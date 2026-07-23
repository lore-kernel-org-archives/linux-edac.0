Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF249690C
	for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811635; cv=none; b=tEF7FKQcqflKanGeK+9YpZ5xOyGhCGB1cUC1h7iAntXFZVJxcNuQjI2uO6BMWb1FUZmXCBaPV8usX1aUJ6fXnQbDikRKREuwvRUpmJMKiRn2p9OYqgxIclyJ9LT9U7kk/FAEMiRx8BevQGN/ryh6+cDSDz25uav1fbftk1qik2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811635; c=relaxed/simple;
	bh=Nj6B89vg/eoHwi/V9n7xJy13riEwGjFKsFi9MFJik7U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q5FgkAxtMZCL49I5HxqvrvZRACzyJ7HCOKMJSnF4MfDwzAKq74KTzz0lQ6NinUXVClhmXfNuZDrr6my81fhwNgAPQRDFH+IlyyH5+XrtGKJgpNzlbtvJDyj7GZ4NnbV94jmCP9MQpPUXxcu5P1FDPNPgDksyHiHc2JVsURHuL9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hSyz6hm4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hSyz6hm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784811631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=89DEW0SPOYiqkUuOJY9WVCQSswmWOgRitvn9m60FuLc=;
	b=hSyz6hm4BCgApUVwk/BupXtnAyp11CKJ+/vOMMRCIaBXetKKikioaA5UQ2WJ/Li/VXDqwf
	g7dZ6OfugnBDHwjNnIayoxGael0a0cNtB3hpHSD5S8YXG7PoW93n9Gtwkc4HQFV8+OKELE
	6H6UMFNZJfDqSJW6iMCLllWZSA8lMY4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-163-3P_yM97RMQeKjSrAeHkiEA-1; Thu,
 23 Jul 2026 09:00:26 -0400
X-MC-Unique: 3P_yM97RMQeKjSrAeHkiEA-1
X-Mimecast-MFC-AGG-ID: 3P_yM97RMQeKjSrAeHkiEA_1784811623
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 49C8D197764B;
	Thu, 23 Jul 2026 13:00:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67094180034C;
	Thu, 23 Jul 2026 13:00:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1016A21E6920; Thu, 23 Jul 2026 15:00:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Lukas
 Straub <lukasstraub2@web.de>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Zhao Liu <zhao1.liu@intel.com>,  Laurent
 Vivier <laurent@vivier.eu>,  "Gonglei (Arei)" <arei.gonglei@huawei.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,  Alex
 Williamson
 <alex@shazbot.org>,  zhenwei pi <zhenwei.pi@linux.dev>,  Hanna Reitz
 <hreitz@redhat.com>,  Ani Sinha <anisinha@redhat.com>,
  qemu-block@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
  linux-cxl@vger.kernel.org,  Jiri Pirko <jiri@resnulli.us>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Fabiano Rosas <farosas@suse.de>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Michael Tokarev <mjt@tls.msk.ru>,  Igor
 Mammedov <imammedo@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Gerd Hoffmann <kraxel@redhat.com>,  Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,  linux-edac@vger.kernel.org,  =?utf-8?Q?Marc?=
 =?utf-8?Q?-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eric Blake <eblake@redhat.com>,
  =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@redhat.com>,  Jason Wang <jasowangio@gmail.com>,
  qemu-trivial@nongnu.org,  Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 40/44] qapi: convert trivial intro sections for qom.json
In-Reply-To: <20260723044805.527643-41-jsnow@redhat.com> (John Snow's message
	of "Thu, 23 Jul 2026 00:48:01 -0400")
References: <20260723044805.527643-1-jsnow@redhat.com>
	<20260723044805.527643-41-jsnow@redhat.com>
Date: Thu, 23 Jul 2026 15:00:19 +0200
Message-ID: <87fr19g8t8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

John Snow <jsnow@redhat.com> writes:

> (Trivial)
>
> Signed-off-by: John Snow <jsnow@redhat.com>

I think you missed a few:

diff --git a/qapi/qom.json b/qapi/qom.json
index 79ac8c2add..44845e552a 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -1148,8 +1148,7 @@
 
 ##
 # @MonitorProperties:
-#
-# Properties for all monitors
+#     Properties for all monitors
 #
 # @chardev: ID of the character device providing the monitor transport
 #
@@ -1160,8 +1159,7 @@
 
 ##
 # @MonitorHMPProperties:
-#
-# Properties for the HMP monitor
+#     Properties for the HMP monitor
 #
 # @readline: whether to enable readline for line editing
 #      (default: true)
@@ -1175,8 +1173,7 @@
 
 ##
 # @MonitorQMPCloseAction:
-#
-# Action to take when the character device backend is closed.
+#     Action to take when the character device backend is closed.
 #
 # @none: take no action
 #
@@ -1190,8 +1187,7 @@
 
 ##
 # @MonitorQMPProperties:
-#
-# Properties for the QMP monitor
+#     Properties for the QMP monitor
 #
 # @pretty: whether to pretty print JSON responses (default: false)
 #

