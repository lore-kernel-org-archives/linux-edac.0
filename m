From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Thu, 20 May 2010 14:37:16 +0200
Message-ID: <20100520123716.GA2040@elte.hu>
References: <1274204560.17703.82.camel@Joe-Laptop.home>
 <20100518185305.GA23921@elte.hu>
 <987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
 <20100518191802.GG25224@aftab>
 <m1k4r0c0y7.fsf@fess.ebiederm.org>
 <20100518222832.GJ22675@basil.fritz.box>
 <m1wrv0zo9q.fsf@fess.ebiederm.org>
 <20100519064619.GA30320@aftab>
 <20100519070919.GA9618@elte.hu>
 <4BF3D17F.5000605@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4BF3D17F.5000605@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Borislav Petkov <bp@amd64.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Andi Kleen <andi@firstfloor.org>, "Luck, Tony" <tony.luck@intel.com>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org


* Mauro Carvalho Chehab <mchehab@redhat.com> wrote:

> Ingo Molnar wrote:
>
> > Regarding dmesg, there's a WIP patch on lkml that 
> > integrates printks into this framework as well - makes 
> > each printk also available as a special string event.
> > 
> > That way a tool can have both programmatic access to 
> > printk output (without having to interact with the 
> > syslog buffer itself) - together with all the other 
> > structured log sources, while humans can also see what 
> > is happening.
> 
> Some system admins prefer to have everything on dmesg, 
> as they can enable a serial console, and catch the logs 
> remotely, even when the machine crashes for example due 
> to a hardware failure.
> 
> So, IMHO, one feature that the perf event needs is the 
> capability to report errors via a serial console also, 
> or a mechanism where some events are sent via dmesg.

Yeah. That can be an aspect of the callback - or might 
even be integrated into the core code.

Thanks,

	Ingo
