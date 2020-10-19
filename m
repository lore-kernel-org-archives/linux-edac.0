Return-Path: <SRS0=Kk5s=D2=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4575DC433DF
	for <linux-edac@archiver.kernel.org>; Mon, 19 Oct 2020 20:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7CD0223FB
	for <linux-edac@archiver.kernel.org>; Mon, 19 Oct 2020 20:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="StRsUcPT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729542AbgJSUIQ (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:08:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21320 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727068AbgJSUIO (ORCPT
        <rfc822;linux-edac@vger.kernel.org>);
        Mon, 19 Oct 2020 16:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603138093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=KK+mSkHQM5HW+MdXjp7VAFTxoyS91vnFOwsUGhSxPmk=;
        b=StRsUcPTszv4JEfQCZoD3nhL7TVFtmE7h8Y0pqybVhj40oleyGkOhmBq/+P+JwIjte8xk8
        PyCqj1+2DfuAnocsqk1VlQiqtEXUHYmK/i2ibZG1OxsVbVYmKkUyah/uNRLD2BN9itIeJv
        lKj/sue3vE4SoXHiHe4o8MUhMg4xW68=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-YZDP4DmHNtm1jfz9XEH9BA-1; Mon, 19 Oct 2020 16:08:09 -0400
X-MC-Unique: YZDP4DmHNtm1jfz9XEH9BA-1
Received: by mail-qk1-f199.google.com with SMTP id f126so560860qke.17
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2020 13:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KK+mSkHQM5HW+MdXjp7VAFTxoyS91vnFOwsUGhSxPmk=;
        b=H2Vuk6iT07GUXrqOg4+fV0aAYVO1r39sJiAEtqKGtPXy04pTEnkOn5Up9Df1qWx0il
         sDziHhVF8OVhAu4kS9Fu44itqzhG2lRaQnQqAu61XPQ6ge+BoGO8VtLbhu5WjpWwaAx0
         NzhunJxdUFykTOwPeHObMdS7c0sBID6y+R3zOJlxWoQ2L5dfOYOF0WukxjUli4YuHZSh
         KoRYnN7/eiQC6YLv2HVXEH2E1pwiNbStmDvRNMTPXKi+5nNbhRV313evz85MLOzoKxJ3
         cDQChJEXNTqIV5MMcBasISt6iT1rTR9CVb/gymriTFB4zp4pBFE+vUvdyVR68WIOCPWp
         BB0w==
X-Gm-Message-State: AOAM5337smNvm4TyZD5dMW+rM6M56Y+llmjfsgk6wW+DghORtM4qhdgx
        V5I2Of3UYHYRuiIZJ4phSAPhDofsIqKIkcuQD53z3PKwNU8ycOzQvbQpmGPwXEUvoVcbuWTRQFo
        D/K73ygA91ia9krqusLICKg==
X-Received: by 2002:a0c:85e3:: with SMTP id o90mr1341843qva.46.1603138089415;
        Mon, 19 Oct 2020 13:08:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/B0cMfcKSl+OJKqaoY4gQIekN4uoRC3m2jozT4QZRyFc8HTBa07dDHNkHwR5uD/T2TIbMmg==
X-Received: by 2002:a0c:85e3:: with SMTP id o90mr1341824qva.46.1603138089200;
        Mon, 19 Oct 2020 13:08:09 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id u2sm369407qtw.40.2020.10.19.13.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:08:08 -0700 (PDT)
From:   trix@redhat.com
To:     tony.luck@intel.com, bp@alien8.de, tglx@linutronix.de,
        mingo@redhat.com, hpa@zytor.com
Cc:     x86@kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] x86/mce: remove unneeded break
Date:   Mon, 19 Oct 2020 13:08:03 -0700
Message-Id: <20201019200803.17619-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---
 arch/x86/kernel/cpu/mce/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 1c08cb9eb9f6..16ce86aed8e2 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1811,11 +1811,9 @@ static int __mcheck_cpu_ancient_init(struct cpuinfo_x86 *c)
 	case X86_VENDOR_INTEL:
 		intel_p5_mcheck_init(c);
 		return 1;
-		break;
 	case X86_VENDOR_CENTAUR:
 		winchip_mcheck_init(c);
 		return 1;
-		break;
 	default:
 		return 0;
 	}
-- 
2.18.1

