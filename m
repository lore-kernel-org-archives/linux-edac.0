Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3D445AFF
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518205; cv=none; b=Wp+FsNlGA8NY2PbwZvdbjLCY7O1YdPK1ChSRvMdlGyDmHWeX9qgMqJu0oTBm49HBPXeVoEBPBYq+5Wq35/vmhzPiseL965k1ktuTknutWWj/i7TZvrO2vlJy22BYZ7NKM2QVrHRAg0gmKTvfVW2PHfY4sP/39u/MXueqdxvo3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518205; c=relaxed/simple;
	bh=xMGeDtcpxKbM8aZ5VHSbp7l1Nc3511PndfBjvKjnd2c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KdgaixNld4S5zsIE7680tpqWo1nRK9mJJm+cKH4Th9ZgkLZyC2xsXck8prfooA3d5FHrkLq4oY36WGt0G1nz0mtqym6T/bwEBldhchNE8cYYc4SZ1TjEGgRljKNc4oGTDpVVj1c8HXs0T6ayBu47UpmFGWfBUTofsOCET3grhY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-451acf33124so642194fac.0
        for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 10:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518203; x=1786123003;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVgIYaTNliJGOLn8A0IvekqRcTBCIAB3DyxW591u3MQ=;
        b=lb5ci9OsF41FlSfbA4NCarasmu1hwT5qzLbXAdiX+gtTSQmDeRww5xb5el8d09qmAU
         nw/mnA0aYmNpmRLjXjBFPakLj6PMjvP6K37ICXydOAXThHj2pCbTq1AOafMjBprATO6E
         5LtwD3TzKc9ZgsBY93l30wHT8YVLiClIIRVDww0MIyezW0GPNBAxg9Dir9KU5qcnXRw0
         LozbqUKxijXjwBvWFuMDG8tKWUKAAMQeBmZxE9gv3VOsygc2S0+iqizTLWUI0Xi8pTFn
         lkQ5LmtWIINu+RSiI4JJbsF6/NSxiOTr7kEMOqayY9QoxRLgopjjMf2pPeZwHfohkLm7
         JCsg==
X-Forwarded-Encrypted: i=1; AHgh+RrafgvOy8Tmi1onl+rJZWSGe5PrRPzMP02QZd0E3NClW4tu9q062KU18n2fen8XPR1gsM5VUyYUuHNu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3/tSgby8KY8wPBV9E9UcHNNLL65rmorw6oNp60czIMtgJNB+
	5PyAI5zWPeC1b5IawlrxhoMNG+D68ERf7OMrFaf0IIYVXgXEX8Rb+rr0SqZGS3iKn3rheIegwf4
	w0CH1E9ntK5i6KZBnT+2XBd3bxqy59wwtIwL5sKFv9+Z46n78r2HGWQVvqJQ=
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:191f:b0:4a3:fb6c:9adf with SMTP id
 5614622812f47-4af5e1d35e2mr1370032b6e.12.1785518203220; Fri, 31 Jul 2026
 10:16:43 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:16:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6cd87b.2d659fcc.1d46f5.019c.GAE@google.com>
Subject: [syzbot] [edac?] WARNING in mce_timer_fn
From: syzbot <syzbot+9d17de59c48d71bd6824@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, tony.luck@intel.com, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1304e249580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
dashboard link: https://syzkaller.appspot.com/bug?extid=9d17de59c48d71bd6824
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14efd632580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6836f8efb1da/disk-cc2b5f62.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0109d3477cc7/vmlinux-cc2b5f62.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2e49e350bbf/bzImage-cc2b5f62.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9d17de59c48d71bd6824@syzkaller.appspotmail.com

------------[ cut here ]------------
cpu_t != t
WARNING: arch/x86/kernel/cpu/mce/core.c:1770 at mce_timer_fn+0x23f/0x280 arch/x86/kernel/cpu/mce/core.c:1770, CPU#0: ktimers/0/16
Modules linked in:
CPU: 0 UID: 0 PID: 16 Comm: ktimers/0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:mce_timer_fn+0x23f/0x280 arch/x86/kernel/cpu/mce/core.c:1770
Code: 00 75 0a e8 93 3b 55 00 e9 16 ff ff ff e8 89 3b 55 00 4c 8b 1d f2 b1 af 0c 2e 2e 2e 41 ff d3 e9 ff fe ff ff e8 72 3b 55 00 90 <0f> 0b 90 e9 33 fe ff ff e8 64 3b 55 00 48 c7 c7 a0 20 20 8e 4c 89
RSP: 0018:ffffc90000157a08 EFLAGS: 00010246
RAX: ffffffff8170683e RBX: ffff8880b87234a0 RCX: ffff88801daf8000
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000100
R10: dffffc0000000000 R11: ffffffff81706600 R12: 0000000000000000
R13: dffffc0000000000 R14: ffffffff8dc427d0 R15: ffff8880b87234a0
FS:  0000000000000000(0000) GS:ffff8881259f2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f08d99b56c8 CR3: 000000003fe3e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 call_timer_fn+0x192/0x5e0 kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1799 [inline]
 __run_timers kernel/time/timer.c:2374 [inline]
 __run_timer_base+0x67b/0x9b0 kernel/time/timer.c:2386
 run_timer_base kernel/time/timer.c:2395 [inline]
 run_timer_softirq+0x67/0x170 kernel/time/timer.c:2403
 handle_softirqs+0x1d9/0x6c0 kernel/softirq.c:626
 __do_softirq kernel/softirq.c:660 [inline]
 run_ktimerd+0x69/0x100 kernel/softirq.c:1155
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
