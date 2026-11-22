Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795305634;
	b=aCSmY8f0sAXEjidWBAyHIEAVeXNwC5ebeoHsos216BfEJBmafbjKySQbebEG63OOuU1O
	 YuCxzkmABoIekDJFGm/hxI7W530/PgU5NN6VroACkECKXPrYGkC4P7kTzGrazIIuhFohV
	 AgHHofaYye0TIMhzVI1OIC7BD1OknPGXuEW58kOK+bQU0+vbT+bnJhrN9KU2D2PgUItU0
	 JrYk5UXvDoIB+dYaYMYvs7WxKLLHmsmH5XwdYVlWBijvct8UdhS9J+AWrxqA5hY2ldkP1
	 6sce+JgJc8pZ1Kiojc8qYt/U/JjDaTZ5rWj/Wi6XObYXNnqhW9XpILqLsAUKrByTEbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oX79inJRzxgZwR0Tcie38RtbzYQdIj/eTCukvbMNytI=;
	b=fVtq+4PrVjnzhZWMPejZoTYjF1NmcrY3ZoeLCV/BySM6pJSpbmJgWu7oYWf3g7yuKKj0
	 zm+iLcB+RbaqZFbbIZTL6B0qYOkqCVEE9Of9I42eMvs2Dvjhz6pQI/Y7K/O4cKteskESc
	 lj/LD/Tlh3HEjqX7SjL39wvgBq2X9fc5Q9Z02niiOqMNRvaLHhO4CMOM1lV/C9mhNAhjT
	 HWsmWpYJ/wbDRJD+APOzSatWWZia8wAJkPal2R8V+GK86LJK5EWEUSjdMf0LALNEWTyX+
	 opPR61PMJ4pQUafW6T3AFF2dgT8xC3B4io/gsHNV4RrcwtycTNAb1TK4SNKApF4amiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4RcuYCf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA709606A337
	for <linux-edac@vger.kernel.org>; Sun, 22 Nov 2026 00:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA709606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4RcuYCf
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2101947a34.1
        for <linux-edac@vger.kernel.org>; Sat, 21 Nov 2026 16:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795305633; cv=none;
        d=google.com; s=arc-20260327;
        b=EBqCBfEc8Pxy7GD4STMh3XSonX3TVmnSROcEfBgUslyOPJdwx+ybQqSeKRb1P6J/Xz
         YGqECycCaqp6bXwZUdrZNXkGsOEw7nnnwDA6goXEKc0DBWL/VE4RzFyGqJJciqWOnvwx
         L2cnrplGIjiBmUW0F8u0OsBRo4MNnjvNz5Hc1anJVeoCzWlIdP8M2hk38vdpujcFllEn
         +nITlh0dkjjoC2dIO7nIKmOTVL1rs0czvKTTM4uQI19X80oZwWbtU7CeSSU3Ro0LOAyF
         hgbk1QDoEXWFwxzCfX7xBSUisHaEKW0a2ghle4d7w8mOa0Ao4Y96Xn7EKzVEoGkPKZ5E
         55hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oX79inJRzxgZwR0Tcie38RtbzYQdIj/eTCukvbMNytI=;
        fh=b9vul9SK0IHUOX6HMcP+tWJI61mhBN+dXm3VXPuVNZ0=;
        b=jvrgye77ISn7fjAIMeMYk/GM7kVL7e4pcj6qWjmR8/+xYzu+CYwYlc7BJzacTvdjH8
         l1ER99rpuO69BCCHp7klDf9eqEydNCXEw7/nfL91wUiHhIeqkeGRq1hMkdJOCgHguMSH
         Pzn7011ibh04YT1C5YnRpoGGEIOmy/1hdv5lO0WZZAmAbSbXWiHFvAsOHV8/qEmps/M8
         y3jy5evTf8lJK37YdeFS46kmbhqKoUSRxIaA8kSUdTik2GP8gghft2DlrKo43lEX5mMg
         PWALPclODDMNqJdVxf8M85bItDK7Y4+PqAskXntsml6h77Z3bFrtw1dwTCXsCqzARsiP
         4j7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795305633; x=1795910433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oX79inJRzxgZwR0Tcie38RtbzYQdIj/eTCukvbMNytI=;
        b=r4RcuYCfIn90HdIwxItumjaK30zdLhmUJVAGcRQ71nWGgskz24QbkTinofHlgkbenY
         G4MS+YOI2jv+T9Xu/GlYrHhhMxTKnQSORkt1g1N9xvgo09K+WmL6Ol4n4KlM7ZnHdfYH
         Dga8N+dVnRKwEx03n6ZRzaZUmZamKVkc3zEM3qYrvuR/ZiJ6LVd5aEscodL4zVuRKxr3
         1CeCqEP8fs5yW/L1fJ7f2jpubwiyYMJLqCP2Y6+Ydqe1XIaG30BcseHXiwDcr3LDh8h8
         aceKX/ezytlgYuce5vlrWJqmIhso+LfDOfRKsao1qd8ZMx8JiPefxktTgvAjr8j03MY9
         f62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795305633; x=1795910433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX79inJRzxgZwR0Tcie38RtbzYQdIj/eTCukvbMNytI=;
        b=WT/morr+cSQNGqw3d7h1OwMdEJuxithDK7k+oZ21L+5BszPHuYMKpz2ryFwTHa1/mi
         mZCc7TFHxFOGx+ldisqzRp4H53/ml5A44mR6exfd3MmekqFukag9ON2E+29J59+XLItK
         gEnNpqRMZObG2aQTMoF2lt+1XOUsXnHAg7PTN91ZUUfQIjtudDfQxUblwqoOwpjHPr++
         qZWt/vAu2U2J7hKgE+I8lXnGGKNM7dM4lNArIAGEcHdQoVOmiap9iqoM6JbzMdeIVQrl
         meehJkbFUyLAqzX5qBjv6PJQD0FkzcFJHVlXaWA9ie72vARFDVy9uXK0a5hAx/ZK9rae
         bTGQ==
X-Forwarded-Encrypted: i=1; AL+hErEqn1fhjYH3exXkyNshzhntiqSFh6EA0dDe5MRJmevS4xz+78ik9cT5zhTiPt9lTYzYewQbNTvpgzB/@vger.kernel.org
X-Gm-Message-State: APuU4Z//4DOB/Hi2CmpsrZ650N3HuabJEi9h8TzrfOdlcwTctwuK46s0
	kmaufvJyI5mnwuuYodDotJTSNk6gnn3c/znZtXkOY31yxgQzEVF472mtgqZEYUabeM5gpNdOqCv
	h1eQraU4kChNfvg2wdf4n7aQRpdaQfYg=
X-Gm-Gg: AZFdTZfxMvAmqaB/U7UZNiFASIT5pwgGdXdG6e9SAHTC5VSsDtwVFV/55Zus+Xmfz4e
	OaZmJiVgPUEgHC9EwXZOJ31OY1cia8Zl+PgEsz9K6mmnNgP4R5E8/V98Ypwi0NBY/3DKMGE7LVS
	HOHky8AtzzhOw1pLM5JiyPbuUEfzXuJJDYsr38kdaADfwObWGu0FEiO+sDyr63T6k+w1S7hiiDW
	47jsPD+JigQGYXYSsqbdD3sf8dyHXMKC/wdl7zL1FqA9q+Ic57OnsJe2qkgeQJw3he5lppcYA5n
	LOWMGdCeiP9AXSaqLPlCdW3/XnB9Tl277HWZ/MyTheP613/hdgk2/aEdLF1hz0ySSR8xn3Tn+FF
	aImVyuqonjJjjQU8FPlOWB+8YoXyLg0d1DtGM
X-Received: by 2002:a05:6830:6a88:b0:863:3a1a:91e0 with SMTP id
 46e09a7af769-8633a1aa039mr1043518a34.10.1795305632770; Sat, 21 Nov 2026
 16:00:32 -0800 (PST)
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
 <20261121210749.GCawIIJcidCeWs3ij9@fat_crate.local> <CAG4KcRKzXNsvBWuuU2_aX5gO7u4vgKAK+bkrB2vgEFBGu3WJCA@mail.gmail.com>
 <20261121230942.GDawIktifTKlYhUlpB@fat_crate.local>
In-Reply-To: <20261121230942.GDawIktifTKlYhUlpB@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sun, 22 Nov 2026 00:00:20 +0000
X-Gm-Features: Aa3M54qnCHZib5IMTc_EQOb3UJ-aKnrHrCYP9h8mtw0fwRaNzLI4HvK65GdTkSg
Message-ID: <CAG4KcRJjU9WB7o0woOaAhtWDPoaL-52T8MUmbYJ9iC0EqP93Cg@mail.gmail.com>
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

On Sat, Nov 21, 2026 at 11:10=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Sat, Nov 21, 2026 at 10:24:28PM +0000, Shiju Jose wrote:
> > Thanks Boris for fixing this and verified by testing.
>
> I cannot test because I don't have the hw. I rely on you to do the testin=
g.
>
Sorry I meant I tested with your fix, which worked fine.

Thanks,
Shiju
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
