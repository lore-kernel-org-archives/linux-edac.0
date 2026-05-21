Received: from out28-99.mail.aliyun.com (out28-99.mail.aliyun.com [115.124.28.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609773033DE;
	Thu, 21 May 2026 01:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327998; cv=none; b=iBFXtQluCOqwvn/cRi4BLLyVtQ63/GU9Y4kWDh7YQtP/Ainp7ccVnkZT2WSqNrEaC93ZAW9CV/S3QMtDEZ3/LLmHoZPKBoI+thfLTyeZ5NV3nTVTV/ERN0fwaqqEXsHYIcurvU0Yf1RRiuT7KX5kHooVc/oBkeY3G+X110GqQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327998; c=relaxed/simple;
	bh=WUYUKtLT8ZA51JX4lVeHSJ5n4E0g/zfdCSA3i0Vy3ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMskBXT/F5xNJgfumFUXQeBTgqYQFyjdXjfZ1nmBve7wyr+vOFH/qm6m46k0Mn5SBXvKLe+TG8YGOcVU0f1edC+ACrWMqIEwTqI9Lp0PimrhbOgvnz/YvhEjIqEPBM4WrQgrvYMDyMwjWw7V8+pLE2QohbySZTEHL4xxvEgC3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0251961-0.00124883-0.973555;FP=1900633640108115035|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032062159;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.hcP4h.l_1779327981;
Received: from 172.19.20.38(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hcP4h.l_1779327981 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 21 May 2026 09:46:21 +0800
Message-ID: <af39e107-46bc-4035-950c-f36f187c99fc@open-hieco.net>
Date: Thu, 21 May 2026 09:46:20 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] EDAC/RAS: Hygon Family 0x18 UMC ECC address
 translation
To: Borislav Petkov <bp@alien8.de>
Cc: yazen.ghannam@amd.com, tglx@linutronix.de, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1775213147.git.shiaichun@open-hieco.net>
 <20260514150825.GFagXlabtyupoMqn9C@fat_crate.local>
From: Aichun Shi <shiaichun@open-hieco.net>
In-Reply-To: <20260514150825.GFagXlabtyupoMqn9C@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/14/2026 11:08 PM, Borislav Petkov wrote:
> On Fri, Apr 03, 2026 at 06:57:24PM +0800, Aichun Shi wrote:
>> Hi all,
>>
>> This is an RFC (Request For Comments) for the patch series that proposes
>> Hygon Family 0x18 (models 0x4-0x8) support for UMC ECC error address
>> translation, aligned with the existing AMD EDAC + AMD ATL layering in
>> mainline.
> 
> Please go over all review comments and address:
> 
> https://sashiko.dev/#/patchset/cover.1775213147.git.shiaichun%40open-hieco.net
> 

Hi Boris,
    Please see my comments below, and I will send RFC V2 soon.
> Patch 2: [RFC PATCH 02/10] ras/amd/atl: Add Hygon DF1 DRAM address map decoding helper
> Result:
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
>> +static u8 hygon_get_num_intlv_chan(struct addr_ctx *ctx)
>> +{
>> +	switch (ctx->map.intlv_mode) {
>> +	case NONE:
>> +		return 1;
>> +	case NOHASH_2CHAN:
>> +		return 2;
>> +	case HYGON_DF1_3CHAN:
>> +		return 3;
>> +	case NOHASH_4CHAN:
>> +		return 4;
>> +	case NOHASH_8CHAN:
>> +		return 8;
>> +	case NOHASH_16CHAN:
>> +		return 16;
>> +	case NOHASH_32CHAN:
>> +		return 32;
>> +	default:
>> +		atl_debug_on_bad_intlv_mode(ctx);
>> +		return 0;
>> +	}
>> +}
> In hygon_df_get_intlv_mode(), an initial value of 8 is explicitly mapped to
> DF2_2CHAN_HASH. However, the switch statement in hygon_get_num_intlv_chan()
> checks for NOHASH_32CHAN (which is enum value 0x08) but does not have a case
> for DF2_2CHAN_HASH.
> Does this code fail to handle the DF2_2CHAN_HASH interleave mode?
> If DF2_2CHAN_HASH is used, the switch will fall through to the default case
> and return 0 channels. This 0 propagates into ctx->map.total_intlv_chan
> and ctx->map.total_intlv_bits.
> Later in the address translation pipeline, calculating the coherent station
> ID uses order_base_2(ctx->map.num_intlv_chan). Because order_base_2(0)
> returns 0, this causes GENMASK(num_intlv_bits - 1, 0) to evaluate to
> GENMASK(-1, 0), producing ~0UL.
> Can this corrupt the translated system physical address by mangling the
> subsequent die/socket bit shifts and ORing the invalid station ID directly
> over the address bits?
> Should DF2_2CHAN_HASH be included in this switch block?

Will fix in RFC V2.



> Patch 3: [RFC PATCH 03/10] ras/amd/atl: Add Hygon DF1 normalized address denormalization helper
> Result:
> Critical: 0 · High: 3 · Medium: 0 · Low: 0

> 
>> +static u16 hygon_get_coh_st_id_df(struct addr_ctx *ctx)
>> +{
>> +	u8 num_socket_intlv_bits = ilog2(ctx->map.num_intlv_sockets);
>> +	u8 num_die_intlv_bits = ilog2(ctx->map.num_intlv_dies);
>> +	u16 coh_st_id = ctx->coh_st_fabric_id;
>> +	u16 mask;
>> +	u8 intlv_bit_pos = ctx->map.intlv_bit_pos;
>> +	u8 num_intlv_bits = order_base_2(ctx->map.num_intlv_chan);
>> +
>> +	if (ctx->map.intlv_mode == HYGON_DF1_3CHAN) {
>> +		u8 cs_offset;
>> +		u16 dst_fabric_id = hygon_get_dst_fabric_id(ctx);
>> +		u64 temp_addr_x;
>> +
>> +		cs_offset = (ctx->coh_st_fabric_id & 0x3) - (dst_fabric_id & 0x3);
> If the base and target IDs cross a multiple-of-4 boundary (for example, if
> the base ID is 2 and the target ID is 4), does this subtraction underflow?
> Since cs_offset is a u8, (4 & 3) - (2 & 3) would evaluate to 0 - 2, wrapping
> around to 254.
>> +		if (cs_offset > 3) {
> And cause this check to falsely evaluate to true, rejecting a valid topology?

As the valid values of ctx->coh_st_fabric_id and dst_fabric_id are 
between 0 and 3, "cs_offset > 3" check should be enough for invalid 
values of ctx->coh_st_fabric_id and dst_fabric_id.

>> +			atl_debug(ctx,
>> +				  "Invalid cs_offset: 0x%x coh_st_fabric_id: 0x%x dst_fabric_id: 0x%x.\n",
>> +				  cs_offset, ctx->coh_st_fabric_id, dst_fabric_id);
>> +			return ~0;
>> +		}
>> +
>> +		temp_addr_x = (ctx->ret_addr & GENMASK_ULL(63, intlv_bit_pos)) >>
>> +				intlv_bit_pos;
>> +		temp_addr_x = temp_addr_x * 3 + cs_offset;
>> +		ctx->ret_addr = temp_addr_x;
>> +
>> +		coh_st_id = temp_addr_x & GENMASK_ULL(num_intlv_bits - 1, 0);
>> +	} else {
>> +		mask = GENMASK(num_intlv_bits - 1, 0);
>> +		coh_st_id &= mask;
>> +	}
>> +
>> +	/* Die interleave bits */
>> +	if (num_die_intlv_bits) {
>> +		u16 die_bits;
>> +
>> +		mask = GENMASK(num_die_intlv_bits - 1, 0);
>> +		die_bits = ctx->coh_st_fabric_id & df_cfg.die_id_mask;
>> +		die_bits >>= df_cfg.die_id_shift;
>> +		die_bits -= 4;
>> +
>> +		coh_st_id |= (die_bits & mask) << num_intlv_bits;
>> +		num_intlv_bits += num_die_intlv_bits;
>> +	}
>> +
>> +	/* Socket interleave bits */
>> +	if (num_socket_intlv_bits) {
>> +		u16 socket_bits;
>> +
>> +		mask = GENMASK(num_socket_intlv_bits - 1, 0);
>> +		socket_bits = ctx->coh_st_fabric_id & df_cfg.socket_id_mask;
>> +		socket_bits >>= df_cfg.socket_id_shift;
>> +
>> +		coh_st_id |= (socket_bits & mask) << num_intlv_bits;
>> +	}
> If die or socket interleaving is enabled alongside HYGON_DF1_3CHAN mode, does
> coh_st_id bitwise overlap with the uncleared physical address? The upper bits
> of coh_st_id will be set here, but the physical address was multiplied by 3
> and never shifted left to make space for these additional bits.
> [ ... ]
>> +static u64 hygon_insert_coh_st_id_df1_3chan(struct addr_ctx *ctx, u64 denorm_addr, u16 coh_st_id)
>> +{
>> +	u8 num_intlv_bits_chan = order_base_2(ctx->map.num_intlv_chan);
>> +	u64 temp_addr = ((ctx->ret_addr >> num_intlv_bits_chan) << num_intlv_bits_chan) | coh_st_id;
> Since num_intlv_bits_chan is 2 for 3-channel mode, are we missing the space
> needed for the die and socket bits when we apply | coh_st_id here?

As HYGON_DF1_3CHAN mode will not co-exist with die interleave or socket 
interleave mode, the above comments should not be an issue.

>> +static int hygon_denorm_addr_common(struct addr_ctx *ctx)
>> +{
>> +	u64 denorm_addr;
>> +	u16 coh_st_id;
>> +
>> +	denorm_addr = hygon_make_space_for_coh_st_id(ctx);
>> +	coh_st_id = hygon_calculate_coh_st_id(ctx);
>> +	ctx->ret_addr = hygon_insert_coh_st_id(ctx, denorm_addr, coh_st_id);
>> +	return 0;
>> +}
> If hygon_calculate_coh_st_id() encounters an error and returns ~0, is it safe
> to pass this directly into hygon_insert_coh_st_id() and then return 0 for
> success?
> It looks like the ~0 will be truncated to 0xFFFF as a u16, bitwise OR'd
> directly into the physical address, and then the caller will trust the
> success return code, leading to incorrect page offlining operations.

Will fix in RFC V2.



> Patch 4: [RFC PATCH 04/10] ras/amd/atl: Add Hygon DF1 address dehash helper
> Result:
> Critical: 0 · High: 0 · Medium: 0 · Low: 1

>> +static int hygon_df_2chan_dehash_addr(struct addr_ctx *ctx)
>> +{
>> +	u8 hashed_bit;
>> +	u8 intlv_bit_pos = ctx->map.intlv_bit_pos;
>> +
>> +	hashed_bit =	(ctx->ret_addr >> 12) ^
>> +		(ctx->ret_addr >> 18) ^
>> +		(ctx->ret_addr >> 21) ^
>> +		(ctx->ret_addr >> 30) ^
>> +		ctx->coh_st_fabric_id;
>> +
>> +	hashed_bit &= BIT(0);
>> +	if (hashed_bit != ((ctx->ret_addr >> intlv_bit_pos) & BIT(0)))
>> +		ctx->ret_addr ^= BIT(intlv_bit_pos);
> Should this code use BIT_ULL() instead of BIT()?
> While BIT() expands to an unsigned long (which happens to be 64-bit on x86_64),
> ctx->ret_addr is explicitly defined as a u64 variable. Using BIT_ULL() here
> would ensure the mask is always explicitly 64-bit, which safely guards against
> future changes and maintains consistency with the rest of the AMD ATL
> subsystem.

Will fix in RFC V2.



> Patch 5: [RFC PATCH 05/10] ras/amd/atl: Add Hygon DF1 normalized-to-system address translation
> Result:
> Critical: 0 · High: 1 · Medium: 0 · Low: 0

>> +unsigned long hygon_norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id,
>> +				     u8 sub_channel, unsigned long addr)
>> +{
>> +	struct addr_ctx ctx;
>> +
>> +	if (df_cfg.rev == UNKNOWN)
>> +		return -EINVAL;
>> +
>> +	memset(&ctx, 0, sizeof(ctx));
>> +
>> +	/* Start from the normalized address */
>> +	ctx.ret_addr = addr;
>> +	ctx.node_id = die_id;
>> +	ctx.inst_id = coh_st_inst_id;
>> +
>> +	ctx.inputs.norm_addr = addr;
>> +	ctx.inputs.socket_id = socket_id;
>> +	ctx.inputs.die_id = die_id;
>> +	ctx.inputs.coh_st_inst_id = coh_st_inst_id;
>> +
>> +	ctx.chan_intlv_hygon.sub_channel = sub_channel;
>> +
>> +	if (legacy_hole_en(&ctx) && !df_cfg.dram_hole_base)
>> +		return -EINVAL;
> Since ctx was just initialized with memset(), ctx.map hasn't been populated
> yet. Will legacy_hole_en() always read 0 for ctx.map.base and return false?
> If so, does this bypass the misconfiguration check?
>> +
>> +	if (hygon_get_address_map(&ctx))
>> +		return -EINVAL;
>> +
>> +	if (hygon_denormalize_address(&ctx))
>> +		return -EINVAL;
>> +
>> +	ctx.ret_addr = add_base_and_hole(&ctx, ctx.ret_addr);
> Later, when ctx.map is populated, if the legacy hole is actually enabled in
> hardware but left unconfigured (df_cfg.dram_hole_base is 0), could
> add_base_and_hole() incorrectly shift the physical address by 4GB?
> If that happens, can this lead to a corrupted system physical address being
> returned, causing the machine check handler to offline a healthy memory page
> and leave the faulty page active?
> Would it be better to move the legacy hole validation check after
> hygon_get_address_map() has populated ctx.map?

Will fix in RFC V2.



> Patch 7: [RFC PATCH 07/10] ras/amd/atl: Add Hygon DF discovery and MCA decode at initialization
> Result:
> Critical: 0 · High: 1 · Medium: 1 · Low: 0

> commit 4b3cc464e5cc696659d9b1d2ba8977f4028f70ca
> Author: Aichun Shi <shiaichun@open-hieco.net>
> ras/amd/atl: Add Hygon DF discovery and MCA decode at initialization
> This commit adds node number bounds, Data Fabric discovery, and UMC MCA address
> translation support for Hygon systems in the AMD Address Translation Library.
>> - Add Hygon node number support in amd_atl_init(),
>>   amd_atl_exit() and __df_indirect_read().
> The commit message mentions adding support in amd_atl_exit(), but there do not
> appear to be any modifications to that function in this patch. Is this bullet
> point out of date?

Will fix in RFC V2.

>>  	struct pci_dev *F4;
>>  	int err = -ENODEV;
>>  	u32 ficaa = 0;
>> +	u16 num_nodes;
>> +	bool is_hygon = boot_cpu_data.x86_vendor == X86_VENDOR_HYGON;
>>  
>>  	node = get_accessible_node(node);
>> -	if (node >= amd_nb_num()) {
>> +	if (is_hygon)
>> +		num_nodes = amd_num_nodes();
>> +	else
>> +		num_nodes = amd_nb_num();
>> +
>> +	if (node >= num_nodes) {
>>  		pr_debug("Node %u is out of bounds\n", node);
>>  		goto out;
>>  	}
> Can this result in a NULL pointer dereference just after this check?
> The code immediately follows this bounds check with:
> 	F4 = node_to_amd_nb(node)->link;
> If northbridge initialization partially or fully fails, amd_num_nodes() can
> return a value greater than amd_nb_num(). If node is greater than or equal to
> amd_nb_num(), node_to_amd_nb(node) will return NULL, causing the ->link access
> to crash.
> [ ... ]
>> diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
>> index b7083588b46ea..bbbbff4d43a3a 100644
>> --- a/drivers/ras/amd/atl/core.c
>> +++ b/drivers/ras/amd/atl/core.c
>> @@ -195,22 +195,37 @@ MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
>>  static int __init amd_atl_init(void)
>>  {
>>  	int ret;
>> +	u16 num_nodes;
>> +	bool is_hygon = boot_cpu_data.x86_vendor == X86_VENDOR_HYGON;
>>  
>>  	if (!x86_match_cpu(amd_atl_cpuids))
>>  		return -ENODEV;
>>  
>> -	if (!amd_nb_num())
>> +	if (is_hygon)
>> +		num_nodes = amd_num_nodes();
>> +	else
>> +		num_nodes = amd_nb_num();
>> +
>> +	if (!num_nodes)
>>  		return -ENODEV;
> Does this allow the module to incorrectly initialize when no northbridges are
> found?
> Previously, if amd_nb_num() was 0, it would safely return -ENODEV. By checking
> amd_num_nodes() instead for Hygon systems, the initialization could proceed
> even if northbridge initialization failed, potentially leading to similar
> NULL pointer dereferences when node_to_amd_nb() is called later in the code.

Will fix it in RFC V2 with hygon_cdd_num() instead of amd_num_nodes() 
exported from Lin's Hygon Node RFC V2:
https://lore.kernel.org/lkml/20260423060420.1785357-3-wanglin@open-hieco.net/



> Patch 8: [RFC PATCH 08/10] ras/amd/atl: Add Hygon DF2 address translation support
> Result:
> Critical: 0 · High: 2 · Medium: 0 · Low: 1

>> @@ -117,6 +119,7 @@ static u16 hygon_calculate_coh_st_id(struct addr_ctx *ctx)
>>  	case NOHASH_16CHAN:
>>  	case NOHASH_32CHAN:
>>  	case DF2_2CHAN_HASH:
>> +	case HYGON_DF2_4CHAN_HASH:
>>  		return hygon_get_coh_st_id_df(ctx);
>>  
>>  	default:
> If HYGON_DF2_4CHAN_HASH is added here, does it also need to be handled in
> hygon_make_space_for_coh_st_id() and hygon_insert_coh_st_id() which also use
> a switch on ctx->map.intlv_mode?
> Without adding it to those functions, the switch will fall through to the
> default case, logging an "Unrecognized interleave mode" debug message and
> returning ~0ULL. This propagates into ctx->ret_addr causing subsequent bounds
> checks like addr_over_limit() to fail, which prevents translation of the MCA
> error address.

Will fix in RFC V2.

> 
>> diff --git a/drivers/ras/amd/atl/hygon/map.c b/drivers/ras/amd/atl/hygon/map.c
>> index 2194c10ff5877..b0c05532b7449 100644
>> --- a/drivers/ras/amd/atl/hygon/map.c
>> +++ b/drivers/ras/amd/atl/hygon/map.c
>> @@ -16,8 +16,12 @@ static int hygon_df_get_intlv_mode(struct addr_ctx *ctx)
>>  	if (df_cfg.rev == HYGON_DF1 && ctx->map.intlv_mode == 2)
>>  		ctx->map.intlv_mode = HYGON_DF1_3CHAN;
>>  
>> -	if (ctx->map.intlv_mode == 8)
>> -		ctx->map.intlv_mode = DF2_2CHAN_HASH;
>> +	if (ctx->map.intlv_mode == 8) {
>> +		if (df_cfg.rev == HYGON_DF2)
>> +			ctx->map.intlv_mode = HYGON_DF2_4CHAN_HASH;
>> +		else
>> +			ctx->map.intlv_mode = DF2_2CHAN_HASH;
>> +	}
> This isn't a bug introduced by this patch, but does the pre-existing
> DF2_2CHAN_HASH mode map to 0 channels in hygon_get_num_intlv_chan() due to
> being missing from its switch statement?
> If it falls through to the default case and returns 0, order_base_2(0) will
> evaluate to 0 in hygon_get_coh_st_id_df(), resulting in GENMASK(-1, 0).
> This can trigger undefined behavior and break Coherent Station ID
> calculations entirely for these systems.

Will fix in Patch 2 in RFC V2.

>>  	if (ctx->map.intlv_mode != NONE &&
>>  	    ctx->map.intlv_mode != NOHASH_2CHAN &&
>> @@ -25,6 +29,7 @@ static int hygon_df_get_intlv_mode(struct addr_ctx *ctx)
>>  	    ctx->map.intlv_mode != NOHASH_4CHAN &&
>>  	    ctx->map.intlv_mode != NOHASH_8CHAN &&
>>  	    ctx->map.intlv_mode != NOHASH_16CHAN &&
>> +		ctx->map.intlv_mode != HYGON_DF2_4CHAN_HASH &&
>>  	    ctx->map.intlv_mode != DF2_2CHAN_HASH)
>>  		return -EINVAL;
> If the hardware register reads a raw value of 9, could it bypass this
> validation?
> Since HYGON_DF1_INTLV_NUM_CHAN is a 4-bit hardware field, a value of 9 would
> skip the remapping block above. But because HYGON_DF2_4CHAN_HASH is defined
> as 0x09 in the intlv_modes enum, the validation check here will evaluate to
> false, mistakenly accepting an invalid hardware state as 4-channel hashing.
>> diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
>> index f943cc33f82e0..c368559ca2ae5 100644
>> --- a/drivers/ras/amd/atl/internal.h
>> +++ b/drivers/ras/amd/atl/internal.h
> [ ... ]
>> @@ -61,6 +62,7 @@ enum intlv_modes {
>>  	DF3_6CHAN			= 0x06,
>>  	NOHASH_16CHAN			= 0x07,
>>  	NOHASH_32CHAN			= 0x08,
>> +	HYGON_DF2_4CHAN_HASH		= 0x09,
>>  	DF3_COD4_2CHAN_HASH		= 0x0C,
> Could this enum value be moved to a value like those > 0x20 to prevent the
> aliasing with raw hardware field values described above?

Will fix in RFC V2.



> Patch 9: [RFC PATCH 09/10] ras/amd/atl: Add Hygon DF3 address translation support
> Result:
> Critical: 0 · High: 1 · Medium: 1 · Low: 0

>> diff --git a/drivers/ras/amd/atl/hygon/map.c b/drivers/ras/amd/atl/hygon/map.c
>> index b0c05532b7449..2a3d962be083e 100644
>> --- a/drivers/ras/amd/atl/hygon/map.c
>> +++ b/drivers/ras/amd/atl/hygon/map.c
>> @@ -17,7 +17,7 @@ static int hygon_df_get_intlv_mode(struct addr_ctx *ctx)
>>  		ctx->map.intlv_mode = HYGON_DF1_3CHAN;
>>  
>>  	if (ctx->map.intlv_mode == 8) {
>> -		if (df_cfg.rev == HYGON_DF2)
>> +		if (df_cfg.rev == HYGON_DF2 || df_cfg.rev == HYGON_DF3)
>>  			ctx->map.intlv_mode = HYGON_DF2_4CHAN_HASH;
> Since HYGON_DF3 explicitly maps to the HYGON_DF2_4CHAN_HASH interleave
> mode here, does it also share the 4-channel hashing and sub-channel
> architecture of DF2?
> If so, does hygon_get_coh_st_inst_id() in drivers/ras/amd/atl/hygon/umc.c
> need to be updated?
> Currently, it only checks df_cfg.rev == HYGON_DF2 to shift the
> coh_st_inst_id and add the sub_channel. Without an update there, could
> MCA physical address translation fail or return an incorrect address for
> HYGON_DF3?

Will fix in RFC V2.

>> diff --git a/drivers/ras/amd/atl/hygon/system.c b/drivers/ras/amd/atl/hygon/system.c
>> index a06a39bc45276..f3ca6f58d00f5 100644
>> --- a/drivers/ras/amd/atl/hygon/system.c
>> +++ b/drivers/ras/amd/atl/hygon/system.c
> [ ... ]
>> @@ -38,6 +44,8 @@ static int hygon_determine_df_rev(void)
>>  		df_cfg.rev = HYGON_DF1;
>>  	else if (boot_cpu_data.x86_model == 0x6 || boot_cpu_data.x86_model == 0x8)
>>  		df_cfg.rev = HYGON_DF2;
>> +	else if (boot_cpu_data.x86_model == 0x7)
>> +		df_cfg.rev = HYGON_DF3;
> Does this logic need to verify the CPU family (boot_cpu_data.x86 == 0x18)
> alongside the model number?
> While Hygon might only have Family 0x18 right now, if a future CPU
> family introduces a model 0x7, could it falsely be detected as HYGON_DF3
> since model numbers can overlap across different families?

Will fix in RFC V2.



> Patch 10: [RFC PATCH 10/10] EDAC/amd64: Add Hygon Family 0x18 models 0x4-0x8 support
> Result:
> Critical: 1 · High: 2 · Medium: 1 · Low: 1

>> @@ -98,6 +99,29 @@ int __amd64_write_pci_cfg_dword(struct pci_dev *pdev, int offset,
>>  	return pcibios_err_to_errno(err);
>>  }
>>  
>> +static u32 get_umc_base_addr(struct amd64_pvt *pvt, u8 channel)
>> +{
>> +	if (hygon_f18h_m4h()) {
>> +		struct pci_dev *dev = node_to_amd_nb(pvt->mc_node_id)->misc;
> Could this use the already stored misc device pointer pvt->F3 instead of
> looking it up globally again?

Will fix in RFC V2.

>> +		u8 df_id;
>> +
>> +		hygon_get_dfid(dev, &df_id);
> If hygon_get_dfid() encounters an error and returns without populating the
> out-parameter, does this leave df_id uninitialized, leading to a regression
> during the umc base calculation?

Will fix in RFC V2.

>> +
>> +		return get_umc_base(channel) + (0x80000000 + (0x10000000 * (df_id - 4)));
> Could this cause a signed integer overflow regression if df_id is 12 or
> greater?
> The literal 0x10000000 is treated as a signed integer. Multiplying it by 8
> or more evaluates to 2,147,483,648, which exceeds the maximum signed 32-bit
> integer limit.
> Would adding an unsigned suffix like 0x10000000U prevent this?

Will fix in RFC V2.

>> @@ -4143,13 +4185,15 @@ static int __init amd64_edac_init(void)
>>  	if (!x86_match_cpu(amd64_cpuids))
>>  		return -ENODEV;
>>  
>> -	if (!amd_nb_num())
>> +	node_num = get_num_nodes();
>> +
>> +	if (!node_num)
>>  		return -ENODEV;
> If northbridge caching fails during boot, amd_northbridges.num is 0, and
> amd_nb_num() correctly returns 0 to abort the driver load. By returning
> amd_num_nodes() for Hygon systems here, does this bypass the failure state
> check and force execution into the probe_one_instance() loop?
> If execution proceeds when initialization has failed, node_to_amd_nb(nid)
> will evaluate to null since nid >= amd_northbridges.num. Can this cause a
> null pointer dereference regression when the driver subsequently accesses
> the misc field?
>>  	opstate_init();
>>  
>>  	err = -ENOMEM;
>> -	ecc_stngs = kzalloc_objs(ecc_stngs[0], amd_nb_num());
>> +	ecc_stngs = kzalloc_objs(ecc_stngs[0], node_num);
>>  	if (!ecc_stngs)
>>  		goto err_free;

Will fix it in RFC V2 with hygon_cdd_num() instead of amd_num_nodes() 
exported from Lin's Hygon Node RFC V2:
https://lore.kernel.org/lkml/20260423060420.1785357-3-wanglin@open-hieco.net/

>> @@ -4213,7 +4257,7 @@ static void __exit amd64_edac_exit(void)
>>  	else
>>  		amd_unregister_ecc_decoder(decode_bus_error);
>>  
>> -	for (i = 0; i < amd_nb_num(); i++)
>> +	for (i = 0; i < get_num_nodes(); i++)
>>  		remove_one_instance(i);
> This isn't a bug introduced by this commit, but is there a race condition
> during module unload?
> When amd_unregister_ecc_decoder() clears the callback pointer, could
> concurrently executing exception handlers still be running? If so,
> remove_one_instance() might free the memory controller instances while
> the handler is actively reading from them, potentially resulting in a
> use-after-free regression.

May consider it in RFC V2.


Best Regards,
Aichun

