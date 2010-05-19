From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 18 May 2010 18:14:09 -0700
Message-ID: <m1wrv0zo9q.fsf@fess.ebiederm.org>
References: <4BF18995.6070008@redhat.com> <4BF2392A.9040409@jp.fujitsu.com>
	<4BF2C3D1.10009@redhat.com>
	<1274204560.17703.82.camel@Joe-Laptop.home>
	<20100518185305.GA23921@elte.hu>
	<987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	<20100518222832.GJ22675@basil.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100518222832.GJ22675@basil.fritz.box> (Andi Kleen's message of "Wed\, 19 May 2010 00\:28\:33 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Kleen <andi@firstfloor.org>
Cc: Borislav Petkov <bp@amd64.org>, "Luck, Tony" <tony.luck@intel.com>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

Andi Kleen <andi@firstfloor.org> writes:

> The original motivation to put them somewhere else
> because I was sick of people reporting them as kernel bugs.

This suggests that to get things reported in dmesg I should
setup a cron job that pulls the latest kernel checks to see
if things are reported into syslog and sends you an email
if things are wrong.

I'm not ready to believe the average person that is running linux
is too stupid to understand the difference between a hardware
error and a software error.

> But there's more to it now:
>
>> If your system isn't broken correctable errors are rare.  People look
>
> Actually the more memory you have the more common they are.
> And the trend is to more and more memory.

The error rate should not be fixed per bit but should be roughly fixed
per DIMM.  If the error rate over time is fixed per bit we are in deep
trouble.

> Really to do anything useful with them you need trends
> and automatic actions (like predictive page offlining)

Not at all, and I don't have a clue where you start thinking
predictive page offlining makes the least bit of sense.  Broken
or even weak bits are rarely the common reason for ECC errors.

> A log isn't really a good format for that

A log is a fine format for realizing you have a problem.  A
log doesn't need to be the only place errors are reported
but a log should be the default place ECC errors are reported.
We do that with hard drive errors and other kinds of hardware
errors and we have done it for years without problems.

My experience is that correctable ECC errors come in two kinds of
frequencies.

- The expected single bit correctable error range.  Which is somewhere
  between once a month and once a year per dimm.

  On the most unreasonable configuration I ever worked with. 4TB of ram
  in 1GB sticks up at Los Alomos, at 7000ft in an environment know
  to trigger errors I saw roughly one correctable ECC error an hour.
  Huge but just barely within the expected range.

  I can live with a log message once a month on a mundane system.

- Errors that occur frequently. That is broken hardware of one time or
  another.  I want to know about that so I can schedule down time to replace
  my memory before I get an uncorrected ECC error.  Errors of this kind
  are likely happening frequently enough as to impact performance.

Eric
