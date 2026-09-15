Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8534DCCD;
	Tue, 15 Sep 2026 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500629; cv=none; b=Sv5rYkTtJWGkJfSAC/IIkFRAdNbHvEh3CAONNQAEisySosPt6ZmnqpR4RaiUtmnnN3lkx9p2tZWk2qiWvD2tp7GMvcEAJw7LG0dC8N0D8w/T39YnOyqqbHC2e9S8IxDetOS6Vxjz4mVgDbET7AjpAmmfUMcUKThcJ9rHSXoFD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500629; c=relaxed/simple;
	bh=4cWMkRG+Z1pJ1YvFzmDZQGESqd6Z0JZYG5q1O4QBX8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=foNXPkTrKo65XxXYRnLMmHDdN52uc92S1nS4HPivj0VmT1aAP1l3oW0bJKJ6JAJMkR8qevrtePFiY0OwJB+miOgQATfVX1FhSbBZJKubKsy+l7Rd7s0+1Z1pPBeEHIUo7ukdZUazo4YEL0m5EWznamL0Xw36wNWBZXvlHraR6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EyruoRl0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EyruoRl0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F2F804090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789500627; bh=29SVqZL6jaoTFFeLQLoNThpgj0piqyLyfTAK7yqpIug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EyruoRl03OfhKEEodVxwuVKlMcA1THLACkOdReZNBhjYyEMWe8UWtqgwlrVKQ2k9V
	 Ac2wHtWfbrINS9koY1N4SZTqQXNLjPcm8+WWvLTvbvXKbZiPq94Kq1RdBsZ3UZxEWH
	 gY6qbEulSvkhaEVGgaQDsJIcf0SLqUCT5V0ckBIZwrZkJFRgdrWFjLEipPIGI3MESj
	 B+Fej+BB6f6olcWAeq2fqV/BH82wmq0s34MbcxzQa8g9mmoo4qnh0fZb5BYbv+XWUf
	 YAD/K/bi4rd/pDdBltIgre8enU1G6eTTDX2ha194FzcTMIVrBeB90RwqZvfv281JIv
	 JBKi/MnvmsaSg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F2F804090B;
	Tue, 15 Sep 2026 19:30:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, linux-edac@vger.kernel.org,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: RAS: Use the real EDAC PCI parity
 control names
In-Reply-To: <20260905092441.41401-1-kmehltretter@gmail.com>
References: <20260905092441.41401-1-kmehltretter@gmail.com>
Date: Tue, 15 Sep 2026 13:30:26 -0600
Message-ID: <874ifq8g8d.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> The document names the sysfs control
> /sys/devices/system/edac/pci/check_pci_parity and the module parameter
> edac_panic_on_pci_pe. Neither exists.
>
> check_pci_parity was renamed to check_pci_errors by commit 91b99041c1d5
> ("drivers/edac: updated PCI monitoring"), after the document had been
> written.
>
> The module parameter has been edac_pci_panic_on_pe
> (drivers/edac/edac_pci_sysfs.c) since it was introduced, and the
> document described it as edac_panic_on_pci_pe from the start.
>
> Use the real names.
>
> Fixes: 91b99041c1d5 ("drivers/edac: updated PCI monitoring")
> Fixes: 327dafb1c61c ("edac: core fix redundant sysfs controls to parameters")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/admin-guide/RAS/main.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon
