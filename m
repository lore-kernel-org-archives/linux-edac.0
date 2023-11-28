Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LtYjpgcS"
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1377C1727;
	Tue, 28 Nov 2023 11:40:11 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4497D40E0195;
	Tue, 28 Nov 2023 19:40:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vrmJyJbB_mJ9; Tue, 28 Nov 2023 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701200407; bh=IXhclYhnw/qTFauJxi+7a90SZAair+gcQDJINu3XN3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtYjpgcSm7YwkFcuZgyU1NAl5uMLMDiZLrFc6Qv9mv2jT4Hg4uNpVL5p4+L1J/RI1
	 qg0kmp1rOpmamQdyXksugkPQbyJORynjEPAo8MFdvk1e5KbnMpgACYCJKicYvseXiU
	 Kdu4fKe9s4g7HBgrL4+yglBMli8HIAOQJS2Rsp7v0UcSGL7GVgONxc0E8OlckezLh7
	 4IrgHnaiAVqNrIVAEtLAasMELRf/IRJvG6KRrQfENWcmMOlgi+e0yCWOidqk/GbW75
	 UjediL6BdcYAp2Bl/nJlpygw/NB2GtVkatX5/j8J4od/XcQxWM6xBHjC7Vh7FES48b
	 ANeYpYtmI/LVyaZMNjsJT/x4CqI25dBZHTyiU48wkOaExcueoP7AVKXTq7mZszISMG
	 JxS2ysVnfce+y8oVf5hyYUrG0XMhEIq4/Jlnr82YDqsqkqweW/jUxJ9GplfccwJblU
	 KGW5cgMkNjZLT2PYFLWLvTx1C1E+0ww17LouMFkvWxbU4iTjNDKDFzl+a7xCz0gzqj
	 f5rOhAA0XcJUL9AR2L1X1PdQeC7/AX8WYrilHzq6g6N4tKH1MT10FAJxbgANGrWcCb
	 Wb0bTG22HD8aBuzOLGt2ikM9bUARbHuR32CwFvf/MUoqsyzeNvsIfLk2a+Tbn4knnf
	 s5F9wikOk4fOL47UDdmoLWJc=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6E9A940E014B;
	Tue, 28 Nov 2023 19:39:59 +0000 (UTC)
Date: Tue, 28 Nov 2023 20:39:58 +0100
From: Borislav Petkov <bp@alien8.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Tony Luck <tony.luck@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>,
	Muralidhara M K <muralimk@amd.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muralidhara M K <muralidhara.mk@amd.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Begin a RAS section
Message-ID: <20231128193958.GGZWZCDrlTbpW9fG9t@fat_crate.local>
References: <20231102114225.2006878-1-muralimk@amd.com>
 <20231102114225.2006878-2-muralimk@amd.com>
 <20231128142049.GTZWX3QQTSaQk/+u53@fat_crate.local>
 <7c5c3634-7a89-48b3-96fa-4d9f3be3ba05@infradead.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c5c3634-7a89-48b3-96fa-4d9f3be3ba05@infradead.org>

On Tue, Nov 28, 2023 at 09:04:22AM -0800, Randy Dunlap wrote:
> In general, does RAS include EDAC and MCE?

You can say that.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
