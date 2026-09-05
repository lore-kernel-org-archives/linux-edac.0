Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87444CB8D0
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626720; cv=none; b=gNSuiZ6JeuhTC5Bvh9wGGvi1qjpUMMq3n5NzLGeHfi3O2TenTWaeJHa//fKmr17rD5BwjSMNJ66puF6Ak7RUO12CpeJT62hFdHXTPd0w+6A7teOTbTulFoMcVd2rOq6VXxgVKE+rgC+YyIad31lFneIdtoka3MSzOGiNS4f0wk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626720; c=relaxed/simple;
	bh=HdBAdLzSTzujbllvsJF4/4Myx4fdLg2P7yqQlusvX+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qB2pOmAGgG5no1sYPdzb+mi1S21uyJVNuaqNZrHrJiJe0OGUYaoELYLtF/2YjRUiVM856h98R7wZ27Ww2QvgJ6YSU6AhKLunmBgkj1BF8UOHBAgQ/KX0/B8rdSnsJvNNjGBSxScsWQ6FLVLUE4IfviBjhFOz/ALZI6tjWF4Hhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoMJbhFu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoMJbhFu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so25652295e9.2
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788626711; x=1789231511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=;
        b=QoMJbhFuOuG8l6M9kcfrHVchJ1sA3K8VcXX9sHvf4KV64ui0dqZaQxiP13c4DzV+y3
         fdHxrGqh+HvShOHBkUze9iFVPZc2XZ0BKvKC3w0bpzibmln+KdCt+djAvjhwwQok7KAJ
         QVCTXS0NY4sc/v3wkWMIJzk4gEIQZyCOIJtwiQ0NZAee3iof4zmjyV6zsT3oenkz+aoi
         2BA2sFly81BjCJIDe85e7qMbYebz0rDi6vAV6KtZlZFNimptRUva7tLy7K2CZw5WMXVt
         KeItXUCqt+TkAcCYntxr7XUou0LJ+WeVB4M/xSiJAUhgmTr+D3KsPffqZi76r06NH+b9
         pEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626711; x=1789231511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=;
        b=XV+2ijeexciUz1Zi9+VL4iCU5nzLeNBNlJz8+NCVMuarfBvPGUCi26GTmjOcNh29yc
         TtpGbirZwx7IRr3Qj7hNnU6Nalx45U081RQKzi4ePf4sko2/V3Ir2ApCaAWFQ8Xixz8w
         JIRU1N6F4Tbzz4chziv6Ie2x/pKpcNErzuSWHk+rADKj0wU/UB3E3k9dFQlBaPC9wBmj
         vRjGSyknHH8fgZ41M8GaakLH+OAMphQUBl1Z03svxKMfpV7h9HxLWYUBqmL43IC+Msfg
         aqdoWZzOEerrYcllTmmTX6gztHx0lqACEIjgRUdpKOzUHxoBQmjVR2JSSCLB5mQYRjWn
         yKcg==
X-Forwarded-Encrypted: i=1; AKwUvByaFnvwEC9+D/+djUqDPSREWgaoZK6TmezxoZyH8lzl+r2Ek3LZREjQ8GE0Xut8/NiXyYmDaJhA4YTP@vger.kernel.org
X-Gm-Message-State: AFuF++l4ADATc8+4xnQbb1GlOwClPt5B9NQ1SCKTi2bQbVrZ4v52Qt7s
	nJN3vlIQTGqA9xS6eOsY/5VCoQwXCfpu8KhE/iKXg4f6iv8Px4ibrsOp
X-Gm-Gg: AYBFou2L3YoWp9YkgxKVxu7xBgJvAmluTQcaf6RoSPJM3O0+s/lmDEMu6iPvoe5yx6e
	XyFMLY35jWH/mNQorqSyG5iYtJm0arS42eLwT9AUD7DCCSQlzYVtSMvUx7HQEf1motFG+eSaz97
	ZnjI7aYNJGvd0jY1ZjLJ1cxYD3vukHPxetMvOg76/DIw1ZFzYfHWDMc2xdxBEJZ630fZgmt2R+J
	qD4K7Cnnq3hTETznsO1AvzFMhpwH9Yon3vuTB4NLCfln6SGNciNCA7BkCpSvZ6NQ7NglNmnP1BG
	yfY1oRe7JRrILGBS4Lp1bNwZHBvNbZxOtUc8IosytEDAzpOJ9+nXSxQXETG7yCp7Kb2QuX4ZvWJ
	oYJToCkO1LOsSeZh5L7TZriJOvzSVya7apzj0g1+CAGJzO9GoxQmP8kDldHYHBIEZ5mj/W9GhG1
	0GzUqvkpvla4a/mk20d5ZGU3JvUlfTFD8Ro49QHMynEoSmRydnODOSHVagm8hn3dDKUlCUTSugO
	eNqCTe8txc1wCTKTnI6mfL51pXsUHMA9pmeg2v6MAvkqv5dJs+NXyFsa+bYpvY+oHTW/4e5CNFP
	e9QizO2KGHKyIS8lBukxvIWW+2HRB8vTKE3DUJEbolbgE+jDieLD1hVqnoJ+hl/i
X-Received: by 2002:a05:600c:4e46:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49cfc6e8e51mr106151725e9.24.1788626711320;
        Sat, 05 Sep 2026 09:45:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm276714495e9.1.2026.09.05.09.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:45:10 -0700 (PDT)
Date: Sat, 5 Sep 2026 18:45:07 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <apxDtqM8UMN5KNjs@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
 <apwzmSr6b0WEkW86@gmail.com>
 <20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
 <871pb7zn36.fsf@trenco.lwn.net>
 <20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>

On Sat, Sep 05, 2026 at 09:27:42AM +0100, Borislav Petkov wrote:
> On Sat, Sep 05, 2026 at 10:20:45AM -0600, Jonathan Corbet wrote:
> > I would like to emphasize this - slow down a bit and maybe you won't
> > overwhelm the system entirely.

Got it.

> 
> I find myself telling more and more new submitters to slow down. Sounds like
> they don't read our documentation before submitting patches. Especially if the
> file is even called submitting-patches:
> 
> From: Documentation/process/submitting-patches.rst
> 
> Don't get discouraged - or impatient
> ------------------------------------
> 
> After you have submitted your change, be patient and wait.  Reviewers are
> busy people and may not get to your patch right away.
> 
> Once upon a time, patches used to disappear into the void without comment,
> but the development process works more smoothly than that now.  You should
> receive comments within a week or so; if that does not happen, make sure
> that you have sent your patches to the right place.  Wait for a minimum of
> 						     ^^^^^^^^^^^^^^^^^^^^^
> 
> one week before resubmitting or pinging reviewers - possibly longer during
> ^^^^^^^^

That's for "not getting any answers" which is not the case here.

Sending a vX update sometimes feels more urgent because you don't want other 
people to read your buggy old version. But yes, some patience is also good
there. 

Thanks,
Karl
