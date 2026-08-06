Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5567D3515D9;
	Thu,  6 Aug 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980175; cv=none; b=aFqQ7T34++uEW9P25vExRARWShkdDuIaIuEkdg1u+ZsR20jMy63f74yYnlPYfD82Uy4E/weVbJ6+fz/ul99noY3qP8wOWmx8AKUgM6N2kcnMha8Xm6eHgErvzAn6K0WX6ryMTqN/wPEHZOqBQuzsjfYfppe1FjUXs2cKqrK4xh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980175; c=relaxed/simple;
	bh=b8x5JOCfBdcnB1NssCE9dOTDYvEorTikNUW2decxH4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boSEhXSX9cP7k83DIvrQkWB7nyWxzUmg43l+NDMuZZPkXLH7Gs/jBpmSl0WYctf4SosiB6vFiqWlxaufEi0Z9zE8cPhEKZar4eqvM2nzeig3dCwbFI0SXpk7BvHvlt9V2lamKJ0vvInfBpebV9Ji4AZiL0LVnOH4QvIXMhUcgnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8AxJqAJ5XNqjdgKAA--.11786S3;
	Thu, 06 Aug 2026 09:36:09 +0800 (CST)
Received: from [10.20.42.102] (unknown [10.20.42.102])
	by front1 (Coremail) with SMTP id qMiowJAxSsQH5XNqfk8lAA--.19057S2;
	Thu, 06 Aug 2026 09:36:09 +0800 (CST)
Message-ID: <3fc94c7d-8ec1-4b7e-bce7-46628d196b1e@loongson.cn>
Date: Thu, 6 Aug 2026 09:35:18 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] EDAC/loongson: Encode node and MC info into mc_idx
To: Huacai Chen <chenhuacai@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Wang Jinwei <wangjinwei@loongson.cn>, Yulong Wang <wangyulong@loongson.cn>,
 Dongyan Qian <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>
References: <20260805085414.1482-1-zhaoqunqin@loongson.cn>
 <20260805085414.1482-2-zhaoqunqin@loongson.cn>
 <CAAhV-H5F6JasjxgiDeDdsz64o186CoL1+EEkH6OJSHPZG0PDOQ@mail.gmail.com>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <CAAhV-H5F6JasjxgiDeDdsz64o186CoL1+EEkH6OJSHPZG0PDOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxSsQH5XNqfk8lAA--.19057S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtF4UXF13GFy7GryfZrW7KFX_yoW7GF45pF
	WUCa1YkF4rtr17uwsaqr1UZFyavr1rKFZFgws2ya4Fk3sFk34kXF93JryayFn7Cry8Kry8
	Za4rKrs7uFW5GFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIF
	yTuYvjxU2MKZDUUUU


在 2026/8/5 21:43, Huacai Chen 写道:
> Hi, Qunqin,
>
> On Wed, Aug 5, 2026 at 5:09 PM Qunqin Zhao <zhaoqunqin@loongson.cn> wrote:
>> From: Wang Jinwei <wangjinwei@loongson.cn>
>>
>> On Loongson multi-node systems, memory controllers are distributed across
>> multiple nodes. Encode node and MC information into mc_idx so that sysfs
>> entries uniquely identify each controller.
>>
>> The driver gets mc-idx from ACPI _DSD property if firmware provides it.
>> If not, it falls back to edac_device_alloc_index() for legacy firmware
>> compatibility.
>>
>> The number of memory controllers per node (mcs-per-node) is obtained
>> from firmware via ACPI _DSD property, with a default of 4 for backward
>> compatibility. Validate that the firmware-provided value is non-zero to
>> prevent division by zero. The node and MC IDs are decoded from mc_idx:
>>      node = mc_idx / mcs_per_node
>>      mc = mc_idx % mcs_per_node
>>
>> Cc: Yulong Wang <wangyulong@loongson.cn>
>> Cc: Dongyan Qian <qiandongyan@loongson.cn>
>> Cc: Chao Li <lichao@loongson.cn>
>> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
>> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
>> ---
>>   drivers/edac/loongson_edac.c | 35 ++++++++++++++++++++++++++++++-----
>>   1 file changed, 30 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
>> index 38745800ed..abfc1e60e0 100644
>> --- a/drivers/edac/loongson_edac.c
>> +++ b/drivers/edac/loongson_edac.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/io-64-nonatomic-lo-hi.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>   #include "edac_module.h"
>>
>>   #define ECC_CS_COUNT_REG       0x18
>> @@ -23,6 +24,8 @@ struct loongson_edac_pvt {
>>           * register state.
>>           */
>>          int last_ce_count;
>> +       int mcs_per_node;
>> +       bool mc_idx_valid;
>>   };
>>
>>   static int read_ecc(struct mem_ctl_info *mci)
>> @@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
>>   static void edac_check(struct mem_ctl_info *mci)
>>   {
>>          struct loongson_edac_pvt *pvt = mci->pvt_info;
>> -       int new, add;
>> +       char other_detail[64] = {0};
>> +       int new, add, node, mc;
>>
>>          new = read_ecc(mci);
>>          add = new - pvt->last_ce_count;
>> @@ -52,8 +56,14 @@ static void edac_check(struct mem_ctl_info *mci)
>>          if (add <= 0)
>>                  return;
>>
>> +       if (pvt->mc_idx_valid) {
>> +               node = mci->mc_idx / pvt->mcs_per_node;
>> +               mc = mci->mc_idx % pvt->mcs_per_node;
>> +               snprintf(other_detail, sizeof(other_detail), "node:%d mc:%d", node, mc);
>> +       }
>> +
>>          edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
>> -                            0, 0, 0, 0, 0, -1, "error", "");
>> +                            0, 0, 0, 0, 0, -1, "error", other_detail);
>>   }
>>
>>   static void dimm_config_init(struct mem_ctl_info *mci)
>> @@ -72,20 +82,26 @@ static void dimm_config_init(struct mem_ctl_info *mci)
>>          dimm->grain = 8;
>>   }
>>
>> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
>> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
>> +                    bool mc_idx_valid, int mcs_per_node)
>>   {
>>          struct loongson_edac_pvt *pvt = mci->pvt_info;
>>
>>          pvt->ecc_base = vbase;
>>          pvt->last_ce_count = read_ecc(mci);
>> +       pvt->mc_idx_valid = mc_idx_valid;
>> +       pvt->mcs_per_node = mcs_per_node;
>>   }
>>
>>   static int edac_probe(struct platform_device *pdev)
>>   {
>>          struct edac_mc_layer layers[2];
>>          struct mem_ctl_info *mci;
>> +       struct device *dev = &pdev->dev;
>>          void __iomem *vbase;
>> +       u32 mcs_per_node, mc_idx_u32;
> Why do we need mc_idx_u32? The code in V1 doesn't work?

V1 works. This is purely to fix the issue reported by sashiko:

"The mc_idx field is defined as an int in struct mem_ctl_info, but
device_property_read_u32() expects a u32 *. Should this be read into a
temporary u32 variable first?"

Should we ignore it?

>
>>          int ret;
>> +       bool mc_idx_valid = true;
>>
>>          vbase = devm_platform_ioremap_resource(pdev, 0);
>>          if (IS_ERR(vbase))
>> @@ -102,7 +118,6 @@ static int edac_probe(struct platform_device *pdev)
>>          if (mci == NULL)
>>                  return -ENOMEM;
>>
>> -       mci->mc_idx = edac_device_alloc_index();
>>          mci->mtype_cap = MEM_FLAG_RDDR4;
>>          mci->edac_ctl_cap = EDAC_FLAG_NONE;
>>          mci->edac_cap = EDAC_FLAG_NONE;
>> @@ -114,7 +129,17 @@ static int edac_probe(struct platform_device *pdev)
>>          mci->error_desc.grain = 8;
>>          mci->edac_check = edac_check;
>>
>> -       pvt_init(mci, vbase);
>> +       if (device_property_read_u32(dev, "mc-idx", &mc_idx_u32)) {
>> +               mci->mc_idx = edac_device_alloc_index();
>> +               mc_idx_valid = false;
>> +       } else {
>> +               mci->mc_idx = mc_idx_u32;
>> +       }
>> +
>> +       if (device_property_read_u32(dev, "mc-per-node", &mcs_per_node) || mcs_per_node == 0)
> The property should also be mcs-per-node.

OK

Thanks.

> Huacai
>
>> +               mcs_per_node = 4;
>> +
>> +       pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
>>          dimm_config_init(mci);
>>
>>          ret = edac_mc_add_mc(mci);
>> --
>> 2.47.3
>>
>>

