Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886940F8C3
	for <linux-edac@vger.kernel.org>; Mon, 13 Jul 2026 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947606; cv=none; b=kDOWcyf3lWyMpa3IvIwJ7/Mx2lpXsMr9zd066lm1M0UxCbBpci0xwrYFClu0A0aBRMHCzzqScQPy1jnyOQSFQJfmCf0DeHtbvbcj8ew6ORhOXK1pQNK8iIbX0uu5BvIektqMywbhSioPmOvrqFfHlYTI2zk+YYVr0NBqpH7HHvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947606; c=relaxed/simple;
	bh=CCq0vCIam84Hdgs0GpDLnEXHgwpUNJo2Cm2/oIvfPSg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fd7yPdA/QM/WsHm1GI484YYIKEfzGzQl/Kg/dUX9dkRHByXRkFaVPPrqOoq4tYK8N1OFY4nPa9tOSUuPxDsmd2gZb2sqPPqPnH8Q/kCCtdJnMAsWCvtTboHW2r3Msm+Ldo5nGX4xuR9LW7b8+b0YJ3nsOPTNC/YTW/ZAsBu95n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SvC5lpyZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SvC5lpyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783947604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k28s8fWtXtRhuZG85v5QKUt8IiIXnNIzhjaG9kOU+1g=;
	b=SvC5lpyZqqvTY5xABvWNwfzJhLucvfN5PLYn5UOtTfXbXlojw+vInSP+Cdho4M7DvNuGb/
	mHzn1e5xGnAhgxuWEaPsjHeg57bsASyG8UtmKzQzx39eZZXEEP6SfQe8gmLtSV9czXOgAC
	ZSDyBWCetu3GnPoSiWCtLDzbVKkactY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-kWoxTyTHN_W-b_OFt9v6vA-1; Mon,
 13 Jul 2026 09:00:00 -0400
X-MC-Unique: kWoxTyTHN_W-b_OFt9v6vA-1
X-Mimecast-MFC-AGG-ID: kWoxTyTHN_W-b_OFt9v6vA_1783947599
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2AD2D1955BC1;
	Mon, 13 Jul 2026 12:59:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 202781800593;
	Mon, 13 Jul 2026 12:59:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 888BC21E6920; Mon, 13 Jul 2026 14:59:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  linux-edac@vger.kernel.org,  Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>,  Alex Williamson
 <alex@shazbot.org>,  Paolo Bonzini <pbonzini@redhat.com>,  zhenwei pi
 <zhenwei.pi@linux.dev>,  "Gonglei (Arei)" <arei.gonglei@huawei.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,  Eric Blake <eblake@redhat.com>,  =?utf-8?Q?C=C3=A9dr?=
 =?utf-8?Q?ic?= Le Goater
 <clg@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
  Zhao Liu
 <zhao1.liu@intel.com>,  Lukas Straub <lukasstraub2@web.de>,  Stefan
 Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 00/14] qapi: convert to explicit intro section syntax
In-Reply-To: <20260629213624.936258-1-jsnow@redhat.com> (John Snow's message
	of "Mon, 29 Jun 2026 17:36:10 -0400")
References: <20260629213624.936258-1-jsnow@redhat.com>
Date: Mon, 13 Jul 2026 14:59:54 +0200
Message-ID: <87ech7gi45.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

John Snow <jsnow@redhat.com> writes:

> GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/2638342206
>
> Hi, this patchset converts some of the most trivial modules to use the
> new explicit intro syntax. This particular patchset does not
> differentiate between "trivial" conversions and those that take
> slightly more liberty in refactoring, but there are (debatably?) no
> such cases in this patchset.

Looks entirely mechanical to me.  Am I missing anything?

