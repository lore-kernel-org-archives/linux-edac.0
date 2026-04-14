Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA39E2C11DF;
	Tue, 14 Apr 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776201520; cv=none; b=EGHYweNnsi/j9kd55muknJc7x3DicI6MmcVnFw0FioXwjjGV3HsVf6kOPMHf17zliUHoXRj4DGxe8fQFwHNuNuS6PSA9MFX+96k9f3ch5bBDI3EHFdcKfKS5fZJVe8VcFs1FtZqkipDuzvCRLqKLW3om2nO47zo7+gPIPOdkQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776201520; c=relaxed/simple;
	bh=MrSCqQcS1rqti7UC5e2y+o9SQB54ybA9P4CtK26eD/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGzsjnB3mfgAovj3TRA9QuAmgnxC4scc+X7yRzfr2NCL8LHymr/ME0gesJbrdj6ELX5FMKiD7jP+LuivcZUidVdaGuwg1mtA4COmMLe0GkW23ZcPuPwBQ40rZ0YRuAZb9kG8LOPPqHLC69QfW7qvV/fNWUPw0Fz6XWJ+80ue0qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fbgp3ye+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fbgp3ye+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8EF2B40E00B9;
	Tue, 14 Apr 2026 21:18:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gd2JhmLmPUIF; Tue, 14 Apr 2026 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776201502; bh=JLdD9CrvjqzX9bD8MQSpQ2hJvIJLl57QBA5S8J9RIUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbgp3ye+SDDdagLh8D1NiwFNB1x5d3sqvmgNHKdXUL1oo76lYxRPUXKPZpfM2uotj
	 TDvyny7BfQhbyAtvT0BCBE8SS0c9LG1BRVrfSDw13AwHTazVmDD1Th+VxgL2e7iqax
	 nt+aW/S3pqRwhyHD2zqu5Xg8LktUWlLMSEc27TRQDm+7cpSQv/GB3qsHgRAQM8zuga
	 Hxc3Ln0ELzXhl17ch0oA/qUUkUiZXwxAHE4x0xHiom+gS7nC8zsuUas2CHIo9N71TB
	 zb0bfxDX3I8DdxZUXvnlY/1W1uobZ1kl2tBZjo11IWF/8nD3tvrn487UgUhLutW7xX
	 1MEdebDGH2RGsxDmmV/BM9htEcZEDT09Xn35a+MN7q69y37WiJBrSJosRPJIh9qIC5
	 a8G4G7yuuRmmPqqfysNnZ7Lr/sVx0RwdYagUBddt2bZ/o4Pdw0CxCaKosCCuj2IoWY
	 yI9izPyhmvbeX4PdoRbkUq2ivLa/FlhwEypeqk1zG9smYj/yvpPHDVR/SA1SFekB72
	 3TSMExCgJjVCs9ee01RFSW1uqipZBFFEK8ugz6H0UZ/CMeIWJH1hUYYwxm/2ygJ0Ja
	 hZH9zcVJ0///vvvCQFZ7bdFQtUr30TfRDmuMJR7CPlSTsV6H2fzZUVT4HKACtrhVVb
	 SZ6t/PccTeiV2qoDQcw+2D2s=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 59E2F40E00B8;
	Tue, 14 Apr 2026 21:18:09 +0000 (UTC)
Date: Tue, 14 Apr 2026 23:18:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>,
	"Luck, Tony" <tony.luck@intel.com>,
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
Message-ID: <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
References: <aYobX83_0kElO3NZ@agluck-desk3>
 <20260210150117.GBaYtIPfsP0Txw7iIc@fat_crate.local>
 <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>

On Tue, Apr 07, 2026 at 03:04:04PM +0000, Zhuo, Qiuxu wrote:
> I injected a correctable error with the CMCI interrupt enabled on an Intel testing machine, 
> and this mce_early_notifier() was invoked.  But the following code in mce_notify_irq() is now
> never executed, and I didn't see the error log message "Machine check events logged".

You did disable the CEC, right?

In any case, let's have a look:

When we log an MCE, we do:

mce_log			# add it to the genpool and run the works
 -> mce_irq_work
  -> mce_schedule_work
   -> ..
    -> mce_gen_pool_process 	# this'll send it down the notifier chain
     -> x86_mce_decoder_chain
      -> mce_early_notifier 	# that guy sees it here and issues the trace record

Now, mce_notify_irq() would do mce_work_trigger() and issue the printk
- dunno, I guess we still want our printk and probably should add it back
- but the first one - the work triggering - that's mcelog. It is using that
usermode helper gunk, dunno if you guys still need it.

Because mcelog does register to the decoder chain so it'll get to see the MCE
eventually. So that part is fine.

The only question is the usermode helper gunk...

Tony?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
