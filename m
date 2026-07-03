Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B78331EB6
	for <linux-edac@vger.kernel.org>; Fri,  3 Jul 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076163; cv=none; b=pQntWJbsqC9oFU5yvVxMQkEhSPvA/YzHwRv1OO1faBt9koFw8wstyvX5I3fGoGp9qJMEQKhoiKK4x65jPEI5y2ozbtD0K03U9hGmjmoSC+7SNfkSY36xs5p0ldUPmJkjPqNn4Idjm0Y/iARte7G9lf6GphjLSNwyn+vA0Hfa7v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076163; c=relaxed/simple;
	bh=CysIEitqp1oNzJv6Deauzq2RHdEl1YZFF9v4KWs0/G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0KYTINwnrOwf7DpN6Qq8mLPHwPm7ZO9BM+QjoWsmSLpt+s3a44ypwn7fVfjBvl634+RS+RlbToSMW15nnpB7bOFoyo4JN6FQoawMpgT9Q2gDMHSMvVMRm+YPTudSCAzndAkrqhW8cskRQD+pxAbAQEiGIv92+VT3t9zwAfBx7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=nkLkfYy0; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=DmqbU3lO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="nkLkfYy0";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="DmqbU3lO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6000B72B2C;
	Fri,  3 Jul 2026 10:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783076160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgeHEWTbKCxupD5KWfTfkROU3v6F+9xYkZiAAsFH+/8=;
	b=nkLkfYy0VV13pNlEi4yra4EUIQsECS8JiQAFEjdWghMpd/BooMKnx1J/YqF5TWPcj9MySA
	v+NjuMty5Mnc2aPf1rC4QSusGzdACOL5FBTP51YyleFu3d0IJwTqM4dzyj09Zap641nne+
	koX0d/31uQekCsLEN0WduXMPV1sFcdU=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=DmqbU3lO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783076159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgeHEWTbKCxupD5KWfTfkROU3v6F+9xYkZiAAsFH+/8=;
	b=DmqbU3lOe3mQfWbjlAJLNvHjo/45rHf+M7PNiMPXfj+4mV79nJmH6VCSbcp6E90dED8Vz3
	I5HoPIQSS23Mxw6JhnBx9/tfq7u+xN59xolyjIfxoanaB9oY2/Nf7GJsNwK4uP9QGNblne
	ElrHAwKt7ECZ7U4Jlwy+/mB02Mb3ajE=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09B29779AA;
	Fri,  3 Jul 2026 10:55:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b6ZXAD+VR2q+SAAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 03 Jul 2026 10:55:58 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-edac@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] x86/mce: Fix build warning after MSR-interface switch
Date: Fri,  3 Jul 2026 12:55:55 +0200
Message-ID: <20260703105555.1758819-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629060526.3638272-9-jgross@suse.com>
References: <20260629060526.3638272-9-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6000B72B2C
X-Spam-Score: -3.01

The recent switch to 64-bit MSR interfaces introduced a build warning.

Fix it.

Fixes: cff219368bd0 ("x86/mce: Stop using 32-bit MSR interfaces")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607031726.ZOwu4snu-lkp@intel.com/
Signed-off-by: Juergen Gross <jgross@suse.com>
---
Said patch is in tip only right now, so this patch could either be added
on top or be folded into the original patch.
---
 arch/x86/kernel/cpu/mce/p5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/p5.c b/arch/x86/kernel/cpu/mce/p5.c
index eb99f384d747..3c2b6cc918b1 100644
--- a/arch/x86/kernel/cpu/mce/p5.c
+++ b/arch/x86/kernel/cpu/mce/p5.c
@@ -44,7 +44,7 @@ noinstr void pentium_machine_check(struct pt_regs *regs)
 /* Set up machine check reporting for processors with Intel style MCE: */
 void intel_p5_mcheck_init(struct cpuinfo_x86 *c)
 {
-	u64 q;
+	u64 __maybe_unused q;
 
 	/* Default P5 to off as its often misconnected: */
 	if (!mce_p5_enabled)
-- 
2.54.0

