Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502723;
	b=XE3CvnD/MJsAzjza1shMc3KtmEsNB4f7BTxZtuFKcxk1iQrQvVX7UAPoqcGfl0NtjvAk
	 E+qj8Xxa2PKm0MDD7nto0i0pQRSFbvI5534wGyKJ9bptMotznJQAO/zCh0QKhP8apLSy1
	 csTME9wjxwaAXlrKsZ+KJ0QAEu4zIkIBOM/LpoyDCYydVB4GlQqbvPoNa0ybJljDgyG6U
	 ApofZihXPb0ITUiEtUwllAtVrR4052bSS8oeQPDq2QH8g8RYNzoK5Q85fDagVi8TTfNi+
	 ifos7ps19T0LoJOfC3Qnnkj+f/6/LOaecsLg2wLUrJr+jyKKuQ21jYVpgPn4xlYP6qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ku64OzmACMW70GnGPBtDLvhYjheHShhvEhRP7gtzIhs=;
	b=G6/wVXtiOqY4DD/T8I05S8avK2CShvSpKv3goo8YMMUb+CMK22jsE0qewmhrqJ7pL+bz
	 A6MyDcbS/aEjCaKNAxc5j5sTbKwCOZkZXn7g6tI48YMyRCMkUrrvq3oM7H4Fg6SpR4lBU
	 jtuWoSoYA5EdeYwACu3GPQu/sVRVD8DXATU3AtpXKTjN5UD5Ec+iKTSs6ZnBg+p+KtSFU
	 hQf31Z9zG+xMTa2zewnidqIORB31dpgZln/fsuDAWLrPhVHOlMugEsJ3BzDFTA+rAz1/g
	 Tp4rDkJ3mcxxAVfl2yEkFuYx9Z+r+oyf2LbjhpD5zY0QPeqe2/yIv007Y4auZjZJDHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PWL9e+/q";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274D7606A321
	for <linux-edac@vger.kernel.org>; Thu, 12 Nov 2026 16:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWL9e+/q
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed06b725fdso9012885ad.0
        for <linux-edac@vger.kernel.org>; Thu, 12 Nov 2026 08:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502722; x=1795107522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ku64OzmACMW70GnGPBtDLvhYjheHShhvEhRP7gtzIhs=;
        b=PWL9e+/qTxQeGLD60f5nw9247Os7SPFeWMcFJeN3OL3cbzD1F7GSu6CsvCln8hFd8C
         0mT4Ttcv8mkxKd7NdgusdNxxx1y+bvjJlv8uOhOzhG92Og+J5eLHJZ+VSlDMhH1yK2KQ
         ec6PXNGon2ZB3KxOAFlZUcQwrUG6RomwEd3oWbnJeKark+CFNURTupVFrMfo4YUASCpt
         zM2EYsvzRjy9qlMFUXThBeKM3TpfxXyyhNLv02rlHzHOKrenmF6mXI1vMaloj4IptHCS
         LTWzFuoXg42FZbD2S4s01zHclI0AGIiCSV4GHncAZqxvp/t9Fc+EpgzIWrsVk1W/+yuM
         gWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502722; x=1795107522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ku64OzmACMW70GnGPBtDLvhYjheHShhvEhRP7gtzIhs=;
        b=fL9eQPcDnRijghUiVqZVJwZX3RVrp7Y2p3iaOAYqcMUCW4vH7XTHeHsxSxKM4h8nMP
         1bC1m0efQtF2G2dnLIC2XTo3iLUFZv/xzeBProG8SkBpsyNwvgOVIqR+Kw+Tyrfm4rwF
         xVCRTmDMgy5JwgLTkzU07/kuyunDRGT+QyzoqZQTOoMg/JhNw6FHCx1rqQyxG1eIGpGz
         FZTb/6Lu8dJ0QxtnkYnIHqDZiGWw86TIpdR88AjcWu6sZCh+xnISj9xOFmvCICh66mWJ
         l4EhBjpSaO4LDNjURXi4LXkgshCE8/sWnwM2X1hw9R+SZAuN4W7Lc8dcBWhVPE0URQ7L
         v0jQ==
X-Forwarded-Encrypted: i=1; AL+hErEQsQTrjv4HBeuItbM0Epx5fdVYwW4Z1C1QUNBeuGTc+85/FZQFK/FAkZGegNIZeJ+m0UDQd6T+PZKO@vger.kernel.org
X-Gm-Message-State: APuU4Z+fZlTOzhLUuiv+Et60W/VKBrE1oxxobprXTEK6hHtXHjFjbW/a
	fFnDl2vEDLKrasDd01O4QGQoWtXCuv0uKoeXgt7oQiI13249ttGZ3Oprio02l4xp
X-Gm-Gg: AYBFou0tSBHcVKlUP8B6b/g0YDHgT/AAaq7lAV6MCUX4gItD3u11uwQPi+VSi5OTeKu
	B/KpVZOBUjD2pmLAS2lgDnr+Yib0KlHTCmjy1yeDhWmLNOZORf69dorb4z+Z+sMlDvUhmYSkHG9
	fDZlrcVi4tZpldKBOAHWyPte8uWWzZiISwnRIMJRztS5g6zVSaZ2Zjb4BcWIiBcpk3pktYWLEuF
	a+IePZ4vHuBHI/+muHQph4hnXbRhdaCK6CYY8y+irL0ZdQTO7WpmEuPYJfPUyOvuM2+3EynM5tk
	Wr3lxarX0EkVjkQ9dCDCam1MmJDlgwhyqfeWuBagR4QtmohDyUYeOZ49EkqlUhavaxCj/eujw4z
	1jFVH7ZKyI1gAUphiKi028t+4Ju8Q4gkjYkpUzdtDBHzx7hA4yNYjVBHCdYGHogDkeUxDIdYA9+
	EGvgQ8nEJE0nlA9CpcGB6+eZuYNUQaM02E4fFUuHBl9XLGlnJDLCoLTPbiXyN4RAwZ1lGT0xiuJ
	YCgdYJx7YUUsAqR3QUaOZ5F+Ow/ZraXLTvwWtEVMlTqp4EPTYrp33D5GA99wX0q0ypYyytTPxbc
	OxR2hPsHBIhhVXj+axaIF9nSZKI4habuKUeliKk=
X-Received: by 2002:a17:90b:1c0c:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b197caa743mr2304014a91.24.1794502722188;
        Thu, 12 Nov 2026 08:58:42 -0800 (PST)
Received: from [192.168.8.247] ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm5368094a91.16.2026.11.12.08.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:58:41 -0800 (PST)
Message-ID: <d259e498-5cc6-4e23-a589-cdffce1764e9@gmail.com>
Date: Thu, 12 Nov 2026 08:58:40 -0800
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] EDAC/i5000: Fix the slot loop and re-enable the
 driver
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Aristeu Rozanski <aris@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111232529.407154-1-andrew.luebke@gmail.com>
 <20261112001752.GCavUFsCwZIRkfLI7T@fat_crate.local>
Content-Language: en-US
From: Andrew Luebke <andrew.luebke@gmail.com>
In-Reply-To: <20261112001752.GCavUFsCwZIRkfLI7T@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > was all the energy you've spent on fixing this
 > - especially the AI tokens - worth the effort?

For me, yes. I still test and repair old medical equipment built on the
xw8400 and xw6400 (as well as even older systems), and FB-DIMMs are the
part that fails. Having EDAC name the slot beats swapping sticks.

 > can I jot you down as the one who will be testing any future
 > patches for that driver?

Yes, please do. I have the hardware on the bench, with single- and
dual-ranked FB-DIMMs, and can test patches on request.

On 11/11/26 4:17 PM, Borislav Petkov wrote:
> On Wed, Nov 11, 2026 at 03:25:27PM -0800, Andrew Luebke wrote:
>> Analysis and test kernels were prepared with LLM help; the tests ran on my
>> hardware.
> Just out of curiosity, was all the energy you've spent on fixing this
> - especially the AI tokens - worth the effort?
>
> This chip is documented on something called the retro web:
> https://theretroweb.com/chips/317 and it says it is from 2006 and it sports
> DDR2 memory. So that is retro alright.
>
> The HP xw8400 has a whopping quad-core Xeon in it.
>
> But whatever...
>
> Now, if you really wanna do this, can I jot you down as the one who will be
> testing any future patches for that driver?
>
