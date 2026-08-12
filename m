Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE4E3112A5
	for <linux-edac@vger.kernel.org>; Wed, 12 Aug 2026 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561728; cv=pass; b=K3+Hu52onu1l4dduMMOYATnU7H43AHfnZSVU5qc/nXGWg/GHJJOq3qT2Q0csriQKHqLrifloKYwrGVVOi8eDReQ05oZsoHrwrJ/hbTfAzjM4nyi7h/R3mY9xWwagrHK6eXfRGWLkoupuoO8VNIU6+T1t8xYXCzsnMDXR/9TiRTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561728; c=relaxed/simple;
	bh=BZr5083eACLRkZqQqZ6nDLbTDJ7Gni+cd7Cc4EhHE28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTllLM81NCn9p0NVLfdhW2uWhc0BtmkK0P8QTjfrupXxKlZwjH8L2UVXXr5a4CGXUIqJdOfp4VYuMmpR9VwfolGasrd7CFiUxvgykiu+8QLiJ8VlFIs986B4XNZPqchY65j9sacqc62/kXmzmW2PPQ0rH6WmoXg1kcnClso4b/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MEBEidZS; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MEBEidZS"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81eaf3709b4so18727987b3.0
        for <linux-edac@vger.kernel.org>; Wed, 12 Aug 2026 12:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786561724; cv=none;
        d=google.com; s=arc-20260327;
        b=DJu+sm5Jrl/qqc9erH7T8wyHhdoJrbJTd9KBV7JmmWzRHaTlpqwEHNShQxO09J6ctT
         HzyKrvrMB+XJJCFsnTS4pWD3/rZe5ZW/PQyN8/giQ3JjpPIlRO1xrw9G2LtKnt38Nd5O
         WIjaNSCc/R6jayMuP7Hq8k9aHd2ycMoSvruAp9rj9V9KwQ0X0zYbQbcgyv3dwWcqcqQz
         iqYxFr1IaCKH5G//dwqpgTQpECJQIYKVGYYtubJX4Im8vXpXnzT+zJ3FulwX1IIj2H9m
         r7QFYqdxag4zw3N8D2fSgsD/uVEvbsEOawRDloT5OwUOYoO6VJ1z7Yf52yBahH4qYoVB
         j3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wd+mCtHn9KjMZIUzGeLhwPtkxmdwj6bs/gC47PZwi6g=;
        fh=Z5ya41wxdxINulIzgITYm5EhwOv7o0CoW86YGguoQOY=;
        b=WNzdxsrxlLje0+lpNbwku1Dhw6ah5/cNCK95hoh+P9CZ6yinwEURKvbqknJnkkKzT5
         DCzugGCrXruUYRSWoHN4+pEOxMi0o1VL9Gg00yjCCEkrR4+NCatWh5mAG7rXjNdeqQJj
         FXa2fzrhZj8bSrj8xzEfEtQ+UrTNExNcC4sXLPWDglhAMpmaVC3ycTORMANRMNrMt8pF
         9eR7LlEfetF6FaWzeuktOdeDJD5qmeb+zznjAx2ipkl53+KyrW8T4nX22furSDLUzj4r
         X4a3eVIZvnGnYiENm4u8zcEEv6ZrDor7umLBMbabHXm31+6YQDZeZa/zIvBMUlQajPpX
         kMBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1786561724; x=1787166524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wd+mCtHn9KjMZIUzGeLhwPtkxmdwj6bs/gC47PZwi6g=;
        b=MEBEidZSM/OoUIebJp9V1pEOzuRJYcHf5xa3Gd4Z9xCQgF2y0tvy6H+h0hsHFwAAU0
         8a81PL7fszkrePdVCc4iEXxnXaMtPEOqxP8dp4k2saMTutHnSk8QbLwLpBbRlbWiwkih
         qaLbYSqjMGUeT24zFIk5WwoLxyGNkiGnNzD9nKHVjk3pd/8l3nvcr5NQbHN/aqg0zTLE
         ygF8eyyYEnDqq6vgKz9VwLomOhFd4P7fSdpb/Z5RNTYhkRhg97VaY4QZMTYlj1Q/YMw3
         WFPJOlldg0w1xVTBEFGevRvIp0kmGFgxFAMdBsCtjgL3pQudQVB9ATfvRYPvblYF9rnS
         4APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561724; x=1787166524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd+mCtHn9KjMZIUzGeLhwPtkxmdwj6bs/gC47PZwi6g=;
        b=PfjWt38zTusrS/Kmp2D98je/SQCklJrS/KGrknTDmWMrZwMn44hYoI8OCUwsz6fl2r
         js2Cg9iD8jTej9OyGYJPAUeQG5kCc+oEXXXcdOF0UH6dXH+80PM5/I8iGhBRZlPDSrSi
         1rG1VdOHv+cfYgppKBX3nAJmNDat6miH4tE/9KH69PGHM5D1szfn8egNrTRK3HlFhCsg
         fyYBEiEiYkjltifXedngid/01bGV7Cd8ARVQYOoMdKdXtKaKLQv4BfP4yEbWLnPYljSQ
         VF27VmwoulKt70+67U3RXqPjUZwk8ScQmoufJ7JB/msjAXVVX4vy5TK9jlAr3r08DWym
         K1Qg==
X-Forwarded-Encrypted: i=1; AHgh+RrUeuvjoqvk/j+Ps6iQn6Sl0UKC2c/MFGftBqXAAPKqdvnwLHHOlhqAW1JNEO3Ir7NJhAvn2w7iou9Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr63/hh5q32ZY8tz0ZPXe+itJ0qXszaJjaP46nPxX6lU/wR23B
	XzYKMZAWlTxomz4/ho331uom3vlUEE6uKv6mCNe9h6LL3nq0DSL1Y2N6uP26PvFZkD+wPNqM7uk
	z8sphal1bY4lDvgcl+GuheVpGiPt1dl311bb9QXqzUA==
X-Gm-Gg: AR+sD10FqiXzyvryF+Wwr+gcdyzQlh1UcynvY0ZtAki445sVWudJt3gZlat1v7bjLyC
	7jpePNcrqN/9w/yeaN04HoU2dP45sRlpVdkId2TTYNX34vLF2+m7nZbwlA6zQuvRKf/FbkdEP0H
	p5ZRmZOaMYOQPN0LORE/2bUHctutQFBJmhyKFMLG5pecAHR0RzfIf9Ky66dw+2CQUMuPBa3O1jy
	358pYB8KPW4KVWFWEcm3eazEIn+0mLbETIiGCbQBiFrVwuSJ+gmhMHlcJ2Znreu0WNChywgmMfK
	lZF0O5+ckXtNPcmzrZFp9Ng3YIWVQlQ/jtRGQzug4Sy7
X-Received: by 2002:a05:690c:c61a:b0:81e:9f17:8050 with SMTP id
 00721157ae682-83474abf784mr584327b3.21.1786561724352; Wed, 12 Aug 2026
 12:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807222721.2795123-1-jrangi@purestorage.com>
 <20260807225241.GAanZhufwGMzonqHUZ@fat_crate.local> <20260810133933.GA57095@yaz-khff2.amd.com>
In-Reply-To: <20260810133933.GA57095@yaz-khff2.amd.com>
From: "Jasjeet Rangi (he/him)" <jrangi@purestorage.com>
Date: Wed, 12 Aug 2026 12:08:32 -0700
X-Gm-Features: AUfX_myEFkjNtKsPaNjZOTnjssABeRyD0Kf3Ou0VwqIcPQ0KUIZ7qcPC8IJacUI
Message-ID: <CAOTx7d7r6OYFuKLfK6XCL0=N=37P76G1e7Rj3g7er3dVhh22XQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mce/amd: Fix inverted interrupt enablement during
 storm handling
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, x86@kernel.org, tony.luck@intel.com, tglx@kernel.org, 
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-edac@vger.kernel.org, stable@vger.kernel.org, 
	Smita.KoralahalliChannabasappa@amd.com, avadhut.naik@amd.com, 
	msaggi@purestorage.com, rjethwani@purestorage.com, rhan@purestorage.com, 
	"Dhaval Giani (he/they)" <dgiani@purestorage.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 6:39=E2=80=AFAM Yazen Ghannam <yazen.ghannam@amd.co=
m> wrote:
>
> On Fri, Aug 07, 2026 at 03:52:41PM -0700, Borislav Petkov wrote:
> > On Fri, Aug 07, 2026 at 04:26:59PM -0600, Jasjeet Rangi wrote:
> > > mce_amd_handle_storm() currently does the opposite of what storm
> > > handling needs: it enables threshold interrupts when a storm is detec=
ted
> > > and disables them when the storm subsides.
> >
> > the subside path:
> >
> > printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_p=
rocessor_id(), mce->bank);
> > mce_handle_storm(mce->bank, false);
> > |->mce_amd_handle_storm(bank, on)
> > |-> threshold_restart_bank(bank, on);
> > |-> tr.b->interrupt_enable =3D false;
> >
> > while that commit Fixes: 5c4663ed1eac ("x86/mce: Handle AMD threshold
> > interrupt storms") says:
> >
> >     Rather, disable the interrupt on the corresponding CPU and bank.
> >     Re-enable back the interrupts if enough consecutive polls of the ba=
nk show no
> >     corrected errors (30, as programmed by Intel).
> >
> > Yap, I see it.
> >
> > I'm not sure about your approach to change the bool meaning - "on" is f=
ine at
> > a first glance and this fix should be minimal so that it is more easily
> > backportable to stable - but yap, looks like we're doing it wrong.
> >
>
> I agree the fix should be minimal, but I like having more explicit
> variable names for clarity. Maybe split this patch in two? First is the
> minimal fix to backport, and second is the variable renaming.
>
> In any case, this looks good to me.
>
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
>
> Thanks,
> Yazen

I agree with Yazen that having the variable names is more clear. I will
split it into 2 patches in the next iteration. If we later decide we don't
want the variable rename then we can drop that patch.

Thanks,
Jasjeet
