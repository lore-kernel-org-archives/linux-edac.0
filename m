Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA7D3F7867;
	Fri, 26 Jun 2026 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782481350; cv=none; b=Y5RtBOE7TpAheUSLOnC5YUEaetsGjiOtBPiP+tWT3B1gWglsTAs5S9qhRtENgXbvJey2DdcND6xSBuWUThK48O5g1ZRst+l6xhPbvMekYC/hXbYqfCXww6MTj7lpJlz4zo5qhvTsnZr87rKyyjCmv72JbTaORXfD/qhGBnTrq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782481350; c=relaxed/simple;
	bh=6xNagnY7a3g40sO3V3cRrA9+Rtruj2LTOAs0KGESaBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktIlPHh59Qf8LCbXiSfskqSJgpbINMJrvSnqGgU6MTYR333KW+yEI19ycSPow0SIxThIPj+Z1X3WzFO4syAA3h+wbeS2FmvvteotUh0hDw4UJLPqhKlyYtdrxpVQMX+VkaayNN/Poyq0urk4IgNuz+Cwy67FFnyRky763vAHgnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS6yORUs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS6yORUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5D31F00A3F;
	Fri, 26 Jun 2026 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782481349;
	bh=9TVJZJsJLSP5jFZNooBLw2NvjZXstfG/u72HEuS/kOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fS6yORUs7oU5O88TBiXXYYusU/imf8YpAYEGwxHr9BY8EABIxR4M6hO6qIgQzuqGV
	 AxpJngo4VeXRUpRzFEuN39NgF9jBjofD8GjU+9B69MElf7axXg8J4FD0OaWlHaZcLF
	 tDb3bSYlQBfVRYxN/pFhVlyX+uWIxP5+U+8Yd3shSrew3RTRK+CKchUs3/oTUIHR7+
	 5TJzn876ADfZpqTAaV3DFvhNFRIFfsjL4AnrPC0KL9S02ruwjDAknWDr12izzJ6qDA
	 azAAdUonUPCeWORgX5h6Ty0Bl4U5ffy1BM8ERGSNcV8/sUIxQs9wyI3d3Cpco9IbxX
	 eO8rpl2JbHHUg==
Message-ID: <a0537f7d-63ad-4384-ae49-41ab00dbbc4b@kernel.org>
Date: Fri, 26 Jun 2026 08:42:28 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 tony.luck@intel.com
References: <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
 <20260617000711.60804-1-rounakdas2025@gmail.com>
 <72efba41-f8b2-4cd2-9ce6-824cfc1a9d2c@kernel.org>
 <CAPYTKoM7PudjgHkgyGgLAoz9gcXyPQhe_VojLxNYPkEwQNRQjQ@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAPYTKoM7PudjgHkgyGgLAoz9gcXyPQhe_VojLxNYPkEwQNRQjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/26/26 03:22, Rounak Das wrote:
> Hi Dinh,
> I'm glad to know that it tested clean on both platforms.
> 
> To make sure that I understand the approach correctly, do you mean to
> carry the A10/S10 distinction in the `altr_edac_a10_of_match[]` table
> via the `.data` field?
> And then reading it back in probe through `device_get_match_data()`?
> 
> If I got it right, I'll send it as v4.
> 

Yes, that was what I thinking.

Thanks,
Dinh
