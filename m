Received: from mail-oa1-f78.google.com (mail-oa1-f78.google.com [209.85.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3929449B29
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 17:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518133; cv=none; b=X9Im6xA+DxOQUA8b6VzTRPqNPs7coVSbnShVYRrn5TBQqaIT5VNK2SzwV+ASRpzW01WphVPwomgKJbAFhQxdmuM5UmbmoVWldDqIDHD+qVmp0XLN8wXP4wfAnMdJffD7YdRpAoqZekrfw/tb2k82ttVMajqGQg78j0jhvO9D3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518133; c=relaxed/simple;
	bh=ovOmtVRGA+9UCv91IqxnV8D55yOV4FRkp86Sy2M0jOU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ONOjyLPc7XdSn3Sge5/+P/0VRr1KyH+n5+xNeyCsmnW9D5dBCuTI+WSkZb1KjW3cMVRpyKEKuHjr1qkF4eaWVerp9MupyqWqKAb/8FNsgAlLv9lcXIxE6O0IToGyvFbltPq1ADrNSLJOqvul6ee9KxADAsQ8o2PUfkcPRMqbCcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-456b5122c7cso2424980fac.1
        for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518130; x=1786122930;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1tKzC4IieKBXh0vW57jNwGxCGNIuXug3aI/M/iOYXU=;
        b=m2WC2etYJfu50BemLTum+nwUhZIpwz+1sSj4Wlj+VPs2JiWt++ccP1CeqSDy7e/925
         NDIgOMZ2n9yzJ2QFq2oFGWL8rzRvEiMw77PNIo0hnLnk+jHM0xrWxdGEGuowquRjE6MA
         eKaKNoBxufWwAngwwcpc5uC70bjTje/a/bMMNPU+yOLRTjcyNPV3Lm+J5m4LoEbtBVuJ
         LFw/xKHnG47c9mwcSUfXku/torjFbhQraA6m7gZmRIETqKvex0EZdubdYwTE2CpIJmPM
         KuPjafI3C901X2kYfzflAnxgzb2pkStzAXWXoAZBFrwnFw0hBZYZJ3glHTSQbEP+GNzc
         IDWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpy6PqF146EocIOueGrWTlYaJTtGxSRNyx3tnHmu3vk6Qwn4jLtWvW739io4XQRJzLouFvq83z1kk4e@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDPaELYTSDYfZWC8i5hRuQUqSKiBJEPQusgr5e7oXsqQIjVWV
	ZTp4L7tuacB1onOtwUk+lzo08yJgIZXxFngAVoa0Zhk5ii9jCpHuPlBaMIPN45h9lcR2lYqKBnc
	ebKEJkpvvu+EXzraub2KHsxd1wmww1VBW32g27RJ5NaHYvoUcQ0rgkSuvySA=
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0d:b0:495:ca1b:7865 with SMTP id
 5614622812f47-4ae318da863mr3238166b6e.11.1785518130646; Fri, 31 Jul 2026
 10:15:30 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:15:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6cd832.1aa927e4.17d4bf.0008.GAE@google.com>
Subject: [syzbot] [edac?] general protection fault in detach_timer (3)
From: syzbot <syzbot+edc6b57cbed1fb72d0f9@syzkaller.appspotmail.com>
To: bp@alien8.de, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, syzkaller-bugs@googlegroups.com, tglx@kernel.org, 
	tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=17ba25b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
dashboard link: https://syzkaller.appspot.com/bug?extid=edc6b57cbed1fb72d0f9
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13334aea580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=156ce249580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6836f8efb1da/disk-cc2b5f62.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0109d3477cc7/vmlinux-cc2b5f62.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2e49e350bbf/bzImage-cc2b5f62.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+edc6b57cbed1fb72d0f9@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xfbd59c0000000025: 0000 [#1] SMP KASAN PTI
KASAN: maybe wild-memory-access in range [0xdead000000000128-0xdead00000000012f]
CPU: 0 UID: 0 PID: 16 Comm: ktimers/0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:__hlist_del include/linux/list.h:1031 [inline]
RIP: 0010:detach_timer+0x120/0x2d0 kernel/time/timer.c:891
Code: c1 e8 03 80 3c 28 00 74 08 4c 89 e7 e8 a9 51 80 00 4d 89 3c 24 4d 85 ff 74 46 e8 cb f9 13 00 49 83 c7 08 4c 89 f8 48 c1 e8 03 <80> 3c 28 00 74 08 4c 89 ff e8 82 51 80 00 4d 89 27 80 7c 24 04 00
RSP: 0018:ffffc90000157af8 EFLAGS: 00010802
RAX: 1bd5a00000000025 RBX: 1ffff110170e4694 RCX: ffff88801daf8000
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000100
R10: dffffc0000000000 R11: fffffbfff1fa1890 R12: ffffc90000157c00
R13: ffff8880b87234a8 R14: 1ffff110170e4695 R15: dead00000000012a
FS:  0000000000000000(0000) GS:ffff8881259f2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7a50cf012d CR3: 000000004485e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 expire_timers kernel/time/timer.c:1782 [inline]
 __run_timers kernel/time/timer.c:2374 [inline]
 __run_timer_base+0x5f8/0x9b0 kernel/time/timer.c:2386
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
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__hlist_del include/linux/list.h:1031 [inline]
RIP: 0010:detach_timer+0x120/0x2d0 kernel/time/timer.c:891
Code: c1 e8 03 80 3c 28 00 74 08 4c 89 e7 e8 a9 51 80 00 4d 89 3c 24 4d 85 ff 74 46 e8 cb f9 13 00 49 83 c7 08 4c 89 f8 48 c1 e8 03 <80> 3c 28 00 74 08 4c 89 ff e8 82 51 80 00 4d 89 27 80 7c 24 04 00
RSP: 0018:ffffc90000157af8 EFLAGS: 00010802
RAX: 1bd5a00000000025 RBX: 1ffff110170e4694 RCX: ffff88801daf8000
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000100
R10: dffffc0000000000 R11: fffffbfff1fa1890 R12: ffffc90000157c00
R13: ffff8880b87234a8 R14: 1ffff110170e4695 R15: dead00000000012a
FS:  0000000000000000(0000) GS:ffff8881259f2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7a50cf012d CR3: 000000004485e000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	c1 e8 03             	shr    $0x3,%eax
   3:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
   7:	74 08                	je     0x11
   9:	4c 89 e7             	mov    %r12,%rdi
   c:	e8 a9 51 80 00       	call   0x8051ba
  11:	4d 89 3c 24          	mov    %r15,(%r12)
  15:	4d 85 ff             	test   %r15,%r15
  18:	74 46                	je     0x60
  1a:	e8 cb f9 13 00       	call   0x13f9ea
  1f:	49 83 c7 08          	add    $0x8,%r15
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 ff             	mov    %r15,%rdi
  33:	e8 82 51 80 00       	call   0x8051ba
  38:	4d 89 27             	mov    %r12,(%r15)
  3b:	80 7c 24 04 00       	cmpb   $0x0,0x4(%rsp)


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
