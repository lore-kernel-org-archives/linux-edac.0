Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BE04DBD7E
	for <linux-edac@vger.kernel.org>; Wed, 13 May 2026 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694231; cv=none; b=TJTKaihR2rw5nkfW2kPQd3K2Edc79nYL4XH3glYFbNFoB7ivIs+aub0kbBYx75ZjehwMF6fPH7Bn/5xSMZgwrRhI/9Ecg6Uq5jXQ2Uuz9+Zlfh4GEnyRd3JcGdfMxX6MIDA1WUMWc16pPb3Nlvq0nUHeARc9HoRIb9NSMRGdE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694231; c=relaxed/simple;
	bh=AH+NvSxfbyKBC0fhACXZr6r7xaBoAcxxvBouFVC/TOU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zk0aVoSdkkeVdQWzQqAH7zsEkwIvhoZBGyZ6wcDsypW7j384VZwdVGI30khGcRnrT8c3iqOHBbjC8GmfqOsa2d+6TABp8SAAjjORNhEbHPDkxlohOuMq8Qi0caYi+hBuzp4NBZc53Me93LHKsbbEl85X/LFb3AEoKqsA4G8KHNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TOIuWgzN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TOIuWgzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778694228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpnRFapMrqHlJjTZfSZdaqBLia0McrAbbHU2YflFY0w=;
	b=TOIuWgzN+52rbeUzoORFetEh6n501ph67NR7iQaCuqg6HGNTSqI4NuS9FvqI5sBLZM0//A
	+pPdDBKecw00pQ13YPXkHDSNrVofyqNUmtf1XCKwPjCS0juHb0ErB+L6J+lkdfDrmIA7hD
	EvqWT91LIbV4cLYuC5ro1vunkJh/6KA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-tV_PtahLNqur0dDy2SUrgw-1; Wed,
 13 May 2026 13:43:44 -0400
X-MC-Unique: tV_PtahLNqur0dDy2SUrgw-1
X-Mimecast-MFC-AGG-ID: tV_PtahLNqur0dDy2SUrgw_1778694222
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C747A18002C7;
	Wed, 13 May 2026 17:43:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 414741953947;
	Wed, 13 May 2026 17:43:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0051321E6A01; Wed, 13 May 2026 19:43:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Thomas Huth <thuth@redhat.com>,
  linux-edac@vger.kernel.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: update HEST maintainership entries
In-Reply-To: <6316f5b788cdc6b63e808606649dc5862271b22e.1778075257.git.mchehab+huawei@kernel.org>
	(Mauro Carvalho Chehab's message of "Wed, 6 May 2026 15:47:37 +0200")
References: <6316f5b788cdc6b63e808606649dc5862271b22e.1778075257.git.mchehab+huawei@kernel.org>
Date: Wed, 13 May 2026 19:43:39 +0200
Message-ID: <874ikbp5mc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Mark HEST code as maintained and assign them to me.
>
> While here, add a "L" entry to EDAC ML as RAS discussions
> usually happen there.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I'll take this through my tree.  Thanks!

