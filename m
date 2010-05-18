From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Wed, 19 May 2010 00:29:24 +0200
Message-ID: <20100518222924.GA3151@elte.hu>
References: <4BF18995.6070008@redhat.com>
 <4BF2392A.9040409@jp.fujitsu.com>
 <4BF2C3D1.10009@redhat.com>
 <1274204560.17703.82.camel@Joe-Laptop.home>
 <20100518185305.GA23921@elte.hu>
 <987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
 <20100518191802.GG25224@aftab>
 <m1k4r0c0y7.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <m1k4r0c0y7.fsf@fess.ebiederm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Borislav Petkov <bp@amd64.org>, "Luck, Tony" <tony.luck@intel.com>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Andi Kleen <andi@firstfloor.org>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org


* Eric W. Biederman <ebiederm@xmission.com> wrote:

> > [...]
> >
> > Concerning critical errors, there we bypass the perf 
> > subsystem and execute the smallest amount of code 
> > possible while trying to shutdown gracefully if the 
> > error type allows that.
> >
> > These are the rough ideas at least...
> 
> Can someone please tell me why everyone is eager to 
> squirrel correctable error reports away and not report 
> them in dmesg? aka syslog.
> 
> I have had on several occasions a machine with memory 
> errors that mcelog or the BIOS was eating the error 
> reports and not putting them anywhere a normal human 
> being would look.

That's possible too - the TRACE_EVENT() of MCE events, 
beyond the record format, also includes a human-readable 
ASCII output format string:

 # tail -1 /debug/tracing/events/mce/mce_record/format

 print fmt: "CPU: %d, MCGc/s: %llx/%llx, MC%d: %016Lx, 
 ADDR/MISC: %016Lx/%016Lx, RIP: %02x:<%016Lx>, TSC: %llx, 
 PROCESSOR: %u:%x, TIME: %llu, SOCKET: %u, APIC: %x", 
 REC->cpu, REC->mcgcap, REC->mcgstatus, REC->bank, 
 REC->status, REC->addr, REC->misc, REC->cs, REC->ip, 
 REC->tsc, REC->cpuvendor, REC->cpuid, REC->walltime, 
 REC->socketid, REC->apicid

Which could be used to printk events.

Cheers,

	Ingo
