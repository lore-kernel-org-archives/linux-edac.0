Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF4A342C8B
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769002; cv=none; b=fjvsZ4CSTxj+i/F7QyJoD2DiCuCp1J41zvLOOMJuNJduVgW5kXDce93ySW+fhO0jvpkz32N689YkfhxpiiPZ1th9JDNhweXqvLoIIQaqu8F8YZj79Ytp0h7oDwU3h0c3iazl8Joms1pBT99CCc/xgIUIKiNTy2rGGrVPUPiahIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769002; c=relaxed/simple;
	bh=08x1TzODCe8roXyuh4rF8Ib5BD5Q6GI3aP7Q6ISvzvI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Cl013CfcA0/rkpgtJgtQYiomqJBlsV+htgQ2IsxzM7RNfVAwq+HNbESQNS+3mYNPDGlGSWWKjokQ+18LHl62Fx80Wk+vJN3rmQ9tsqQLcITcw9JrfBGwh+rb/2Sr1pnqehakDdK4U+Izfs+Su/6z844PcJSBzv86Cwav/osq8Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HiW1/X3I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HiW1/X3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r1/3WCB7J1KfpyxbMqsTPjUmH4YQamwrqSS/U8KRduA=;
	b=HiW1/X3I0+sCfJcQoLNJh2DmrhOjZnmd+qhRNX8XrmB8CtCbjN4NJoQbceI0FRR4lntDPv
	oMYXZS5Xna0saY3BTGQ3JrR9UELCt3WOIvQ06iI1244dPcNfMB2IsB/0t3zinPRKvECeVa
	rch3yy/HKTZEo6eU2pUz6qc7J++k+gY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-YXo-i3FUPFOxKOMOqIO0Sg-1; Mon,
 29 Jun 2026 17:36:36 -0400
X-MC-Unique: YXo-i3FUPFOxKOMOqIO0Sg-1
X-Mimecast-MFC-AGG-ID: YXo-i3FUPFOxKOMOqIO0Sg_1782768995
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 74CFA1945105;
	Mon, 29 Jun 2026 21:36:34 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 425441956096;
	Mon, 29 Jun 2026 21:36:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	linux-edac@vger.kernel.org,
	Markus Armbruster <armbru@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Lukas Straub <lukasstraub2@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH 00/14] qapi: convert to explicit intro section syntax
Date: Mon, 29 Jun 2026 17:36:10 -0400
Message-ID: <20260629213624.936258-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/2638342206=0D
=0D
Hi, this patchset converts some of the most trivial modules to use the=0D
new explicit intro syntax. This particular patchset does not=0D
differentiate between "trivial" conversions and those that take=0D
slightly more liberty in refactoring, but there are (debatably?) no=0D
such cases in this patchset.=0D
=0D
John Snow (14):=0D
  qapi: convert intro sections for error.json=0D
  qapi: convert intro sections for acpi-hest.json=0D
  qapi: convert intro sections for ebpf.json=0D
  qapi: convert intro sections for uefi.json=0D
  qapi: convert intro sections for compat.json=0D
  qapi: convert intro sections for vfio.json=0D
  qapi: convert intro sections for trace.json=0D
  qapi: convert intro sections for misc-arm.json=0D
  qapi: convert intro sections for cryptodev.json=0D
  qapi: convert intro sections for machine-common.json=0D
  qapi: convert intro sections for accelerator.json=0D
  qapi: convert intro sections for authz.json=0D
  qapi: convert intro sections for yank.json=0D
  qapi: convert intro sections for replay.json=0D
=0D
 qapi/accelerator.json    | 18 ++++++----------=0D
 qapi/acpi-hest.json      |  4 ++--=0D
 qapi/authz.json          | 21 +++++++------------=0D
 qapi/compat.json         |  9 +++-----=0D
 qapi/cryptodev.json      | 18 ++++++----------=0D
 qapi/ebpf.json           | 14 ++++++-------=0D
 qapi/error.json          |  3 +--=0D
 qapi/machine-common.json | 19 +++++++----------=0D
 qapi/misc-arm.json       | 24 +++++++++------------=0D
 qapi/replay.json         | 45 ++++++++++++++++++----------------------=0D
 qapi/trace.json          | 12 ++++-------=0D
 qapi/uefi.json           |  5 ++---=0D
 qapi/vfio.json           | 19 ++++++++---------=0D
 qapi/yank.json           | 28 ++++++++++---------------=0D
 14 files changed, 94 insertions(+), 145 deletions(-)=0D
=0D
-- =0D
2.54.0=0D
=0D

