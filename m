Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950DE277C96;
	Sun, 19 Jul 2026 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784478493; cv=none; b=cYovDXhqUZss8onHR8cT70Zj2z+QPVpVlWzXTNhqFjKmdl7q+fLC7oKyH07QJYFRC4dlloctHOl+0KDSYPP4j9Qob3bjt5SQkllgK31YAYm6CmiEACVVUJ/eWaAKjmop2CXYwVj1tv0kPh0tp0Av04FVo7gT1ZmI53GQ0w1MRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784478493; c=relaxed/simple;
	bh=JpnT8XJ88gwNmRa+be1SpaZwz6CtFhqsGTd20634HcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRE/GE9JS0Xs6oIFo/l1PGwJnkUFAj2Dt8H6YGHUufOwxSgLzLHkxOWHgYtyrLo0uZ59oE5YHZyKLENYSjYwaL6w6ZXOU/Xhm/UQ/xAK0tUt42/eE6cVbcQbMG5ykPbg1Q62XMiRRf3dLJ9MJYe7sfw6EhylhHVIMH63q07j8Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lLogkn20; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lLogkn20"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0D61840E00DC;
	Sun, 19 Jul 2026 16:28:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4T2U3_ebaVXK; Sun, 19 Jul 2026 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784478477; bh=Hx9MZWuvrI8H6YwL6rjDpa4a5eWn7GFznv0yhkfDzbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLogkn20oLMyh1aaezy+6dP+PKZ5SJiX/8CBwDovsCFQTgC5beOJ2V/jI4eOq2QaL
	 73stYz/cXCXIoxotGLlU0OkYwkaSvsHpUq2mn8CB7uScKAwA+ufX6Ju+sw4hMtHuRQ
	 G/lgDBRqv00PDWKpLtUZxMjWwxMK1UKD7pEOD9wtsQJQI9HRplezYfxyiCmzUKLBBr
	 Xadpid++tDCFb+pHqkFvbqL2mz9iUHV1Mnzn9LDX+YiYq8qVFqAnRdPbeNppg2kUne
	 U5DvhetgJCwmQhmmlIkent1Y4Xx9GSo0UnNSISmgIooeQL2rKZm0f50HOoD0XNi10x
	 SWH/DPHzZk4FbQ1sYHf3ZHevjvFcnJ2K97uCN0eDAYffZUquKjBxxy9laaSWAfu/AX
	 ZK5mQ6jQBAec+ShLG3DK5eGxo+awpLDyrB+om1QVDaYlDioFTH4elYjU86mPaT4IyV
	 DRxbb60fF1wlfv+LHHU8JxufFiCHCtglxGdBzsOxETmfM+RwZ3S9Q40Dg4pliKJLs8
	 5OY+9Hx5JtyDyTP9d2+ucRzo/zPwQuKhQcWaRiy0lr+2keZipWxPbxsZrBX2WpU2yv
	 nRf0I7F1IPkGAJZtN+mO7Jr4SiPqyNgQJj+InuiuzIqyFmtS43HcDJW7o6jdjEo8Xm
	 PPhfcNm7LM2/4ZbWTAYEy9JM=
Received: from stx.tnic (unknown [12.110.208.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C470740E00E6;
	Sun, 19 Jul 2026 16:27:43 +0000 (UTC)
Date: Sun, 19 Jul 2026 09:27:26 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rama devi Veggalam <rama.devi.veggalam@amd.com>
Cc: tony.luck@intel.com, michal.simek@amd.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org, james.morse@arm.com, mchehab@kernel.org,
	rric@kernel.org, git@amd.com
Subject: Re: [PATCH v3 0/4] Add support for Versal Xilsem edac
Message-ID: <20260719162726.GAalz67qebFiJ6E5rh@fat_crate.local>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>

On Thu, Jun 25, 2026 at 02:55:41AM +0530, Rama devi Veggalam wrote:
> Add sysfs interface for Xilsem scan operations initialize, start,
> stop scan, error inject, read ECC, status and configuration values.
> Handle correctable and uncorrectable xilsem error events.

A lot of issues caught by Sashiko:

https://sashiko.dev/#/patchset/20260624212545.2850787-1-rama.devi.veggalam%40amd.com

they need to be addressed first, before adding anything new.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
