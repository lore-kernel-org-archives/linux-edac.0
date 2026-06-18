Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D239B48E
	for <linux-edac@vger.kernel.org>; Thu, 18 Jun 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789206; cv=pass; b=qzj+RcJSN/FNktIJvVKip7bsBlEPGbFtRY+Y4dkwiRyrXjq4DbITRsJq/zns1/UrpWbwCJ2XvT6ijs4reAs4XE+Ke0HzMCD5ZVblnVnY/tQx72ueEqM7azZ/JkptsIpEjF3OThRkWw9IY0fs4ymR/kMxEz8a6cYLbw3JuNUiWZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789206; c=relaxed/simple;
	bh=9ag5hs/4xp89XVn6utSessCD0vBSBtSm9GRCHk6ObrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H19gKKQFGeLFsi8Ya7s8LEIcZyJxwKuhR0QIpyKcjIsUtqWcTzDjT7q67vGW0t+PcLMZnsXARVRWZiyBcRC0Q4mG33m9mQgBsDQ6OTKO5UO//Yk2+gi+tkkQauBtwKcBw5XuwrIbxUNQIEH6iv0V20dr+MmNiWJG858Q6iP30mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGPv5waX; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGPv5waX"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13988680a69so2344863c88.0
        for <linux-edac@vger.kernel.org>; Thu, 18 Jun 2026 06:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781789204; cv=none;
        d=google.com; s=arc-20240605;
        b=G2BSoQbHpVVnSS3WN7YUN5MaC/g33VM3XYSmCV32z8QchH2+FQ3Zd50qI6C8+yf6l6
         KfXhtcbRTQ7m5s4FA9lXzkYoEABSI1c6HoOdRksOAjVcZzzBsTU4hawrnzdHq7RhhARV
         xz5yNKWRniaMCbVyB3p40rD+4NN3d50nFNpeQvlR4SdtJOhV5t9GJq1hQlVWOJiHqVA3
         Bu9QKf8lNZkUj+1NfPU1SwrsGylaZrXW7sNE8meTQ7KCPWEig1H1SrNgyUzSYkLQgumt
         UVZOnEkGRfRveQsQEWbiz+xznwWqGZisYR8yiNjHBDvb1XiBXiGg4tUYnGWoW44JXxzo
         OqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9ag5hs/4xp89XVn6utSessCD0vBSBtSm9GRCHk6ObrQ=;
        fh=7UAOq/nxlAIPaflDz6A1ZftDPhWG/Jg6zrr2HuyZNrU=;
        b=FctyO7ldOEQy0XSPaM76qr88LxA0LkjhoxQGnrCxvKg+911Zaygq2TuSc9GonO5k7h
         zDmDOK/Se7BQAfY+tpzEcgwj/QoDCYUhLY+Xyt33vKMKRNHfqf8PSi337qsZ5ZRHLZVR
         MnMr5ydwu0VpTgM73qlel0PqB9AgFRIC03UDNv5VKpGtBJQEl3q7JIaDaddmY246vqub
         AE1PN1z2vQEnVlwaR7B7tQ2DflVH9PuKj+9TcTTaKKNspP5e+bxNTji3L59+It5BKRpI
         rK0npLgDQQ95YgRH6csXv+kaMFGMfSwE0cSpln3m+kCT9GqKp0ukaqeiznChhlUN6LJ3
         ffiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781789204; x=1782394004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ag5hs/4xp89XVn6utSessCD0vBSBtSm9GRCHk6ObrQ=;
        b=gGPv5waXx4pmWkw6XIUR0wcwES8M/2ckqrqde0YOMnQFcuT75SIw0xo6hgLrVSl4sh
         VGQmTZ1Vv7ISHywn3gfirMcVRFYlqp5UoQHp5QHf872ly+zlZRQq+xPj86r69Bp9a40r
         7rfrGso1OYaEKDxRrkRV8cCKo0to5JjbOdD19w19FQlp4EIbp0AL4YDd7BUMGKN+AoMm
         We947HzN9LoON8qcdmK2Ac6PE2Qot/kD8WFjqA+OBHs9i6UkMVxv4Na9Cq9+bGzfL0Js
         YoKf1W9oSvgiXIWPvOKlPiut6FGQcMptm4eSx0QfINY5Z4BGsMntVB1P0hawMpsE4TMm
         f+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789204; x=1782394004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ag5hs/4xp89XVn6utSessCD0vBSBtSm9GRCHk6ObrQ=;
        b=pEUlADs26UT/K0tFlWikYbJ9As6brik80sjs9COg6G/H7s7Bpz1UPuZos8vxsWukVz
         WgRZScrNHL7HzbZjMoPwGMGUrehkE8BQM89OFYdK2TXpvLj2/nCqOEqKnMJyUAfOfueU
         OoTdldG/QPe8f8qk9ctFPD357un4S7m6Ts/cMD3XRvkTj3gX4Bmj+KSi4WeODF3YsZfL
         Y/X07rHETp4F+vAHLWfWk+BVZbp1dhoxpvTl/EUX3czZ78AXawjbZbBhAYgaonckvqRe
         rZxN7UgmCNEhepouvl2uFWPOMyGZW4jg3CwOUeBu9MZKVEyScmgLRLYMXt8f8eALUM8y
         chug==
X-Forwarded-Encrypted: i=1; AFNElJ/2981tKbXHl677XcrNFQo+h+eYYtUfMpgnssIoGalTVMzEP7dF/Lm0dwYxUuM4eJTMp5Wi6N6ZfaOM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+eiJxHmxVzNPJ9X1S+KZxpbU7iq3YkXElQhHT1W9H41wZV8h
	fI5bHaUADG0A7+XvY2lqF7R4IL/sA/ZtxQp4/QuREZk5Xn22QD+HhU21oteiDq0WnbQ0T8eP6qL
	rSCqStJJIKffVnswLRIG5pymq4L7KpvmMdCa0jVykFS7k
X-Gm-Gg: AfdE7cnABVXYhxdRjlOXdLOjoc20vVFCYxiIUYy9NSqfb7CWGF4epdEozCSAa4kfL18
	suedoW4ywNdyHq1FRqinMe/3yAxQ4/66mOyUQRYnI4Bl0rjwihJcP+yErDbjgH9zdoQqVP5UCee
	AKVICSHoDOr0+ye6KOQl8sNVVwTWM92CCfM6VFw5a3i6HqhpZaxiKeanIyjSgxdBeVxEwfvmY88
	QZY7wQZ8ExsInT/7FriZxOixCQBXihoG2OqWI/M4v2xytCmZVR/sOFzS2RRL9szKg+hLuMZ85rX
	rJS6DlhYCdNL6NeUJ9pwgoOd3RPPU6rSe85n4Ys=
X-Received: by 2002:a05:7022:ec14:b0:137:fad9:397c with SMTP id
 a92af1059eb24-13997bec729mr2928180c88.12.1781789204288; Thu, 18 Jun 2026
 06:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
 <20260617000711.60804-1-rounakdas2025@gmail.com> <77d71af8-27b8-42ca-a6e9-f110a6289893@kernel.org>
In-Reply-To: <77d71af8-27b8-42ca-a6e9-f110a6289893@kernel.org>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Thu, 18 Jun 2026 17:26:32 +0400
X-Gm-Features: AVVi8CdeROc2F87kMdI4szDBN1WzeNKf-iD5jGxtiNJ-y50nsRvOtSNEuChduOw
Message-ID: <CAPYTKoPe8dcQ9ZLHMmXkgqKVGEvcVEG7C8qxc_LdSUvKGuZgqA@mail.gmail.com>
Subject: Re: [PATCH v3] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"

> Were you able to test this on any HW?
> I tested on an Arria10 and it looks good.

I don't have access to either platform, so I wasn't able to test on HW.
Thanks for verifying on Arria10, glad it looks good there.

> Currently, I don't have access to a 64-bit platform. so I'd
> like to wait to get access to one and test.

Alright, sure.

Thanks,
Rounak
