Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com [115.124.28.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FFB2DB7A3;
	Thu, 28 May 2026 03:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940405; cv=none; b=CB1070RSw09KFDhJvJXubXbb7tJVJnLmCjgHLINoFQpsNsN2B8/F0o08D4cN0/xpIMZ1HOQNkULHzT9poplw+7WCdHRHQSL2a/IBBA8kZSpbUQRBC068A2qseB6GWTI/XHqvh5q0aNCsqlfs/trVpZok1lHv6qF+y3Y3aEemKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940405; c=relaxed/simple;
	bh=SPbsmk3Q96W8fDM674CIz6Ziz9srN1kp0PD4Q5uKksA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D2b0gzJKWl8TpzFzLpdjAzTElA5PpxAtw+sj7rJldBFCECPgJtx+eQhDfmjP9ljHgLnPx2YHmkCCNSX4Dxhd1J9GeI5aVigupKb3DMFokou5jh/mdilGh9i5cbu9Vid1HlvuC1cXsGjJs/4/N5ujJ79JuGJoDrRzagvoKBiXZBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0295833-0.006798-0.963619;FP=5219788172806448131|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeBVJ_1779940385;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeBVJ_1779940385 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:11 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 00/11] EDAC/RAS: Hygon Family 0x18 UMC ECC address translation
Date: Thu, 28 May 2026 11:52:34 +0800
Message-ID: <20260528035246.526012-1-shiaichun@open-hieco.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This is RFC v2 of the patch series adding Hygon Family 0x18 (models 0x4-0x8)
support for UMC ECC error address translation, aligned with the existing AMD
EDAC + AMD ATL layering in mainline. RFC v1 is at [1].
Link: https://lore.kernel.org/lkml/cover.1775213147.git.shiaichun@open-hieco.net/ # [1]

RFC intent
----------
The code is posted for architectural feedback before formal submission:
Hygon Family 0x18 Data Fabric behavior differs from AMD in several places,
and the boundary between shared AMD helpers and Hygon-only code is easier
to adjust now than after a formal series. Posting as RFC is intended to
confirm if the overall approach---Hygon backends under
drivers/ras/amd/atl/hygon/, registration through the existing amd_atl
hook, and matching amd64_edac changes---is acceptable or is there a better
approach.

------------------------------------------------------------------------
1. Background
------------------------------------------------------------------------

Linux RAS and EDAC report DRAM and memory-controller (UMC) correctable and
uncorrectable errors for operators and user space.  On AMD x86 server
platforms, drivers/edac/amd64_edac.c owns UMC topology discovery, related
register access, and integration with the MCE/MCA UMC decode path for
Family 0x17 and later CPUs.

Converting a UMC MCA normalized address from hardware into a system
physical address (SPA) requires Data Fabric (DF) knowledge: DRAM regions,
interleave, hashing and dehash, die/socket routing, and offsets.  That
logic is substantial, changes by generation, and is not EDAC-specific---any
subsystem needing MCA-to-SPA translation needs the same math.

Mainline therefore places that translation in the AMD Address Translation
Library (amd_atl, drivers/ras/amd/atl) and exposes a single RAS-facing
entry point that amd64_edac calls:

    amd_convert_umc_mca_addr_to_sys_addr()

For AMD CPUs the implementation lives in amd_atl.  EDAC stays responsible
for MC/UMC enumeration and error reporting; DF address translation stays in
amd_atl.  That separation avoids duplicating DF algorithms inside EDAC and
keeps a single place to fix or extend translation---this is the decoupling
between AMD EDAC and AMD ATL.

Hygon parts use the same broad MCA/UMC model on Family 0x18 but differ in DF
revision, register layouts, and IPID/channel rules by CPU model.  This
series adds Hygon backends under hygon/ and wires them through the same
hook, plus amd64_edac updates for the covered models, so UMC ECC reports can
resolve to a consistent SPA.

------------------------------------------------------------------------
2. Problem
------------------------------------------------------------------------

(1) Requirement: UMC ECC address translation on Hygon Family 0x18

    Operating systems need a correct MCA-to-SPA path for UMC ECC errors on
    Hygon Family 0x18 so logs, sysfs, and tooling reference a physical
    address that matches the platform memory map.

(2) Gaps in upstream Linux today (without this RFC)

    - amd_atl/amd64_edac implements the AMD translation path but not the
      Hygon-specific handling required for the Family 0x18 models in this
      series.

    - Without that path, end-to-end reporting for these Hygon systems is
      incomplete even if UMCs are probed.

    - Folding address translation back into amd64_edac would duplicate amd_atl,
      break the single registration model, and complicate maintenance and
      testing.

------------------------------------------------------------------------
3. Solution
------------------------------------------------------------------------

3.1 Solution summary

    - Extend the existing AMD EDAC + AMD ATL design: add Hygon code under
      drivers/ras/amd/atl/hygon/, register the Hygon decoder during ATL
      init, and extend amd64_edac for Hygon Family 0x18 models 0x4-0x8.
      Other existing Hygon models and future models will be extended later.

    - Keep changes to existing AMD EDAC/ATL code minimal: shared helpers
      remain shared; Hygon-specific logic is isolated under hygon/*.c with
      narrow integration points (topology difference, decoder selection,
      node bounds).

3.2 Details: flow, diagram, code paths, Hygon vs AMD

    End-to-end flow (conceptual):

        MCE / UMC MCA record
          -> amd64_edac UMC decode
          -> amd_convert_umc_mca_addr_to_sys_addr()   [registered by amd_atl]
          -> Hygon: hygon_convert_umc_mca_addr_to_sys_addr()
                  -> hygon_norm_to_sys_addr()
                  -> Hygon DF1/DF2/3: system, map, denormalize, dehash

    Sequence:

        +-------------+       +-------------+       +------------------------+
        | amd64_edac  |       | amd_atl     |       | hygon/ (this RFC)      |
        | decode path | ----> | hook / reg  | ----> | DF rev, map, denorm,   |
        |             |       |             |       | dehash, UMC entry      |
        +-------------+       +-------------+       +------------------------+

    Touched paths (summary):

    - Hygon DF1 (models 0x4/0x5): hygon/system.c (DF1 info), hygon/map.c,
      hygon/denormalize.c, hygon/dehash.c, hygon/core.c (normalized-to-SPA
      pipeline), hygon/umc.c.

    - Hygon DF2 (models 0x6/0x8): Hygon-specific four-channel hash
      (HYGON_DF2_4CHAN_HASH), hygon_df2_get_dram_addr_map() with shared AMD
      DF2 DRAM base/limit where applicable; denormalize/dehash and UMC IPID
      channel/sub-channel handling for Hygon DF2.

    - Hygon DF3 (model 0x7): DF3 detection and fields; DRAM map and
      denormalize; reuse of DF2 DRAM map plumbing with Hygon DF3 interleave
      behavior.

    - Initialization: amd_atl init/exit and __df_indirect_read() extended
      for Hygon node number; hygon_get_df_system_info(); register
      hygon_convert_umc_mca_addr_to_sys_addr().

    - EDAC: hygon_edac.c/h encapsulates all Hygon-specific EDAC logic
      (UMC base computation, IPID channel extraction, DDR5 support check,
      per-family MC count); amd64_edac.c calls thin hooks only.

    Shared AMD helpers (what Hygon reuses):

    - find_normalized_offset() in map.c is shared via a get_dram_offset_fn
      callback.  The function iterates over DRAM maps 1..N to find which
      normalized offset applies to the current address; Hygon plugs in
      hygon_get_dram_offset() as the callback to read Hygon's DramOffset
      registers (D18F0x214 for DF1/DF2, D18F0x1B4 for DF3) while the
      iteration and monotonicity-check logic is reused unchanged.

    - df2_get_dram_addr_map(), valid_map(), make_space_for_coh_st_id_at_intlv_bit(),
      and insert_coh_st_id_at_intlv_bit() are also called from hygon/ code
      for the standard interleave modes where Hygon behavior matches AMD.

    Hygon-specific deviations from AMD (high level):

    - Explicit Hygon DF revisions (HYGON_DF1/DF2/DF3) and model-based
      detection.

    - Additional interleave modes (e.g. DF1 three-channel, DF2-class
      four-channel hash) and coherent-station / fabric ID handling as
      described in per-patch changelogs.

    - DF2: coherent-station instance ID derived from MCA IPID channel and
      sub-channel fields per Hygon rules.

3.3 Patches description

    Patches 01-05 — Hygon DF1 backend stack:
    These patches build the Hygon DF1 address-translation core in order:
    DF system information and model detection, DRAM map decoding,
    denormalization, dehash, and hygon/core.c tying the pipeline into a
    single normalized-to-system path for models 0x4/0x5.  They are
    prerequisite to any UMC hook or init wiring.

    Patches 06-07 — Hygon UMC MCA entry and ATL integration:
    Add hygon/umc.c and hygon_convert_umc_mca_addr_to_sys_addr() as the
    Hygon-specific entry that invokes the DF1 pipeline from MCA context.
    Connects Hygon to amd_atl at init/exit: node number bounds, DF
    discovery via hygon_get_df_system_info(), and registration of the Hygon
    decoder with the existing amd_convert_umc_mca_addr_to_sys_addr() hook
    without changing the AMD path.

    Patches 08-09 — Hygon DF2 and DF3 extensions:
    Layer additional Data Fabric revisions on top of the shared helpers:
    DF2 for models 0x6/0x8 (four-channel hash, denormalize/dehash, UMC IPID
    rules) and DF3 for model 0x7 (DF3 fields, DRAM map, denormalize).

    Patches 10-11 — amd64_edac enablement (split from RFC v1 patch 10):
    Patch 10 adds drivers/edac/hygon_edac.c as the single home for all
    Hygon-specific EDAC logic: per-family MC count, UMC SMN base, IPID
    channel extraction, and DDR5 support detection.  amd64_edac.c calls
    only thin hook wrappers.  Patch 11 hardens hygon_get_umc_base() with
    defensive checks for missing F3 device, failed DFID read, and IO-die
    DFID, each printing a warning and falling back to the default base.

    [01/11] ras/amd/atl: Add Hygon DF1 Data Fabric system information helper
            hygon/reg_fields.h, hygon/system.c, HYGON_DF1,
            hygon_determine_df_rev() for models 0x4/0x5.

    [02/11] ras/amd/atl: Add Hygon DF1 DRAM address map decoding helper
            hygon/map.c, hygon_chan_intlv, HYGON_DF1_3CHAN, shared map helpers.

    [03/11] ras/amd/atl: Add Hygon DF1 normalized address denormalization helper
            hygon/denormalize.c.

    [04/11] ras/amd/atl: Add Hygon DF1 address dehash helper
            hygon/dehash.c (hashed modes, DDR5-related cases).

    [05/11] ras/amd/atl: Add Hygon DF1 normalized-to-system address translation
            hygon/core.c (full pipeline).

    [06/11] ras/amd/atl: Add Hygon UMC MCA to system address conversion support
            hygon/umc.c, hygon_convert_umc_mca_addr_to_sys_addr().

    [07/11] ras/amd/atl: Add Hygon DF discovery and MCA decode at initialization
            amd_atl init/exit, node bounds, decoder registration.

    [08/11] ras/amd/atl: Add Hygon DF2 address translation support
            models 0x6/0x8, HYGON_DF2_4CHAN_HASH, denormalize/dehash/UMC.

    [09/11] ras/amd/atl: Add Hygon DF3 address translation support
            model 0x7 (Hygon DF3).

    [10/11] EDAC/amd64: Add Hygon Family 0x18 models 0x4-0x8 support
            hygon_edac.c/h with UMC base, IPID channel, DDR5 check,
            per-family MC count; thin hooks in amd64_edac.c.

    [11/11] EDAC/amd64: Harden Hygon Family 0x18 UMC SMN base against bad DFID
            Defensive pvt->F3/DFID checks in hygon_get_umc_base() with warnings.

3.4 Dependencies
    This RFC patch series depends on the APIs exported by Lin's "Hygon Node"
    RFC v2 patch series [2]:
      hygon_cdd_num()
      hygon_f18h_model_in_range()
      hygon_get_dfid()
      hygon_cpu_to_df_node()

    Link: https://lore.kernel.org/lkml/20260423060420.1785357-1-wanglin@open-hieco.net/ # [2]

3.5 Test
    Each patch was build tested individually. The entire set was functionally
    tested with the following systems.

    Hygon Family 0x18 model 0x4
    Hygon Family 0x18 model 0x6

3.6 Feedback
    Maintainer and reviewer input on the points below would help refine a
    subsequent formal revision:

    - Layout and wiring: placement of Hygon code under hygon/, decoder
      registration at amd_atl init, and interaction with amd64_edac.

    - Shared helpers: reuse of selected AMD helpers with exports in
      internal.h---whether this share is appropriate or should implement
      the same helpers in hygon/ to separate Hygon and AMD code better?

    - DF typing: names and mapping for HYGON_DF1/DF2/DF3 versus existing AMD
      DF revision handling.

3.7 Future work
    Broader hardware coverage, more tests, and possible helper unification
      with AMD code after maintainer feedback.

------------------------------------------------------------------------
Changes since RFC v1 [1]
------------------------------------------------------------------------

Hygon code split out of amd64_edac.c into hygon_edac.c:
  - drivers/edac/hygon_edac.c now contains all Hygon-specific EDAC logic.
    amd64_edac.c retains only thin hook calls:
      * hygon_get_umc_channel(): Hygon IPID bits [23:20] channel extraction
        (moved from inline FIELD_GET in umc_get_err_info()).
      * hygon_supports_ddr5(): DDR5 model range check (moved from inline
        is_hygon_f18h() + hygon_f18h_model_in_range() in system_supports_ddr5()).
      * hygon_get_umc_base() now uses pvt->F3 directly (the already-stored
        DF misc device pointer) instead of re-looking up node_to_amd_nb().

Split:
  - RFC v1 patch 10 split into two commits (patches 10 and 11): core
    amd64_edac enablement is now separate from the defensive hardening of
    hygon_get_umc_base() against missing F3 device, failed DFID read, and
    IO-die DFID.

Shared AMD normalized DRAM offset lookup with Hygon (map.c / patch 02):
  - find_normalized_offset() is now exported from AMD's map.c via a
    get_dram_offset_fn callback.  Hygon's hygon_get_address_map_common()
    calls it with hygon_get_dram_offset() as the callback, reusing the
    shared map-iteration and monotonicity-check logic while reading Hygon's
    DramOffset registers (D18F0x214 for DF1/DF2, D18F0x1B4 for DF3).

All Sashiko AI code review comments [3] are addressed:
  - hygon/denormalize.c: hygon_denorm_addr_common() now checks for the
    ~0ULL sentinel from hygon_make_space_for_coh_st_id() before passing
    the result to hygon_insert_coh_st_id(); also checks ~0 from
    hygon_calculate_coh_st_id() before calling hygon_insert_coh_st_id().
  - hygon/core.c: legacy_hole_en() check moved to after
    hygon_get_address_map() so ctx.map is populated before the test.
  - hygon/map.c: DF2_2CHAN_HASH added to hygon_get_num_intlv_chan(); without
    it the mode fell to the default case returning 0 channels.
  - hygon/denormalize.c, hygon/dehash.c: HYGON_DF2_4CHAN_HASH added to all
    switch statements (make_space, calculate, insert, dehash).
  - hygon/umc.c: hygon_get_coh_st_inst_id() extended to handle HYGON_DF3
    alongside HYGON_DF2 for sub-channel shift.
  - hygon_edac.c: hygon_get_umc_base() checks hygon_get_dfid() return value
    and warns on error; unsigned literals prevent signed 32-bit overflow for
    high df_id values.
  - hygon_per_family_init(): explicitly sets max_mcs = 2 for models 0x6/0x7/0x8.
  - is_hygon_f18h() extracted as a static inline in ATL's internal.h and
    hygon_edac.h, replacing open-coded vendor+family checks; both carry a
    TODO to move to <asm/hygon/node.h> in hygon-node helper.
  - hygon_determine_df_rev() uses is_hygon_f18h() guard and
    hygon_f18h_model_in_range() for DF1 detection; returns -EINVAL for
    unrecognized models instead of silently leaving df_cfg.rev as UNKNOWN.
  - hygon/map.c: hygon_get_dram_offset() uses explicit equality checks
    rather than >= ordering on enum values.
  - hygon/umc.c: hygon_get_die_id() uses hygon_cpu_to_df_node() instead of
    topology_logical_die_id(); properly propagates errors.
  - HYGON_DF2_4CHAN_HASH enum value moved from 0x09 to 0x22 to avoid
    aliasing with raw 4-bit hardware IntLvNumChan field values.
  - hygon_df_2chan_dehash_addr() and hygon_df2_4chan_dehash_addr() changed
    from int-returning (always 0) to void; ctx->ret_addr XOR mask uses
    BIT_ULL() consistently for u64 operands.
  - HYGON_CDD_DFID_BASE constant introduced in hygon/denormalize.c and
    hygon_edac.c to name the magic literal 4; both carry a TODO to move
    to <asm/hygon/node.h> in hygon-node helper.
  - Commit message for patch 07: removed stale amd_atl_exit() reference;
    replaced amd_num_nodes() with hygon_cdd_num() to avoid bypassing
    northbridge initialization guards and prevent possible NULL dereferences
    via node_to_amd_nb() with indices beyond amd_nb_num().

Style:
  - Author names in all seven hygon/ file headers corrected from "AichunShi"
    to "Aichun Shi" to match Signed-off-by.

Thanks for comments and review.

Aichun Shi

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>

Link: https://lore.kernel.org/lkml/cover.1775213147.git.shiaichun@open-hieco.net/ # [1]
Link: https://lore.kernel.org/lkml/20260423060420.1785357-1-wanglin@open-hieco.net/ # [2]
Link: https://sashiko.dev/#/patchset/cover.1775213147.git.shiaichun%40open-hieco.net # [3]

Aichun Shi (11):
  ras/amd/atl: Add Hygon DF1 Data Fabric system information helper
  ras/amd/atl: Add Hygon DF1 DRAM address map decoding helper
  ras/amd/atl: Add Hygon DF1 normalized address denormalization helper
  ras/amd/atl: Add Hygon DF1 address dehash helper
  ras/amd/atl: Add Hygon DF1 normalized-to-system address translation
  ras/amd/atl: Add Hygon UMC MCA to system address conversion support
  ras/amd/atl: Add Hygon DF discovery and MCA decode at initialization
  ras/amd/atl: Add Hygon DF2 address translation support
  ras/amd/atl: Add Hygon DF3 address translation support
  EDAC/amd64: Add Hygon Family 0x18 models 0x4-0x8 support
  EDAC/amd64: Harden Hygon Family 0x18 UMC SMN base against bad DFID

 drivers/edac/Makefile                   |   5 +
 drivers/edac/amd64_edac.c               |  58 +++-
 drivers/edac/amd64_edac.h               |   5 +
 drivers/edac/hygon_edac.c               |  99 +++++++
 drivers/edac/hygon_edac.h               |  24 ++
 drivers/ras/amd/atl/Makefile            |   7 +
 drivers/ras/amd/atl/access.c            |   8 +-
 drivers/ras/amd/atl/core.c              |  24 +-
 drivers/ras/amd/atl/denormalize.c       |   4 +-
 drivers/ras/amd/atl/hygon/core.c        |  57 ++++
 drivers/ras/amd/atl/hygon/dehash.c      |  96 +++++++
 drivers/ras/amd/atl/hygon/denormalize.c | 201 ++++++++++++++
 drivers/ras/amd/atl/hygon/map.c         | 339 ++++++++++++++++++++++++
 drivers/ras/amd/atl/hygon/reg_fields.h  | 191 +++++++++++++
 drivers/ras/amd/atl/hygon/system.c      |  96 +++++++
 drivers/ras/amd/atl/hygon/umc.c         |  50 ++++
 drivers/ras/amd/atl/internal.h          |  53 ++++
 drivers/ras/amd/atl/map.c               |  11 +-
 drivers/ras/amd/atl/system.c            |   4 +-
 19 files changed, 1305 insertions(+), 27 deletions(-)
 create mode 100644 drivers/edac/hygon_edac.c
 create mode 100644 drivers/edac/hygon_edac.h
 create mode 100644 drivers/ras/amd/atl/hygon/core.c
 create mode 100644 drivers/ras/amd/atl/hygon/dehash.c
 create mode 100644 drivers/ras/amd/atl/hygon/denormalize.c
 create mode 100644 drivers/ras/amd/atl/hygon/map.c
 create mode 100644 drivers/ras/amd/atl/hygon/reg_fields.h
 create mode 100644 drivers/ras/amd/atl/hygon/system.c
 create mode 100644 drivers/ras/amd/atl/hygon/umc.c

-- 
2.47.3

