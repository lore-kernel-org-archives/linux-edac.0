Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0785279DB7;
	Tue, 17 Mar 2026 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754401; cv=none; b=GEn4M3MEKLbcwSCpdOHnR+2DrlRjAWBdx/vuzEhYc758tl/UscwI13zmEUaun9V9/XjLwSoVIZCA1mFWvTWaHPbjG6IoDKtBQ03K5f+hE92F0Sr0HEoBdC+hKO7mfTZ/iOH1HZTMgHafteBc1znG2rshBPBg1drplFsfZc5qwQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754401; c=relaxed/simple;
	bh=tlDAsscSmSE9U6LfZNHYajFHZpEbXkH3J/cOaMTQpoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsKqyScoPwTLxfTyF/py8hRdb4skwqExxHv1+54hbAQmqWYDI9O9LuA4YQAsV5BF7PdMx3gY+pUi1mDql+yH1oeOEwSMUlTDOSS8FZIW58S0RP6c542xOAoRYTgifW9ChbXGQqE6Tmj/me90Gg6CGFYv8uk+WZD0Y4sWEfXDiHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=joTnUw5a reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="joTnUw5a"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1663A40E0163;
	Tue, 17 Mar 2026 13:33:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QWWfu13U0m6z; Tue, 17 Mar 2026 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773754389; bh=IpSphifIZivkohbwhUfSbWbfCZL24Ai9npHlnZctMlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joTnUw5aVrJKHtwhaViFAK8ULtXPj/2+y4xJCLs/8HIOLpJ1AJKiYx2yZAj6cJGmk
	 O/3EnKE/XFVV01xeLuSrgs3Pe6lyCXD1kgviaxtlYgQ8dD0FmZqYdpyDGQ0rfvMAnf
	 gWv4larBdQq09rKL4cJy83EJyAAQriCGouNWB8A+5sZb+yx1OJPiX1WJ0KJItzZvh2
	 oqIuX5KYnswK/fDU4TK2Amkk178pegKFW1fwKAYrkQ2AOTqlo6j1BIIdm1546GbCk3
	 UkQcUWYV7qzK1KoGc5WStGCNH3qZLinpM4nuVB1LBUSN7t7F6sVmr9sW5u4OKsUFpu
	 iySpsOM6qa92sC8I/X+alB8dPya3UMxDXqY+YVawpnEJwiCBMLnWgRhNhdx3/vNRBF
	 oU07q9EUY7plecuX/rfclgkLuk+1WDFtrjv+DpmxUZwNooNdpZKhX0pdyJtizQdzXM
	 X5kcAa5sLTfI6K3gLIoNAqo54R+fGyOndJz+Qelulxe3GOJzvZVHjn0I18uxxZyDmB
	 t38OmFdemBamrVBkbnj0HTsSkbzH0q5lfS0KKzS4ALqU9FYBQUFoAiboh0CLqyXJdk
	 bpBUD8jBVidULdKi9REsT7FM4rUGtvZI49CpCX6pws/otzBOvb+3yp8DXlBiCReysi
	 sKS8Xhd8FldgEJtbkiTfMLQo=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id A25CE40E01B5;
	Tue, 17 Mar 2026 13:32:57 +0000 (UTC)
Date: Tue, 17 Mar 2026 14:32:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?Q?=E2=80=9CWilliam?= Roche <william.roche@oracle.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v3 1/1] x86/mce/amd: Guard SMCA DESTAT access on non-SMCA
 machines
Message-ID: <20260317133247.GAablX_1ECCF-CKgjJ@fat_crate.local>
References: <20260317103810.2492661-1-william.roche@oracle.com>
 <20260317103810.2492661-2-william.roche@oracle.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317103810.2492661-2-william.roche@oracle.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 10:38:10AM +0000, =E2=80=9CWilliam Roche wrote:
> From: William Roche <william.roche@oracle.com>
>=20
> Access to SMCA specific registers like MCA_DESTAT should only be done
> after having checked the smca bit. Avoiding a non-SMCA machine (like
> AMD QEMU/KVM VMs) crash during deferred error handling.

Not good enough. I rewrote it to:

Author: William Roche <william.roche@oracle.com>
Date:   Tue Mar 17 10:38:10 2026 +0000
=20
    x86/mce/amd: Check SMCA feature bit before accessing SMCA MSRs
   =20
    People do effort to inject MCEs into guests in order to simulate/test=
 handling
    of real hardware errors. These efforts are of a questionable nature b=
ecause,
    for one, a guest cannot really make any assumptions about the underly=
ing
    machine and especially which MSR accesses the hypervisor filters and
    which it doesn't. See Link tag for the whole background.
   =20
    However, regardless of virtualization or not, access to SMCA-specific
    registers like MCA_DESTAT should only be done after having checked th=
e smca
    feature bit. And there are AMD machines like Bulldozer (the one befor=
e Zen1)
    which do support deferred errors but are not SMCA machines.
   =20
    Therefore, properly check the feature bit before accessing related MS=
Rs.
   =20
      [ bp: Rewrite commit message. ]
   =20
    Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling=
")
    Signed-off-by: William Roche <william.roche@oracle.com>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
    Cc: stable@vger.kernel.org
    Link: https://lore.kernel.org/r/20260218163025.1316501-1-william.roch=
e@oracle.com


--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
