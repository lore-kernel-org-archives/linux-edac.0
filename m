Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C283B52E3
	for <linux-edac@vger.kernel.org>; Tue,  7 Apr 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566296; cv=none; b=T3iM5AHi9pj2bRb+QEBqBBJ6QeInImGIFu6v7kpV7zdbRloRqO0fFWX9rZvBFkNegy4N/A7ncwDJf0+Bua0RDhiwDZzaawO/t2V8qDguOP4VERxTo3IbHlz/XHjPmtX1mVACIef/sEbC2iZoNM9ajFQZ1AJ7DV/w9+MoMiLbsao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566296; c=relaxed/simple;
	bh=c6fKxssJtIj3CIJdNmGZs6AiMnNPplX+dnIRE+mMbDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsQb8clBCVj9F7HztfIwZSlcju742c1DmVInSxOpeXoDTZmKZcuCuOEXiZYu1ORKT4pXYfj38f0S2zVGPco7NHlilyWo+eczpIPyT3JCYPVmIk0SktIybpB1KII+Z7XYyAGGfD6I7/q5+7qj3KaUronVXPaYleYSuyjOpoznx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z374labG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z374labG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so36833145e9.0
        for <linux-edac@vger.kernel.org>; Tue, 07 Apr 2026 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775566293; x=1776171093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7M2L5Q2b/RxLVV6QJQb6U42CemJltMVdvNn+W75xc98=;
        b=Z374labGMsq5MVaf2cBMlYbWrom55pJxJ5Ap/MZCuos+oq+Hkk5cCZUoaUVHqyu6Lq
         MMi/eF88W57q8V8QhTqRINu9e4tEnL3NhlQkoUNY+YPz/+p0jHLlEr2VDuHdvkxUlh8+
         cnzYU3JYyFBT29FAkwxzbcblHHGAYOOM9xmlb7R08Qt4OxOQoiWlT7OtNMTudbH71izU
         WduhvVVxEBrMdl8QGc/mkr7e5tWpUTZ9w9YCTMxsoqKJfW5xauEgHNp4fxcluyBJ9Q+Y
         M/07JPpDeBpLM59CpU69KPxUwdLCrMAd7PfAhT23ak56OkW8o27w8cHYM8fyvE9769PK
         UTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566293; x=1776171093;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7M2L5Q2b/RxLVV6QJQb6U42CemJltMVdvNn+W75xc98=;
        b=eiHV+YWD/dtYIyfsVCWpv56Eh013UKo7+PNoSO1nRO4XUEMDUo+ZM3Z1op9fBveaF+
         KrL2y6binXUl4ykEKXPR7Kl64AprT+q/MWOtgdnH0U7JF8l9LsNupDIDMh6JFS6CkuZt
         eqDAkhsZ3itDnLl1OcxuGMJUA/gfC9gfwOz+mgmUDZBXVZVWKKrQQed7PuFWOXwHcC9X
         lhV+dZ17KBWCSW7Tzxn+XkX8xgM8VPecAjtnEFSkdJbJuK9F9UiDbWQXHgi9iqqvtNeX
         jC5W/RixOFS+XGeAsmLPwF1tXMC4qxgGQCNtNvcaR/IKpLbn9SSAqQZV4mt7iV/eCQYh
         cv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW62x0cpwRkopFwLUy41dm4teaD4R2kMU7Gt3RsYYTXYK6nyOgTj898L90H2W3rsYhaKYSZ5TSe4ld8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0FVDt+O+1Ulk9aBe4dugjGyzphHB1ZSUBHk64MRgSFw55yeUA
	9szdwfvs/Wpwli5WSyCenTu0VXMKIgg1lJ0LzIFOsfEHNTk/2u31r5oPyPPHqhDs/uk=
X-Gm-Gg: AeBDievB06XBjwGDuOUqrP0Xv2WrmPKOsw+91wFbkzPtYMgnJdiGJ+8n7T2VQlDH1vs
	mrBwxSup888ETkUewRGOD4EaA1Ps0MIrekzX+WErZTdJRBEA5DgAaIam49nLhOFNAYgSKg7Sasz
	t2BtSDSga+Yuq6ERQBrQ+xZFpdsR29/xbN+fxTZuX0SYX8M00uZXPBSfrEGsf8p22vUwF1G46d5
	vbvyMj1FJbMYH+8scl8b3uPuWm0DdxFt6kJViM0LAg6+E24d8fDxGcX809UiTHbwSTxdvQJkpNw
	rLDmRqqAjP95IXawIrpUSXVOotjecaTFsNzgecg20tnw2sf+4i83Y8t+IRGHfAYcWY6XVfKy7bI
	U/OCld2gqjxSDikiGq4NDrynsQOY+0jKtGk7QNjuIQVdCd6O/AMKDBw7hkn5gUHvWkEQtRi/B1V
	0Ng8ifS1z3QxwG5BAG04TLmGHHve36E0owjwOx9w64kKEt+qN446Lie5WP1qs=
X-Received: by 2002:a05:600c:c0cf:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4889945f8e8mr147405115e9.2.1775566292578;
        Tue, 07 Apr 2026 05:51:32 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b64f03afsm122587285e9.0.2026.04.07.05.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:51:31 -0700 (PDT)
Message-ID: <050a2494-88e6-4c15-beae-2e97f3b1cace@suse.com>
Date: Tue, 7 Apr 2026 15:51:29 +0300
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: Restore MCA polling interval halving
To: Borislav Petkov <bp@alien8.de>,
 "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
 Avadhut Naik <avadhut.naik@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
References: <20260114135034.GAaWefKm97-CkbEp4P@fat_crate.local>
 <20260207115142.GBaYcnTp7maUDVv3Nc@fat_crate.local>
 <aYobX83_0kElO3NZ@agluck-desk3>
 <20260210150117.GBaYtIPfsP0Txw7iIc@fat_crate.local>
 <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7.04.26 г. 1:49 ч., Borislav Petkov wrote:
> Ok,
> 
> finally. :-\
> 
> Pls run it to make sure it DTRT for you too.
> 
> Thx.
> 
> ---
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Mon, 16 Mar 2026 16:12:00 +0100
> Subject: [PATCH] x86/mce: Restore MCA polling interval halving
> 
> RongQing reported that the MCA polling interval doesn't halve when an
> error gets logged. It was traced down to the commit in Fixes: because:
> 
> mce_timer_fn()
> |-> mce_poll_banks()
> |-> machine_check_poll()
> |-> mce_log()
> 
> which will queue the work and return.
> 
> Now, back in mce_timer_fn():
> 
>          /*
>           * Alert userspace if needed. If we logged an MCE, reduce the polling
>           * interval, otherwise increase the polling interval.
>           */
>          if (mce_notify_irq())
> 
> <--- here we haven't ran the notifier chain yet so mce_need_notify is
> not set yet so this won't hit and we won't halve the interval iv.
> 
> Now the notifier chain runs. mce_early_notifier() sets the bit, does
> mce_notify_irq(), that clears the bit and then the notifier chain
> a little later logs the error.
> 
> So this is a silly timing issue.
> 
> But, that's all unnecessary.
> 
> All it needs to happen here is, the "should we notify of a logged MCE"
> mce_notify_irq() asks, should be simply a question to the mce gen pool:
> "Are you empty?"
> 
> And that then turns into a simple yes or no answer and it all
> JustWorks(tm).
> 
> So do that.
> 
> Fixes: 011d82611172 ("RAS: Add a Corrected Errors Collector")
> Reported-by: Li RongQing <lirongqing@baidu.com>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> Link: https://lore.kernel.org/r/20260112082747.2842-1-lirongqing@baidu.com


Much cleaner and simpler,

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
