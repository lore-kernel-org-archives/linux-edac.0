Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7654040D59B;
	Mon,  6 Jul 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341287; cv=none; b=DHVit0zG6ItjnNy2x0uREXl81HC3k51jlNguax0OLuOXohv5YUKEnJ4v08A55nuScyzuu3DxDY3H7Qh82X8+Ot6/Y9eRNksnvLDjNt5PI4wKi2J5m8I4LmQQzmumfb88L5unyooMvBbksfbHcmwEKZOXnzQhvUJkmRiQqMs2jx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341287; c=relaxed/simple;
	bh=+tbYphDBog3r7NesBjOFAmashQzP3M0bnH1GU+8abHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWek1EinrjMWU2hClh6NtHEBKUb2oTcQKn5mPwPHzlFCkRJjmZvFMRjhVqNkXIfV6XxXNyguRXLuDbzAx78lGOo/tpEZ2zBdyIjXx7qAt5Ypovz3SpUksEM1IsN0aL5gY8nB5ZSXBBkwed9Wv4+bCOMXlpCpUMEVeu+v+y+8cXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4Lpq/wy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4Lpq/wy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F511F00A3A;
	Mon,  6 Jul 2026 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783341286;
	bh=GvPBqzJJ4TKEziZ7maybe0awnUEVtMsAYri8KNIrQc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P4Lpq/wy3rTfHWg4T909IjTB3Z7uCbOX4RvZ7Wd/U1Vmy/UwZukGH3/1FfephvcGN
	 5iyic+adr9TfL/Bmr20ewk5wVfdp2ank+ENjbRmrSEjI/BaddW91iLC74XpZws2nme
	 PP+Oq6hB8wbAXxPnXtYzfSZ75SsrSLeJc53iGgVOxNMcJWHSPHyR8RCrbCEUlTmQma
	 AWhDU++CHDjGxkCVSSk6wTeDoBsS4omNXiVuQZol1WpdT4O55t/0L5Df658ws30aCh
	 yfdboe8bwhfoI6vLaYiTEq98CQI+cnLrY411YUhKFqkZ0uOEMxSjT3BweiRwSusRjH
	 UXsFrzcEV5ctA==
Message-ID: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
Date: Mon, 6 Jul 2026 07:34:44 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260627061723.43014-1-rounakdas2025@gmail.com>
 <1acf2543-6773-4dad-a94c-76fe3c11ca8a@kernel.org>
 <CAPYTKoOBG=quMkOsnAaT7Kn3Zni_Jxw8kjJPwRq3CHrd=hnQoA@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAPYTKoOBG=quMkOsnAaT7Kn3Zni_Jxw8kjJPwRq3CHrd=hnQoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/2/26 10:53, Rounak Das wrote:
> Hi Dinh,
> 
> Thank you. I am glad that v4 tested clean on both platforms.
> 
> On the two remaining ifdefs: I originally left them as-is because they
> guard the double-bit-error path, where the SError handling and
> arm_smccc_smc() reboot are arm64-specific. Converting to is_s10 would
> compile s10_edac_dberr_handler() on 32-bit too, but that looks fine
> since the symbols it needs (arm_smccc_smc, INTEL_SIP_SMC_ECC_DBE, the
> S10 sysmgr defines) are all available on 32-bit socfpga.
> 
> I'd like your opinion before sending it. If you'd like them removed,
> I'll do it as a separate commit, patch 2/2 in a v5 series, since the
> DB-error path is a distinct change from the IRQ-index selection.
> 

That sounds good. I actually tested with all the ifdefs removed and it 
looks fine.

Thanks,
Dinh

