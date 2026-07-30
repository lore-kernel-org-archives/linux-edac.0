Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64B43F0A2
	for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423370; cv=none; b=lha/7+wB5HdEyRRyOROH+auZ36uK5pASdukmGm0Bdzr2weGEY4M7zbj5UbnARkcduRLlHQtzyi08JoO8cETkJtUUEbC7QOS+ubdaYijYI89ZySW55hocVGVl1/PkPAZcfdmahuAhPtiDNkQNkvRxI4srmGJRYNMnyOWxmvcXRMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423370; c=relaxed/simple;
	bh=1IwhCeOSGfHIUTSp68RI4myZPbDSYzd3+jmAO1Nv/P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZQP5LvJTgNnXAlwGCw/pgj6+SwpthvOEjRTKHlZYKCIdO116cKbIJh/MYwDlq7wLyjzICUhYUTA9xPgpl1ITZnpWctRYOYzbDmYYbPsykZUyF0QH5WZd9ho5/cDX+AtmNajtqIDDxKpq2bcfkjNrQhfCpSZkmn9STX8l2CXVM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYpDI9da; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYpDI9da"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49800c6a846so7447585e9.3
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785423367; x=1786028167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehAlYsFHvV0gZg+DHaBIyQIOf2PYndruWsclXbIjl3U=;
        b=lYpDI9daCVt1Q2ec4ABi5C4ig9Xkf4+O6ZYA0/MDXAH/1YGijNjPyEuXi/VoipJL2g
         Si05+FweKJ1sL5lMS3LAfqLYUU4EiM3yuVVtX7j28NUOGXLhNcdkuPK1RjsfgiEkyB+4
         NKy+nGbYdbmIpUtvWF+yy2nEY92LjOJ4Ly2jMSGEtJNzu9SBlXb5GnlX9y4PKKr7F8tY
         O26tU/rSCFeV82bQpyDdlFuG7+dwWPew0oYPvAq21CHCKCfC8i0lacmM6R1H58VXnKtv
         2w73NZ3Ib/pgRGq8/U8z6PkxMXtrByOKFcxC00lIUd1O19gMuNwZLkayeS5RqFw7T9gL
         UzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423367; x=1786028167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehAlYsFHvV0gZg+DHaBIyQIOf2PYndruWsclXbIjl3U=;
        b=M5LkX+EUEO8RPG5PhPUvoCGAX9Slv5/LDkvQhxJCGWB6r50pCOIjgVDAFvVjimizlC
         gjeLJk8iadV03y0X8YpfgoAs+4dSHN48rE5biUycZ8fiaorYxc+nX6doUsyVf2MF+HK8
         yIc67xsac5/6WIzsYdhduaMT8+zPcXdhVl9DgtnP3Qv99PbOyjC0MyDAeOjFS4pJpqk7
         KesnBP1OlMBomwmeUd71GZCXKEiQXT5toNR18RJRleRBDvdlbp+UL3auq+YgWvcJyTrf
         7I23inYLhPGDCINEBn6uu9pF7Tc6vmCmGw5xkCRrkl5a6aRtSn1zUqqMNSQ9y3ThsN5E
         +oQg==
X-Gm-Message-State: AOJu0YyQ5yUEHHSh0J+34YoRhmJFOiAFAUXmVv2INjM6y57HJvo7WBGZ
	51PJ6jRSRNFUHuwJ5e3/RfZE2wqoG9lGePwWAQwqy1ZAVhNEmwOAmlOkLh0Iu7CqGFs=
X-Gm-Gg: AR+sD11IxZvWDh2FFd4LpD+Np2yrWByKk/IYXBkNsAciokrVdRctAUC3fr1d7nvo4wT
	RRM0KNwAxotqpHIDo0HPAv74hj/8hNxqLmKF2j50hYUn3PqfeTvzp6nZOd0h9Z08ppF5aWTEz6O
	0TCYFhXB/+pFj5oo9yLid20ljA//zcTVnEWRrFdaZQLRwFqaScqkPKekl2kkRjH4s1B10fvWp1R
	PpyR9iTjm9rn+DAyL8jD9KuVOzWqbccf0EGqnHyBpQs2p2os1mgHuRdU4D/qsYphH6pKPHP3VR+
	haiJPs8mbAJT+jl4+3Ji5Ca5Z/+oX5+uBT0o1WAQORvjWQa2ruxfZIA1LNrIp61iQ2K7o+z1miV
	3PYHwMyx8lY1dFv/hqVOiirHB8HSacFeqUR4DnF4MlMyH+g/Pexr7L2lTwcJtJewlDIpWzP3SxM
	bdzw/I0xPa0DbwQIrnJ4TeB9nYfIwwgrZswEsrpb/7gWbsUwETqS4eOwEHrbwKlO5X5WkUruLWf
	7Kr62xhurW7Uw/xV7wWkKNw6VPzA7vuqTBkxbo2FCznS7K6GsS6
X-Received: by 2002:a05:600c:470d:b0:495:7538:d4ea with SMTP id 5b1f17b1804b1-4980122085cmr40583505e9.0.1785423366435;
        Thu, 30 Jul 2026 07:56:06 -0700 (PDT)
Received: from fedora ([105.190.201.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d985csm7257138f8f.1.2026.07.30.07.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:56:06 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: linux-edac@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 2/2] EDAC/device: Serialize poll_msec store against device teardown
Date: Thu, 30 Jul 2026 15:55:49 +0100
Message-ID: <20260730145549.148229-2-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730145549.148229-1-inasj268@gmail.com>
References: <20260730145549.148229-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_device_reset_delay_period() unconditionally calls edac_mod_work()
to re-arm the workqueue timer when the poll_msec sysfs attribute is
written. This has two issues:

 1) Interrupt-driven devices (op_state = OP_RUNNING_INTERRUPT) have
    no initialized workqueue, so calling edac_mod_work() would operate
    on uninitialized timer state.

 2) A concurrent write to poll_msec during device removal can race
    with edac_device_del_device(). Even with an OP_OFFLINE state check,
    the check and edac_mod_work() are not atomic, allowing the workqueue
    to be re-armed after teardown.

Fix both by holding device_ctls_mutex around the state check and
edac_mod_work() call in reset_delay_period(), and moving the workqueue
teardown inside the same mutex in del_device(). With the mutex held in
both paths:

  - reset_delay_period() atomically verifies op_state == OP_RUNNING_POLL
    before re-arming; any other state skips the call entirely.
  - del_device() sets OP_OFFLINE and tears down the workqueue while
    holding the mutex, so any racing reset_delay_period() completes
    before teardown or sees OP_OFFLINE and bails.

Also fix the parameter type from unsigned long to unsigned int to match
the poll_msec field, and fix a latent bug where round_jiffies_relative()
received a millisecond value instead of jiffies.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/edac/edac_device.c | 15 +++++++++++----
 drivers/edac/edac_module.h |  2 +-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index 19522c568aa5..3fb4de3ed28c 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -394,17 +394,24 @@ static void edac_device_workq_teardown(struct edac_device_ctl_info *edac_dev)
  *	Then restart the workq on the new delay
  */
 void edac_device_reset_delay_period(struct edac_device_ctl_info *edac_dev,
-					unsigned long value)
+				    unsigned int value)
 {
 	unsigned long jiffs = msecs_to_jiffies(value);
 
 	if (value == 1000)
-		jiffs = round_jiffies_relative(value);
+		jiffs = round_jiffies_relative(jiffs);
+
+	mutex_lock(&device_ctls_mutex);
+	if (edac_dev->op_state != OP_RUNNING_POLL) {
+		mutex_unlock(&device_ctls_mutex);
+		return;
+	}
 
 	edac_dev->poll_msec = value;
 	edac_dev->delay	    = jiffs;
 
 	edac_mod_work(&edac_dev->work, jiffs);
+	mutex_unlock(&device_ctls_mutex);
 }
 
 int edac_device_alloc_index(void)
@@ -492,11 +499,11 @@ struct edac_device_ctl_info *edac_device_del_device(struct device *dev)
 	/* deregister from global list */
 	del_edac_device_from_global_list(edac_dev);
 
-	mutex_unlock(&device_ctls_mutex);
-
 	/* clear workq processing on this instance */
 	edac_device_workq_teardown(edac_dev);
 
+	mutex_unlock(&device_ctls_mutex);
+
 	/* Tear down the sysfs entries for this instance */
 	edac_device_remove_sysfs(edac_dev);
 
diff --git a/drivers/edac/edac_module.h b/drivers/edac/edac_module.h
index 96f6de0c8ff6..e03ec7daa64a 100644
--- a/drivers/edac/edac_module.h
+++ b/drivers/edac/edac_module.h
@@ -56,7 +56,7 @@ bool edac_stop_work(struct delayed_work *work);
 bool edac_mod_work(struct delayed_work *work, unsigned long delay);
 
 extern void edac_device_reset_delay_period(struct edac_device_ctl_info
-					   *edac_dev, unsigned long value);
+					   *edac_dev, unsigned int value);
 extern void edac_mc_reset_delay_period(unsigned long value);
 
 /*
-- 
2.55.0

