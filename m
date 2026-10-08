Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCC43D411B
	for <linux-edac@vger.kernel.org>; Thu,  8 Oct 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443912; cv=pass; b=lo591qJj+u9INHwa654biarYfBVQTw8R59vymZakh5k3q19d1lGJdnFy3ZpnxJp31vpWSoE6sFvPaT4/Y/TSqA+RGq+Uux+NLasJjdq47ZSU173LlVAoHk+nZpejlg0S6neMHvLeNq6bUsgURN9ECiCmsPtRQ1igmYsnH3GFf30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443912; c=relaxed/simple;
	bh=mEfZs82VT+qdUvxddu4QZb3styi2rIzs8l6ABw4Qllo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yek9x4v17APW6MQu7ozQ5TNzCghrIFfotB+fADRKN4nvrzIslEEoi3HC0dEn9EDyURl0QwjiRo2gQ+RpPhIdTs1kJu/BO7Mx732HTah5eQyTzOKkI4njSSWzA6NxRz60e2WJwbbb/6CJvnzhbt3vyM1LxbJ489X+pdBtK5QQ1AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8r4URmw; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8r4URmw"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d290b10a35so1000318eaf.2
        for <linux-edac@vger.kernel.org>; Thu, 08 Oct 2026 00:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791443909; cv=none;
        d=google.com; s=arc-20260327;
        b=OCLJJL1i9bKiO97wK87cCVWwxkhgwv82Fy3qDtkftP0QxvrTPm1fgEIUq7UcO0TK7x
         q4dARP8jEE+IjWlxlvMvifdSkgzf94Sdvg8SQnyiVKlbPG1UHohpQjxT/tLpVfUFqneN
         2iV2G/aEGSvfUAADgj3iG7YCUn/jYRnOr0cEjqa+5Jo45R3JWWYQb2Mpl/ISrboBb5jN
         rnhca/GtudHu4WL9IXdmSc/j8FrowWLQi5mSIYgK8B+L2RxrxlJP8ENFI4wwC90oUtuT
         OvEPJ+bR88bcL2mPji5IFzLOvrjwnQ5XUlzjwLKnp1lDQmdRF+UzrXZy7oN9GprWS3oc
         ZAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=70ywZ2AyEe7ncaX3K+b5VsGq7joUvo2qDjp4zFNieZQ=;
        fh=5Cxs5gJc3EZRBR1ZOT1ixnaLNeAFF9FKtnY9xAh4p1c=;
        b=B/iFAgxhSWkNFevdgbVNnlmRgxPyxm/DlF8onQesLOBv4ApXQj8hcwNjtVf/sc94Se
         dYRxoqY4Wfd1lm8U5czEysP7VeBB1BSyLYxgtdtQphiAja/gSLRlrIDY3Kp+F3XisKNf
         W7NB59NYXZZqx3fDya4DD2ajRdB1n/HefpfExw8aeEL3k+vQ4wXpDpQLaAtUa1dqhimq
         rhl4UToz+MQCo9GA6MMnTIGvkc9QAwMNsWlyXqwDbqp/m2zUAWZkJZ5SQmeto+0HeplW
         zl1vbcpznEtlC+s7bDjOGyAPQ6NNs2HHiRe31M0e1rLkJMw8QO4hlyqMYIKNP1fxeKw8
         GSmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791443909; x=1792048709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=70ywZ2AyEe7ncaX3K+b5VsGq7joUvo2qDjp4zFNieZQ=;
        b=l8r4URmwE6Pqf05rXr098yyUPpb0lPIsiCToQANmesWZw04HT6qBAsBWeE63M2Ftd2
         6ZnU0ZFm5fVVkw9PJ7zeU2S0ubWbK8a8dtxjz9anI4pN8sWr9WjYll7VIJdgWxUKRZcE
         CzYAE/e7oyx73INhV9UZr9cCz+4zHyK48ShE5TNmNK/eo7+ZH+lmBR7Yd0QMqwwf/RFJ
         Qp09hJzek5jHZZTgE0RIawPjlk1BAkm8EqCdTW5lVyJAwuOkwrNozXmI97OiNX98g4ja
         GI0Eait86lFnirEPX+RrTGL88K1JaT+amRpGPzg1DUNmHtsPURU7feScxkskttJ8LVpN
         AztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443909; x=1792048709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70ywZ2AyEe7ncaX3K+b5VsGq7joUvo2qDjp4zFNieZQ=;
        b=XUbWA6YZraQOz/XAS0LOaT8mR4Z8Uf+F5TqLTkViDdQHT5jtM3SVQ/9t/x9A5MdXeu
         2ShmONE4npW0tbwAvUlY6HLdsyVTJiXTSD0l4kuCqk7rUeTK6WPTe2VdRkgoxxhwYk6q
         aOAlb6XlhfKdw9giMz4sW2Ja/zIRlL/GqlqF36a5jkQqq47Ru6FEShSESvBlPQB5QeCu
         WfC7Re6VCcwV0/x1LaitU7MFS7cdCrDwq5VdulJMMtcXfj7s84xmoXYlg6HNjZ2Z734Q
         UkGlaT/2mOeZe2Zd613PUDzuS3fH7bD+sa3MWGXE5pK93gh8PVg5xTZpN6kEMPs0lYpN
         el/A==
X-Forwarded-Encrypted: i=1; AKwUvBw1qMEAXei5YbSqXLQc8Htbz9nWr56D607R74sB5AEh3SLfLNDqx+w5KRpJxU2SZoZkxq8mySMKzkDx@vger.kernel.org
X-Gm-Message-State: AFuF++lhQbQxp7Vrw+gBeU8juT99ipwg4ZhUymWWdEQ78B1HLTcwdHrd
	h4EOoPf1NiPRjUgM7Fymgc0xX0rhSfqxEEdQxQCTpeHLL9EABRvaoS5QB45/a26WPOx0V2FHdfF
	sPPOsIc+x7dp1RzzZsEfDyGnxWsNk4B8=
X-Gm-Gg: AYBFou3mVnOUMPeqodQrRYgtkYWD8dKfPPR/lExHi5N2XJByaV4QA+/65zC8PUidjox
	hc2Rerhlys5DHo5soYG9YAt0imE5DbKpZIWQq2he77I5u1IfRcGuR1kg3Hdp4jcBAXFwcJEvMVi
	ZufsPhwP1S75MApkgWsLmrzXDRYtE4WFabkvksXI8hZYOiId/al8si3SryBUuVenZPYenY9aleH
	JMr+2X29ldtmRsDfItP6dZn6iwkqAacM8HFro8/GHTIdBtheXMFAKUYNROtXfkC1KEjqiuvevQF
	F6i6WHJL7jwzUH+Uw7ozuNFE44xg1ZIDHZbZm9Na10L/CRBpzqQDj7C7fIyEXFsDsQ==
X-Received: by 2002:a05:6820:618:b0:6e4:1587:d2b9 with SMTP id
 006d021491bc7-6e7aaecda5cmr4190773eaf.35.1791443909157; Thu, 08 Oct 2026
 00:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-2-shijujose2008@gmail.com> <20261005235021.GBasQ3vXTivT3NLbBq@fat_crate.local>
 <asU7svV8g2Hb5DZl@hu-ashoraj-lv.qualcomm.com> <20261008030603.GAascImzt4cv8Gz49p@fat_crate.local>
In-Reply-To: <20261008030603.GAascImzt4cv8Gz49p@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Thu, 8 Oct 2026 08:18:14 +0100
X-Gm-Features: AclHuK_Pa4PSN7Ovd8UjVYuZheIOrKSyX750Qa13rdRkYN_uBxTlt7ZeUcurB5c
Message-ID: <CAG4KcRLhN9=6xeT4qfqKLFdukiZLUc7akGcWwXJUU1-qrfxTUQ@mail.gmail.com>
Subject: Re: [PATCH v23 1/2] ACPI:RAS2: Add driver for the ACPI RAS2 feature table
To: Borislav Petkov <bp@alien8.de>
Cc: Ashok Raj <ashok.raj@oss.qualcomm.com>, rafael@kernel.org, 
	akpm@linux-foundation.org, rppt@kernel.org, dferguson@amperecomputing.com, 
	linux-edac@vger.kernel.org, linux-acpi@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, tony.luck@intel.com, lenb@kernel.org, 
	Yazen.Ghannam@amd.com, mchehab@kernel.org, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com, ashoraj@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Boris, Hi Ashok,

Thanks Ashok for reporting this issue.

I debug this. nows_txdone used to set before requesting the channel
until v16 and was changed in v17
following a review comment by claude.
Found this issue occurs when txdone_poll set and  setting nows_txdone
before requesting the channel, solved.
In my test setup,  I missed this issue, because txdone_irq was set in
pcc_mbox_probe()
with the acpi pcct flag set to ACPI_PCCT_DOORBELL by the firmware.

Thanks,
Shiju


On Thu, Oct 8, 2026 at 4:06=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Tue, Oct 06, 2026 at 11:19:30AM -0700, Ashok Raj wrote:
> > > +static int register_pcc_channel(struct ras2_mem_ctx *ras2_ctx, int p=
cc_id)
> > > +{
> > > +   struct pcc_mbox_chan *pcc_chan;
> > > +   struct ras2_sspcc *sspcc;
> > > +   int ret;
> > > +
> > > +   if (pcc_id < 0)
> > > +           return -EINVAL;
> > > +
> > > +   sspcc =3D sspcc_get(pcc_id);
> > > +   if (sspcc) {
> > > +           ras2_ctx->sspcc     =3D sspcc;
> > > +           ras2_ctx->comm_addr =3D sspcc->comm_addr;
> > > +           ras2_ctx->dev       =3D sspcc->pcc_chan->mchan->mbox->dev=
;
> > > +           ras2_ctx->pcc_lock  =3D &sspcc->pcc_lock;
> > > +
> > > +           return 0;
> > > +   }
> > > +
> > > +   sspcc =3D kzalloc(sizeof(*sspcc), GFP_KERNEL);
> > > +   if (!sspcc)
> > > +           return -ENOMEM;
> > > +
> >       __mbox_bind_client() reads knows_txdone at bind time to promote t=
he
> >       channel off MBOX_TXDONE_BY_POLL. It must be set before requesting=
 the
> >       channel, otherwise the channel stays on polling and mbox_client_t=
xdone()
> >       later hits the mailbox core's "Client can't run the TX ticker" gu=
ard.
> >
> >       sspcc->mbox_client.knows_txdone =3D true;
>
> Yah, I can see that happening but I don't have the hw to even poke at thi=
s.
>
> Shiju, what's up?
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
