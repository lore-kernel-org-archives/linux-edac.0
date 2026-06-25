Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CDB2E06EF;
	Thu, 25 Jun 2026 06:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369565; cv=none; b=ZAaeaMChDtDYR6PCnL7Bmlbrl/CnoJWKo6L/R2NE41EAYcSB4yn72ku42YIYbW/Nu6UC8YrS3aLb1HBW2vaOvjkCqk0jyX/9nGhf9KV+VgkWCC5iI5sX72MLWDRB/To5IAHWP4QElz90m/+K8M1EreVOpDSM+++lE6LZowtHKRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369565; c=relaxed/simple;
	bh=dla6KEGixxcbbpeE32Y0FV+s+JhG0zt3mNXu9vf2RbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgGTo958fpUvwiJ1qKu/Uds33kIqbEw0xjwRLP8s9Fwr3CuLRoMXez7BdWJX0odFcjXXOdPO9yk6SKRMuSo2ulJyQh5rJxLIS6yxnBj0We31SO4mNhmpS9Q57i7Qe70Co3oXZHs+Fi0X0quo21+CzdumoAiacUcdwfaQI9kuPTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRzz5Q7a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRzz5Q7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BE01F000E9;
	Thu, 25 Jun 2026 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782369564;
	bh=GcoSB0XZI4hLE+JDx5MBKb7eQx9RhsjyMhNWGGvT4Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LRzz5Q7aVp0LE/z0exmrhdbrKF1B8680nCHxXz5/RIqUGDxAMa3aF/6V0gGRPOafj
	 LhPPOUtUhEBDDFrRw0fJgaEZxBpCVpR5kpnMcpjZVw19Kn7rD1MMT7ozXSRkRgeTFD
	 RfeK7G7MXzmk24Y+rAQebnMoBWsZMZHHYGnG5nPBVXr244kLD+dws7+NNnxFqwDE5V
	 IH7HuV3eE7NAVLSnH5hIfD6TRcdIxM4N9R4GYTyOUoFryBn0RGR4SKdOukkTWKJ0pl
	 Wva2/fgnXcxKyRGvYjsdmOSXNtT4Ufde36pdnleU1EctdhhWPQZHDCW/GEupGp0Dgk
	 lPvjSFiGiXdPA==
Date: Thu, 25 Jun 2026 08:39:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rama devi Veggalam <rama.devi.veggalam@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, michal.simek@amd.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	james.morse@arm.com, mchehab@kernel.org, rric@kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/4] dt-bindings: edac: Add bindings for Xilinx Versal
 XilSEM
Message-ID: <20260625-grinning-copperhead-of-love-b6bc2c@quoll>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
 <20260624212545.2850787-2-rama.devi.veggalam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624212545.2850787-2-rama.devi.veggalam@amd.com>

On Thu, Jun 25, 2026 at 02:55:42AM +0530, Rama devi Veggalam wrote:
> Update versal edac device tree bindings for
> Versal Soft Error Mitigation (XilSEM).
> 
> Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
> ---
> Changes in v3:
> - Merged XilSEM edac with Versal Edac

One more thing: There is no xilsem here... or commit msg is just missing
the main point. This is very confusing or heavily incorrect patch. No
clue which one.

Best regards,
Krzysztof

