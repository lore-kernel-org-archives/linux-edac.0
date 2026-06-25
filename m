Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5162E39902D
	for <linux-edac@vger.kernel.org>; Thu, 25 Jun 2026 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385042; cv=none; b=YghoTR04WXCu5i2RTwYDcvvjzZ6uiv4JAm5fiQyGcylrDCAyA69HBb/cQRnsGE4J1c1yep1AQgme068XD30+RR/MSfemyEezgRxorcSnxtW9lpGBU6GEdWamCNklT3L9NQK+WrlL8yebzPS+LFtGKwr2g6eh13VOqOW1oOXSeEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385042; c=relaxed/simple;
	bh=++FVkwILNKlbScjNFeM9SANlKaAyvEa5jrh63t4yOmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkOXUHtm1gFEy9HOfgu7LqDQXcjKhLJwlw7yMCxMt5SDHd1ewQkwzOfTsBMGSjUi2MoNNs992ksWcjdlQ/5tLWFp4Gsidrzc+gBYdbelZ50b+D7cD6PecvAjibK7CAuL4YPcXr5t813W+5Ns2/u4Jyrwn3wTzNygSVtXv0bJXwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWW9xqBj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWW9xqBj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso11559895e9.1
        for <linux-edac@vger.kernel.org>; Thu, 25 Jun 2026 03:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782385040; x=1782989840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BqRv2LvLiTwMDijxQ6la05Or7ANrVdBQUl8AHj2I31g=;
        b=JWW9xqBjlikzFGp87zH4wigoNrFkQSlDKv9FZbZwd/gcQ/ixWhfyOnmZxWXfjA71FK
         +UpqdNYcjrU23YfaIPEW0hZ/H8vAy/D4XARYppdFefXfPFfWFMXTwcAyNzoUm++Zfzi3
         4cWtPzZg7CIfbeThPjFDcyXIm6qCvR2vT36LJHeEN3lsW+X/2VZlLelczpY/lZStNno4
         rdQQfLlDmgiA/hSMN5RVX7nC0puQ+XTAGZQz445SGd9bbMzUMHjZ7lDShDxes5fcwPZF
         UpOggCEf0nqHGA0ffD5OiZjwiA/ogLxjwlbeqLs1Xt5I6+5UQQjCJkajzud5CDx7ibze
         ILxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782385040; x=1782989840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqRv2LvLiTwMDijxQ6la05Or7ANrVdBQUl8AHj2I31g=;
        b=VhnYx0cvZENlsKEfc/jkWwxVXmwODTxBecK1AoYkuOPoOtvascW/8Ux1cAd6vjhUfr
         Dylua2nFkocSTd96Ek3e1jfzAiXlSeQ9h4qDTugCgU30R/Yi0XjGdX8y3ouWo2N9Vxa7
         /+mKZacgPxN5TkNf72Zq1EhXrYAEOVyUrwMSO9DrnyWklbWN4Mze+cfh9R6R6RIi5kLT
         HEvz1OfNPYGaL6MEUPi2LPp1ZINs9LYixmfbQ3x7mGi2a+hkjJfCg0o19dH3AIG9Lu0O
         zbpiNBRNiBpCuZGFHw8Pt+5nBUTNdXw+L62+uUIzcj8K9patg6KyS5gGFYdT2GOGkq2T
         Fasg==
X-Forwarded-Encrypted: i=1; AHgh+RpwYP4ky5vO0F+JLdgzfJ809wkyVTek4PKOM/lkvVJzU0KZlj211V673OkaLzS/N/Sjp9Z4eftAV76j@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTfceNmZAikIIaVAm8mAH0Lxs3sUwz7rByxZr7mxwrnk+zcCL
	7dQRxdr6i+Zg9lGG0hFBgP73QEepQpetPE8xLFuZEstJlIzLPXovQ9Ac
X-Gm-Gg: AfdE7cmSkQJGPy2b7UcGjftj2SaYLMOTuWKSZQQptPCVsrJ04gVFtCWXzAfw7a4NCnP
	P22DXFtm0JnUxWE7NH014Mu55vGtAUWLOO40Q5/cN6bwGkp6aeZMlZU/r0RBmyyI2BcRHNynMQn
	B5lVmVSG8neLTBet30409mbkkKHFPhBUmqFPrMFtAoL4+eS+JZBt1/Y3C7arPXvOLZiIXP41NnP
	b4pV9Q48rMKZ77oUlWE4h2JZ2rBvbu+4pe2+iFXOtP6Bwo1hOMFfVM8XNnMghMgeMNeymwOQtuE
	T862PmzNZHgKn0vtnI4a++Taz5yNXMZx9DN6jRvQVt0/b5fI4xrkZbz+hm8RmfoB246cBvx64i8
	IqkT2eFCSmb/T5dfX+DWJ9hkIS4jW7e+S5NRf5qxM9OU0G5uwbK9UcmawZ5z9q4ncoiyauIWkXx
	jIk+gHryySIxAoaCC0n3w/wSVml5kCxzNMWpEt0s5QoJ+h3MKggH0GbgHyMkOMFONsl2PPBzJI9
	ozJfEhJ
X-Received: by 2002:a05:600c:5488:b0:490:ea8a:32d0 with SMTP id 5b1f17b1804b1-4926689644emr25100555e9.20.1782385039551;
        Thu, 25 Jun 2026 03:57:19 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926401a2e7sm91474245e9.3.2026.06.25.03.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 03:57:19 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f725da33-3ce0-455a-ba43-e23b8ec5d223@gmail.com>
Date: Thu, 25 Jun 2026 11:57:18 +0100
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] edac: xilinx: Add EDAC support for Versal XilSem
To: Rama devi Veggalam <rama.devi.veggalam@amd.com>, bp@alien8.de,
 tony.luck@intel.com, michal.simek@amd.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 devicetree@vger.kernel.org, james.morse@arm.com, mchehab@kernel.org,
 rric@kernel.org, git@amd.com
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
 <20260624212545.2850787-5-rama.devi.veggalam@amd.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260624212545.2850787-5-rama.devi.veggalam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rama,

On 6/24/26 22:25, Rama devi Veggalam wrote:
>  config EDAC_VERSAL
> -	tristate "Xilinx Versal DDR Memory Controller"
> +	tristate "Xilinx Versal DDR Memory Controller and XilSEM"
>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>  	help
>  	  Support for error detection and correction on the Xilinx Versal DDR
> -	  memory controller.
> +	  memory controller and configuration memory of the programmable logic (PL) fabric. Support detection of errors in Network on Chip (NoC) peripheral interconnect (NPI) Registers.

This line of kconfig 'help' is far too long. See
Documentation/process/coding-style.rst
and
Documentation/kbuild/kconfig-language.rst

- Julian Braha
