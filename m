Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A943F4129;
	Wed, 13 May 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689891; cv=none; b=VqdUvQ73UtLLAEGqMHsllYY27WZGiyIdmvx79GQHs2uaocS0BB68rVm8rzHYrx9Mj2jqDOHI9kmHo48kL+0kFTxN+cgdvZhCH7nVB0XeC0G/tJIco8fQyb3PubtkcO65wvG90LjIED0C3HlBpJ2r5VfyhObEOzxMDAAd4vMzLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689891; c=relaxed/simple;
	bh=fwq6XqXE5RheTT/QxOlDYYlOskVq91yyFVrsmLMgEyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDRlvKjDcK51f6Sqkwo9fwXtgyPBEsHo8zYcN8ioR43UNEELAsib9MeoPEx7eSl8kppJF2U6VKEnPuiX8SeslCZ1Ki5W+8DGKyDa/ldiW1t74YQ1mKusSMGe2j7vMKimZKmLVcYil6C9Y3deel4WLyViXCjT5X+Lo36MOawacnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjViQ1Bw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjViQ1Bw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778689891; x=1810225891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fwq6XqXE5RheTT/QxOlDYYlOskVq91yyFVrsmLMgEyI=;
  b=PjViQ1BwL9xveD3WsqfsedEYkw9jz8JjjLQ1AdLquZpOZ+Xe3UnSoC/G
   jvIJAKum/nm2IVc693ECYG/Mf6BOjQ5BKYhgGj6d6bzeiRNP/am8DguFa
   jnqgPX4cI/zTeY1/G3gKTv1+qP08PAP0odVuVSv/c9YQRk8Kkm2nKZ5jW
   HyJ3e8Hgb/T/aUghoaMcUUD0UBAD8LKFnQDxCr0SGfKYpj8H8jIoHD5bK
   8IRv0cYzcxitbFmo+67c08U5wiVOQyzmo33rmlN5ca70g9dzCaoewxGFz
   cN0/BvtfFJ/qfEcnuZCirr1Tb8crWsVC9U4w7mQMO/YYtak0vHq1qpbHr
   A==;
X-CSE-ConnectionGUID: WIVwJ8paRk2IbbH6s2vgTw==
X-CSE-MsgGUID: 9ycMKBtyQAyxbYVN8qcusA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90198968"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="90198968"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:31:30 -0700
X-CSE-ConnectionGUID: k1Z44gBsQ6K53WoLc0C6VQ==
X-CSE-MsgGUID: a4Aep1PsT9WE1jb6iFv3DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233683161"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:31:28 -0700
Date: Wed, 13 May 2026 19:31:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v1 1/1] RAS/AMD/ATL: Drop malformed default N from Kconfig
Message-ID: <agSnXBBS_ur1YEYQ@ashevche-desk.local>
References: <20260513162253.365343-1-andriy.shevchenko@linux.intel.com>
 <20260513162744.GEagSmgKV9ceTtO162@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513162744.GEagSmgKV9ceTtO162@fat_crate.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 13, 2026 at 06:27:44PM +0200, Borislav Petkov wrote:
> On Wed, May 13, 2026 at 06:22:53PM +0200, Andy Shevchenko wrote:
> > First of all, it has to be 'default n' (small letter n), otherwise
> > it looks for CONFIG_N which is absent and in case of appearance

> Who does look for CONFIG_N?

Hmm... I need to rephrase that. Any suggestion how to refer to the Kconfig
symbol in a clearer way?

-- 
With Best Regards,
Andy Shevchenko


