Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434850;
	b=5R1f2a1fojBJbnzGGucc5hafy6x5IV/QdJIM36chvi1Kn6gkZE0phhX9IYIftrMT7zEr
	 i82GLL+dEzp0qvDtdgCykUXGv6WgAcUSHaXDYxol9geqow2cedxmsfCQ3peeoypghPAvK
	 1LmlX4O1cVikqqu3nfHH2Z75rDmPA5qi+gEsewEbfLqGZRUw4PoZ/V5UHeNvuvQlyBrS2
	 v29a8wvWe3xVWYq61oWbWS0Pki8Gjayo6IdT+MkAPBiDyyVr8ZkfytacKokN6iMD7B4D5
	 jEU/13PHCNFb3unYqjr/omBxM5NQU0S0JSOmTUAlF8LchlZtMG5+vuI8pC4gg/DZD+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=VOD5WV6JaRXrgzqNWUFEhdhLw9KZTPaqTGo8V7P+ZtU=;
	b=X2nYKGZ3RtCFx0832ajiuvxS4t8B26whgRiGksu3MoO1IAD5CajYGHZU/ERQczOu3t87
	 jHYa6Rhr8hLWOnS9id29WbAL2mPLNDRoV4qGRHA4gvsupVArRlGAd8SZ1S6USgSe/LTNA
	 ADqddVs+SSWm5KT9rfPXb5I4nfAZX/EKxyRDFpnXVvt6KM6Ms+rdi7num5R8++ZWRpd8j
	 mLdySvOqEPV8tFe66MMD9pzj5vgtkf/rU3aH0F7mPcaMPC560mi0WmPtUQeYiXR7kOV2f
	 0iJN4MT6iXu6CiHSddU5mmODfQ5Vk3Gl2zj2IIPiT5nWRlpEJAwCyDgRTOfwfvmar5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=adrianschlegel.com;
	spf=none smtp.mailfrom=adrianschlegel.com;
	dkim=pass header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="hG/nB1t/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C3606A320
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 18:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03C3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=hG/nB1t/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16984265e9.2
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianschlegel-com.20251104.gappssmtp.com; s=20251104; t=1792434848; x=1793039648; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VOD5WV6JaRXrgzqNWUFEhdhLw9KZTPaqTGo8V7P+ZtU=;
        b=hG/nB1t/LCdP73RiVqbj/yEJ+CCZpJrJ8H0jRdeEe8J2nf4dozVEjGkosf8BFMHa2n
         Crlx33chm3oolEpgiI5j5iwKl4WRpZcvDDIw3p2Uug4VOx2AZ1x68v9TSl94c3eB6wtn
         stzSmYntl7/E9FTYqzX7pUrnnnYiHONoiqz93nty8CjUFTr6Rvo74wyI1rKJXCNRo1kv
         u1Idx07K5l9Prge0+jKZMYsnjhklEFmMEPGKtr8MCincbz3J/rpsKbDesUik5QlxTcv9
         p3hmOUIcfmYEKNXhQUmLyJpP/Ry5ibioq/D5RVT2yqNm9R0E7aVDZhoKJSXOiGX3zvDM
         o0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434848; x=1793039648;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOD5WV6JaRXrgzqNWUFEhdhLw9KZTPaqTGo8V7P+ZtU=;
        b=VrbyMCXaBBWJm4b7dKsoijkknWIIhwVEbwxgVM1y6Z1w58QCx4rIniBJNPvajgKzLY
         FiKKYYoUfwPdh9Asn7QDZqN8rarD3xCqSW/HBCRuFphI2tVko/UUO6RC12fPXRBmpaw8
         jwPUOYJ+UZ6rUJosjyBxQ0jiUHGgicxZJUZzLZ4X+xafaYcH+3Goh1Q0Of0CNvQqDpin
         qyMP7DwYYxq4SuLisBt+CQ5OGmVN+KNOmsKJgNm1iWI4i4I7p4zTPLc+YTZQrlDx0uko
         dYLZ+Jk+OXJh7yMsO9xcYpqUxYdwPQtpVmdbrxEjqdaJWi5avD1+RBDQxGQwps5v5s/1
         r76A==
X-Forwarded-Encrypted: i=1; AKwUvByc83OcPciuvI+zC5j77Niz5kE5PzrY3ob92Ieu0geOXLB+LFR+8jswLyUE+yf0e7y+sCRErH4RDUer@vger.kernel.org
X-Gm-Message-State: AFq9FYLaGk0GQE1N+xALfP0Pxm1DMcMY9MU9LO6NNROcRPKvYdqLpw/5
	ktN/HVmFKO4iHWyNkCnTjprt6S5R63lpeXmJ/BmsNW3+pQ2ABIJcadjM1dfDf4lk4g==
X-Gm-Gg: AYBFou1/n463CXz37x/qSEDF/VkviPmYCXXJ11Fm1E1O64zJa6qKfB9fXfDAACyfMEc
	/XA7dLhPUHE07O0/mQkuhUiIyBRd2AJOUdB3I2AC/lYpWPmT5LyQpi0wy7d57ZN5PF1jzhrssD5
	57IHSh37XuoIndRML4osr74/1Qy8MPQx7szeZPXNbtcK0u9M/On/9Tvudevd++5wgFxWGo/6Lbr
	7Ks6aCMzpJRXNWuVzvkjh34bTIZAJXSBpbHFO/nYtfV/GP0ncws5dHFNMsHJw0vjav+iJ3Hk5V5
	24gMi7Y5ZNNKkqlpBh2T7DEulVeFRKEu3j/qXPRNSba3Pel+B+73F9jMHRzK0DKWz0B62nIlWoQ
	AYOjfB5OrjI+AJiN1IsiE9wyOOJEFUWtU9ocOosZwcEwqUOsz6wF8w4pqAAuvobElWE0N5G443W
	0kviD2ajRL6vVR7IoyxN4OZ+swJYVYZryKqeOcoWspi3zfXDgw/PNTD1yGc97ZS9vgfm4blLb6P
	KrlslXRtXKxqffYcrA2tgnj4U2UvYw2vOYiMJmc/wqGrhRW4wm1btU0YgnucA6hDIUMSWNurzTJ
	bXTHwN8AjHdN
X-Received: by 2002:a05:600c:e549:20b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a1d7624601mr112174505e9.26.1792434847726;
        Mon, 19 Oct 2026 11:34:07 -0700 (PDT)
Received: from localhost (2001-67c-10ec-2886-8000--14b7.net6.ethz.ch. [2001:67c:10ec:2886:8000::14b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3597sm10959075e9.2.2026.10.19.11.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:34:07 -0700 (PDT)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 20:34:06 +0200
Message-Id: <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <x86@kernel.org>,
 <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <sohil.mehta@intel.com>
Subject: Re: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as
 memory errors
From: "Adrian Schlegel" <me@adrianschlegel.com>
To: "Yazen Ghannam" <yazen.ghannam@amd.com>, "Adrian Schlegel"
 <me@adrianschlegel.com>
X-Mailer: aerc 0.22.0
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
 <20261019153207.GA144824@yaz-khff2.amd.com>
In-Reply-To: <20261019153207.GA144824@yaz-khff2.amd.com>

On Mon Oct 19, 2026 at 5:32 PM CEST, Yazen Ghannam wrote:
> The SDM also mentions "Extended Memory Errors". I guess these were left
> out before, but should they be included?

I don't think so, since from what I can tell from the Intel SDM (Memory
Controller and Extended Memory Errors), extended memory errors use the
same encoding as normal memory errors, but report errors in memory that
is used as a cache, similar to what cache hierarchy errors do.

I also found this thread, where Tony made the same point:
https://lore.kernel.org/all/SJ1PR11MB60831E048B544C83E845D907FC8DA@SJ1PR11M=
B6083.namprd11.prod.outlook.com/

Best,
Adrian

