From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 18 May 2010 15:14:08 -0700
Message-ID: <m1k4r0c0y7.fsf@fess.ebiederm.org>
References: <4BF18995.6070008@redhat.com> <4BF2392A.9040409@jp.fujitsu.com>
	<4BF2C3D1.10009@redhat.com>
	<1274204560.17703.82.camel@Joe-Laptop.home>
	<20100518185305.GA23921@elte.hu>
	<987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100518191802.GG25224@aftab> (Borislav Petkov's message of "Tue\, 18 May 2010 21\:18\:02 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@amd64.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Andi Kleen <andi@firstfloor.org>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

Borislav Petkov <bp@amd64.org> writes:

> From: "Luck, Tony" <tony.luck@intel.com>
> Date: Tue, May 18, 2010 at 03:08:58PM -0400
>
>> > It makes sense to use the kernel's performance events 
>> > logging framework when we are logging events about how the 
>> > system performs.
>> 
>> Perhaps it makes more sense to say that the Linux "performance
>> events logging framework" has become more generic and is really
>> now an "event logging framework".
>
> Yep, that's the idea.
>
>> > Furthermore it's NMI safe, offers structured logging, has 
>> > various streaming, multiplexing and filtering capabilities 
>> > that come handy for RAS purposes and more.
>> 
>> Those of us present at the mini-summit were not familiar with
>> all the features available. One area of concern was how to be
>> sure that something is in fact listening to and logging the
>> error events.  My understanding is that if there is no process
>> attached to an event, the kernel will just drop it.  This is
>> of particular concern because the kernel's first scan of the
>> machine check banks occurs before there are any processes.
>> So errors found early in boot (which might be saved fatal
>> errors from before the boot) might be lost.
>
> Well, we have a trace_mce_record tracepoint in the mcheck code which
> calls all the necessary callbacks when an mcheck occurs. For the time
> being, the idea is to use the mce.c ring buffer for early mchecks and
> copy them to the regular ftrace per-cpu buffer after the last has been
> initialized. Later, we could switch to a another early bootmem buffer if
> there's need to.
>
> Also, we want to have a userspace daemon that reads out the mces from
> the trace buffer and does further processing like thresholding etc in
> userspace.
>
> Concerning critical errors, there we bypass the perf subsystem and
> execute the smallest amount of code possible while trying to shutdown
> gracefully if the error type allows that.
>
> These are the rough ideas at least...

Can someone please tell me why everyone is eager to squirrel
correctable error reports away and not report them in dmesg? aka
syslog.

I have had on several occasions a machine with memory errors that
mcelog or the BIOS was eating the error reports and not putting them
anywhere a normal human being would look.

If your system isn't broken correctable errors are rare.  People look
at syslog.  People look in /var/log/messages and dmesg when something
goes weird.

I have no problem with additional interfaces to provide additional
functionality but please can we put errors where people can find them.

Eric
