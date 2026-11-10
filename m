Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794351659;
	b=RrnnnV4g5aTgw9bw0V9zSvSevWcu9b3CJIhP92nkSjrj3oQZ4Lvy8YLvL8XN3AZq0SxI
	 I8y4UaeQ4FSN9z7ZH7i62lFC6/3ggdrM2BO/MvOVTuD9B7ktEwEoDRJB9S9Ljx4JumCap
	 txpcrEbqPZcY3o5lO07gIhQpIBUsBlLU8KTrBnudHEK3njplVZFZ1rjJvK68zsnQBTmlb
	 CL4Mt0CUuce+a9xXjIPlydz10f4VED1RbhyRq2rWmgV1FtWKGhgqJvkBhF7XNY2440no2
	 IWn1CyPTMSCM7THhm6ic4ABuWnmWJlOTeU3sT9sTpB0IKa6EzJ2CpxXm6KZ1T+jKokw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o9zfjeLXx8nlaVhvD+KO4LRkpHUPOVyGHHNomAn5t58=;
	b=ZBAjTmQPZZWcK25ogUBRdX6GtVI0p+/kGmKhUEX7niogaP1Zesz8u0gO5pHbLzuwrwQj
	 DQpntAQp4ausuUt3VtIU4bOOHKb92G6+M++8vjAoRFeaLrNbkJdHSHePuxOp2yDAKOHQ5
	 9Qy9JWq5pIbHyI+uZgUpJS4re9Jotb9wvhTsz8j+dZF+ojRy2jr02zZMxgiSr5po5HEln
	 YKBXWdZWcfoTyg5VdHI3hhxosZ4RfDHp0UBDusP1bhOlObo2jBm+J6JhnUmvfd4JsOOZE
	 fjrpncVz7PwLsoP001+p3Zu5x/3XeQsSKfcWE92Tgcbsr4kQVyd9F+y7IAmL8ehaEMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NME2XDvX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC5606A31C
	for <linux-edac@vger.kernel.org>; Tue, 10 Nov 2026 23:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NME2XDvX
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso1820115e0c.1
        for <linux-edac@vger.kernel.org>; Tue, 10 Nov 2026 15:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794351658; cv=none;
        d=google.com; s=arc-20260327;
        b=G/j2yxXmqOFnwmcpQWWH9HKw94+cal9gztZConvmw5Na2yLc7yl18iPjYWslM82WdC
         IODBWuYtRY+mjIjxdQ/aVPIdv5o1L6gBjnG6iwY1mpv1SW+MQcNZzVHSUzpksXn6tURy
         ZhUglqzLzLu8G4XSVVFLDWwkulebQhaEhGE6jSq48ZUfyRAiJUXCmLCZZvWqS/aD9QFe
         sRShFyxICkLMkC+ijbxPLdLRZ4EIgw4YETwo+1vfJU3VLBXT84slSJVmWk/ZUBkW5LV3
         4HIiQrEJwpr6PFbxU1U+20M67FmUSZ4JuRc8YlEH0G0wE14Kgh9gUCBtr0VFDdQDYrMz
         LO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9zfjeLXx8nlaVhvD+KO4LRkpHUPOVyGHHNomAn5t58=;
        fh=YBLdmB27PlBcltHsy5b5I5VjumemQlzuU7mLMJpaJJg=;
        b=Urk12loPLUiYWl+fyRWtOgdp1Q37UexcdmEX35sun7vH4YEcxdq9pMkmtDwMYKhcSK
         lUl11fnM1bpW4sDSgA3f6dp7M7REroUrv3ybySo68a1zki0O/HVYUf8d5hHH6f9i9dSO
         SC+Ny8ofIurmEu5CgoahOIpDmxsx7jaED0CsRrep+buaLEnjbaoQISbLwX09YgrLyVKM
         S2sHszF4U89qWxLP165Z4tzTOc9vCLN5ofy0PpPgFlggqAHbPtuNjlopO3NDi2RJJTRF
         7e99CClFflttsWFOgDd2rVYDuPwz/f9SEweRowEHMmiy95MrOHnyqtkhpDM+4CAehr5M
         O4aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794351658; x=1794956458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9zfjeLXx8nlaVhvD+KO4LRkpHUPOVyGHHNomAn5t58=;
        b=NME2XDvXz1QujELu1uKRy4PxvIj2Y3PYnDNxLGaRJFXJC5ZFBnWaaDi+D35cX54ClJ
         trsKh65JQNX56lyiMhfhk4D5VOv1LJGb8xYjL2MxH+kNH82lqbWZMINu6x3XvAZGrVOx
         GRLav0QN2+HQeaZ5T44dwIaCYcj7H5lhxt7bxACj2RI4wsFf1r32H8s1wAMW8WL279WL
         KPDhCnEOnAAVi7nJ9gLA/JIjRANM60bMgnBcO5e0xVrZdFDJRkHFLgJPfZbD3PYEnxSJ
         +MVokBumaQ2FGU2sBvqyi7pOgpugTbA/Htj8GPVvIXIT8FB7Qb+hAXCviNxlVo+d2+wT
         SDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351658; x=1794956458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9zfjeLXx8nlaVhvD+KO4LRkpHUPOVyGHHNomAn5t58=;
        b=bYC2O6MSifzoX/k48OI5dblTJE6Ky8tKUrdPdBARXK3IYg+/F/cnEB0x403VSRpSd9
         Ol9LNd+1s4Zy8+K3UJEvr+aFaq+YlHn/cyAmBKtqQ8DWvz/pAB62W+CVqcQR1vUqbY2Q
         NEd3kAQFcfLezOwDm4La1YvidrxdVa8aBngYXy1FPnZNWPG906xqtQrmAPFkDeACAd2G
         aiRtSb1LbF9iPoy5Z5hs+0CC2A2AUsME9z9JdRXTM7AA/sa+CEdF7koT+hLFGUiMmdwS
         oN5kQemJlPlL6bBj/Ck68rPXHVh3ckx6gOEMRx/jeThyTQr+d2IkxAt8R6Ukj1jAYtce
         2BmA==
X-Forwarded-Encrypted: i=1; AL+hErGEhmGtW/5GTAiAArOpi1cwIIgdX6zQZVWl28hGrrsx//apx1eF5ViJUEaOZ+pvqUpZQm3ZA35ORKAV@vger.kernel.org
X-Gm-Message-State: APuU4Z9x/ZrE4sgT2HeK4FhNs/B2blyc6LaGZBpFknGmhOJSJP6/9Y0d
	/yNN0hbEOUQO5gQ6u/Acsxk8mwgycRqgnsmtuDY1Wdx0M1OIpVUfU5QI6FN+NCXMgi4jdHJlHi7
	XcsZvt27eJMt3aRc1/vZGufGBULduI0BEd/Hr0UY=
X-Gm-Gg: AYBFou0JTcylsba2hdJR2X7rxsZ4zEzjWnRoaXadVgc6sqmRRx3tLwUifjOy/rQqap+
	HtJpnstZbiieu3CtNi/PvkFKYst03FQr1ZuCShr/S5/nxbm01znyY1tP65jka2mgjkdVlf8h+fM
	R2Hns0uXF8n9RGFFbAdqw8B4Y72oLUpDFNBAMna4pEZLHv8nisVv0ilu2KlfyUb0mgRjnlVBWLy
	+Ris4pdnlsaoRNdu0XR0kIXet4mu3ILLNsrCTQAJBecHPviiscWmJz6OLLljJHa6mKeRPsNVMTw
	gloe1W+zpLYqNYTBmD/a9NDYEYc9HOVAHYV/1DCxHmEZ6m+lpvwkoMHjxheT1c7yIWT9rk3zjyp
	XMAM3V8EtrcCq4E7S4id6Nqxfqk+cDJMv0V3XaQ==
X-Received: by 2002:ac5:c752:0:b0:5ee:b3:a43d with SMTP id 71dfb90a1353d-5ee1b02333dmr198001e0c.21.1794351658145;
 Tue, 10 Nov 2026 15:00:58 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-3-shijujose2008@gmail.com> <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
 <CAG4KcR+NOKHNzg6FN-oLLHgUxeitZHKXg9cN7dz24+Ap=RrwSA@mail.gmail.com> <20261110071729.GIavLFCfLKzPx8R0i0@fat_crate.local>
In-Reply-To: <20261110071729.GIavLFCfLKzPx8R0i0@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Tue, 10 Nov 2026 23:00:45 +0000
X-Gm-Features: AclHuK9UQtupPx8LMZTpk2yNTMX5hNKYK0tRiitG5dSZyQW9ncd1bgVrIhw2Lvo
Message-ID: <CAG4KcR+ikfQEBjCZiNJ1CUz=u3Gtbk_XDroA_GQqYpgO4Lo5Qw@mail.gmail.com>
Subject: Re: [PATCH v23 2/2] ras: mem: Add ACPI RAS2 memory driver
To: Borislav Petkov <bp@alien8.de>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 7:18=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Sun, Oct 18, 2026 at 11:56:22PM +0100, Shiju Jose wrote:
> > I have got an arm64 setup only, did not try to build for X86 recently
> > after adding the following change
> > of using iowrite64 and ioread64 as suggested by
> > https://sashiko.dev/#/patchset/20260325165714.294-1-shiju.jose%40huawei=
.com
> >
> > Following change is required to build for X86_64 build when using
> > iowrite64 and ioread64, while it was
> > fine for the ARM64 build.
> > Note: I'm not sure whether RAS2 is needed for the 32 bit build or not
> > and the result of the 32 bit build.
>
> I'm not sure iowriteXX/readXX are needed here at all.
>
> Documentation/driver-api/device-io.rst talks about all those different op=
tions
> and the most generic ones are readq/writeq().
>
> About those you're using, it says:
>
> "ioread64(), ioread32(), ioread16(), ioread8(),
> iowrite64(), iowrite32(), iowrite16(), iowrite8()
>
>   These are an alternative to the normal readl()/writel() functions, with=
 almost
>   identical behavior, but they can also operate on ``__iomem`` tokens ret=
urned
>   for mapping PCI I/O space with pci_iomap() or ioport_map(). On architec=
tures
>   that require special instructions for I/O port access, this adds a smal=
l
>   overhead for an indirect function call implemented in lib/iomap.c, whil=
e on
>   other architectures, these are simply aliases."
>
> and I don't see anywhere that you absolutely need those, judging by that
> explanation there. But what do I know.
>
> Unless there's a real reason you cannot use readq/writeq()...?
>
> But those should give you the same fixed endianness when accessing little
> endian ACPI so...
>
Hi Boris,

Thanks for the guidance.

I replaced  ioread8/ioread16/ioread32/ioread64 with readb/readw/readl/readq=
 and
iowrite8/iowrite16/iowrite32/iowrite64 with
writeb/writew/writel/writeq respectively and testing passed
in the arm64 test setup. Also the X86-64 build is fine.

I am sharing the changes in patch#2 here for feedback while testing on
other platforms.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
From d504d61a17d46b0aa1141b5d1cf828facb67eef6 Mon Sep 17 00:00:00 2001
From: Shiju Jose <shijujose2008@gmail.com>
Date: Tue, 10 Nov 2026 22:48:52 +0000
Subject: [PATCH 1/1] ras: mem: Replace ioread8/16/32/64 with readb/w/l/q &
 iowrite8/16/32/64 with writeb/w/l/q

X86-64 build failed with ioread64 and iowrite64 are not defined.

To fix this issue replace ioread8/16/32/64 with readb/readw/readl/readq and
iowrite8/16/32/64 with writeb/writew/writel/writeq respectively.
---
 drivers/ras/acpi_ras2.c | 56 ++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/ras/acpi_ras2.c b/drivers/ras/acpi_ras2.c
index 51adfcddfa99..0849dd247cac 100644
--- a/drivers/ras/acpi_ras2.c
+++ b/drivers/ras/acpi_ras2.c
@@ -51,9 +51,9 @@ static int ras2_is_patrol_scrub_support(struct
ras2_mem_ctx *ras2_ctx)
  struct acpi_ras2_shmem __iomem *common =3D (void *)ras2_ctx->comm_addr;

  guard(mutex)(ras2_ctx->pcc_lock);
- iowrite8(0, &common->set_caps[0]);
+ writeb(0, &common->set_caps[0]);

- return ioread8(&common->features[0]) & RAS2_SUPPORT_HW_PARTOL_SCRUB;
+ return readb(&common->features[0]) & RAS2_SUPPORT_HW_PARTOL_SCRUB;
 }

 static int ras2_update_patrol_scrub_params_cache(struct ras2_mem_ctx *ras2=
_ctx)
@@ -63,17 +63,17 @@ static int
ras2_update_patrol_scrub_params_cache(struct ras2_mem_ctx *ras2_ctx)
  u32 scrub_params_out;
  int ret;

- iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
- iowrite16(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
- iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
- iowrite64(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
+ writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
+ writew(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
+ writeq(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
+ writeq(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
  ret =3D ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
  if (ret) {
  dev_err(ras2_ctx->dev, "Failed to read patrol scrub parameters\n");
  return ret;
  }

- scrub_params_out =3D ioread32(&ps_sm->params.scrub_params_out);
+ scrub_params_out =3D readl(&ps_sm->params.scrub_params_out);
  ras2_ctx->min_scrub_cycle =3D FIELD_GET(RAS2_PS_MIN_SC_HRS_OUT_MASK,
       scrub_params_out);
  ras2_ctx->max_scrub_cycle =3D FIELD_GET(RAS2_PS_MAX_SC_HRS_OUT_MASK,
@@ -94,10 +94,10 @@ static int
ras2_update_patrol_scrub_params_cache(struct ras2_mem_ctx *ras2_ctx)
  return 0;
  }

- if  (ioread32(&ps_sm->params.flags) & RAS2_PS_FLAG_SCRUB_RUNNING) {
+ if  (readl(&ps_sm->params.flags) & RAS2_PS_FLAG_SCRUB_RUNNING) {
  ras2_ctx->od_scrub =3D true;
- ras2_ctx->base =3D ioread64(&ps_sm->params.actl_addr_range[0]);
- ras2_ctx->size =3D ioread64(&ps_sm->params.actl_addr_range[1]);
+ ras2_ctx->base =3D readq(&ps_sm->params.actl_addr_range[0]);
+ ras2_ctx->size =3D readq(&ps_sm->params.actl_addr_range[1]);
  } else {
  ras2_ctx->od_scrub =3D false;
  }
@@ -128,7 +128,7 @@ static int ras2_get_demand_scrub_running(struct
ras2_mem_ctx *ras2_ctx, bool *ru
  return ret;
  }

- *running =3D ioread32(&ps_sm->params.flags) & RAS2_PS_FLAG_SCRUB_RUNNING;
+ *running =3D readl(&ps_sm->params.flags) & RAS2_PS_FLAG_SCRUB_RUNNING;
  if (!(*running))
  ras2_ctx->od_scrub =3D false;

@@ -338,18 +338,18 @@ static int __ras2_hw_scrub_set_enabled_bg(struct
device *dev, void *drv_data, bo
  if (ret)
  return ret;

- iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
+ writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
  if (enable) {
  if (ras2_ctx->bg_scrub || running)
  return -EBUSY;

- iowrite64(0, &ps_sm->params.req_addr_range[0]);
- iowrite64(0, &ps_sm->params.req_addr_range[1]);
- scrub_params_in =3D ioread32(&ps_sm->params.scrub_params_in);
+ writeq(0, &ps_sm->params.req_addr_range[0]);
+ writeq(0, &ps_sm->params.req_addr_range[1]);
+ scrub_params_in =3D readl(&ps_sm->params.scrub_params_in);
  scrub_params_in &=3D ~RAS2_PS_SC_HRS_IN_MASK;
  scrub_params_in |=3D FIELD_PREP(RAS2_PS_SC_HRS_IN_MASK,
ras2_ctx->set_scrub_cycle);
- iowrite32(scrub_params_in, &ps_sm->params.scrub_params_in);
- iowrite16(RAS2_START_PATROL_SCRUBBER, &ps_sm->params.command);
+ writel(scrub_params_in, &ps_sm->params.scrub_params_in);
+ writew(RAS2_START_PATROL_SCRUBBER, &ps_sm->params.command);
  } else {
  /*
  * There is no need to send the command to stop background scrubbing,
@@ -358,13 +358,13 @@ static int __ras2_hw_scrub_set_enabled_bg(struct
device *dev, void *drv_data, bo
  if (!ras2_ctx->bg_scrub)
  return -EPERM;

- iowrite16(RAS2_STOP_PATROL_SCRUBBER, &ps_sm->params.command);
+ writew(RAS2_STOP_PATROL_SCRUBBER, &ps_sm->params.command);
  }

- scrub_params_in =3D ioread32(&ps_sm->params.scrub_params_in);
+ scrub_params_in =3D readl(&ps_sm->params.scrub_params_in);
  scrub_params_in &=3D ~RAS2_PS_EN_BACKGROUND;
  scrub_params_in |=3D FIELD_PREP(RAS2_PS_EN_BACKGROUND, enable);
- iowrite32(scrub_params_in, &ps_sm->params.scrub_params_in);
+ writel(scrub_params_in, &ps_sm->params.scrub_params_in);
  ret =3D ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
  if (ret) {
  dev_err(dev, "Failed to %s background scrubbing\n",
@@ -449,22 +449,22 @@ static int ras2_hw_scrub_set_enabled_od(struct
device *dev, void *drv_data, bool
  goto enable_bg_scrub;
  }

- iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
- scrub_params_in =3D ioread32(&ps_sm->params.scrub_params_in);
+ writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
+ scrub_params_in =3D readl(&ps_sm->params.scrub_params_in);
  scrub_params_in &=3D ~RAS2_PS_SC_HRS_IN_MASK;
  scrub_params_in |=3D FIELD_PREP(RAS2_PS_SC_HRS_IN_MASK,
ras2_ctx->set_scrub_cycle);
  scrub_params_in &=3D ~RAS2_PS_EN_BACKGROUND;
- iowrite32(scrub_params_in, &ps_sm->params.scrub_params_in);
- iowrite64(ras2_ctx->base, &ps_sm->params.req_addr_range[0]);
- iowrite64(ras2_ctx->size, &ps_sm->params.req_addr_range[1]);
- iowrite16(RAS2_START_PATROL_SCRUBBER, &ps_sm->params.command);
+ writel(scrub_params_in, &ps_sm->params.scrub_params_in);
+ writeq(ras2_ctx->base, &ps_sm->params.req_addr_range[0]);
+ writeq(ras2_ctx->size, &ps_sm->params.req_addr_range[1]);
+ writew(RAS2_START_PATROL_SCRUBBER, &ps_sm->params.command);

  ret =3D ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
  if (ret) {
  dev_err(dev, "Failed to start demand scrubbing rc(%d)\n", ret);
  if (ret !=3D -EBUSY) {
- iowrite64(0, &ps_sm->params.req_addr_range[0]);
- iowrite64(0, &ps_sm->params.req_addr_range[1]);
+ writeq(0, &ps_sm->params.req_addr_range[0]);
+ writeq(0, &ps_sm->params.req_addr_range[1]);
  ras2_ctx->od_scrub =3D false;
  ras2_ctx->base =3D 0;
  ras2_ctx->size =3D 0;
--=20
2.25.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

Thanks,
Shiju
