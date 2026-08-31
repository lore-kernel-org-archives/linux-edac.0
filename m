Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642737260D
	for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207938; cv=none; b=sG8cRmnC6ePhX0A8h+ITtlEO6RcD+a8jnG+GgDJhwr18wjFRWiU8Mw969mzuewDiPucd1UwBpAYQlv1xU79+mupUPphkDVtr9m+kV9uCA8d6rvxv/5Kkbrb5sen6JhqltWNNRzLKsv0+BlctxR0rxxhir85mbWEQF52uoYI3Gy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207938; c=relaxed/simple;
	bh=s2TsiM0W9dsOuJK6fIQDzIX8Tj6MlDjmFwC1VN69hfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pn1VivF+dtTTqMLvhh7jkKvHxpVOMpesYT1DFxWQaho2bgfQYmUuCoiSMPnAGBwcUob7PjpT4unrqPbqQZgO7wdCwusk2X0SSAXkUac3UcZvPcHCGodWiU4n4HP+SqapSXM0gM/Y1NWIxlybTJnYG5YQEvDYZXRTSSi+JZ3zlbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQuCYtua; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQuCYtua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788207935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/qXQ7y8j8vRIuhHXNBGEntkR65K80MZ6kjFW8kUyKM=;
	b=hQuCYtua3ju7JqXX4nZVJgww5vuyUyk7pDGdVFz4+y4dpPz/Xib85I3+YoMjgdbrYM6Igr
	DlJAAoL92/k5GGh/XpxUxsB9X54Utm+RkAacfQLZNuGLuLhs/PJQR6C3qR0/AZ8I4HtBI9
	5CapVwC9lmLJUruh/lbchaDdvhWjd4g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-XNahUdQTN_etkX5G4gySqQ-1; Mon,
 31 Aug 2026 16:25:28 -0400
X-MC-Unique: XNahUdQTN_etkX5G4gySqQ-1
X-Mimecast-MFC-AGG-ID: XNahUdQTN_etkX5G4gySqQ_1788207925
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2AAB018E6789;
	Mon, 31 Aug 2026 20:25:25 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.63])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6064018005AC;
	Mon, 31 Aug 2026 20:25:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Lukas Straub <lukasstraub2@web.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	Jonathan Cameron <jic23@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jiri Pirko <jiri@resnulli.us>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	qemu-block@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	linux-cxl@vger.kernel.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Alex Williamson <alex@shazbot.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	linux-edac@vger.kernel.org,
	Michael Tokarev <mjt@tls.msk.ru>,
	John Snow <jsnow@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Eric Blake <eblake@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 38/43] qapi: convert trivial intro sections for net.json
Date: Mon, 31 Aug 2026 16:19:40 -0400
Message-ID: <20260831201945.287730-39-jsnow@redhat.com>
In-Reply-To: <20260831201945.287730-1-jsnow@redhat.com>
References: <20260831201945.287730-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/net.json | 92 ++++++++++++++++++---------------------------------
 1 file changed, 33 insertions(+), 59 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index 1a6382825c5..4ea4bd1bc72 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -12,8 +12,7 @@
 
 ##
 # @set_link:
-#
-# Sets the link status of a virtual network adapter.
+#     Sets the link status of a virtual network adapter.
 #
 # @name: the device name of the virtual network adapter
 #
@@ -60,8 +59,7 @@
 
 ##
 # @netdev_del:
-#
-# Remove a network backend.
+#     Remove a network backend.
 #
 # @id: the name of the network backend to remove
 #
@@ -80,8 +78,7 @@
 
 ##
 # @NetLegacyNicOptions:
-#
-# Create a new Network Interface Card.
+#     Create a new Network Interface Card.
 #
 # @netdev: id of -netdev to connect to
 #
@@ -140,8 +137,7 @@
 
 ##
 # @NetdevPasstOptions:
-#
-# Unprivileged user-mode network connectivity using passt
+#     Unprivileged user-mode network connectivity using passt
 #
 # @path: Filename of the passt program to run (by default 'passt', and
 #     use PATH)
@@ -301,9 +297,8 @@
 
 ##
 # @NetdevUserOptions:
-#
-# Use the user mode network stack which requires no administrator
-# privilege to run.
+#     Use the user mode network stack which requires no administrator
+#     privilege to run.
 #
 # @hostname: client hostname reported by the builtin DHCP server
 #
@@ -389,8 +384,7 @@
 
 ##
 # @NetdevTapOptions:
-#
-# Used to configure a host TAP network interface backend.
+#     Used to configure a host TAP network interface backend.
 #
 # @ifname: interface name
 #
@@ -447,9 +441,8 @@
 
 ##
 # @NetdevSocketOptions:
-#
-# Socket netdevs are used to establish a network connection to another
-# QEMU virtual machine via a TCP socket.
+#     Socket netdevs are used to establish a network connection to
+#     another QEMU virtual machine via a TCP socket.
 #
 # @fd: file descriptor of an already opened socket
 #
@@ -476,8 +469,7 @@
 
 ##
 # @NetdevL2TPv3Options:
-#
-# Configure an Ethernet over L2TPv3 tunnel.
+#     Configure an Ethernet over L2TPv3 tunnel.
 #
 # @src: source address
 #
@@ -531,8 +523,7 @@
 
 ##
 # @NetdevVdeOptions:
-#
-# Connect to a vde switch running on the host.
+#     Connect to a vde switch running on the host.
 #
 # @sock: socket path
 #
@@ -553,8 +544,7 @@
 
 ##
 # @NetdevBridgeOptions:
-#
-# Connect a host TAP network interface to a host bridge device.
+#     Connect a host TAP network interface to a host bridge device.
 #
 # @br: bridge name
 #
@@ -569,8 +559,7 @@
 
 ##
 # @NetdevHubPortOptions:
-#
-# Connect two or more net clients through a software hub.
+#     Connect two or more net clients through a software hub.
 #
 # @hubid: hub identifier number
 #
@@ -586,8 +575,8 @@
 
 ##
 # @NetdevNetmapOptions:
-#
-# Connect a client to a netmap-enabled NIC or to a VALE switch port
+#     Connect a client to a netmap-enabled NIC or to a VALE switch
+#     port
 #
 # @ifname: Either the name of an existing network interface supported
 #     by netmap, or the name of a VALE port (created on the fly).  A
@@ -607,8 +596,7 @@
 
 ##
 # @AFXDPMode:
-#
-# Attach mode for a default XDP program
+#     Attach mode for a default XDP program
 #
 # @skb: generic mode, no driver support necessary
 #
@@ -623,8 +611,7 @@
 
 ##
 # @NetdevAFXDPOptions:
-#
-# AF_XDP network backend
+#     AF_XDP network backend
 #
 # @ifname: The name of an existing network interface.
 #
@@ -675,8 +662,7 @@
 
 ##
 # @NetdevVhostUserOptions:
-#
-# Vhost-user network backend
+#     Vhost-user network backend
 #
 # @chardev: name of a unix socket chardev
 #
@@ -836,8 +822,7 @@
 
 ##
 # @NetdevStreamOptions:
-#
-# Configuration info for stream socket netdev
+#     Configuration info for stream socket netdev
 #
 # @addr: socket address to listen on (server=true) or connect to
 #     (server=false)
@@ -861,8 +846,7 @@
 
 ##
 # @NetdevDgramOptions:
-#
-# Configuration info for datagram socket netdev.
+#     Configuration info for datagram socket netdev.
 #
 # @remote: remote address
 #
@@ -898,8 +882,7 @@
 
 ##
 # @NetClientDriver:
-#
-# Available netdev drivers.
+#     Available netdev drivers.
 #
 # @l2tpv3: since 2.1
 #
@@ -933,8 +916,7 @@
 
 ##
 # @Netdev:
-#
-# Captures the configuration of a network device.
+#     Captures the configuration of a network device.
 #
 # @id: identifier for monitor commands.
 #
@@ -972,8 +954,7 @@
 
 ##
 # @RxState:
-#
-# Packets receiving state
+#     Packets receiving state
 #
 # @normal: filter assigned packets according to the mac-table
 #
@@ -987,8 +968,7 @@
 
 ##
 # @RxFilterInfo:
-#
-# Rx-filter information for a NIC.
+#     Rx-filter information for a NIC.
 #
 # @name: net client name
 #
@@ -1033,8 +1013,8 @@
 
 ##
 # @query-rx-filter:
-#
-# Return rx-filter information for all NICs (or for the given NIC).
+#     Return rx-filter information for all NICs (or for the given
+#     NIC).
 #
 # @name: net client name
 #
@@ -1082,9 +1062,8 @@
 
 ##
 # @NIC_RX_FILTER_CHANGED:
-#
-# Emitted once until the `query-rx-filter` command is executed, the
-# first event will always be emitted
+#     Emitted once until the `query-rx-filter` command is executed,
+#     the first event will always be emitted
 #
 # @name: net client name
 #
@@ -1104,8 +1083,7 @@
 
 ##
 # @AnnounceParameters:
-#
-# Parameters for self-announce timers
+#     Parameters for self-announce timers
 #
 # @initial: Initial delay (in ms) before sending the first GARP/RARP
 #     announcement
@@ -1178,8 +1156,7 @@
 
 ##
 # @NETDEV_STREAM_CONNECTED:
-#
-# Emitted when the netdev stream backend is connected
+#     Emitted when the netdev stream backend is connected
 #
 # @netdev-id: QEMU netdev id that is connected
 #
@@ -1208,8 +1185,7 @@
 
 ##
 # @NETDEV_STREAM_DISCONNECTED:
-#
-# Emitted when the netdev stream backend is disconnected
+#     Emitted when the netdev stream backend is disconnected
 #
 # @netdev-id: QEMU netdev id that is disconnected
 #
@@ -1226,8 +1202,7 @@
 
 ##
 # @NETDEV_VHOST_USER_CONNECTED:
-#
-# Emitted when the vhost-user chardev is connected
+#     Emitted when the vhost-user chardev is connected
 #
 # @netdev-id: QEMU netdev id that is connected
 #
@@ -1246,8 +1221,7 @@
 
 ##
 # @NETDEV_VHOST_USER_DISCONNECTED:
-#
-# Emitted when the vhost-user chardev is disconnected
+#     Emitted when the vhost-user chardev is disconnected
 #
 # @netdev-id: QEMU netdev id that is disconnected
 #
-- 
2.55.0

