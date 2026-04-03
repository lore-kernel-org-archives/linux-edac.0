Received: from out28-108.mail.aliyun.com (out28-108.mail.aliyun.com [115.124.28.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DDD312807;
	Fri,  3 Apr 2026 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213892; cv=none; b=ZZ5hbxtZr5zQsjtqT1Zxm+RG/Umbe08aCMLrJwqQCUGoPJTgccF/05TATGenH/JN4rgJp0TEk+vbIJaZ/w0k/6pfOzwtK04bg8iErf6cO5YioI7FZHpmL07Jvh3N1HRk5+4zhE4I8ICBfd9puK9cB8TT+uX+rBNlDtabyz2rKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213892; c=relaxed/simple;
	bh=Cwf1h3Bl+/Lq0DadpCLktthUPEUNuO9ZmO3SMcHuTvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D+TraiNagraN+ZVQ7r/MXRfON3vieYD10Tx4sWPaT3zqHZN24t8Ovtntm/XsU5yGUzhLq/jM38YUfG1ZQ6Zt0k+TYL5rxCi0etSQ1OK6GHruE7cQ/d3NDzQGEkc5aa/gTsCHg0LZNvVFchKf4aQeQZMuZs0wWSlPtrlIq+riUtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436284|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_system_inform|0.0260635-0.00730505-0.966631;FP=7652018153914418183|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033040074035;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkL9H_1775213868;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkL9H_1775213868 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:57:58 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 00/10] EDAC/RAS: Hygon Family 0x18 UMC ECC address translation
Date: Fri,  3 Apr 2026 18:57:24 +0800
Message-ID: <cover.1775213147.git.shiaichun@open-hieco.net>
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

This is an RFC (Request For Comments) for the patch series that proposes
Hygon Family 0x18 (models 0x4-0x8) support for UMC ECC error address
translation, aligned with the existing AMD EDAC + AMD ATL layering in
mainline.

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
        | amd64_edac  |       | amd_atl     |       | hygon/ (this RFC)        |
        | decode path | ----> | hook / reg  | ----> | DF rev, map, denorm,     |
        |             |       |             |       | dehash, UMC entry        |
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

    - EDAC: UMC bases, MCA IPID fields for Hygon, distinct MC counts for
      models 0x4/0x5 where needed, amd64_edac_init()/amd64_edac_exit() node
      handling for Hygon.

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

    Patch 10 — amd64_edac enablement:
    Completes the end-to-end story in the EDAC driver: UMC bases, MCA IPID
    channel handling, memory-controller counts, and node lifecycle for
    Hygon Family 0x18 models 0x4-0x8 so probe/decode matches the ATL
    backends above.

    [01/10] ras/amd/atl: Add Hygon DF1 Data Fabric system information helper
            hygon/reg_fields.h, hygon/system.c, HYGON_DF1,
            hygon_determine_df_rev() for models 0x4/0x5.

    [02/10] ras/amd/atl: Add Hygon DF1 DRAM address map decoding helper
            hygon/map.c, hygon_chan_intlv, HYGON_DF1_3CHAN, shared map helpers.

    [03/10] ras/amd/atl: Add Hygon DF1 normalized address denormalization helper
            hygon/denormalize.c.

    [04/10] ras/amd/atl: Add Hygon DF1 address dehash helper
            hygon/dehash.c (hashed modes, DDR5-related cases).

    [05/10] ras/amd/atl: Add Hygon DF1 normalized-to-system address translation
            hygon/core.c (full pipeline).

    [06/10] ras/amd/atl: Add Hygon UMC MCA to system address conversion support
            hygon/umc.c, hygon_convert_umc_mca_addr_to_sys_addr().

    [07/10] ras/amd/atl: Add Hygon DF discovery and MCA decode at initialization
            amd_atl init/exit, node bounds, decoder registration.

    [08/10] ras/amd/atl: Add Hygon DF2 address translation support
            models 0x6/0x8, HYGON_DF2_4CHAN_HASH, denormalize/dehash/UMC.

    [09/10] ras/amd/atl: Add Hygon DF3 address translation support
            model 0x7 (Hygon DF3).

    [10/10] EDAC/amd64: Add Hygon Family 0x18 models 0x4-0x8 support
            amd64_edac integration for covered models.

3.4 Dependencies
    This RFC patch series depends on the APIs exported by the "Hygon Node" RFC patch series [1].
      hygon_f18h_m4h()
      hygon_get_dfid()

    [1] https://lore.kernel.org/lkml/20260402111515.1155505-1-wanglin@open-hieco.net/

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

Thanks for comments and review.

Aichun Shi

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>

Aichun Shi (10):
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

 drivers/edac/amd64_edac.c               |  68 ++++-
 drivers/ras/amd/atl/Makefile            |   7 +
 drivers/ras/amd/atl/access.c            |   9 +-
 drivers/ras/amd/atl/core.c              |  25 +-
 drivers/ras/amd/atl/denormalize.c       |   4 +-
 drivers/ras/amd/atl/hygon/core.c        |  52 ++++
 drivers/ras/amd/atl/hygon/dehash.c      | 100 +++++++
 drivers/ras/amd/atl/hygon/denormalize.c | 181 +++++++++++
 drivers/ras/amd/atl/hygon/map.c         | 383 ++++++++++++++++++++++++
 drivers/ras/amd/atl/hygon/reg_fields.h  | 191 ++++++++++++
 drivers/ras/amd/atl/hygon/system.c      |  91 ++++++
 drivers/ras/amd/atl/hygon/umc.c         |  52 ++++
 drivers/ras/amd/atl/internal.h          |  38 +++
 drivers/ras/amd/atl/map.c               |   6 +-
 drivers/ras/amd/atl/system.c            |   4 +-
 15 files changed, 1186 insertions(+), 25 deletions(-)
 create mode 100644 drivers/ras/amd/atl/hygon/core.c
 create mode 100644 drivers/ras/amd/atl/hygon/dehash.c
 create mode 100644 drivers/ras/amd/atl/hygon/denormalize.c
 create mode 100644 drivers/ras/amd/atl/hygon/map.c
 create mode 100644 drivers/ras/amd/atl/hygon/reg_fields.h
 create mode 100644 drivers/ras/amd/atl/hygon/system.c
 create mode 100644 drivers/ras/amd/atl/hygon/umc.c

-- 
2.47.3

