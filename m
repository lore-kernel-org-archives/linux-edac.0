Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14AC3A784E
	for <linux-edac@vger.kernel.org>; Wed, 23 Sep 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182605; cv=none; b=dbnk1hJJHlocTxnMzCO2NJ9jjBbxUdD7+qZKcDuvtZMBl6HOrN87LswX9QgJ7hcMETU0O3zQr0MyoON1LztgoZM6Mh8N5AVvKqD5WvNEmYNc45xBRyItauUNOSftvCh+35jpMcXQWCN2+EOhH1o5TkIXALgcNu8SUyFXOAGH5ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182605; c=relaxed/simple;
	bh=SXLwIEv1wLDY/SjQuew2Mr9cNFckDSjzP5UQOUJn3/k=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QIf/pw1DNbWaY1zunvLwW/LEYOV4E8Q3MkoVrngwAAgeZv9da03YuNkAQzjT20WMuIDHwllIToI0WEYKM3WI58MAYipz7F80FuX8rnPeVanlBOBjCG3cM3u6Af/nNz5ySR7r4Mxld/igvkAN7WjKAEDQ6rxAntC8EU4H6iu+Kgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsqQazf7; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsqQazf7"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so905008f8f.3
        for <linux-edac@vger.kernel.org>; Wed, 23 Sep 2026 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790182601; x=1790787401; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kr1MVzRgK4mAiK4oAoOCSLrh/zDQ2LAQZ54aeHcdQ74=;
        b=dsqQazf72wnvXYgCMRGDuI63KD7GRr/bgNVJteCUU1VCHvzL5FAujzLPeUM6o92GUj
         ChGgFB4VSC5UZcXn1LVfbZLadF+4zY2pFlSA+QKAljRgWHjB6cJwBNpOHhYBm5IJ8Od5
         lXyFtPomQiO9GhBXeOqPe68w3uP5n0wfVnddk6xLXeh6VnOn+lA/ZtTeLY932no2b1nM
         rHqAgz/OO2sFsF7rObzQRi3nISwAeCSIt0sxzLBgzINys+rHifmxY2CjuPtt8yVMXiQG
         GmoXELhwkMlHCXKnvhLwrGSVcyTJXR0FKkEOVOHd71BrYYqx2kub6OCgdsXc4RJ+gh17
         p7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182601; x=1790787401;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kr1MVzRgK4mAiK4oAoOCSLrh/zDQ2LAQZ54aeHcdQ74=;
        b=tMsYRg5ptvqf6zqRjuCsIKNCFExj2+rEbSSC0j4uESRg56DTR/7Zf/afs1YNcIdX2/
         c7WNUreWCEDmIv3imlEMBFjc2ABVm+7plV22Gvj3R1RRQdp6wFcNCCXCp0+18JjH5E+b
         Q+faqfzayWDApQeemhxkF6yAWWFH2MC72A1Pgbvix06ZAX44gSm/PZXzvdd9VgKigjxn
         7sRAuRXS6CINheCgqZwbXHc/82LPd287LWPpB39OQyVB6x6fTcO82evolDSQHCOXzWTF
         ooA9vBmbYKT8cds6o0rz0eGSz0j6a4Bt3J57H7fuqNC6SE0aTOvgY7RyfQ9qkWdyMhgX
         aBMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyON6V17u0e8w0tmIBIDugITFnNUGu2yFbJRGeCNqrAgtZD20R2hynwChJ0dvZrrDDgBS2FU1KRM/y@vger.kernel.org
X-Gm-Message-State: AFuF++lisnwQBLu9+7WOUaJAf0c0sMqeItHG9BlivSYcTVG9xbCFK+Hl
	bGOsnpyjWOp+1Rs/bO3YqGvWczNDwfQlDKNotgQzBoD7eTVKJT8v6paUCBXjGwSERdg=
X-Gm-Gg: AYBFou296sabNCr9AA7cXdnH3fKpDNdNfsBz42UAWtxjkAzvFDtT5Kd1wAUIz73lBly
	T4P0itsy2hdlNsLic5P5Ilp/an6LCDRw0fY6QOT4G2PX+sZhsxHtA6RB9YOauJL4/ibfT0iW814
	j1njxihtNF+pMl9ldUP2A09rpLDj/VSX8rVULCDihNbnXl+S5MOa+94bp/5MLy7VvSufoudddht
	uCqnlaLz112l0lczThQCfVXhenNuZ4/MMUjMPi5abm5thKH+9mgZ/r7Fa3sEikY0DA50PF2yBna
	jp6VWYfMP5NXyXL0ybiE3P6/JixjOJQrEcdHXG6tqFflcOqFtjLAyEBaZOlMlOOmsi7Z/I18x6/
	Tvksu205MaIMT+NAywk+r/ARrHlF33kLuOSfvOqxJdQnUM/wYAMB3nupvJZwAnXktIQ07V0GCrB
	pnCnhwGmbrVfzGmB6SkgEMZzNoF5df7Bn37Zv5vn7wwwhrJQXAnG3En54AOmvIKCHIyRP49SZD/
	aOM/WAkHw==
X-Received: by 2002:a05:6000:710:b0:487:27f9:840 with SMTP id ffacd0b85a97d-488670a09d6mr5921753f8f.53.1790182600803;
        Wed, 23 Sep 2026 09:56:40 -0700 (PDT)
Received: from [192.168.5.15] ([161.12.45.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm7815715f8f.0.2026.09.23.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: RE: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical
 operator style
From: Bryan Chan <bchimhim15@gmail.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Bryan Chan <bchimhim15@gmail.com>, Borislav Petkov <bp@alien8.de>, 
 "open list:EDAC-SKYLAKE" <linux-edac@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <SJ1PR11MB60834A6CB20792962CE05051FC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260922231854.108188-1-bchimhim15@gmail.com>
 <SJ1PR11MB6083B6CEC6BA730C18AD450FFC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <179013525089.122719.12798013417319991127.b4-reply@b4>
 <SJ1PR11MB60834A6CB20792962CE05051FC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
Date: Wed, 23 Sep 2026 17:56:39 +0100
Message-Id: <179018259977.122719.1860882880972360707.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-09-23 16:35 +0000, Luck, Tony wrote:
> > Sorry for my mistake, this is not compiler warning, but warning from the
> > sparse, here is the warning message:
> > drivers/edac/skx_base.c:359:46: warning: dubious: x | !y
> 
> Ok. I updated the commit message to say "sparse warning" and pasted
> in that message.
> 
> Applied, thanks.
> 
> -Tony
Thank you Tony, I will be more careful writing discriptions in the future.

-Bryan

