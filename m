Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF10242D7B;
	Fri, 14 Aug 2026 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692813; cv=none; b=RmXy8pIfDmIWxGYMIAIvm4Y5N6NL+BR5WEkywJ3sIv3oZcSYnNAoW4NO/nEGFGODkH4rzr9I7zYD3dWV2fIAHCu/iWPyA2z8s/J5qU4OqvvM7DjOA25wNFMgXgizs+NyPRVVDEIerjdZ7PfGQMg1l8Y9tjXFv/BOaUr7O94Jthk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692813; c=relaxed/simple;
	bh=AUcZck6TiAAaviUvLJSUmyY1yJtjaaViHwHYGCocmV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnc7UhVYso0hL32v5Ofnm8J2EnGhreN0zJkiqQPn81m44jwp63WI1WdBPjpLAZ9L/pXlbuwzUxXlfBulwP2Zw13nfxUMejUvMkIJ63sxjvMmgiidqROW0H1vcmOAlE+/HrBu+hra9NhzpWZWubN1UNXBroXXXK7JKn1PdOVZQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8DxC9K3xH5qlicBAA--.3504S3;
	Fri, 14 Aug 2026 15:33:11 +0800 (CST)
Received: from [10.20.42.102] (unknown [10.20.42.102])
	by front1 (Coremail) with SMTP id qMiowJCxNs2zxH5qQ10EAA--.15824S2;
	Fri, 14 Aug 2026 15:33:09 +0800 (CST)
Message-ID: <54439ff4-52ae-4e87-9adc-d63356961434@loongson.cn>
Date: Fri, 14 Aug 2026 15:31:15 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] EDAC/loongson: Add CS4-7 timeout filter for
 cross-node access
To: bp@alien8.de
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 chenhuacai@kernel.org, Wusheng <wusheng@loongson.cn>,
 Wang Jinwei <wangjinwei@loongson.cn>
References: <20260812064139.1231-1-zhaoqunqin@loongson.cn>
 <20260812064139.1231-4-zhaoqunqin@loongson.cn>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <20260812064139.1231-4-zhaoqunqin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxNs2zxH5qQ10EAA--.15824S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKF4ruFyUAF4kZF4xKrW7Awc_yoWxGFy8pF
	Z8Can8trW0qr92ywnrtr4UZa45u39aka98Wr93A34rCr98Zr98XrySgrW2v3WDC340kw1j
	q3W8KwsrCFWDAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07jepB-UUUUU=


在 2026/8/12 14:41, Qunqin Zhao 写道:


> On Loongson 3C6000 multi-node systems, when the EDAC driver running
> on one node accesses the memory controller registers of another node,
> the read operation may timeout and return random values. This causes
> false CE error reports because the random values in CS0-3 (low 32 bits)
> are misinterpreted as valid ECC error counts.
>
> For cross-node accesses, check CS4-7 (high 32 bits) of the ECC
> count register. If the valid-cs-bits firmware property is set and
> the high bits are non-zero, it indicates a timeout or random value,
> so skip the report and return the previous count.
>
> To avoid undefined behavior on 8-CS systems where valid_cs_bits=64,
> guard the shift with a bounds check (valid_cs_bits < 64).
>
> Signed-off-by: Wusheng <wusheng@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>   drivers/edac/loongson_edac.c | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index a3776a8501..eb36b708e6 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -27,6 +27,7 @@ struct loongson_edac_pvt {
>   	 */
>   	int last_ce_count;
>   	int mcs_per_node;
> +	int valid_cs_bits;

Thanks for the pointer. I've reviewed the Sashiko report and address each
finding below.

[Severity: Medium]


 > The valid-cs-bits device property is parsed as a u32, but it is stored
 > here as a signed int.
 >
 > If the device tree specifies a value >= 0x80000000, it would be cast to a
 > negative integer. This could bypass the bounds check in read_ecc() 
where it
 > checks pvt->valid_cs_bits < 64, resulting in a right-shift by a negative
 > amount.
 >
 > Could this be declared as a u32 instead to avoid undefined behavior?

I'll change `int valid_cs_bits` to `u32` in the struct and
in the `pvt_init()` parameter.
>   	bool mc_idx_valid;
>   };
>   
> @@ -37,11 +38,21 @@ static int read_ecc(struct mem_ctl_info *mci)
>   	int cs;
>   
>   	ecc = readq(pvt->ecc_base + ECC_CS_COUNT_REG);
> -	/* cs0 -- cs3 */
> +	/* Discard the read value if any invalid bit is set to 1 */
> +	if (pvt->valid_cs_bits < 64 && (ecc >> pvt->valid_cs_bits)) {
> +		edac_mc_printk(mci, KERN_DEBUG, "ECC read invalid, skip: 0x%llx\n", ecc);
> +		return pvt->last_ce_count;
> +	}
[Severity: Medium]

 > If the hardware read times out during probe, this will return the
 > uninitialized pvt->last_ce_count (which is 0 since pvt_info is
 > zero-allocated).
 >
 > Since pvt_init() uses this to set the baseline error count:
 >
 > drivers/edac/loongson_edac.c:pvt_init() {
 >     ...
 >     pvt->last_ce_count = read_ecc(mci);
 > }
 >
 > Does this incorrectly set the baseline count to 0 if a timeout occurs 
on the
 > first read? If so, on the next successful poll, the entire historical 
error
 > count since system reset would be subtracted by 0 and falsely reported as
 > newly occurred errors.

This cannot be fixed in software:

1. Waiting for a "correct" read during probe could hang the kernel.
2. A bounded retry cannot guarantee correctness - all reads within the 
window
    could still return bogus values.
3. The only thing software can do is print a debug message when a suspicious
    value is detected, which this patch already does.
> +
> +	/* cs0 -- cs7 */
>   	cs = ecc & 0xff;
>   	cs += (ecc >> 8) & 0xff;
>   	cs += (ecc >> 16) & 0xff;
>   	cs += (ecc >> 24) & 0xff;
> +	cs += (ecc >> 32) & 0xff;
> +	cs += (ecc >> 40) & 0xff;
> +	cs += (ecc >> 48) & 0xff;
> +	cs += (ecc >> 56) & 0xff;
>   
>   	return cs;
>   }
> @@ -111,14 +122,15 @@ static void dimm_config_init(struct mem_ctl_info *mci)
>   }
>   
>   static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
> -		     bool mc_idx_valid, int mcs_per_node)
> +		     bool mc_idx_valid, int mcs_per_node, int valid_cs_bits)
>   {
>   	struct loongson_edac_pvt *pvt = mci->pvt_info;
>   
>   	pvt->ecc_base = vbase;
> -	pvt->last_ce_count = read_ecc(mci);
>   	pvt->mc_idx_valid = mc_idx_valid;
>   	pvt->mcs_per_node = mcs_per_node;
> +	pvt->valid_cs_bits = valid_cs_bits;
> +	pvt->last_ce_count = read_ecc(mci);
>   }
>   
>   static int edac_probe(struct platform_device *pdev)
> @@ -127,7 +139,7 @@ static int edac_probe(struct platform_device *pdev)
>   	struct mem_ctl_info *mci;
>   	struct device *dev = &pdev->dev;
>   	void __iomem *vbase;
> -	u32 mcs_per_node;
> +	u32 mcs_per_node, valid_cs_bits;
>   	int ret;
>   	bool mc_idx_valid = true;
>   
> @@ -165,7 +177,10 @@ static int edac_probe(struct platform_device *pdev)
>   	if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) || mcs_per_node == 0)
>   		mcs_per_node = 4;
>   
> -	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
> +	if (device_property_read_u32(dev, "valid-cs-bits", &valid_cs_bits))
> +		valid_cs_bits = 32;
[Severity: High]

 > On older 8-CS systems lacking the valid-cs-bits firmware property, this
 > defaults to 32.
 >
 > If a correctable error occurs on CS4-CS7 on these systems, the 
hardware ECC
 > register will populate the upper 32 bits. The timeout filter in 
read_ecc()
 > will incorrectly interpret this as a timeout and discard the read.
 >
 > Because the hardware ECC register is cumulative and cannot be 
cleared, the
 > upper bits will remain non-zero permanently. Will this cause every 
subsequent
 > poll to be discarded, effectively deadlocking EDAC error reporting 
for all
 > chip selects on that node?

This concern does not apply for two reasons:

1. There are no 8-CS systems at this point, so backward compatibility with
    8-CS firmware is not something we need to account for. The 
`valid-cs-bits`
    default of 32 matches the 4-CS hardware that the current firmware 
targets.

2. On 8-CS systems, all 64 bits of the register are valid counter bits, so
    software cannot distinguish a correct read from a bogus one. Determining
    whether a read is valid on such systems requires a hardware 
mechanism; no
    software-only check can do it.

Please let me know if this addresses your concerns; otherwise I'll send a v4
with the Finding 1 fix.

Thanks,
Qunqin
> +
> +	pvt_init(mci, vbase, mc_idx_valid, mcs_per_node, valid_cs_bits);
>   	dimm_config_init(mci);
>   
>   	ret = edac_mc_add_mc(mci);

