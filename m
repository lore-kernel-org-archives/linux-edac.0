Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363217;
	b=s4wM+oh/v94LZRIr7lB9VCOXeATFuPR8/BzjsEdBCb751oDbeZWNE7LFe+qQPrRBhMaY
	 01V5gA4mAjuf+wjRZBp+H6WGeRfxu4ClQJsUeapYnTBa0Brcrj1gtjyn4cs+Hu6ualMow
	 coH+aJaDlLMCCYwj8+j2rz63nCIyeS51f1GZnQke3zT6HeSj9qcwSXOeJhgerx5vN8fij
	 45el8eO/bmh/Rz/sYDoqG35bWDOc5Oaul0Z1V4iQM+rEQx2hRRGBeLgPaSziImT8V3ai3
	 SG0NrCSjUkTebj8xdUBv4ESXZeHZKobQEbScgAIwnDfC04j3FCKIsN8ECTfbWXbJa8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363217;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2wXPPM/VhpiWJdobsdjxR6EX3sgqzr/Ver2rW6fKyKM=;
	b=nKwW5q4xX21sFY8PAn5iscUmWZ6Am7uBRb0vk06G9NxWN/tjpT6uJh6Kb4sLtKAuocpk
	 t1yA+Eeov4j4ZOaCeQM93+ZKqpby/h1nTB1fLPlXRk8em+EjaZ2wcDDHe+CnDbJPpxtC5
	 mIbhV5wlcOL1wZjSQbC7+b+Fti6SCDz8MPlVLxf1/efdcClnhZSTA0HkQc6HEkjphCWe+
	 bEhu5QVmjgoVTBpHLaOVlrkiEvwSdbGSvKVlW0jZeb6o9F2+HDgN0XJIS0snH6DoJoUQg
	 re1ebWIyY+GlopkqjvpnbUeInbsGCmxlGNrJUwJ+Ct2tU/4/VM6smS9O76YpZ56z+ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksa1nqbz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF3606A685;
	Sun, 22 Nov 2026 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksa1nqbz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01EF1F000CA;
	Sun, 22 Nov 2026 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363216;
	bh=2wXPPM/VhpiWJdobsdjxR6EX3sgqzr/Ver2rW6fKyKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ksa1nqbzeGyOyPhy2/y+ZCkHO9mZynIykj8CVVEb9P7GCZzFNEZAD3XArXlz3j7BF
	 q/NVz8B784ETR66STnJDAEOr0jAwLLLY/YFMHoO6+c1qDV+CFJKl2Qom5bhhied2bp
	 3qV7NOmK63bIbSQjhImv98PHCRhOst3Edv7myxbWtw1w9AKJrlx58qsEyNcdSrO1m8
	 v4feVDMVNDvdopUH9w5up/HEEI4EafrxP6rACtRs7y/woXX/33CKpbf4VmSNTOzfor
	 7UEOabrLr08F5mX/o2A00dtBBDRG/93JsAvjZQATyLJ++qlG6uTjDkmpOUb4OGFvT4
	 Oo5fQ0noGsVHA==
Date: Sun, 22 Nov 2026 17:00:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rama devi Veggalam <rama.devi.veggalam@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, michal.simek@amd.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	james.morse@arm.com, mchehab@kernel.org, rric@kernel.org, git@amd.com
Subject: Re: [PATCH v5 1/3] dt-bindings: edac: Add Xilinx XilSEM
Message-ID: <20261122-devout-ant-of-tact-31896b@quoll>
References: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
 <1795313124-2138932-2-git-send-email-rama.devi.veggalam@amd.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1795313124-2138932-2-git-send-email-rama.devi.veggalam@amd.com>

On Sun, Nov 22, 2026 at 07:35:22AM +0530, Rama devi Veggalam wrote:
> Add a devicetree binding for the Xilinx Soft Error Mitigation (XilSEM)
> block on Versal and Versal NET devices.
> 
> XilSEM is part of the Platform Loader and Manager (PLM) that runs on
> the Platform Management Controller (PMC). It detects, and optionally
> corrects, soft errors in the Configuration RAM (CRAM) and the NoC
> programming interface (NPI) registers. Errors are reported to Linux
> through the firmware's event notification interface, so the node needs
> no interrupt property. The only resource is the register region used to
> read the CRAM and NPI scan status.
> 
> Only monolithic (single-SLR) devices are supported; multi-SLR devices
> are not covered by this binding.
> 
> Use a single compatible, xlnx,xilsem, because XilSEM is common to Versal
> and Versal NET devices.
> 
> Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
> ---
> Changes in v5:
> - Moved the XilSEM binding out of the Versal DDRMC EDAC yaml into a
>   separate xilsem yaml.

Why different directory? So not a memory controller?


> - Renamed the compatible to xlnx,xilsem, shared by Versal and Versal
>   NET.

Odd, you need to explain the reasons for deviating from the rules.

Best regards,
Krzysztof

