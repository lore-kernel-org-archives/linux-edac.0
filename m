Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6E3B4EBB;
	Mon, 15 Jun 2026 20:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555282; cv=none; b=X5gE1ObYZVAQWSKbTSDYQb4WXGGYqUccrkxDSxuu2RNNkJRGRcp3+eFex/2efNoEIOZecoQwxp7LSkSVNCqRKRRMsF7ZvQh6CEh6wnMxIDQw3cwyKxwjWlYBoVEtFKy/6HL3aIfpsdfp8PDgObGrBLQBDXKBK57VvhISY5VBMEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555282; c=relaxed/simple;
	bh=ux9v6XGThpCyoG6n5/IQJ4vzGUNS8Ir4hEwurhbhLZ4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=W9n1WcvwYzPLMJQVShGfPtXtezxNjNXF9dNriz/43ErI03F3UnEjCLFOGEeGCASvbLY+3Kao5vOpd1gkbrVE3h6+QR35DyfyGC/QHnuurv7FcZgkMiJ7KTfosUQl5A27KMHecy9eiwzj76zM240Op+utwHX7D7yUGGdtVz61ZhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lYEk2lOF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lYEk2lOF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7EB6340E01B4;
	Mon, 15 Jun 2026 20:27:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zzWpXWRdJg9y; Mon, 15 Jun 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781555268; bh=ux9v6XGThpCyoG6n5/IQJ4vzGUNS8Ir4hEwurhbhLZ4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=lYEk2lOFbFyQRedovGqeceYJ4dzJSbZhWC5QLU1uG+waxe9X567yMikf53ecOwEta
	 +aQ+Y2ovaWFU83GB6eipuvARdIVLaKwCLVmkz8OlmAZ4Gn05anIWAoxWH29B7WbNJ+
	 vBPaUgaDz4eVRMKFQGIc8BcuwBee7Nu1UzWD6u72uY//Xd8DLze4LRMkkJ71ZzPfef
	 qXQEmLtPXxG5WZDlC6fZAQzc25H/SnkxY49dfFUd1C9P+E7+24CoIF0Gp9CFFNKo8x
	 3vfoP4qFbdN3XjqM5c1bUKPPwBFKV/A2nImLNOu2FvPMNd1UaEDHxGJxppNYA1rB7d
	 g1hGgd/HvuNZ9JR+PTWt1YLx26EKZxAUy3VCvpnPFq9YWSHoerSP+nIfun6+cbslhA
	 AYJ219knRPJgqkCeToh8Y4/7NJtatSv+O0oS7v8Gx1UJ4f+RN/XJdsa85qe6rLECMA
	 XVvRC4z/wH0xA+e74IpOBiSqoky4BcRjeqXkSBr6BDnn4CAPLMHY5kbVFK7skKZ2+m
	 KNIhrwmRszsIPWPQYhCk5syt2/9BrI4cbgnx4gbpnRl8ag2UFyrp3BQOHxpT9LScuy
	 WLdPoJxzuOLE0Aot+woZvgklAzPtWOXAb4Pfhw7OtQ2Wyy6ZBIPf+sXPCNH1W9DKUP
	 EkvqQveayI98GHA/aJeJZPMM=
Received: from ehlo.thunderbird.net (mobile-166-177-248-195.mycingular.net [166.177.248.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 93C6940E01C9;
	Mon, 15 Jun 2026 20:27:42 +0000 (UTC)
Date: Mon, 15 Jun 2026 20:27:35 +0000
From: Borislav Petkov <bp@alien8.de>
To: AZ9tumas <rounakdas2025@gmail.com>, dinguyen@kernel.org
CC: tony.luck@intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_EDAC/altera=3A_use_SDMMC_co?=
 =?US-ASCII?Q?mpatibles_to_select_A10/S10_IRQ_layout?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260615191508.46335-1-rounakdas2025@gmail.com>
References: <20260615191508.46335-1-rounakdas2025@gmail.com>
Message-ID: <D0D37FA4-666A-4526-91A1-1AB57B8D2A19@alien8.de>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On June 15, 2026 7:15:08 PM UTC, AZ9tumas <rounakdas2025@gmail=2Ecom> wrote=
:
>The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
>between Arria10 and Stratix10 paths=2E This is architecture-based,
>while the interrupt layout is a hardware property described by DT
>compatible strings=2E
>
>Select the SDMMC IRQ layout via of_device_is_compatible() checks
>for altr,socfpga-s10-sdmmc-ecc in both altr_portb_setup() and
>altr_edac_a10_device_add()=2E
>
>This keeps the existing behavior for both SoCs while making the
>selection mechanism hardware-descriptive=2E
>
>Signed-off-by: AZ9tumas <rounakdas2025@gmail=2Ecom>

Please use your legal name to sign off on patches=2E

Thx=2E

--=20
Small device=2E Typos and formatting crap
