Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA88405C33
	for <linux-edac@vger.kernel.org>; Fri, 12 Jun 2026 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283952; cv=none; b=aNKDHAtFUW1xzidbt+rTIFgK2SoDw4ZE2bM1zkbbxKplS/ygWKN91NC7yqNxh23Rz7Nj4Z1d4caokr7LmeT8wSb95bZk2reDnuHHvx6UiCyCUdhGyOyn1qKa/1P2NXRVcMn27O8tS1TH6Pq4Q5XFzjWgTGPq7SNOtcMrNWbGT/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283952; c=relaxed/simple;
	bh=EFflbR1Rx35JoQf+sIVPtpqU5ZfVszTdFtLHsprSuYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTuBb4uOrUBTeQuFR+uj0XQcj2W/gxF919pCfHK7Inln5QtOBeuUVVIOasB1lrwd/7VWupkjXASubGExv6m7G9f32GqIrR/yL6s2rrKOJQrApdr1o+OtarLeo4UIpoFfivkG4has6TcrI94/1/TsylQB1RTde/zL9VLztOUfWrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rKPmKLIl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rKPmKLIl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45efb698ef2so638416f8f.3
        for <linux-edac@vger.kernel.org>; Fri, 12 Jun 2026 10:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781283948; x=1781888748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EFflbR1Rx35JoQf+sIVPtpqU5ZfVszTdFtLHsprSuYE=;
        b=rKPmKLIlKXdpUpuxISRlDEq/KMCIN7iVJiIR0pb+uTTfLdbeb2pDeouhSzXwfkxJvQ
         4kaUMpypUCEmsSTZEUAcuouNw+OIpOvfJAp5mFV29mxvn02Lm2FFW2/1drrUUW63q/Rr
         WhAo9xD3z+0cdOb8vrrH1RVsBm3oT/jYBdOg0YpPxoskXslPCrD6v3NO5jMAexx7J5ml
         aMPOa3OwSq7mji6RTPSQKJ+N2Lpn5Lq0Kx5kpve0pqeO7d/jMkNu7RzQYooqTuR1/RuS
         X8bUXiAgpUXMCLNVeK3FZCGiw0Ma+upMw5ksxTYWvsJe2N6EccEl9EMMAQOjZ3itNjFu
         KN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781283948; x=1781888748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFflbR1Rx35JoQf+sIVPtpqU5ZfVszTdFtLHsprSuYE=;
        b=RyPSkJNg3MnjM/CG8ngJNoPtk1WVNZDg7Z1v0Nfod8XaIjUlAJSr9jLlneRMtaCaV/
         ey+1dY3wVS34Y2i8qcWyx4beQNYTVG3aJl/s0prXwAQ5hgSvvEps99ADbgaJE12NU0+M
         RzujMqoRHcaClpo7byczjAqayxmPLDhWa3MzC/0cO5pmY1Ti63WZPUDNharPCSgc0eko
         mNOW3mISCPRRcq8X1Xe7ravLh6Y+1Of72YTP60oT7Js6YHkX+zYzwxDJdVpE45xQYcew
         RBsvFQC4Lu3HAVNdTCQfBL2kBVlWn14UJGExsaiyiXcfSVTJUclwcdoezXCYhO7pGrcw
         LDtg==
X-Forwarded-Encrypted: i=1; AFNElJ9YiUvxD+n/BJEBJqk6nQjf6SXp2bU+nOwwmLFVqMyN27UL/ylINENOM6sB8ldjDxHljclgWNato0dm@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJcTswbfTKgx2GSj63KmQvf94vJip7d+Bwf5GAJ0ToDaiZIbL
	jVTIY5JFvUWjeUsOmc3yOo7wciDERwW8Ox75fpaK8KhYRBeaX1iG9sCY
X-Gm-Gg: Acq92OH5PmbHgMT/gLNxqO1wDG7H5tCeo6Uowra5hkWYktzedWl+IQEM9jsI8Q3+imj
	cEDwaVF3RuVGWI6sUQoC4UvP/tcDZ0DbgPLOLhgrtPPywFJnUXm4EAI7QUnvT+8aRflQEx6Zhqk
	WxCfZtyjM5XxQ2/znpHRw39/jJnEmArwgdcz+gEEIpx+iMRy99UemDGGgwoNHuoqo7Gbvw2tDnx
	EE4OZU9DKLSt61X2ExfzuTODW5aefEplBr49eMpXoh6LFjOcD7LTxTc6+Hzex7UB0cMM1MIvm1J
	Mck15e56JGN5+O8nnqkDU1YUGvr3a1qBbXjrrAp+4oS2YjIrQZ45iX69HxSiIl0pQqGMrzrd2FR
	5nTPAb6DQha1J16JWkbce4FZwjHdgSbRlCTXJaoLMzIqqDnINwVFBKtGVFJuxXs+ZDjUde+JVqi
	k2lsC9lorqpMV0iLIdcXjTlZyHMTXTgRjFUK10jAtsHJIuTPIP/qnQYVRWBNOSYhUL+3UKW10Or
	4n+8oOUxHOL6Z1xwgWjViAjP1wBXNn9PAovuAiGTHk09PApguA3rg==
X-Received: by 2002:a05:6000:184b:b0:43d:77a8:3baf with SMTP id ffacd0b85a97d-46074b84e9emr89888f8f.32.1781283948151;
        Fri, 12 Jun 2026 10:05:48 -0700 (PDT)
Received: from ?IPV6:2003:f6:f70a:900:3c0b:876f:c20f:d04? (p200300f6f70a09003c0b876fc20f0d04.dip0.t-ipconnect.de. [2003:f6:f70a:900:3c0b:876f:c20f:d04])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm7877502f8f.1.2026.06.12.10.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:05:47 -0700 (PDT)
Message-ID: <add460c5-0403-4054-a85a-a1c76925def7@gmail.com>
Date: Fri, 12 Jun 2026 19:05:47 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
To: Borislav Petkov <bp@alien8.de>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, open list <linux-kernel@vger.kernel.org>
References: <20260603191908.5618-1-rosenp@gmail.com>
 <16fb1ca6-447c-42b6-b4f3-aade5ce7f90c@gmail.com>
 <20260610173352.GBaimgACY4q6PkkkUk@fat_crate.local>
 <ef8107c1-92e9-4540-b88f-0191d1b7a4e6@gmail.com>
 <20260612153839.GCaiwn_7qOic4KLF8P@fat_crate.local>
Content-Language: en-US
From: Johannes Thumshirn <morbidrsa@gmail.com>
In-Reply-To: <20260612153839.GCaiwn_7qOic4KLF8P@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/26 5:38 PM, Borislav Petkov wrote:
> On Thu, Jun 11, 2026 at 07:55:35AM +0200, Johannes Thumshirn wrote:
>> Yep fine from my side
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Fri, 12 Jun 2026 08:35:50 -0700
> Subject: [PATCH] EDAC/mpc85xx: Orphan it
>
> Johannes doesn't have the hardware to test patches on it anymore and
> TTBOMK, no one else has shown interest so orphan the driver, for now at
> least.
>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>


Acked-by: Johannes Thumshirn <jth@kernel.org>

