Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1055F282F31;
	Sat, 16 May 2026 05:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778910184; cv=none; b=fr58b6rgEdCuFXd6ZO3ZYgmfnMwHpxJ2407m2bzV+ZqFdm1SGh4pGgO9qlDEqAf2Kqk+p8I5AXlmBQnjnOmH08hydke7mEBhEbp2tsGIPxSxE5SUiPcsCKQbD3v04CjXacRfC1cX2Ag8XTJxbjvc36MKOdpFB4M4VYPxZq7b4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778910184; c=relaxed/simple;
	bh=pYx1oLsAjKO5w+nHhnLhkJ6Rh+reqjcEgMfTaVnQWUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doiXxrI7+0GLaMj0RVM8qiw02He8w3tgtMjqQF7/RtkwMHW+JFL/mQh9ztsO3g6ftvArWXe7mY/4kTdCmILeQQZKJhFhuM10BXmhwWLcW4U7ZdiFUa0WzNOmxOP8hTb6u4IJ0qGTytxO5WmsDS5bRxQZpBMQ+PYiQ4nKjvddFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1415007|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0113899-0.00363243-0.984978;FP=7535467963031209163|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083013073;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.hYSXGym_1778910172;
Received: from 192.168.2.127(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hYSXGym_1778910172 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 16 May 2026 13:42:52 +0800
Message-ID: <f7d72a3a-cf03-41de-a56c-15847d8ef444@open-hieco.net>
Date: Sat, 16 May 2026 13:42:51 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] EDAC/RAS: Hygon Family 0x18 UMC ECC address
 translation
To: Borislav Petkov <bp@alien8.de>
Cc: yazen.ghannam@amd.com, tglx@linutronix.de, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1775213147.git.shiaichun@open-hieco.net>
 <20260514150825.GFagXlabtyupoMqn9C@fat_crate.local>
From: Aichun Shi <shiaichun@open-hieco.net>
In-Reply-To: <20260514150825.GFagXlabtyupoMqn9C@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/2026 11:08 PM, Borislav Petkov wrote:
> On Fri, Apr 03, 2026 at 06:57:24PM +0800, Aichun Shi wrote:
>> Hi all,
>>
>> This is an RFC (Request For Comments) for the patch series that proposes
>> Hygon Family 0x18 (models 0x4-0x8) support for UMC ECC error address
>> translation, aligned with the existing AMD EDAC + AMD ATL layering in
>> mainline.
> 
> Please go over all review comments and address:
> 
> https://sashiko.dev/#/patchset/cover.1775213147.git.shiaichun%40open-hieco.net
> 

Hi Boris,
    Thanks for the review. I will go over all of them and address them soon.

Best Regards,
Aichun

