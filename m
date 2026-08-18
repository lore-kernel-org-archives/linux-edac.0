Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841542EEE85;
	Tue, 18 Aug 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044176; cv=none; b=OwCJYyR6KhnXT5Qvk7HK0CE/+zn89LKMarSx6drQufpneRVRwQ2G0mwKT3YJwmgNmzqXlMLMteREhFiM2ydJWOaENccfclieaKx/u6i9AtuvXBB6AceWlCW9X0tI9UF8zMCHpLSivXsTv6ztzs0Ll39/V9U1FyMAMuk0z09+nhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044176; c=relaxed/simple;
	bh=bXX6VMuwN5vpkRKRyZFkzSURVdn8r4QGhy01FbnZOY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OQUZLsisEo5iv2pA78Oe52iyvFEVI+LLyo9tEqy3gQXL0BReNr2xuPnBiGvpBcEHImGoNKmOLvEiX656CDz+HBJmcVAWch22lcOUi5le5Rr0sr4QqAsrbvFRVsLQdXB4SBS70XlgUQa+1Sz6pkl+bWQrFCMTosb1P83QXRGT4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRoWIXJv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRoWIXJv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B567F1F000E9;
	Tue, 18 Aug 2026 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787044175;
	bh=Y4wKTOkEo+qgiglva+vd3wu6GyhsefRmXAzxmdPiYKI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IRoWIXJvw+JeYbi4ifKUlhsE2/Ai333GLiie0ICqbngxqnGalBCEC9i15ToDOm780
	 FgfxYQ7MGu8/BwmJlRMSdYtyFuRmZ1KnjQMkj7AHDenHiajn2FE/Gf4DpD4pGPT2C7
	 lLEt8KBxAWzNydf7Fg/bmA1OdDi89VNthNPjAFbf1W6jnH8h9DmwebZiF8yoTT5PP6
	 hPA5AzG+k5p239EzZFRuYlW1wuE9wCmDHvKq6+wpPq3+VhRgqP2bv3SfTu4Ac4RICJ
	 V+82tvWBIsVooAEkv5W/Idd4eNlz0/gihmpajlVSnpw2ba9qZcCwk1j4cDjZm8TFvQ
	 XfeTNAEWiZ3Yw==
From: Thomas Gleixner <tglx@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org
Subject: Re: [syzbot] [kernel?] general protection fault in timers_dead_cpu
In-Reply-To: <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13> <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local>
Date: Tue, 18 Aug 2026 11:09:32 +0200
Message-ID: <878q63lrqr.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 17 2026 at 17:18, Borislav Petkov wrote:
> On Mon, Aug 17, 2026 at 04:55:53PM -0700, Borislav Petkov wrote:
>> On Mon, Aug 17, 2026 at 11:14:35PM +0200, Thomas Gleixner wrote:
>> >  timers_dead_cpu()
>> >    migrate timer to CPU0
>> >    
>> >    // Migrates the MCE timer of CPU1, which is a bug in itself
>> 
>> Stupid question: can we prevent this?
>> 
>> As in, this timer is not migratable, do not migrate it.

We could do that, but that's just papering over the underlying issues.

>> But then what do you do with a timer which is not migratable and its CPU goes
>> offline?
>> 
>> Perhaps cancel it...

Yes, but that's not really well defined.

>> It won't matter in the MCE case, that's for sure.

Correct. You still have CMCI ...

>> Anyway, just some musings from reading this...
>
> Hmm, the down path does timer_delete_sync() so I guess I'm missing an aspect
> here about the timer migration.

Care to read my first reply where I described exactly how that happens?

The timer is rearmed by that sysfs muck _after_ the down callback
deleted it. And the same happens to CMCI. The down callback stops it and
the sysfs muck reenables it.

Alternatively we can split the hotplug callbacks and have one in the
late stage of hotplug after the point of no return, which stops the
timer and CMCI. Then let the existing one only care about the device
stuff which requires task context. Something like the untested below.

Thanks,

        tglx
---
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2762,23 +2762,33 @@ static int mce_cpu_dead(unsigned int cpu
 	return 0;
 }
 
-static int mce_cpu_online(unsigned int cpu)
+static int mce_cpu_starting(unsigned int cpu)
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
-	mce_device_create(cpu);
-	mce_threshold_create_device(cpu);
 	mce_reenable_cpu();
 	mce_start_timer(t);
 	return 0;
 }
 
-static int mce_cpu_pre_down(unsigned int cpu)
+static int mce_cpu_dying(unsigned int cpu)
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
 	mce_disable_cpu();
 	timer_delete_sync(t);
+	return 0;
+}
+
+static int mce_cpu_online(unsigned int cpu)
+{
+	mce_device_create(cpu);
+	mce_threshold_create_device(cpu);
+	return 0;
+}
+
+static int mce_cpu_pre_down(unsigned int cpu)
+{
 	mce_threshold_remove_device(cpu);
 	mce_device_remove(cpu);
 	return 0;
@@ -2841,6 +2851,14 @@ static __init int mcheck_init_device(voi
 				mce_cpu_dead);
 	if (err)
 		goto err_out_mem;
+	/*
+	 * Invokes mce_cpu_starting() on all CPUs which are online when
+	 * the state is installed.
+	 */
+	err = cpuhp_setup_state(CPUHP_AP_X86_MCE_STARTING, "x86/mce:starting",
+				mce_cpu_starting, mce_cpu_dying);
+	if (err < 0)
+		goto err_out_starting;
 
 	/*
 	 * Invokes mce_cpu_online() on all CPUs which are online when
@@ -2856,6 +2874,9 @@ static __init int mcheck_init_device(voi
 	return 0;
 
 err_out_online:
+	cpuhp_remove_state(CPUHP_AP_X86_MCE_STARTING);
+
+err_out_starting:
 	cpuhp_remove_state(CPUHP_X86_MCE_DEAD);
 
 err_out_mem:
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -186,6 +186,7 @@ enum cpuhp_state {
 	CPUHP_AP_HRTIMERS_DYING,
 	CPUHP_AP_TICK_DYING,
 	CPUHP_AP_X86_TBOOT_DYING,
+	CPUHP_AP_X86_MCE_STARTING,
 	CPUHP_AP_ARM_CACHE_B15_RAC_DYING,
 	CPUHP_AP_ONLINE,
 	CPUHP_TEARDOWN_CPU,




