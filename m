Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448841;
	b=JiRrtf/xFYkGMtGvH867L9cm0QxQwI1ps9zKWBy+sUJ59gHd2EXb8zREKcetP9Ni8Lxc
	 qYpdo9BvCeGCGyOf4gtTNE3DpSTKZLEEIj1aH+gT+eOAFVAoM8hImHNriPn9yaZfNfdF4
	 Oky7+IBhz8tD17o8cD3W3Y7XTU639DMuC725fa448u6n3B4WMgS8IHudlYF/DRjuLMEOX
	 sW6MgO9xn6HqDKIiCJ5Uj5XBdlq8aNyvyoYw4UIg2Q3LRj7kXzCzQLt3LxbBA9U69gelh
	 pj/6ufKx4DZY7TzlHjwgrwOmYBEmxIB92qyo8isoIMkjB2popzbHLq+jNrNeJVoRK0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448841;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=hMdIfyVj7PF9ML59JLA2Q0M+VPwWPBvPk1LmuPNm3pw=;
	b=vrK6wbIWFJXssnQd6eHnndIsm4Fszbr9S19xlB93J9pRLvLgkdQznH0O1nZHPdCWirsU
	 QQhYPQL6SERoN+09zAPUvz1+RSs8rUVgdxcA5f+PM+JRZGH2ldn5Ca21oxUR6OowNE9Z9
	 5SMxRoLau7YUhbaWCMvj56YT7/rTXvZWfNn0rSUqlTTk0B/l/ys0TARJ4lARMc3vPAZC/
	 KAT/5nZ3szxZjIW+JOzWnuNFs0ZIUfZb8+uMyxdCNR6Fs7/++5p2DKuYC7PfmgecILmhs
	 Ifi2tcGrynhp80BIIKifxByC/jCyPV3zk9l/evWTKFz4oY0TrFHbcTystJgcMAhxdcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED232606A31A
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 22:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED232606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso4137339b6e.2
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 15:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448840; x=1793053640;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hMdIfyVj7PF9ML59JLA2Q0M+VPwWPBvPk1LmuPNm3pw=;
        b=ILt3vVE1qa59M67AhE2ei17K3h9lggm7bds6A8LtgEDhAg9bikmFShdcA3avc9aZl3
         RWHVIhqpljvHjj8o09+XGfFLDoVPB1d3iFIMEX/9nIgtA0GZPO6BcFAv/5sS+2Cn7sto
         uWILKPCC+QuPOBYxv596AoKxhkQfJk2qEPK93wHVeojB2BRVysFSE5ME7Wty0HbKzoj1
         jB2uqJs1THK6twh8wY9F03k3y68uFXzUCSLvgUjfL2ZycNtN0RloRqvhhtGx+yfwqdD0
         CZwjQ+w0Yf8r1Smoy+4pD2ymPZwKehUjqk55qDfnueXGXD5hYOhR5C14ExITFL7BZ6W7
         PUpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL3F8uDyevI0tyebtSOYtxYBrwOg9CEh/VdLYYhPqhz+7mWCM/F0fseSc5H5fwEi8lYfx6gvJPmfAM@vger.kernel.org
X-Gm-Message-State: AFq9FYKXS7dLkajym3YcY2fRwoLV3l9L3giZ6Q1rXMfzVUKckqcWKd3s
	OIOuksKHP+i6u32dyWKtTgnRTB1cVU0ifgOIjZq9/pIdOhtb+xNO/EHiRqtYZcGwY/dHRHOKxzn
	cxrJ5w/l5dCVJd8MCqAyEtc0PlUW+U+pTrWMQDByXdR0xtsMQ5VWvXgmvY+w=
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2387:b0:4d6:92d4:c804 with SMTP id
 5614622812f47-53cd20a090cmr6556751b6e.60.1792448839984; Mon, 19 Oct 2026
 15:27:19 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:27:19 -0700
In-Reply-To: <6ad23c08.7952420f.283480.0348.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad69947.8652420f.25107a.2841.GAE@google.com>
Subject: Re: [syzbot] [edac?] WARNING: ODEBUG bug in mcheck_cpu_init
From: syzbot <syzbot+553c9f2c5781192c2214@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, tony.luck@intel.com, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c03c1a14507d Linux 7.3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=112ccc95580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=553c9f2c5781192c2214
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164119cd580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=132ccc95580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/99fcc4d8c943/disk-c03c1a14.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ba99fd445f9b/vmlinux-c03c1a14.xz
kernel image: https://storage.googleapis.com/syzbot-assets/be10147815f2/bzImage-c03c1a14.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+553c9f2c5781192c2214@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: init active (active state 0) object: ffff8880b85234a0 object type: timer_list hint: mce_timer_fn+0x0/0x280 include/linux/highmem-internal.h:-1
WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230 lib/debugobjects.c:629, CPU#1: swapper/1/0
Modules linked in:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
RIP: 0010:debug_print_object+0x18a/0x230 lib/debugobjects.c:629
Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff e8 0d ac 58 fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 e3 60 d7 0b 48 83 c4 10 5b 41 5c
RSP: 0000:ffffc900001c7c20 EFLAGS: 00010046
RAX: 1ffffffff16df3c0 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: ffffffff8bcc7640 RSI: ffffffff8bcc7240 RDI: ffffffff90bcd1e0
RBP: ffffffff8bcc7640 R08: ffff8880b85234a0 R09: ffffffff8b6fb180
R10: dffffc0000000000 R11: ffffffff81b2b760 R12: 0000000000000000
R13: ffffffff90bcd1e0 R14: ffff8880b85234a0 R15: ffffffff8b6f9e00
FS:  0000000000000000(0000) GS:ffff888124ab9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000efb0000 CR4: 00000000003506b0
Call Trace:
 <TASK>
 __debug_object_init+0x224/0x350 lib/debugobjects.c:818
 debug_timer_init kernel/time/timer.c:788 [inline]
 debug_init kernel/time/timer.c:836 [inline]
 timer_init_key+0x41/0x2c0 kernel/time/timer.c:880
 __mcheck_cpu_setup_timer arch/x86/kernel/cpu/mce/core.c:2087 [inline]
 mcheck_cpu_init+0x3dc/0x600 arch/x86/kernel/cpu/mce/core.c:2262
 identify_cpu+0x1f2c/0x3940 arch/x86/kernel/cpu/common.c:2126
 identify_secondary_cpu+0xaa/0x160 arch/x86/kernel/cpu/common.c:2187
 ap_starting+0x9c/0x150 arch/x86/kernel/smpboot.c:190
 start_secondary+0x66/0x110 arch/x86/kernel/smpboot.c:280
 common_startup_64+0x13e/0x157
 </TASK>
----------------
Code disassembly (best guess):
   0:	f8                   	clc
   1:	48 c1 e8 03          	shr    $0x3,%rax
   5:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
   9:	74 08                	je     0x13
   b:	4c 89 ff             	mov    %r15,%rdi
   e:	e8 0d ac 58 fd       	call   0xfd58ac20
  13:	4d 8b 0f             	mov    (%r15),%r9
  16:	4c 89 ef             	mov    %r13,%rdi
  19:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1e:	48 89 ea             	mov    %rbp,%rdx
  21:	44 89 e1             	mov    %r12d,%ecx
  24:	4d 89 f0             	mov    %r14,%r8
  27:	ff 34 24             	push   (%rsp)
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 83 c4 08          	add    $0x8,%rsp
  33:	ff 05 e3 60 d7 0b    	incl   0xbd760e3(%rip)        # 0xbd7611c
  39:	48 83 c4 10          	add    $0x10,%rsp
  3d:	5b                   	pop    %rbx
  3e:	41 5c                	pop    %r12


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
