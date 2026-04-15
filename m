Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63CC3624C5;
	Wed, 15 Apr 2026 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776281275; cv=none; b=XhMNSf78uqYRCgmeTHRXVMqjD0EDKwdQRqfdszbrrm7bcggNPVohI4JzcsEhgWLfR4vz5xmSn8eCl2u+W4W5z9TdGCoIWMaPSx/nekYoA3cTTbjHjDPN92GlUQ1KUuC6Vt8H9Fr+ifFgbgqtO5t8lO2C0PDhJdUZNOO+eB67aLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776281275; c=relaxed/simple;
	bh=104CJ5dsafkFIRy903AwqHCkqU7oqhOhdgkDtVnxqBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Evm9D7xocuw7xiPAy/NIeHRr5iQeaw7gA4pqJ29FyeAGvCWvV8QqMYjvqF1slNoFk69nM5woaN2VcvrrfmXYADlx7dqSw7gUe5DmwQ1htbU4Dq1euFMQLTXBFcxZTeW2F97csy9CkLRL/Vxi6rYRyLA89gaIeb1BfZZWnfQTB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NX0na9BK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NX0na9BK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 604BC40E00C0;
	Wed, 15 Apr 2026 19:27:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id q2HJkFH7rLBm; Wed, 15 Apr 2026 19:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776281264; bh=zjKnDRnHPevKfk6Wia4FH+ZxrV2pUI+iWZa5XH7K7ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NX0na9BK56ecWpDMCNsx4e41PsJOKigCCS8fd47VtMz4viRzOWNxNKIs7Fjom5GJD
	 asYTSf5A/upUgQ00sATclPzIgIiaNK4JkiyX+szaqzPnb2qjBhZi3nL0XxLfO86Dym
	 eHRxusYXyiL+ozDz0iJ1G1s6aMLaMTiKzWpc3au91y2Ptk7mdkC8y9kFnYQDYMc2OL
	 hAlRbaS8a0Bi6J0Vfpp2iIz6jcGjj7nbczRpKFfUjOuEIrXacQeFSJr4G7WK3fSOIF
	 /iojIsJkN+1bpol/QnnoGoklzVmn1mUrGG+4FNNd99lyLTfX6fZjTH4LOReVf96amP
	 AXqnF0WOR5lxLKoxaTwHwKJsPoiP8+j3wd6V0tS3jquKf+NEx4Z1KaN4R+pgwUgno9
	 FI1CEcQkqMuvZlri3yLUUCovASnd0wUaxWixe/cefCSX5POgUyyvLMBxuMCfwqUGmB
	 WE2fGyfsGSq1CnvyG7bPG7aDdM3d4Q6SedWIN15tKf/yokXbEPIpOBknqT/LBgXRc6
	 8ooUfe66avMpk3HtQWEh75VQmgJ6RQ2C9mvAZ561X5v9/t6klvsx+1kYtxGoBvTIHx
	 M4Q0aqqci1FcnARG1afvLw1LZf9QZvijzkBVzFTdPs2koq2E/0AN6d/vYG/MAVRSJ1
	 aVeK8Y/7gD1NQ3QNHGlm8TuQ=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 5269E40E0032;
	Wed, 15 Apr 2026 19:27:31 +0000 (UTC)
Date: Wed, 15 Apr 2026 21:27:23 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
	"Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: Re: [PATCH] x86/mce: Restore MCA polling interval halving
Message-ID: <20260415192723.GAad_mm7YFTi7ypK5I@fat_crate.local>
References: <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
 <ad6-H5eihazhqsmC@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad6-H5eihazhqsmC@agluck-desk3>

On Tue, Apr 14, 2026 at 03:22:23PM -0700, Luck, Tony wrote:
> Ran my own test. RAS_CEC disabled. Booted with mce=no_cmci injected a
> corrected error every twenty seconds. Added pr_info() to mce_timer_fn()
> to say which CPUs were doubling or halving interval.

Right, we still need some sort of a feedback that we've logged an error.

> Results:
> 
> I did see some "Machine check events logged" console messages.

Right, mce_timer_fn().

Not sure that is the right place tho. We want to issue that printk the moment
we log an MCE, perhaps in the early notifier or so, where mce_notify_irq()
was.

> The debug messages are "interesting". Polling timers on CPUs aren't
> synchronized, so I got random bursts of debug messages where some
> CPUs found an error and halved their interval, while others didn't
> see an error and doubled their interval. The machine check banks for
> memory corrected errors are socket scoped, so when an error is logged
> whichever CPU on the socket polls next will find the error.
> 
> Both mcelog and EDAC were invoked on the mce decode chain and logged
> errors OK.
> 
> When I stopped injecting, all the CPUs doubled back up to maximum
> polling interval.
> 
> Summary: This is working as well as can be expected given the shared
> scope of the machine check banks. If Linux were to understand the
> scope of machine check banks it might designate a single CPU in
> that scope to do the polling. But Intel doesn't make it easy to derive
> the scope. In any case, the common case is CMCI enabled.

Thanks for the testing - much appreciated.

One aspect remained unanswered: 

mce_notify_irq -> mce_work_trigger -> schedule_work(&mce_trigger_work); ->
mce_do_trigger -> 

	call_usermodehelper(mce_helper, mce_helper_argv, NULL, UMH_NO_WAIT);

Is that thing still used?

If so, what is the use case? Is per-chance that mce_helper the userspace
mcelog tool which the kernel calls here on a MCE?

Or?

Do we need that still?

If not, ripping that out would be a nice, additional simplification.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
