Received: from mail-prod-route12.it.su.se (mail-prod-route12.it.su.se [77.238.37.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA023DC850
	for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.37.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793058; cv=none; b=EJIaW/GifUh1yyfqVszzLRwRn8hXNBlwtOHj1Tqc80WYbeRJyBRLRSqrBQ8NpHXo3mqSIz/p6JpGTo0/xzf5eUI7OxERPtTgsOZ9bXES/67FSTAv1a6wP87tUY3wBrpPDpQAdRgCAT9OvIIpHX8qBkyRLqRckVPFrPzbf4wzE9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793058; c=relaxed/simple;
	bh=83H92OK9NHIYdz2xj7hN0lmdfd3mOB9jCxS1P2RemDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0dlvMsyFpvRg8sQKMQD6St+TBBOdHmoSTiEi478jYOMTZTNklE2cpTO7tpdaoQqg2YlQEkPxWkX3Umni6JtU0TCRB1Qcj3Jhm88fq+Wb9ZmEOICTGcPtE5QHUNsW62Uic2SAioy0pIEqVAcGX3i85UwCbGTuIeBePs41LZq/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=astro.su.se; spf=pass smtp.mailfrom=astro.su.se; dkim=pass (2048-bit key) header.d=astro.su.se header.i=@astro.su.se header.b=KEnCrPt1; arc=none smtp.client-ip=77.238.37.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=astro.su.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astro.su.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astro.su.se header.i=@astro.su.se header.b="KEnCrPt1"
Received: from mailfilter-ng-3.sunet.se (mailfilter-ng-3.sunet.se [192.36.171.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-prod-route12.it.su.se (Postfix) with ESMTPS id 4h5NP35Hkcz1Yf
	for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 09:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=astro.su.se; s=halonv1;
	h=content-type:mime-version:message-id:subject:cc:to:from:date:from;
	bh=Pat/6Xx9wzlA0o/V+akry+n01iRwK02tdudXEzDFnuc=;
	b=KEnCrPt1tdtdLKcrrOf03tRb/DVs2v+evE88XIFYX74ycyCKNwX9CshUZUOGeo19ccTaLO6oNjJYy
	 PdHvb9//rSUH+CldkPsSWTtMb1b5DFgaU0wMUaSkBvHz0MWj40aiJbms0eHe4rzAIQjqv1a8AQLjDD
	 NgC+2dqqEYw4IBBmwDFdk3WeNtA0ZP8QlDEvV7YDe08DitjknnL7pfuop+fh6uriwvOfqZsdVR62U4
	 LKRhaxJl+iswLE+80D5Cqy0rifve320wHNAaKVrD6T7yz7PjVDgkeHcWEbcOXzWajQbUD7JtMwzSnU
	 +t4tQ2zmIRVCDQfAQo5V0FBjiK7qQvg==
X-Halon-ID: fc58d93e-8669-11f1-999b-0050569a1168
Received: from smtp.su.se (mail-prod-smtp10.it.su.se [130.237.181.87])
	by mailfilter-ng-3.sunet.se (Halon) with ESMTPS
	id fc58d93e-8669-11f1-999b-0050569a1168;
	Thu, 23 Jul 2026 07:41:58 +0000 (UTC)
Received: from duamutef.astro.su.se (duamutef.astro.su.se [130.237.166.114])
	by smtp.su.se (Postfix) with ESMTPS id 4h5NP24ZsTz1K;
	Thu, 23 Jul 2026 09:41:58 +0200 (CEST)
Received: by duamutef.astro.su.se (Postfix, from userid 1014)
	id 6DE11699A; Thu, 23 Jul 2026 09:41:58 +0200 (CEST)
Date: Thu, 23 Jul 2026 09:41:58 +0200
From: Sergio Gelato <sergio.gelato@astro.su.se>
To: linux-edac@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: PATCH: rasdaemon: Don't run ipmitool if use_ipmitool is false (#241)
Message-ID: <amHFxtiMSlRHBnxn@astro.su.se>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="kjFAopSjcQ9CB1K4"
Content-Disposition: inline


--kjFAopSjcQ9CB1K4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The patch below addresses an issue observed on some systems, where rasdaemon
(and sh) would log a failure to invoke ipmitool. The issue has been reported
before (https://github.com/mchehab/rasdaemon/issues/241) by someone else but
is still not fixed in release 0.8.5.

--kjFAopSjcQ9CB1K4
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-Don-t-run-ipmitool-if-use_ipmitool-is-false.patch"

From: Sergio Gelato <Sergio.Gelato@astro.su.se>
Date: Wed, 22 Jul 2026 11:17:12 +0200
Subject: Don't run ipmitool if use_ipmitool is false

It's inappropriate to try and invoke ipmitool when use_ipmitool is false.
This has been observed to cause spurious warnings on systems where ipmitool
is not installed, and may have worse effects where it is.

Signed-off-by: Sergio Gelato <Sergio.Gelato@astro.su.se>

diff --git a/ras-aer-handler.c b/ras-aer-handler.c
index 5d069f3..85d3df7 100644
--- a/ras-aer-handler.c
+++ b/ras-aer-handler.c
@@ -187,21 +187,23 @@ int ras_aer_event_handler(struct trace_seq *s,
 	 * number, byte 16[7:3] is device number, byte 16[2:0] is
 	 * function number
 	 */
-	rc = sscanf(ev.dev_name, "%x:%x:%x.%x", &seg, &bus, &dev, &fn);
-	if (rc == 4) {
-		sel_data[1] = seg & 0xff;
-		sel_data[2] = (seg & 0xff00) >> 8;
-		sel_data[3] = bus;
-		sel_data[4] = (((dev & 0x1f) << 3) | (fn & 0x7));
-
-		snprintf(ipmi_add_sel, sizeof(ipmi_add_sel),
-			 "ipmitool raw 0x0a 0x44 0x00 0x00 0xc0 0x00 0x00 0x00 0x00 0x3a 0xcd 0x00 0xc0 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x",
-			 sel_data[0], sel_data[1], sel_data[2], sel_data[3], sel_data[4]);
-
-		rc = system(ipmi_add_sel);
+	if (use_ipmitool) {
+		rc = sscanf(ev.dev_name, "%x:%x:%x.%x", &seg, &bus, &dev, &fn);
+		if (rc == 4) {
+			sel_data[1] = seg & 0xff;
+			sel_data[2] = (seg & 0xff00) >> 8;
+			sel_data[3] = bus;
+			sel_data[4] = (((dev & 0x1f) << 3) | (fn & 0x7));
+
+			snprintf(ipmi_add_sel, sizeof(ipmi_add_sel),
+				 "ipmitool raw 0x0a 0x44 0x00 0x00 0xc0 0x00 0x00 0x00 0x00 0x3a 0xcd 0x00 0xc0 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x",
+				 sel_data[0], sel_data[1], sel_data[2], sel_data[3], sel_data[4]);
+
+			rc = system(ipmi_add_sel);
+		}
+		if (rc)
+			log(SYSLOG, LOG_WARNING, "Failed to execute ipmitool\n");
 	}
-	if (rc)
-		log(SYSLOG, LOG_WARNING, "Failed to execute ipmitool\n");
 #endif
 
 #ifdef HAVE_OPENBMC_UNIFIED_SEL

--kjFAopSjcQ9CB1K4--
