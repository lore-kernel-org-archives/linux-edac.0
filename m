Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795299881;
	b=Mol9ebVJeOsAWfp20r/sdPmdVBO9pai10zJlCT4G73acWvXkZ0eSNTPId3W8Ger/Ijde
	 6Goyodt/vNgAy0Veut3Dn9tB5rwILQjSlNx/Ty9M9RItG8kC6WIF3ripRJf0WxbYHGHZ/
	 mfiN1fz+tLixQlD/zAB1vfHTLHsfBJLfo6G+b/WlFg2imcQ8J6kUD5VUtfq6XwWqKYEwg
	 UQktjTk3Hrvfc5o+NFjJ0YJJsP3Xl6cPKfIox4mgJxhK2V3k6RU64gckSySpv1v+WzUmG
	 dzd/z/A8grg+8CeGfkWXFzkMdn8pnHFygI8FxHU/oKFkqz6cn/FsPZCG2BqVFaS+qFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795299881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Hz3905wAXZE2z0xpo1pg4iMkZNUnir/n6DiACnoEPHk=;
	b=EqFVTvNUDD4yCv6h6aTAFsJ+hCOb25eKD9+sz14JXhd7chtBCxM0ortYjzFxa7m4y9/i
	 gVAHuXHC1lqFx6cLaP5BoJybTpOEROSz5DhSZOHmf1SjMuTHQG0mg0vREp6eeypLa4+TZ
	 L0rz+anYDjJ92poHct/hWYERJUVS3YErCVuKXBsegQx2kRAuP2GJfx83UI+X6zRhVBLL7
	 BTxF0SL9Xs91yWCrXzwDlGQXsAdbWfz8JHm0Aaw3KNxPsYj5JTHVo7xs/jN18fLenrFZo
	 9N/vavECxlk7DRFx2ph3LDBV/C85K8Sdw+dWZuXzc8MKeXH80JMWBZm7/iDevBkYdbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iwlx/YiR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE6606A32A
	for <linux-edac@vger.kernel.org>; Sat, 21 Nov 2026 22:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BE6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwlx/YiR
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2043923a34.1
        for <linux-edac@vger.kernel.org>; Sat, 21 Nov 2026 14:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795299880; cv=none;
        d=google.com; s=arc-20260327;
        b=UdDIwwqs8P5PkvV0LLnUEwm+ZtRkr+dIYXedY1LeBaLTLGnZHHaDhTfrWBZmZRt0wO
         3vWZYv7TLlIcoEiRfQQ2h5KKw0sFmRJmsY8dGuBaSIANl8nVO1TIMdihmG1iFxksoKFj
         +D938+OlaxE/KKGxv/920jtD3lnV1mo6VlZYhEMwMk4zlTer6iG2huG6asUbOzRFCgsB
         8cHSzOc3eHgbuHxDuzJ1svNJVeGTN7WQ0zU/0NExVbpZug74UAlE+AHEk40L1J3UHBLy
         dU9nGz657rb0xYBmPmrDcrAirPc3POM2EFQouEJw5Eg+6RdQmkpA/ZG6OoSdGxq0t5av
         kCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hz3905wAXZE2z0xpo1pg4iMkZNUnir/n6DiACnoEPHk=;
        fh=yNkiz1Dg+yDcXcwkg3rH4sZZdremi5JeU0aDovHgbq0=;
        b=pwcMIWVXqybGVkw9xtG9fJmGw3WbXTb273OA3y9kD6XnAz+OUlxrazsQNaOj4enaGp
         W1onUYZxrx/uoU1OpmfloAVdx2tNDXRxzhv+EkltK2bOBikk1IGNdxUSgTD7YdlyibCx
         WiQ2GWwbofGsdoq8uIkXr+KGIn+2O7eLfY2NfQmUAh3xcfhoW9fTimg16Xp5kCEg/dVg
         nX9D9eqDbCXSV+7XNFQMA2+RLHlScsSWODfCGfbQpaguXAFEDwxACnXjTOnJ2kOZbCx+
         gFSjGfiL16jrFqe1OfifzF48qqj8WByrnzMaCCrOPFX5C0/NIJ6yJhCnpb+9W2atAhxy
         j03A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795299880; x=1795904680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hz3905wAXZE2z0xpo1pg4iMkZNUnir/n6DiACnoEPHk=;
        b=iwlx/YiRPAdloZBmBL4iBicJ5qjH9cxWWijc/+M0drPUqUyZTbyNJy1fF4OT9IRKe0
         d9Fvg+W1Z+BJo2/wkQEHEhZ0wb8qMWAAy8SURPHAmuW7Prn8OoPQRpH3ZQiLVbvNExCd
         D3JvxE3k1EDmvNnPy3wgk9OYi3WVjmTK+ZzmZhRH6RkaeUQY1gkOX4gei720SqPrvqAo
         n3Gjyhgh5oofchX8sCPo9HlapCvfneWCMqgBmF7Um+ph8RD2dhm5mGt7D0B3wW8RFdAE
         64dXwJfl40o5/4PsehIkbg3hnsPU0ZkeLl/wU/ArSjwqoux4f7QoDcHtYxvFtHGHs8Xr
         Ym0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795299880; x=1795904680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hz3905wAXZE2z0xpo1pg4iMkZNUnir/n6DiACnoEPHk=;
        b=RQgW6sRlgTJ7PTCKmNwyrhxNyIT2t0/oIBVzFLV1503UYcn5Ns8/ZmZ5WXAjICVNSg
         kNMUvkn7xG8FsV8v80WiNXQnsMdb4NJLMZGF2LwSJwTBGVetJlKZLrfizDrREZlpfdo9
         ZavT4oGPLOI2g45RTyvYZHAxVcniqo85GlHpXvK40ZrCaWMPRgvu6MDYaIb0Y1TrlgZB
         66sKkUkQ2GcPVIuMyUHKCIlHXaIM9TMXFwyDXYCsAcceHk8tPo1BsQkbw5XBn3AlQw9J
         GHBmHgKqFmFljPIiZojWoAxxHr9Sf1mF7YRW5FvX+R81z0f6Dyak5DwSLNzznjuk3oSi
         j1Nw==
X-Forwarded-Encrypted: i=1; AL+hErGe1NhxH+qyLc186crk2pG0/cUJsvcOXkJ8hvP/CovA2cggB/ISExCdGZmQRahBme39UNmQ3oo6Nw2h@vger.kernel.org
X-Gm-Message-State: APuU4Z+HwsoftpZ1LAKAkla+ck12DQCiKLhYglwj2/6+2uqgNTK28Kuy
	KS1UdqD1Vn/7XyDmBg+bokGNos69rOPBGnHqK1+lkGS1+lsM4HaJHxnQz0aoNbwBhrKc3laE3BA
	FvSHzo0t7djTu3mjwju3wKJIVbYOp/TI=
X-Gm-Gg: AZFdTZdgHkVngzxP10gPKHVbyAKpMO1YIYZi4QF3mxYh2P0eVXLQ0DA7W/MVcMi4S47
	xi8c2jaCOtHvx4Nxjx6wZD8rc3qSMTt8oiLpOZCshh8kGtSuFLZ43TwOzLNOb4H1nBp4HBwhK+j
	sUMTB9TEjlJCIdwWw1+HhNE0+fMFPnPWrT4WdyPExRLUmaNxA+PdRspF70rHt/NDjodwFNXgzAU
	nuNHGX44pk5zBH1ckerfHSLLBc5KP3aCi6Y/nri/snY2tV+WjTg7TRtspe4wxDsOJSbBt9TaSsL
	O1K+vNTLUoVSg41a2lHk/bkXy2nFkXQoU0qk7Thp1h/eEv9GsrXQO3b8urCIYKxQ53OnzO5DCcr
	1uxpGW5iGXvfdCHjjBpfSbjmKie3DEoAEBX0P
X-Received: by 2002:a05:6830:2692:b0:862:eb1e:6a78 with SMTP id
 46e09a7af769-8631593a1b2mr8377193a34.7.1795299880305; Sat, 21 Nov 2026
 14:24:40 -0800 (PST)
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
 <CAG4KcR+NOKHNzg6FN-oLLHgUxeitZHKXg9cN7dz24+Ap=RrwSA@mail.gmail.com>
 <20261110071729.GIavLFCfLKzPx8R0i0@fat_crate.local> <CAG4KcR+ikfQEBjCZiNJ1CUz=u3Gtbk_XDroA_GQqYpgO4Lo5Qw@mail.gmail.com>
 <20261121194030.GBawHzrrCNCMpfr7Gx@fat_crate.local> <CAG4KcRKhE1UXwrhscUdSpDJS8R0t7kWp8RXZm8j_9yXYJSQ2KQ@mail.gmail.com>
 <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local>
In-Reply-To: <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sat, 21 Nov 2026 22:24:28 +0000
X-Gm-Features: Aa3M54pmfzCjwgwOho9jx8HJwewKtlzAxxWUC8EhQd9hmHj0B3lyfXoGWgN4lh0
Message-ID: <CAG4KcRKzXNsvBWuuU2_aX5gO7u4vgKAK+bkrB2vgEFBGu3WJCA@mail.gmail.com>
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

On Sat, Nov 21, 2026 at 9:08=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Sat, Nov 21, 2026 at 07:53:54PM +0000, Shiju Jose wrote:
> > Please find the attached patch with the changes.
>
> Thanks, you missed a spot. I fixed it up:
>
> diff --git a/drivers/ras/ras2_mem.c b/drivers/ras/ras2_mem.c
> index 70f7f0b497ed..de5555d2e1b8 100644
> --- a/drivers/ras/ras2_mem.c
> +++ b/drivers/ras/ras2_mem.c
> @@ -117,10 +117,10 @@ static int ras2_get_demand_scrub_running(struct ras=
2_mem_ctx *ras2_ctx, bool *ru
>                 return 0;
>         }
>
> -       iowrite8(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]=
);
> -       iowrite16(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
> -       iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
> -       iowrite64(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);
> +       writeb(RAS2_SUPPORT_HW_PARTOL_SCRUB, &ps_sm->common.set_caps[0]);
> +       writew(RAS2_GET_PATROL_PARAMETERS, &ps_sm->params.command);
> +       writeq(ras2_ctx->mem_base, &ps_sm->params.req_addr_range[0]);
> +       writeq(ras2_ctx->mem_size, &ps_sm->params.req_addr_range[1]);

Thanks Boris for fixing this and verified by testing.

Thanks,
Shiju

>
>         ret =3D ras2_send_pcc_cmd(ras2_ctx, PCC_CMD_EXEC_RAS2);
>         if (ret) {
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
