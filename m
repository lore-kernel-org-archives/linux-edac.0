Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AC3E3141
	for <linux-edac@vger.kernel.org>; Thu, 13 Aug 2026 18:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647302; cv=pass; b=rjJ9VnJaGMdgYpqxWJ9/fTHFgd0PNCjGVWizQpnAGbMJLxAeh7neXyQqKNMGM1QmFt0LkLru6KaaadIFMdYIIslfmSmYJmD/dLUwENnu4DxIDsNhPUiKWFFqOURGk/dTpF1Yw2ftdNogpcS0FkjJbJQTON+NF5foHXEhI0TW9R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647302; c=relaxed/simple;
	bh=MZMk5amhVvwpxgU22Jr2gG0SimDKHn4o3AJnpzUIRys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epPbIHo07bPvWk+vZOhWtTdaCCR2St0CJdJAWlkWayEmHtzVD1kbkKVn0YLHwyUhScFk2O7aSdBZ66jjbFc6uH24ZHIIZdx499GQPjYcHSVit2bwOb45kLoeR6lL9aARlEZghNisHZ4Cp2QAqL6j3dIyzLAuVGh6u75DU8JXaOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb662xZ+; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb662xZ+"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ecd7216cso105908a34.3
        for <linux-edac@vger.kernel.org>; Thu, 13 Aug 2026 11:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786647299; cv=none;
        d=google.com; s=arc-20260327;
        b=JCOhjYItMfFlesQ70FCHk/ilMWDXJfCN8B6z4XSiYEKzaXq9okH56otcjmBVhwqMGW
         5Hz4vtm6+C2svUyGJVCJQ9PbQPXS3ofVNdBAeZcNRjrCD3CxJEfKJGT/S9MjZKmB9I21
         LC9Xyr98zRGkxqcYibZROBF3AQJirwQ7NVbSSywD7/VedHeyfEeC1BjJyR8XsUG91M+/
         cVYD1HRObtbNSqNvNtGpCe9fn+CPNkiUqgZj/qEuUfprn2lgqP/I+mxY2vyzr7+6pTtW
         0GyyJ6S981PQMjfleRc7GOw8INiU6A1XpUW/RL4xya0rYUK051nlmcgYrr7pJ5Y2gbmW
         FgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4D8xAVPVQumphtAB0QLf5r82YP3dFNVcG1VBTYgExPI=;
        fh=+ePt8Noyn7u9MCpdpMZK0cibEcRqZrv7iASR0JCYlfE=;
        b=ppynsPD1EKF0jjRlj0oHONw+NzreXwR4znnZi1EbakfmcmNLA5XCBLZofyoHdBroyC
         TuhWKfhUYdG/ST+Tl4st3c6Np8GZnnDxlR62xoij2zh+TsrrsXEsqH9rg0psrHADMmkS
         bRjGRx41FEa5zfUBOxxfzQx7lGMNsJSBmufKodX1kTR/INhrXN3X0upCPH/xclTsGOJs
         WIGTL8CjScVeG+5oYLXmJBxqU8FmcnBVTTCA3YYcwvqNtx03vGo2CY7FhUJ1dhqJXw7d
         VLu3nXM+EFf6eEFyLAGkdBgvhw6iz2FgYLreG+gBGHq0ogDpqcdeUozWgXfJAa215xxY
         jjgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647299; x=1787252099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4D8xAVPVQumphtAB0QLf5r82YP3dFNVcG1VBTYgExPI=;
        b=Hb662xZ+DWuhLhaaGHLkKwhvVQkAyjuu/PDNAfrIObBmSVhXeN5Gd7WV9Tj/Da6tlP
         HhTkaB42si8PfQUj565U6maiY4Ko7hf50VQAEH9QvZ0mXUFnQji/vjRcGiHhBxqlY/IC
         ydGjxxG4oJDa+kyPJP0mp5624mcrPpInWRn6HBrqkCBg2c9VhFWICjbbC6YQC9cdRgX5
         akmXV2iIdZysTz50F5YhtEnW2ll/mTW6wH5PZlpUbw2BYe4z8GqBp8jMH5pjyyVhLQ8j
         HjKaonWdjXjGgwdW0jzBpo+HQnSuSC9Hs5Jxak29ZbQfmFCH1mMWyFjxnFANMh2V6+8n
         ZmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647299; x=1787252099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4D8xAVPVQumphtAB0QLf5r82YP3dFNVcG1VBTYgExPI=;
        b=LhXBuBpneDBZMOosNg/9JXrJDVcv2SRyR79gh7TBlxOXisr6YXbVncQThhadHAP1xl
         PV/aqeFOMRGmdEdUHt6gp2HNLrWHS/jzH4cA7Zy9DcEFw/gvHs7BjRtVrHpBE6xapd67
         sgKdqtrDCiNnXb4EwDJhcGbGyyoSWXEsuv8yhSvnDPCHRDRLZlqVJcdQM17l38mzsBfH
         BksmIoFsqtPwX8JoBjXFZZGRDpmsmBZ4Sv4qDYdhwjXQnnwdCshDQMKEb3ZCtjOXI6Q0
         CvRt1qq0Jgx/LHIQLgCAg9c8QjFjbcbnXCZ/j6kIbcCb1Gc2t+np7wjWbsBPe2sleGHa
         Mj5g==
X-Forwarded-Encrypted: i=1; AHgh+Rom1nXNE9r4HYT8eLqoRVn7H8AweY+99eZjy64kDaJYirrq69lyywU4Oks0l4obMNtUMOh2xEybAQ1O@vger.kernel.org
X-Gm-Message-State: AOJu0YwgnN4mZyYD21D+qJLpK63x4WAd/kzQFAsfaiTVszZVxARnhe96
	yYC2OGBQxUMau5jMYJs36XkH+0cUb6KjwDzYcPAuKbVhXxmbG/DqLWhvRjl17og/2tkOd3EG1ov
	MNAgm9I87Sp2sHtzSRim6ijDnCoNmNg0=
X-Gm-Gg: AR+sD11S1Ky7DgvYOpcgJykYcCZ/C+u5LMzXqj078vEKHYvMiuy1SxwH0PfOVpYWKkj
	u2OxSEOhwFRPvOphsoxk4I+6Yn92WAc2nCZlcSfBvkwHJ3KXzTvVCwi1fHFQeJAIJzIPUGDVspS
	ny5A94I/0jiG2uahpECDikJ/67qz9oHvNRRvYVfqNU0JdH7mlorbkA5IzZapaJLFAVIOlpVhl8k
	vF8LsEzgH/L8oZY14qX/tSGnaBRjNL6VhXh8QOXPIfTVz0jLKqWePD5TVwOiIn7O4vOz+EASEFq
	eKNyPKby8WGR8HJESPbgiZNSOlp/cBC/oOLV4IRr8wZt
X-Received: by 2002:a05:6808:1456:b0:4b2:3e72:bab1 with SMTP id
 5614622812f47-4b2413e7cd2mr156530b6e.6.1786647299226; Thu, 13 Aug 2026
 11:54:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-2-shijujose2008@gmail.com> <anvRn4g9Ihn5eyVq@hu-ashoraj-lv.qualcomm.com>
In-Reply-To: <anvRn4g9Ihn5eyVq@hu-ashoraj-lv.qualcomm.com>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Thu, 13 Aug 2026 19:54:48 +0100
X-Gm-Features: AUfX_mzK2KYq66enN11TTUyY_bgBfEgK88jDGTBrTGSa-gkPWcIl2Tm-4YHdY2Q
Message-ID: <CAG4KcRJR9+KMsoWjUWjaMveTteqMUrFukTcRgb0SZ593Zqj=tQ@mail.gmail.com>
Subject: Re: [PATCH v23 1/2] ACPI:RAS2: Add driver for the ACPI RAS2 feature table
To: Ashok Raj <ashok.raj@oss.qualcomm.com>
Cc: rafael@kernel.org, bp@alien8.de, akpm@linux-foundation.org, 
	rppt@kernel.org, dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, jic23@kernel.org, linuxarm@huawei.com, 
	rientjes@google.com, jiaqiyan@google.com, Jon.Grimm@amd.com, 
	dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, james.morse@arm.com, 
	jthoughton@google.com, somasundaram.a@hpe.com, erdemaktas@google.com, 
	pgonda@google.com, duenwen@google.com, gthelen@google.com, 
	wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:51=E2=80=AFAM Ashok Raj <ashok.raj@oss.qualcomm.c=
om> wrote:
>
> Hi Shiju
>
> On Sun, Jul 26, 2026 at 10:28:11PM +0100, shijujose2008@gmail.com wrote:
> > From: Shiju Jose <shijujose2008@gmail.com>
> >
> > ACPI 6.5 Specification, section 5.2.21, defined RAS2 feature table (RAS=
2).
> > Driver adds support for RAS2 feature table, which provides interfaces f=
or
> > platform RAS features, e.g., for HW-based memory scrubbing, and logical=
 to
> > PA translation service. RAS2 uses PCC channel subspace for communicatin=
g
> > with the ACPI compliant HW platform.
> >
> > Co-developed-by: A Somasundaram <somasundaram.a@hpe.com>
> > Signed-off-by: A Somasundaram <somasundaram.a@hpe.com>
> > Co-developed-by: Jonathan Cameron <jic23@kernel.org>
> > Signed-off-by: Jonathan Cameron <jic23@kernel.org>
> > Tested-by: Daniel Ferguson <danielf@os.amperecomputing.com>
> > Reviewed-by: Ashok Raj <ashok.raj@oss.qualcomm.com>
> > Signed-off-by: Shiju Jose <shijujose2008@gmail.com>
> > ---
> >  drivers/acpi/Kconfig  |  11 +
> >  drivers/acpi/Makefile |   1 +
> >  drivers/acpi/bus.c    |   3 +
> >  drivers/acpi/ras2.c   | 509 ++++++++++++++++++++++++++++++++++++++++++
> >  include/acpi/ras2.h   |  57 +++++
> >  5 files changed, 581 insertions(+)
> >  create mode 100644 drivers/acpi/ras2.c
> >  create mode 100644 include/acpi/ras2.h
> >
> > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
>
> [snip]
>
> > +int ras2_send_pcc_cmd(struct ras2_mem_ctx *ras2_ctx, u16 cmd)
> > +{
> > +     struct acpi_ras2_shmem __iomem *gen_comm_base;
> > +     struct mbox_chan *pcc_channel;
> > +     struct ras2_sspcc *sspcc;
> > +     s64 time_delta;
> > +     u16 val;
> > +     int rc;
> > +
>
> [snip]
>
> > +
> > +     /* Ring doorbell */
> > +     rc =3D mbox_send_message(pcc_channel, &cmd);
> > +     /*
> > +      * mbox_send_message() returns a non-negative integer for success=
ful submission
> > +      * and a negative value on failure.
> > +      */
> > +     if (rc < 0) {
> > +             dev_warn(ras2_ctx->dev,
> > +                      "Error sending PCC mbox message command: 0x%x, r=
c:%d\n", cmd, rc);
> > +             /* Restore CMD COMPLETE bit on error */
> > +             val =3D ioread16(&gen_comm_base->status);
> > +             val |=3D PCC_STATUS_CMD_COMPLETE;
> > +             iowrite16(val, &gen_comm_base->status);
> > +             return rc;
> > +     } else {
> > +             rc =3D 0;
> > +     }
>
> Minor:
>
> Sorry, I missed in prior review.
>
> Can the else after return be removed?
> just set rc =3D 0 should be sufficient.

Hi Ashok,

Thanks for the feedback.
I will make this change if another version is needed.

Thanks,
Shiju

>
> Cheers,
> Ashok
