Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486723;
	b=NXZ/rcL6IpQIdHnllq8JF25zuEWgvSO6u9SucS/Bu2Yx/TUyjF+QGcYTA9iXNclmmqIU
	 st6+YWdw2/ebRwPbx+i2LIAX7SUrPsB8qNyfnza2dUwc3dPFaMTb2oUYUSLJIz0YAdeKM
	 4DsapRZTFKH5tCRsbNCVKgu2NGyuwYPC6HuE5U8t3+lHPYqTKSCMstR1HBK1SLwjorHGc
	 8LRRGsX5CMtV9uo/re+QukkWx1eCx6lQHu1wqtM7cxfBcIkDcvjziSP0hXo9yX2WEtg8E
	 yQnnZ7SMlUNp51PUpqyLpbn4OLA4NPYQ1NbTgZk1c15u+9SlDu5wsZvd7Yss8I8FuvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486723;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7GQt9xtPL9z9GDoDCIL36a20sRC9UdEBG+d8LmlkjlI=;
	b=zBct5fVaK9Q2OvU0/GDQb46RwM+wAjhJHKnoecczE6RDFlJoyzFq2u9ytVVFVC3nXjsU
	 OH+vdSBi6YKpiih8dsmlJwfpYCuHEwdpbSQE9otzfLCu65pOrloUHKQW7rjBz9wCZsw9K
	 OBd9aIEZxRd07am2rbNgebIpd4275AluRvamqeSZx4Q7OGbBPRZBv7D0/73q/H2C1Tusa
	 zvOIPW7CvtCnZKLca4ItuYfXT8g5RTa/3qlyp3XZott1PsBTIq2noqH3X4B1S4BUiIQv9
	 KCJwdqmZDyB0Y7pwGCrsQHuDjiMXDPQC95UlFvwcfbNeOj/wmVC5O1vuHzdXICdObyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=SbxvQgzI;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A17606A31E;
	Tue, 24 Nov 2026 02:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=SbxvQgzI
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C54A940E02B4;
	Tue, 24 Nov 2026 02:18:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1yOXpp3EnhoH; Tue, 24 Nov 2026 02:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795486717; bh=7GQt9xtPL9z9GDoDCIL36a20sRC9UdEBG+d8LmlkjlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbxvQgzIT3j5r+tgIuNkLkHZuHuhIVxHE6DSMNqHItoriyZS598P5KnvanVhS08aH
	 At1RaJxyap+7l1/qAhbB36ODm4MXlZNdtl69+pOJpXH/IZM1fiDBwmmxqYXe54JRzD
	 kvN91IFUEjLEUZi5B2N12T85Y/dKoIRJTRe6mRcVhgSCSbCzULIXJ0cMqqguHazfGQ
	 IW2bMZJ/25HdDj/tU47blcrm0Ou7Pi2OIlG/gBivNiDgyWJ81jXP9qp3LBqrlF3dVK
	 KcNevaVE+znEJn6FQ80gMJq6k8vJCaNM0cWDLSVm95jHNzGssMcJn8rgZMUVqcGPx8
	 GQ8z6uK7pV20C5T1itgyMHxTSN9Mkdrd2fTZOf5mHIOfUqzAFgRC0Lq7xrSe6hah1g
	 g6CD3HIvmdLv8JiJrjG39DYo2biiIoWdrvALKX9VWplGkyQCU8YS6ln+C4BRnpOp1J
	 WuhUqpZMPK/qoG/9H/PqJ309Na1gppjtJKEOG5QHgCT8NvO0qvwP/Sd2TO1kn0RLh2
	 O3DftPAbaFmfW6kD0JXGRGK66yt6JiXjwRooIkefojROngTb/PnL8xS/sVUe6CFIKZ
	 9NUbGTxX0rs+H3mp7A0gsQHxOtqSzkR9pZ0lsji2RHwna+7lk6NS2WaMJm1O+nEjDm
	 Pc58yGlfxGCxQkH32PZNC6C8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 52CF540E02A9;
	Tue, 24 Nov 2026 02:18:24 +0000 (UTC)
Date: Mon, 23 Nov 2026 18:18:20 -0800
From: Borislav Petkov <bp@alien8.de>
To: Dexuan Cui <decui@microsoft.com>
Cc: tony.luck@intel.com, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	kameroncarr@microsoft.com, Naman Jain <namjain@linux.microsoft.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: [PATCH v2] x86/mce: Report unavailable MCE support at
 informational level
Message-ID: <20261124021820.GDawTz7EeTyDB6SB8G@fat_crate.local>
References: <20261119185811.565606-1-decui@microsoft.com>
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
In-Reply-To: <20261119185811.565606-1-decui@microsoft.com>

On Thu, Nov 19, 2026 at 10:58:11AM -0800, Dexuan Cui wrote:
> mcheck_init_device() reports an error and returns -EIO when
> mce_available() is false. However, MCE support being unavailable does
> not necessarily indicate an initialization failure.
> 
> For example, a TDX guest with TD_CTLS.REDUCE_VE set and
> FEATURE_PARAVIRT_CTLS.MCA clear does not enumerate the MCE and MCA
> CPUID capabilities. This is an expected configuration, but it causes
> the kernel to print:
> 
>   mce: Unable to init MCE device (rc: -5)
> 
> MCE can also be unavailable because it was explicitly disabled with
> mce=off or nomce. When it was disabled due to an earlier initialization
> problem, the relevant path already reports the reason.
> 
> Report MCE unavailability at informational level and return -ENODEV
> directly instead of routing it through the common error path.
> 
> Reviewed-by: Naman Jain <namjain@linux.microsoft.com>
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Dexuan Cui <decui@microsoft.com>
> ---
> 
> Changes since v1:
>     v1: https://lore.kernel.org/all/20260923173033.4104944-1-decui@microsoft.com/
> 
>     Added Reviewed-by's of Naman and Yazen.
>     No other change.
> 
>  arch/x86/kernel/cpu/mce/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 50b1614968be6..ca7b729b74126 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -2815,8 +2815,8 @@ static __init int mcheck_init_device(void)
>  	MAYBE_BUILD_BUG_ON(__VIRTUAL_MASK_SHIFT >= 63);
>  
>  	if (!mce_available(&boot_cpu_data)) {
> -		err = -EIO;
> -		goto err_out;
> +		pr_info("MCE is unavailable\n");
> +		return -ENODEV;

What's the difference between:

	"MCE is unavailable\n"

and

	"Unable to init MCE device (rc: %d)\n", err

?

And changing the routing path breaks the readability in this function.

What's the point of this patch at all?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
