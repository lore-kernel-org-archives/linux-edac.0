Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8423CCA1F;
	Fri, 13 Mar 2026 20:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773432652; cv=none; b=gikQGHQYxOca+O7Ds7+XW76dxwE1b13roC4PLxIcrDCCYUMPWQYEfCYw/69FdAFhhySmrVNyCsg7l1kqbkhCPAnU6i2luhWRnbyEHuu7lhYiotU74Nk/HdNQvPEi07WIfY4lSVicqJI57e7/HdXgDtMcU8ArO01gndfmoQfzsvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773432652; c=relaxed/simple;
	bh=8jwcS2OZhLvXzbbH6/U2BbvV07YlFD2VhAl2jCz+5rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImPsp/gAQrOJzRVk/PbmFeyElRhx4Ww/T28wl+2WIwaPswvY5JAJ+LFAFzoYGTC9w9RZVt9Gnuj5yyrIWj7vBK5bh8XehEqIms4WUxY+fHhW0EfoYbfD4kW7Ej2wapS8K+al314JzwsKlQQb397PTuk/YbmNruVcRa65CSnJwNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=dbGvtDGi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="dbGvtDGi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8B57440E01AC;
	Fri, 13 Mar 2026 20:10:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id W7S6TY-iQB1G; Fri, 13 Mar 2026 20:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773432645; bh=e14kwMaPfPJlv+hgw264hzFHeo2atH8/ei7ECNWZs14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbGvtDGiizlEvKYj6trlP6uSSTV6x1bFNwXji6+ARJdyVv/kGFbgxPiEXxy88+pCm
	 714xRWnZPtzNR1yxBSfSH+8C19a2omMfshZtdQiqmw3P1PvF6SWoDsmEBe9Jq6Arny
	 C2/HulHz6x84+Gxo/kGYBI0e1DCITycZLpB7SMCYt74xmZ0F4qVXwGvAzzPWKlsOYD
	 2QQA0F39z7tbG4Rdx8ex+Ixw4AGQILnis06J3zr58XS3xk3M0RmqiuVPai/jC3L58P
	 9UAZWYncRHUeNfu6xw4HDXDgn1toYTkTQtKyco5UjZQaqh+rI8ZTNQozNMkkuoyFx/
	 30wEM0+UfBD2xjrhT5yXfM04uDZHGh000NiIt62foJDPd3aU2tJU41ztKluV20WOeP
	 9UgwzhqhSI3FRtwiH0xu5YOzkZnsosyPDwgoHdqSiAtSMUqVsbNeVkkVi9jo7jMjZd
	 h0c3m3BIYwda+bABO1+KsY7aPwCy+0fGTyjKufTM5vqP2IK/YQTp1jAkm0lidhJCHK
	 YR4TbR6nzU63rCK8nH9frf5uzIWm9RWWpvTgk4NypDJkkRXjqlnCI/qXI9zqJtQ050
	 5zUpJpMCAv72tBeic/t/cdgLy6qDV0t0p/Hnwz4DUy05w0k/B2ej3UueVCo5E5bRoC
	 43Yc4ySN+goIME4MWxolPS/E=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 250EA40E0140;
	Fri, 13 Mar 2026 20:10:33 +0000 (UTC)
Date: Fri, 13 Mar 2026 21:10:27 +0100
From: Borislav Petkov <bp@alien8.de>
To: William Roche <william.roche@oracle.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v2 1/1] x86/mce/amd: Fix VM crash during deferred error
 handling
Message-ID: <20260313201027.GHabRvM1wcctKe2Kut@fat_crate.local>
References: <20260218163025.1316501-1-william.roche@oracle.com>
 <20260218163025.1316501-2-william.roche@oracle.com>
 <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
 <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>
 <20260312160453.GDabLkJfhslCLXZntv@fat_crate.local>
 <ff7008cd-db47-4a0a-a74f-dcf3e6ab1891@oracle.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff7008cd-db47-4a0a-a74f-dcf3e6ab1891@oracle.com>

On Thu, Mar 12, 2026 at 11:44:04PM +0100, William Roche wrote:
> Yazen, could you also please tell us if an existing non-SMCA AMD hardware
> could crash on updating an SMCA register ?

So, the situation is this: if software needs to access a MCA_DESTATUS MSR
- which is part of AMD's MCA extensions - then software needs to check the
 smca bit.

So your patch is correct. The justification about it is not.

It should talk about how software should touch that MSR *only* *after* having
checked mce_flags.smca.

Because, it doesn't matter what KVM does or whoever - we all adhere to the hw
spec.

Because technically speaking, this code should blow up on non-SMCA machines
too because they do support deferred errors (Bulldozer for example) but they
will #GP on access to the MCA_DESTATUS MSRs as those are reserved there.

So please rewrite your commit message to state that. And then you can talk
about what the real-life situation is which caught this.

As to your use case - thanks for explaining it. If this is something which
people run, then it would be wonderful if we had a simple test script in the
kernel which verifies new changes don't break it and so that we can run it
periodically as part of testing.

HTH.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
