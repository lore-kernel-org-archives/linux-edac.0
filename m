Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794580533;
	b=tm3rmW0BF37qMHUw9BKDhIdL1/IgI/hvjfUSZnYb4Fd9XdUNQ27LInHknfYyEDSqDcWV
	 0pLXsp1waYsZlScS1nVQmWO9gXFspzYkNJMD4QiSdGXlDKk/n2+ggBkDR/kMVlovIWUEm
	 1IZGQVwyBy36sKgLV7SHAKVBLWpjxQoY44q55ClzPyv52TMzQ1wNhNY67mNz1XqrT0wZJ
	 d+/sFDZwDwUACzCKRhousDDXIjQndYU7slfohSZLmhFB6FfSLO6EFlil7qHVo0YCIDUi2
	 EMYD2pdNbqVSrIs+SARkTKP8YIhXFVsV2LtQ3XUCXBhKVnF1KEC9xy5gFmZcnP6zhhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YEhVBcNusAf405LcZnwE5mAN0qWS+I+RJ+OQc0+Tq9U=;
	b=MovznBziQo7oNIqzIeCg6QGC77TpRwIzFZJrlhZ7XMhDaHxzdkK4jw3MmsT51xYqCrjz
	 +8RIo5nJK/F1Wr32dF4sSmrAC82yz73S1WQW3mZVKAVKois45uQsDn/Bz6PtmJA9ZmJc1
	 xlkJmBP1H7HpVhdEtYuT2Q3IMzYxvVVLV9r4JDhAJHcRlx1VlFxSh7SdLKkWA3zoAS1GL
	 rPfgeHC3ENTrDBBFCVFFuNdxaHodsuqQvtZ2Tw2RNa8jtM8VKXQsuuVFMo+qDJ1duDP0o
	 9U86r93YKbfHcKMdOYVwXRfcviuocDwLSOasQZ0uiHV+VHRLCPy6E3+cKpkHf1EHjOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=adrianschlegel.com;
	spf=none smtp.mailfrom=adrianschlegel.com;
	dkim=pass header.d=adrianschlegel-com.20260707.gappssmtp.com header.i=@adrianschlegel-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PQSdCaAh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D6606A32E
	for <linux-edac@vger.kernel.org>; Fri, 13 Nov 2026 14:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236D6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianschlegel-com.20260707.gappssmtp.com header.i=@adrianschlegel-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PQSdCaAh
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3704d30b84fso1380376eec.1
        for <linux-edac@vger.kernel.org>; Fri, 13 Nov 2026 06:35:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794580532; cv=none;
        d=google.com; s=arc-20260327;
        b=Ns60DWC/cu2BSuNXWQEHeRUWrTRxtWGiEokNC3JkPBl9Lxp8/LmWIGCQ3vpXRS7SSN
         alt2KJVExfpuaVWGXoOmHMTCe38iQ5l6FTxBIuEj7OKyBZItj+2KDH08NhNr8mhq2ZXp
         xXprOV+HsLaGMfOtC4+L8jYCqAo+1ejvQDT5dbOY7c8MPgZ08u1mVKyb1rM6Y10eYQfN
         kKlBS3yrsB0V8puSXP0IPqP9qt3MZDgowYsJI2cyFnKuDzHZZTPV9fpWkwPsAX9xmOMh
         gqan6ML5okOK5bxkrM6UNiebdGm/tw1lFTBDBId88+9nmFe2/x+bFl6JbFY0lQyJdLs9
         5zSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YEhVBcNusAf405LcZnwE5mAN0qWS+I+RJ+OQc0+Tq9U=;
        fh=1HFh6ZHm7ATpJwQqJ9cgBBfClGVmcU0XAToGkZ6ihyA=;
        b=gJDZc5vp3LJHA7VdwFI+++USmVK5sQ97zEWFuvLwqv0RiiomfDqHrwPKLjmSeb87JZ
         ve7CvsXpK+zS0nIEEPSI09agaNF48qkF1DJujQOWdDM9W6tVjRdAODh4765bzR4Rj23K
         5dylFAL9umf7ApfyugAIxPb/oFOgAvpqaVjY4rTJoY3z5wcdK2ZHOFdNz2zzq6e8l8UP
         /oR1ODBCRJ6F45g4Y2JBwCEhMAIMJEHGfQ8E0KN5FsdAFMyD731nLCdsJ6sYPjoG5wl1
         Q+II5gIFm2zPtafg5rtzBC5enCm7xhcLDwDC2ayqyQ9R3TEKv9Qwj+KUpST8lbOFygmh
         ofmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianschlegel-com.20260707.gappssmtp.com; s=20260707; t=1794580532; x=1795185332; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEhVBcNusAf405LcZnwE5mAN0qWS+I+RJ+OQc0+Tq9U=;
        b=PQSdCaAhpO5/jDSiheLa1OG8EJ9skTRuDG1W4vNIhvIv6pTie1Vj0L1fjTeWtsKKog
         db84zu9iKIq58QUVRsZvkrZ1zm1yDQlORDk2Teo7NOH2PfRHWAo94eS2be2CGYUlaB4R
         /JNO8Od57ZmSPMGoIhSmrLaM3vgfoWcn+Ym45coAd+4ICbHqHY/cFhEg/P+Yyg5aEQMC
         IQ2kQQ6PwLBb4nMFAJnEyO3z7avTTB/uhyW8IEi069hEagzWvyKXIjP6k+0JnDCYPWgT
         PeXe3XHF2COkglrXyoVdNFVquVn7cOq3njqRJWDxFYxbZPYZ/QJFctbMYFti9xn4sOd8
         1cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580532; x=1795185332;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YEhVBcNusAf405LcZnwE5mAN0qWS+I+RJ+OQc0+Tq9U=;
        b=iKzLSt9ZS2Dshu+32G0O/2gqSh2HqLKGPlyA+7zWrOHNV4jQkleZ23IsgRs2agyH3s
         oMGmYFBjlfjdKFouXYQnnUZykllEuLCymDKGJpd/B54I5LNWg9t7r+kuRuZ0w2GaYVc3
         tabgWz/sXwCON0ksyXnevNJym/1TVJySnCT9H9hFO3FKhO+tpneM/JjL0F1iBszg9HWV
         UYMAVjTy99JaBnrHOofkkGbjN5Ts2v/Q4lPs8y9Jxk/KoCmtLQk1P6TJRfrfekcR7y3B
         eHbY3vh54CsX4QAfFWik1PRpNf/zAAHV0ZvQnrVXjaL0yPpCv9Mcry/nAfSP22vo7m1Y
         ho/Q==
X-Forwarded-Encrypted: i=1; AL+hErGPrcWeqHfdSF0M6dOYEKjJpLyi+pctAKtNwvCtkdKOrsW7Oq2af1mNkjQkj0Dx3ye1jTlegR39loDR@vger.kernel.org
X-Gm-Message-State: APuU4Z93UMhzG73VaUZoCWXjK3HK8ORCw72wOewr7ISNyAoUfIAX4rJW
	aCCeAJGdT31VLo1/UUG7cNffziSMHRla/ubi82ZB7bmh4RsGN6kKrzeMMolpmib6dKS8thN4Veu
	I5nW8f8VsGY3zRT6BSycyFUoSuxaewX+yFqjz7kIr
X-Gm-Gg: AYBFou1N4T4qv5dmmsDgi9uIJoTf4mlPt7CzI/jbyyjKhYZYagbtpDMOllwuN3lmA6w
	Bilv6j3zAh33BZCiAk7TzInSfY4vujevlytoQRzfGRYbIM/vxmIFjQApdvqpWboSNFwPkut8C0P
	g1iZBN8YuVfpHa9LB3Y2GKqLhLMYZfS3ExWblHSPriZrlsF1Qf5hNMcmph1q4HG9ZzhBKIdab4Y
	1RGpr/hzyLf/CxvVs5EWHrz8l9NewSvKvS3TLwmI/ZxR+eEsFB7lK4rEszHLfPTcvtO1AsBBEUp
	kP/Gn9YDxhvTh9fUnQKAYvCgGuiJ3OXG5L+wJ2D7cUEpsJB59rDyY8PLJFSTA2xEAeXrinZt9K6
	Ju0g3HymYgM4hUjAxVMGVTnBPLJYQjST1Hdx2T//i8jJEnNZxnKa1cplPGtQvgao1as+/PP6yhU
	PNM3cf+6rrYbZIv+emKTHQ2MCYn4SsC8/hqg==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id
 5a478bee46e88-379682c2053mr1907220eec.30.1794580532081; Fri, 13 Nov 2026
 06:35:32 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003222012.19685-1-me@adrianschlegel.com> <20261012193305.38931-1-me@adrianschlegel.com>
 <20261019153207.GA144824@yaz-khff2.amd.com> <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
 <7886e7b1-95fb-4338-a7bb-b6bf1da3a634@intel.com> <SJ1PR11MB60837CA7EFFE0AC99D01904DFC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ba508991-6a98-4aa2-a98d-e85307d50cef@intel.com> <CAN+_ncWbJh1iPzi+4tKdSguEo_SYj_4R3K=sNkG2_VT8TvkG5g@mail.gmail.com>
In-Reply-To: <CAN+_ncWbJh1iPzi+4tKdSguEo_SYj_4R3K=sNkG2_VT8TvkG5g@mail.gmail.com>
From: Adrian Schlegel <me@adrianschlegel.com>
Date: Fri, 13 Nov 2026 15:35:20 +0100
X-Gm-Features: AclHuK_0-cTHzsQGKoJrpYaOYYagia9Qe2eDwfhL7mPMeIIGxuqssjIMZGSuEos
Message-ID: <CAN+_ncXtoZ=84qKHcox-aBotNLSogiJrhRtKJtbz=HvOt-umbA@mail.gmail.com>
Subject: Re: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory errors
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Yazen Ghannam <yazen.ghannam@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Boris,
gentle ping on this one.
Thanks,
Adrian
