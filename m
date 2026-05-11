Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F33D3D01;
	Mon, 11 May 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495973; cv=none; b=JOy0zCMXE6urAanfmYxx7AdDK8+m0AtPD5CMaILBDFC4eDNInWPv3MfPOhInIEn+B/SZEihNp5355ENn2OAahXX8KOwarMYUimFFFkrWSf+w4K5ZbjhSaKT2mk1mPP6hWSx+s9H9SGkC6q0Ex5+yjoh0nbRi65EtLD1j8OISYs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495973; c=relaxed/simple;
	bh=vwU7GQ26ZjysSZJtoYsD3ayS/pQ9tAtxQIePgftwveY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfzi0bqRrYmHDP186IY1pzgd0svDzu0IXAH8Jt0DsUpChe/Qibs8BdX30ZtOxA+ifxA3rR5EeWXVSnNj8otN750z+GYpIvRMG1r+pvzjegO720WcIACYkRKJZ++/j3ZDLzcAnC1bBpWDA6hF4Cm2xid5/oAIIB6ANU62GPS629g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UxFeHMj7; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UxFeHMj7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C2E4F40E019B;
	Mon, 11 May 2026 10:39:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Xe1n8vRKra0E; Mon, 11 May 2026 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778495959; bh=g1p2UkX3BR9uOWz6T2nEuxdtXaF5hiKEvUMFCjutwDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UxFeHMj7kmz3WS4G2/YPOVZckAWzK3H37te2n75wuUSkV7KVEeTr7/ayJNFBOLoQM
	 Ox58LImrfA0shOCES3AUwQmgQTbdewm4s4fVgKCG+X9fqSWDLUDfzrmQYXP/IKHl5C
	 RZpRpaWZ7t9M/dPRu/SPNqFQS2wEfgwPLiM6ysakVJZFiip16qOQ1IqZL/usIvblKO
	 ffT1g5SrqCs1Btqd0dgja4PERMWveahWwf/ZCIxIyh0ewjMugQMb07l0Cib7SqRavu
	 SVzptUO/5hTLOymFFccolv5o+N1WnhwFFxBBkhHjKeahIdYxxEPygbopwCNQJxFDUS
	 lwKOJEVqZyKnqgEoPp1scuaCFwSvzE+Q7gqR/ip1mjloYFEPb6qWI4DigJHbbpcjpO
	 rM2BH+axW5Npuar+6z4yDPmLwkpLWekz7fk1fHtpApOjAOka7V0xj5x/UF8HVMhFf7
	 NMc7WrKTr+ck7T6UHKH7fLrANGh9AQBbti+RppLAPyYB//m8PRSIk4O5QXNwVC2tcE
	 B3WmgxFVy8pMp9gRf/Sv5yy2tqRCqcOY1VcZLyvGHFuenSpFAGrK5m7Ys9Obx3ZAhO
	 1YnLVhHgdEW4ya+oHOjeAzktFxMeKiiNMCB4X4PyI8HZkkVcPF/3yQhYpVsSMntzxm
	 8q302Z+gsmEs3os2YlrifdbI=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 930A340E0140;
	Mon, 11 May 2026 10:39:01 +0000 (UTC)
Date: Mon, 11 May 2026 12:38:54 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrei Purdea <andrei@purdea.ro>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>,
	david.laight.linux@gmail.com,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Tony Luck <tony.luck@intel.com>, Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-edac@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin>
 <agExLK2GR0w0Z_N2@geday>
 <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>

On Mon, May 11, 2026 at 09:46:53AM +0300, Andrei Purdea wrote:
> Hi all,

Hi,

first of all, please do not top-post when replying to a public mailing list.

> Furthermore the one in versalnet_edac.c looks like beyond fixing a
> buffer overflow risk and code smell, it also introduces a behavior
> change (bugfix?), because the old code I believe cuts off the last
> character from the copied string. (Because it was using just strlen()
> and not using strlen() + 1)

The versalnet_edac is innocuous because, AFAICT, that silly code is copying
"error_ipc" into

struct rpmsg_channel_info {
        char name[RPMSG_NAME_SIZE];

with that buffer size being 32.

So no overflow here.

However, just to make this safer, we should min the size.

Also, Shubhrajyoti, why aren't you padding the rest of the name string with \0
*especially* since you're allocating it on the stack?!

IOW, this (totally untested ofc):

        strscpy_pad(chinfo.name,
                    amd_rpmsg_id_table[0].name,
                    min_t(size_t, strlen(amd_rpmsg_id_table[0].name), RPMSG_NAME_SIZE));

I still don't like it because we're noodling with this string as if it is
super special and copying it back'n'forth just because this rpmsg is
MODULE_DEVICE_TABLE and apparently is used to autoload the driver or so...

Why do we need it?

Can we simplify that gunk there?

Please have a look.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
