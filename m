Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D3B264F80;
	Mon, 17 Aug 2026 22:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004901; cv=none; b=ZERTZsDbOsamEWWDYvrZgQo6frR0v6bazfs2ol1kR0AwPOI+R0LoCCqaberBSgSX9lQdJzPc2gcFZdgspOsKb6Dex57vWtF5DKb5tVeicS4nmtKQh7rd06YjzFQ4kqxBKMutYT+QrOM02l33laI24iyia4TLQZBCANej99GG09A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004901; c=relaxed/simple;
	bh=mr3qY3hwG6RSgJMN9eX39Gn2wqvL9qRryygX1/CkFdM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bl31NBxI/lEcGEISlEpcX5GB6VGQdLYQ//MNyvTDmS4765xuy8auMqfzh+HjoCZWeNBuuNvKRR4PiKJFcNfzNdCMRBCeYhuYjszicanfMqU1FSR3fNgB16NazliaUhpfPx4t2fZDRsJpvRusnorxPzcqDGtvyblbFYxYrJtHx4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1F1TMOV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1F1TMOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1531F000E9;
	Mon, 17 Aug 2026 22:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787004900;
	bh=hmjgS7EDU1decfxdl9rAuWlnaC8GAizbEJhFxkHXiGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=R1F1TMOVe8aKxG4hGaIxip0ry81a7J5ZXVg9DvZjla40XnYbtoGzCExhvn06x4llk
	 D+mWDS8zoPSPCwLjymn1CqUp/qhyXihHTkBn2STfr+4XwjnUqZcMKotQCi6mhojG4s
	 dqgL5Tm8wPPCrTHi0UPyyWXxwqoLHc8ny6GzNeGqvsy7GhiINlJPR4iRXUwBx/pogZ
	 uq7yJwPnxD9n4C5v7DizbVNYCFUKsQj9r0Yc6xqcdiiB2Bh98Y8FCwTSCJAhMbbZ7Y
	 /M6ZNeUgik7ezrr0tgdgToZ3hKHKhrhIUuAQR5c/jQXlMc2vHeG9chie5YF5Yd8YYV
	 tyiCxwhqdyzbQ==
From: Thomas Gleixner <tglx@kernel.org>
To: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH] timer: Keep debugobjects state consistent in
 migrate_timer_list()
In-Reply-To: <87ik58la9w.ffs@fw13>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
Date: Tue, 18 Aug 2026 00:14:57 +0200
Message-ID: <87bjb0l7ha.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

When timers are migrated away from an offline CPU the debugobjects state
gets corrupted. The timer is accounted as inactive on deletion, but the
enqueue on the alive CPU lacks the activation call.

That used to work, but got broken when the trace point and the debug
objects call got separated. That change missed to fixup
migrate_timer_list().

Add the missing debug_timer_activate() invocation to fix it.

Fixes: dc1e7dc5ac62 ("timer: Move trace point to get proper index")
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: stable@vger.kernel.org
---
 kernel/time/timer.c |    1 +
 1 file changed, 1 insertion(+)

--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -2492,6 +2492,7 @@ static void migrate_timer_list(struct ti
 		timer = hlist_entry(head->first, struct timer_list, entry);
 		detach_timer(timer, false);
 		timer->flags = (timer->flags & ~TIMER_BASEMASK) | cpu;
+		debug_timer_activate(timer);
 		internal_add_timer(new_base, timer);
 	}
 }
