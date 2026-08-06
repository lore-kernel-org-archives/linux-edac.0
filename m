Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE1388E63;
	Thu,  6 Aug 2026 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040216; cv=none; b=k0zlbetgiFsBNuthuHQ8ADqlksEGJGwoqj98k3csN9SSNDOvjW3e9BR/92N1vrYDSA6iKlz0ey2q44jfuirnRnHFUAm2PagvpuBbxAINnDvyRQmiOf0ALmannpYNVrCucO3pvZLcVI5H9sAWyq8G+qjO7J0BYCiEUOFaEZjc+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040216; c=relaxed/simple;
	bh=aPF/k3s+EvGi16bkCOhvHq17FIM4H7LGLmjhshm52qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHajR5Ev7Mrli2S/2Rj9je+8vIksdd6g7+/M+una3rUamSLqmtNwDxitKtiauExOKKW6cPurtc7WjACYkCwV08I+C30Qg3n1pROf0+nM0bNkkZrrpvXQ8hFpMIRmpuWSOv3q8lLpKOwUHltQL3UFBqc7H7f/lTqyH/x1a/VhtpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FjWknaRH; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FjWknaRH"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E8EC540E016E;
	Thu,  6 Aug 2026 18:16:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHR8h4PQ0myC; Thu,  6 Aug 2026 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786040205; bh=eivCTlL1pgz/6ZVPyC5W8SfS79f8rUG9D92yKZ9Y9/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjWknaRH+8Mi2NsGYhf2Ot0oYT4IJHZ4SDtvG9KGZXNG0qWOrHrl0wPaU7SDL+nri
	 rM8E0I9NrE8/QpcF0yWn2u85vUYF1Xw4pUzBRECHp7ejTFa4Jo8KfKwBS+6TZOp5ag
	 o8z2rE1sKE2edUBmd3aTwZwSOnnPF8nJs9EjwCme1S/J2zFDwNvsyoP3VUmNVcBb3j
	 67Ovhq7J+fbrz18ZtjauIKASuxRzEM4jR3Fz7pkqCN9xbIcw9TCUuybFKKPKc8vpIF
	 X5ZYaqE3fZ0btG0EOqbTgc1sKFxVF4hEpdLrVUxUfz+db9gcnTheiFpDch5OpsZDVy
	 mado5PyVjlOjtImGrpkaA1hB6lxbqF8zsQ8ETWD16XB5tJcHb/+Tvbh92Lz82hSB4Q
	 3VPuKS+dIWgcs8bIhluG6xL/uwRdnePbei6VAFBeiAX7eEgc+uQgX8uURrGerJH87l
	 SUhZzL2zPT0ow+CVyO4F76cxomsKKmxK6j7Ia6RoxFxlUWz8tB+TMUqcCxDsXuAHXj
	 JGBSKs+VNmJ/684/i0cMrk+IrrVCICMu4plNdVta5Jhp9B82FWoxfzZtnLp9KP9Qck
	 n5PyCApxCsio7NFSyHR/4s3Ijeed6kqR4CrdXL2/doLe4c4J/rJlByEPDFrv76mIjI
	 T6T47ZFA+mXVap2806HhJfsM=
Received: by mail.alien8.de (SuperMail on ZX Spectrum 128k, from userid 1005)
	id 3ED1940E01CE; Thu,  6 Aug 2026 18:16:45 +0000 (UTC)
Date: Thu, 6 Aug 2026 18:16:45 +0000
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: tony.luck@intel.com, rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] EDAC/altera: Guard against NULL of_node
Message-ID: <20260806181645.GCanTPjVMp9VY1EPnX@fat_crate.local>
References: <20260806161055.1520446-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806161055.1520446-1-dinguyen@kernel.org>

On Thu, Aug 06, 2026 at 11:10:54AM -0500, Dinh Nguyen wrote:
> Hi EDAC maintainers,
> 
> I wanted to explain the reason why I think this patch doesn't need a
> Fixes tag. The way the Altera EDAC is written there are many instances
> of the driver referencing the of_node, which is why they are flagged in
> many sashiko reviews.

If you think this patch would make your life easier, then sure. But
we're not "fixing" the code just because a tool is stupid. No matter which
tool it is.

Thx.
