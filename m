Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B822D0C82
	for <linux-edac@vger.kernel.org>; Tue, 30 Jun 2026 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808070; cv=none; b=lRY/8qscSoRxr3RCKdRuAnfsBCefK6uPEO//ihqyM+8h7C/xGP+WAMqRUxuaw6rZrzAlFktmop7rWRoXQLBsk4AlRjVBxR9toa0A3q9F8JuIluij7Zkq5/+/KdO0FxnYllIO/xM2652dHDBakTrMD7YlSIKxX1qDxbVt7FDbrR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808070; c=relaxed/simple;
	bh=fY537FtkHCR/MR0vUPeslZ761SXe6P3E+GZGSaEDGR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptd9X4e4hF/9rWqNz1gVovythx7iFDkKdWu+Jkyv6FisjRvBGKx9W7AJBJ/0QVwSMeibvg1uenqpui6uu/16ic1RJdh3wsUUjBEG6Xfw6CZK6UU0OnDKNJSiece49KgHO/COEg1MZKSyLYCxEtyrR5xmGF2+beWNp//BH6NYwrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=chMrJHj6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="chMrJHj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782808068;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=CfxnvkBGUYVYS7qBYS31Jw4HlMb2Mc6vt0J7713tpI8=;
	b=chMrJHj6YYDe2LS2wgD5s20bUKg1hyYja8WwSIyu1/d1mAhqBwhgl50b/EDW0qwK0vhdl6
	nLQDRH8dH6Gju5V4YXYHeCVSHjEdtMj+7iSqSUxeNN5a7iomJHSsltegtlkwVCgyCMRJGU
	FLG4grtE14kkQtkoFqQP56dWVfXupGk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-_OAUnOAhNwahorkVMUCc9w-1; Tue,
 30 Jun 2026 04:27:45 -0400
X-MC-Unique: _OAUnOAhNwahorkVMUCc9w-1
X-Mimecast-MFC-AGG-ID: _OAUnOAhNwahorkVMUCc9w_1782808063
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B8BD1800576;
	Tue, 30 Jun 2026 08:27:43 +0000 (UTC)
Received: from redhat.com (unknown [10.44.50.20])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 876E2180035F;
	Tue, 30 Jun 2026 08:27:35 +0000 (UTC)
Date: Tue, 30 Jun 2026 09:27:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-edac@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Eric Blake <eblake@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, Lukas Straub <lukasstraub2@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 00/14] qapi: convert to explicit intro section syntax
Message-ID: <akN99Ov2ngf2BwbG@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260629213624.936258-1-jsnow@redhat.com>
 <20260629230756.GCakL6zDDd_g8DIeGD@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629230756.GCakL6zDDd_g8DIeGD@fat_crate.local>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Mon, Jun 29, 2026 at 04:07:56PM -0700, Borislav Petkov wrote:
> On Mon, Jun 29, 2026 at 05:36:10PM -0400, John Snow wrote:
> > GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/2638342206
> > 
> > Hi, this patchset converts some of the most trivial modules to use the
> > new explicit intro syntax. This particular patchset does not
> > differentiate between "trivial" conversions and those that take
> > slightly more liberty in refactoring, but there are (debatably?) no
> > such cases in this patchset.
> > 
> > John Snow (14):
> >   qapi: convert intro sections for error.json
> >   qapi: convert intro sections for acpi-hest.json
> >   qapi: convert intro sections for ebpf.json
> >   qapi: convert intro sections for uefi.json
> >   qapi: convert intro sections for compat.json
> >   qapi: convert intro sections for vfio.json
> >   qapi: convert intro sections for trace.json
> >   qapi: convert intro sections for misc-arm.json
> >   qapi: convert intro sections for cryptodev.json
> >   qapi: convert intro sections for machine-common.json
> >   qapi: convert intro sections for accelerator.json
> >   qapi: convert intro sections for authz.json
> >   qapi: convert intro sections for yank.json
> >   qapi: convert intro sections for replay.json
> > 
> >  qapi/accelerator.json    | 18 ++++++----------
> >  qapi/acpi-hest.json      |  4 ++--
> >  qapi/authz.json          | 21 +++++++------------
> >  qapi/compat.json         |  9 +++-----
> >  qapi/cryptodev.json      | 18 ++++++----------
> >  qapi/ebpf.json           | 14 ++++++-------
> >  qapi/error.json          |  3 +--
> >  qapi/machine-common.json | 19 +++++++----------
> >  qapi/misc-arm.json       | 24 +++++++++------------
> >  qapi/replay.json         | 45 ++++++++++++++++++----------------------
> >  qapi/trace.json          | 12 ++++-------
> >  qapi/uefi.json           |  5 ++---
> >  qapi/vfio.json           | 19 ++++++++---------
> >  qapi/yank.json           | 28 ++++++++++---------------
> >  14 files changed, 94 insertions(+), 145 deletions(-)
> 
> Why is this thread CCing linux-edac?
> 
> I don't see any relation here...

The linux-edac list was recently added to the QEMU MAINTAINERS
file:

  https://gitlab.com/qemu-project/qemu/-/commit/4c5e70b9a42744401fc10b17cc61820586ba4a13

and the entry matches the qapi/acpi-hest.json file that John has
modified, so gets auto-CC'd.

Admittedly the content in this series is not especially relevant
to the liunux-edac list in this case, but the patch submission
tools are just following the declared MAINTAINERS file entry.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|

