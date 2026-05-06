Received: from out28-148.mail.aliyun.com (out28-148.mail.aliyun.com [115.124.28.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED02402BB1;
	Wed,  6 May 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073542; cv=none; b=LbcJ+sjTgOhqfeGTemg6hHER5vOBSMXism2mL6eN/tRqBoXsesaGLZTs3OvkWcN5/VMIfLDjvVj0G/uP5YuW1eSpB4c2GQ/WaehFhaYTwJM5Pi+EjQRwsUeffmDYk/l397HwaxJXLHbScbopdQQHAj+QSfBsRw/afq5CB/yptLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073542; c=relaxed/simple;
	bh=GLz7707dOJBz7rlUYWcS2N2QgYMPwvTUFk6JSMPAXzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcNpfQy0z94EZJxHo1f1mltyU7clL4a3yvqnknxlNeMziL4Sf8s7XSQ6dXl55JqnGdhcAT9zhBRJOpeK21DD7RxfvNfsVP9KzdMvDw102gd0e4X2rUMCBj8g7/DV/kpybPmcPS9yOlJuHdDraC6D2SEDNABFx045xEFmwXKT7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1381891|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0141813-0.00145143-0.984367;FP=3342058454143132029|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068016216;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.hQqZyVG_1778073207;
Received: from 192.168.2.127(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hQqZyVG_1778073207 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 06 May 2026 21:13:27 +0800
Message-ID: <79948d2b-341f-4059-9268-c9b391073795@open-hieco.net>
Date: Wed, 6 May 2026 21:13:01 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/mce_amd: Fix Hygon UMC ECC error decoding with
 logical_die_id
To: Borislav Petkov <bp@alien8.de>
Cc: yazen.ghannam@amd.com, tglx@linutronix.de, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260216203211.GB420258@yaz-khff2.amd.com>
 <20260301142609.242124-1-shiaichun@open-hieco.net>
 <20260504175554.GCafjdqoMgM7k87tjU@fat_crate.local>
From: Aichun Shi <shiaichun@open-hieco.net>
In-Reply-To: <20260504175554.GCafjdqoMgM7k87tjU@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/2026 1:55 AM, Borislav Petkov wrote:
> On Sun, Mar 01, 2026 at 10:26:09PM +0800, Aichun Shi wrote:
>> You are right, the family check (0x18) is over restrictive and can be removed.
> 
> How much of sprinking of "if Hygon" is this file going to get? If you start
> sprinkling it left and right I'd prefer if you did drivers/edac/mce_hygon.c
> and add the functionality you need, without impairing AMD code and us not
> being able to change it due to Hygon-specific changes which we cannot test
> anyway...
> 
> Thx.
> 

Hi Boris,
    Thanks for your guidance. From what I can see, this is the only spot 
where we need to sprinkle an "if Hygon" check to enable error decoding 
in mce_amd.c for Hygon platforms.If any other similar checks are 
required in the future, I will move them into mce_hygon.c.

Best Regards,
Aichun
