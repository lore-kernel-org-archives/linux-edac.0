Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2B047F2E3
	for <linux-edac@vger.kernel.org>; Wed,  6 May 2026 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075659; cv=none; b=JwUapGrarr/FG/vVj2aOeRBb1OYe5ZitgmHVvUYObm9th7xVMsbrVGx+v/+BYhAeb4gStf5I2/cjTeWQStgHZAdRVMVOcQZMMpDSFrIGQYf9YqnytEmidydibhX4jaTvWPZm0eWosEBw1OLY7xGz1Onbe+CIBuj+br2Qhbm1Iao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075659; c=relaxed/simple;
	bh=+QhbvYAmYNexNcjfjTevz8GNne3BxIxGTPeqj8Oq9UA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U2eh3bigWdwGEP5bFFLPDNyiVZJ5OnpUlri2e2dy/sZlrxKKMQl5uzlnxxrEUS//wOb+bbKF4ep3g6aKEh6pGBOp3OYzFrwToAWZWuSmbmRBN1ASQTFVy6ojpaPYdgAkO5xihS+i46NzqW21inXp2oBAsegFG82BiLemflTssxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jSyfvRtD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jSyfvRtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778075655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QhbvYAmYNexNcjfjTevz8GNne3BxIxGTPeqj8Oq9UA=;
	b=jSyfvRtDBGOtzWHlmE+5TroZGKNGMUg+uGl1YSsejHhlM+Ebb70iDcKwB+j/scBWkibl5r
	Q4dLeCqIG3muAY+gmc23ELCbLhjOYMmWE7TrdGe5OywXR/Nr/OjC8uZGX8Jbbg4OQYLjIA
	RHpjjJMcndiPTbIembNJUVeZFjGGDcA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-ZEcnUJmEO2-Q4sOUebK2Sg-1; Wed,
 06 May 2026 09:54:09 -0400
X-MC-Unique: ZEcnUJmEO2-Q4sOUebK2Sg-1
X-Mimecast-MFC-AGG-ID: ZEcnUJmEO2-Q4sOUebK2Sg_1778075645
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43A4319560AD;
	Wed,  6 May 2026 13:54:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A307E3002D31;
	Wed,  6 May 2026 13:54:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3D34B21E6A01; Wed, 06 May 2026 15:54:02 +0200 (CEST)
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
Date: Wed, 06 May 2026 15:54:02 +0200
Message-ID: <87y0hwabk5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Mark HEST code as maintained and assign them to me.
>
> While here, add a "L" entry to EDAC ML as RAS discussions
> usually happen there.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thank you!

Acked-by: Markus Armbruster <armbru@redhat.com>

