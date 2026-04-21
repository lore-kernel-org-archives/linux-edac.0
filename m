Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ACF279334;
	Tue, 21 Apr 2026 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773158; cv=none; b=VtsUu8TzDLPeYpmYIvjSTZFXSYI0BVwf8jvilJp8xwbmXT0cyFOT7qu6q6Gqj4/oAGTv69+7xLJb3Sluvr+EvzjOIRNoa5wDT55BKLo3Yty+5s8H3DG2IRFB8KXiBL+mq8VB/gqGKg3pX8buMYkfMRMlh9LpnRAbtNaONIHH99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773158; c=relaxed/simple;
	bh=GpkZS1NVd9+P4UXIJFc+V0DDJYWKrAxBbg7B9WEyH54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQj5tve6dO3pkaNoXcbbXRbp8qyd/sQDwl/MW6zNX0UveUL0mnqyRTKpCtBsMlEnF42vIXkMW2ON0/0UWoJdy52OQNdkHtaFXXuWz7FziTckHLkTJd6nXskMl+IQE6TERUZbGuJV8iw9w7UymN22HbuxkHorVh5ZeGyIhIk1WKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ColPS+OI reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ColPS+OI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3A76C40E00C2;
	Tue, 21 Apr 2026 12:05:45 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GkboiVDN_WMO; Tue, 21 Apr 2026 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776773135; bh=8y7Y88SHke5SVq3V1Aa9JkKle0BTlOwbAX8buOM5Xlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ColPS+OIr7528i7EmFBsN2ZWrorZWG49Jm95t5nVIB2Pmh1lcKMfcrMSlG/EGTSB2
	 r+ml2jEbiVPJG6NjDKGoGMO+AoTyNW6YG3cmOVCkK/1xmvBt+8jkgW4yb7VALsH1ba
	 XhHyZ3g7+O+AJRUftxXn2pJ8TN4odLMr/8vYysqHrL/vSUDaR9CBTzpV7ruCmw3bs7
	 lr4BQG5mJFyfpfuYxtCutSSv0gkxw3CfpTFt0zh+hlfWHt3PIc3CLiAXHr/lf0IXq/
	 LmCBiZMrqsc4A/vhBri22Y0hKiI/EaIHD8HjeMELi2hxuQ6d07t2yiKjKSoZsJXyUZ
	 7JROU8lUJk7GMjxCHy+yaEoIkKWAln0DiTXXqQXsoVn3axuyYuAOsAJbwxSvETm7w6
	 6EqPwKUJlfSR/BbJF+WEsXZq8cRELQ1T/RdIZJh1XMUQevNogIl3gXBatxK5azD4WL
	 rESOdb0Q/zUXF8EIp34Z/iVdnNG3o6Nq4iimObf313cSjuQyb+pdsbXI0xozGnGRM5
	 GqyJtgVbe7tGWfZbrLG0krtVf3L04DOXFgeBDgdboUyStY604806/5jxeo+XlFrYwJ
	 fDVjdRSGoK6e2qX0sSj8P51quMPiXjZH8pjS3S/+W/hRY5OwoXSbAdwtET5FDX/rwX
	 HAkCqS8Gh5GRIXGEDMJWJnOY=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id EA89640E00DC;
	Tue, 21 Apr 2026 12:05:21 +0000 (UTC)
Date: Tue, 21 Apr 2026 14:05:16 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	"Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: Re: [PATCH] x86/mce: Restore MCA polling interval halving
Message-ID: <20260421120516.GDaedn_OTOE2Agrl59@fat_crate.local>
References: <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
 <ad6-H5eihazhqsmC@agluck-desk3>
 <20260415192723.GAad_mm7YFTi7ypK5I@fat_crate.local>
 <SJ1PR11MB6083E24844911D87A89BCBA0FC222@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260415200203.GBad_uu1gC_V_LFH0u@fat_crate.local>
 <20260417115001.GCaeIeaU8eS_EMNq6G@fat_crate.local>
 <CY8PR11MB71343373617F535A8EC5A2C0892F2@CY8PR11MB7134.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY8PR11MB71343373617F535A8EC5A2C0892F2@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Qiuxu,

On Mon, Apr 20, 2026 at 02:14:52PM +0000, Zhuo, Qiuxu wrote:
> 1. Test precondition:
>      - Added debug messages [1] on top of Boris' patch.
>      - RAS_CEC was disabled.
>      - A correctable error was injected every 10 seconds.
>=20
> 2. Tested with CMCI interrupts enabled:
>    - The message "Machine check events logged" was printed each time a =
correctable error was injected.
>    - EDAC and mcelog in the decode chain were notified as expected.
>=20
>     So, this part tested OK.
>=20
> 3. Tested in polling mode (boot with "mce=3Dno_cmci"):
>    - A CPU=E2=80=99s timer interval was halved after calling mce_log(),=
 or when !mce_gen_pool_empty() was true during polling [2].
>    - A CPU=E2=80=99s timer interval was doubled when mce_gen_pool_empty=
() was true during polling [2].
>=20
>     This part tested OK, but please see comments below about mce_gen_po=
ol_empty() check in mce_timer_fn().

Thanks for testing.

> mce_timer_fn()
>   machine_check_poll()
>         mce_log()
>           irq_work_queue(&mce_irq_work)
>             ...
>               mce_irq_work_cb()
>                 mce_schedule_work()
>                   schedule_work(&mce_work)
>                     ...
>                       mce_gen_pool_process() // [3] worker thread concu=
rrently running on any CPU handles MCE logs.
>=20
>   mce_gen_pool_empty() // [4]
>=20
> It seems there is a race between [3] and [4].
> Although my testing did not observe this race, it's possible=20
> that mce_timer_fn() (in softirq) completes fast=20
> enough that it always finishes before [1] (in worker thread) is schedul=
ed to run.

Does this and the next message in the thread explain the situation?

https://lore.kernel.org/r/20260207115142.GBaYcnTp7maUDVv3Nc@fat_crate.loc=
al

Bottom line: I don't think this was ever meant to be anything but a rough=
 and
simple method to catch too many errors being logged and halve the polling
interval.

IOW, even if the above race happens, in the abundance of too many errors,=
 it
would pick up and start halving eventually.

Right?

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
