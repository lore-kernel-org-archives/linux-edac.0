Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B22390226
	for <linux-edac@vger.kernel.org>; Thu,  8 Oct 2026 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485430; cv=pass; b=NSvAROnTybyhU267XhXFyiVU7qIUPdO+dh2KrLxGvUv6SSkkmF30G/U/gEDOFpF0JBkABeUv8R8t0IWuoaR0h6i+H6E7/uSyTySG54sw5PbHyDM+uyXM9TSSrDqmBNRGz+07w11wNlvNr7WhqqnV5EuA0Z1q6k+hqOXKPGKACfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485430; c=relaxed/simple;
	bh=lr8M7fmxQx+oenGID2VdP5yfHKsvKNwWZtz8MlvHV6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epMCMX2ppohDcThlhuH0BAEpXlbfxxrvfkW4foa7fp8hp713ES/vUnkMu4IOmItFWelqY+T50LI8XCchXEmndw0YqCiOsKpioWEG2VZQc+iiAjn25QN6eYaXFO4j7CNsg12D1OhuouE/lfZLMb0/kfuR4itg9PEpuYkaum922RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omizmiq5; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omizmiq5"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-81c5aac8478so2099071a34.0
        for <linux-edac@vger.kernel.org>; Thu, 08 Oct 2026 11:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791485420; cv=none;
        d=google.com; s=arc-20260327;
        b=L7UM07lzI6x5aRRlJ5XuGq6VKSiDhjQAziUFMqb9P4kgsY5oxDqWJ4ldwYMImYnrLQ
         pgb85F6rBsFOv5RkQw2DHGp92pV/p3H12MlSnWD2R5tCdPjZXd3efonHAo49DjhwKvNX
         iBr/6U+kj1JVMeOYzrg1brapEnXD4ZEt2MhZ4p6sCGUK1bOldH8LI0vQsvn6+Mkjhw4G
         2QPySgnCuuUUpFTu3yVJ2bSiVzJWE05qgYpmiB3lzTtNyBhz8hm+SnavpM9JWyKa2wL2
         avnnngmriqKDj3OPT4yMuGF8B7Aqx19kU32Mp6Qw6TOTervRul9Wqw6scat4oa4/P7ry
         BCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HUuHUTe3yEqV1MPJyew4xZgwaSUycY+L6akjTIcM0eo=;
        fh=CG46sS/1QP3yFS7LOAQPUx2QX1b192wFF5r/SvJwvss=;
        b=a0/a2E0MO2OdCG1kqg4AUvZWs2j91sNrshNugsumV9yLXO4apl5syB+zB8ftxCqlj8
         gKHfmjEJfXOwO+ujp+3gzoTHZvllPOVJEfnnHHgkF6dRDbPoHNzQOSiyEisFmMG+eZNU
         AqJp40tBC5x6esiwZ/Qcg2a1oiIuoJ2S04L6TCnRE/1QXvHRH22HppgZ6BM90O1ZEHw+
         yeW7+4R04MUffeZ3o17KxHUYMgSv2yV8wZ85b5o/1tzY86P56yxfHujbxlW0+uu9POD4
         vG3mJh8W+ZcJNldHopXoiC7+YIXWNC8DfYunLglHFl1ONGRkizhWTxO5wZnMOKxR2HPx
         EGGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791485420; x=1792090220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUuHUTe3yEqV1MPJyew4xZgwaSUycY+L6akjTIcM0eo=;
        b=Omizmiq5kZD2GJIYcjN5Z1UlkdIXv+r+rTOY1/VbtxY4WeYAI5gkIPlvbvki1uJfcU
         Z6h/3z2ll+vxeJ26AFdNi4EnbUF9DMHnopFSs9KsZIi/UpwN6chmQsGOgHx1BkLUz61t
         ZTKZQWZYRIQQb0EDPAAcCKbvrHJEL8dzIbREJ21QUC+HbRkEhsQnvvNIUxJLbaWzuqEv
         KQ9UA6TKp7GoVEwezvh4U+lPnKeWTYBsQW9VdGXTiGHUZIFh2b1JHPZT0SoS7mKG+AyN
         qKgqQsFh9AlcsPTK8ukKIuR7qQbKdBM3XsItH0z0cPag+NfcHjW0IYsFMMzLJNhhBtJZ
         SDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791485420; x=1792090220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUuHUTe3yEqV1MPJyew4xZgwaSUycY+L6akjTIcM0eo=;
        b=bOjSMsC+amutnY9O8W0kHkoq6GHy1TZMol9m/lEsQWc6yePVaasTZpNaQmYenEoicu
         XRS/dQz6IAduJbEDhLqKVeohxOwGSCausl/asGAv0qlDGivzhMBqT2WTlkiY3bd/DK73
         oifI0IbNtTH0cz4/7iOEwj1qr/LTzkzTiPlhRbloH4WG9XMGkA5d7zRJEd8TIwhsfDKf
         Ppj8S+3wVmIP3ctn1O4mvbNNUSylUIiPsUqMjMSEteX8ycwaDUpCxqmSZrjp3SHropov
         UmpUJXENz0R6T0dY+TTZ6rXSeHdPgT/tepQVDc1cX7p0tXPo1QTpjmXQr713elQTMgll
         jBwA==
X-Forwarded-Encrypted: i=1; AKwUvBw1C1QzuOxj2XlbM3qy55AtxRsYm98i0vTJSqZh3WQgE8esY6JkyKKxOgN2Or/zrsrzhaFckvtid2Hx@vger.kernel.org
X-Gm-Message-State: AFuF++nVDjtbxyOQwK8XXjFZg9KENS0Gp0QmRlj7G7PKbgYUqjA/VK7y
	SWZayeWeYBVq5HwSnXOsLjo2MJJGAzashEfAKbNvyJHpU9nOR3Bv5BwYkMMGi2FB8mJZw3tHoDA
	LNy3uaYscKuF+mWcudvO+9gracANPN7Y=
X-Gm-Gg: AYBFou3/e3+3MEkQgoarFP/9xFkkRQlEr+X/YVzQ+ntz80w845Sjqz6d3Q/VGucFZcG
	7mDQ5d+snl5tN6DIe3Zk1QvMsSc054h7jVFYIPSC5V0EgzS+5SxuNW04BgDS0dAWIeSBWZkRviI
	BMQDKtx1qrc7FYRWWnhia+j+gpWk3rzXsh3v6Yg48PEvoIgoaiyD1wpB+9O5epH4d4hyzsXMKPT
	OhkQ1s2zz8Cj3AJX7HX4KdQ6gjOWntmOR7C99DxrczaOIADYK6RwjvlFimMyVsoYAG05VksjC5u
	Sv40ohg24oee/TxWSm2dkiQtvovERMz/ni/TicK3ui4reV7TIKg5xV4=
X-Received: by 2002:a05:6830:398e:b0:829:2af1:a07e with SMTP id
 46e09a7af769-82acce646e4mr6427817a34.3.1791485419594; Thu, 08 Oct 2026
 11:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-2-shijujose2008@gmail.com> <20261005235021.GBasQ3vXTivT3NLbBq@fat_crate.local>
 <asU7svV8g2Hb5DZl@hu-ashoraj-lv.qualcomm.com> <20261008030603.GAascImzt4cv8Gz49p@fat_crate.local>
 <CAG4KcRLhN9=6xeT4qfqKLFdukiZLUc7akGcWwXJUU1-qrfxTUQ@mail.gmail.com> <20261008174114.GAasfVutvsmAk8JGsD@fat_crate.local>
In-Reply-To: <20261008174114.GAasfVutvsmAk8JGsD@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Thu, 8 Oct 2026 19:50:07 +0100
X-Gm-Features: AclHuK-7nYIEHIpgx3dw55yERdZIxrZ2s_no432HghoTK3RqssmmaR0vXdDXvqQ
Message-ID: <CAG4KcRLx69BK+aw+exUzPe+BW8exFM2LLvN9pEr-+1BoGVhFXg@mail.gmail.com>
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

On Thu, Oct 8, 2026 at 6:42=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
>
> Shiju,
>
> On Thu, Oct 08, 2026 at 08:18:14AM +0100, Shiju Jose wrote:
> > Thanks Ashok for reporting this issue.
> >
> > I debug this. nows_txdone used to set before requesting the channel
> > until v16 and was changed in v17
> > following a review comment by claude.
> > Found this issue occurs when txdone_poll set and  setting nows_txdone
> > before requesting the channel, solved.
> > In my test setup,  I missed this issue, because txdone_irq was set in
> > pcc_mbox_probe()
> > with the acpi pcct flag set to ACPI_PCCT_DOORBELL by the firmware.
>
> What?!? I can barely understand what you're writing here.
>
> And tell me, how many times do I need to remind you not to top-post on pu=
blic
> mailing lists?
>
> Geez.

Sorry. I meant the issue occurred when setting the PCC signalling mode
as polling for the RAS2 PCC
(In include/acpi/actbl2.h struct acpi_table_pcct: flags).

Regards,
Shiju
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
