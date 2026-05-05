Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB0C239E9A;
	Tue,  5 May 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972160; cv=none; b=obPo4XchDNoGCP2cLTdwnEqoumD9bp6h8PtFtBZz+B0b+gTxcAgba/t8Kuh4ignMmpw7GmlgvkaJsXNvCoNxVu7SNMrMS2yKjLo/dJ0CBn2dUwyMCW0yPRvi4ufy4AChRf9vC47XcAp768s/4pOm7U/5vASKOOWbMdgo5+HkMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972160; c=relaxed/simple;
	bh=C0bdwBSAR6p3ueWKifFA2dtLf1KddQyiBbH5mGX+Uk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQjmjqXv2hUMMyuBP6Cg0h8o2YBKLT1OvZA8zdWOFYBM+zt62UYx5F6h3wU6trcU8VhriHRIcXqN8P0h5EjVMny9TXCSK92nHmFNdoh4CBpV9o3v0Nri+XsHC7LWKTy/B0+vNvhfdH1Wsqj6L69KpYOYrESm6ovJtY184JCiQkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OLHcTfsj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OLHcTfsj"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CDDE740E014B;
	Tue,  5 May 2026 09:09:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jxqGxWRnYM0c; Tue,  5 May 2026 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1777972144; bh=6heRNOLcc75PQAgTGMtZQ9v23ltulrA5PMWow6h+mMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLHcTfsjJEmKS8ZlWesustfQnRkW3vgYeFbgyTLL7ed1AbqVDGVC2E/e47uDKMv/b
	 kSnXHzi5f3xZLkYbbsx8C1XWyca2TPHPFCv2I6RHu7R7Z5UFxmsnT7fCCh4+eytpOn
	 y2utvJZXnkbCtNhxi/L2aZMvUX14vsxr2mCka5doyd6dhGbx0KwZNtfk06gY57+/D7
	 QV9Z52kFWwmfQzlowzbEPiIkm1mNmRpclBrej9KladKYbVRoDxC2TqH5XnLZOYcIeK
	 MSrGmKYLnMaSJ+BOnJANV4Sm0yYMGzBrC0W4uIjDD0qTSGzDm9gYDCln/25FXkmzn7
	 qT1iM3vJRcjI13/G/DtXSjeHkG2xWmPwjKNeldo2o8zctr3H6Q3pFK3yXPIoE1nm8e
	 Kj7B8pGrCekq5D2dRBMj+0KR52co+XcFGnbepnSBH9GkHCM2Iznk2B4LlKVNAKIhZd
	 EXhs4sbI6M0g9dvHbSuuAlUUP0Ct9wYywnXVVfLQWA7WnRQ+9pqMjGsZNBpX/reKQR
	 M/nqgH6/2BWF8qssN6tNjEi6UckMKjNbOCSmXYXdwUD6LMSWeikDdPTRodr5uVxeJz
	 7taV64Tbw+EuLWRey8z9mHPnCLffM67vjFyw8yvs2L0EZK+9S7IilQ7Gt1NrcfgGbN
	 C1nobEKHY8vLu9w0mnle4VZY=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id DAB8F40E0032;
	Tue,  5 May 2026 09:08:57 +0000 (UTC)
Date: Tue, 5 May 2026 11:08:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: ssengar@linux.microsoft.com, shubhrajyoti.datta@amd.com,
	tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] EDAC/versalnet: Fix teardown ordering in
 mc_remove()
Message-ID: <20260505090850.GBafmzopzW5vUM8a8Y@fat_crate.local>
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
 <20260403103457.GAac-X0SzsO9MtwAVE@fat_crate.local>
 <b6af31b0-0429-4092-8ec0-e0ab84a16f39@linux.microsoft.com>
 <20260406082353.GAadNtmUQqtwhw4yZS@fat_crate.local>
 <897f996e-1d43-4817-88af-d980f321d0c6@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <897f996e-1d43-4817-88af-d980f321d0c6@linux.microsoft.com>

On Thu, Apr 09, 2026 at 03:03:29PM +0530, Prasanna Kumar T S M wrote:
> Sashiko review says
> -------------------
> If an MCDI response message arrives after priv->mcdi is freed but before the
> RPMSG endpoint is destroyed, could the still-active rpmsg_cb() pass the
> dangling priv->mcdi pointer to cdx_mcdi_process_cmd(), leading to a
> use-after-free?
> -------------------

Sashiko says:

"If an error message or MCDI response arrives from the remote processor during
this race window, rpmsg_cb() will execute concurrently. When processing an
error, it calls handle_error(), which dereferences the memory controllers
already freed by edac_mc_free() in remove_versalnet()."

IOW, handle_error() does:

	mci = priv->mci[ctl_num];

however, remove_versalnet() has *done* *already*:

        mci = priv->mci[i];
        device_unregister(mci->pdev);
        edac_mc_del_mc(mci->pdev);
        edac_mc_free(mci);

How is that a false positive if you change the teardown sequence to:

  remove_versalnet
  cdx_mcdi_finish
  unregister_rpmsg_driver
  rproc_shutdown
  rproc_put

?

IOW, the proper fix in all this gunk of unwinding sequences is to *prevent*
the hw from sending *any* more messages before you start tearing down things.

I'd leave that to Shubhrajyoti to figure out how to do properly.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
