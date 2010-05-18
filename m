From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 18 May 2010 20:53:05 +0200
Message-ID: <20100518185305.GA23921@elte.hu>
References: <4BF18995.6070008@redhat.com>
 <4BF2392A.9040409@jp.fujitsu.com>
 <4BF2C3D1.10009@redhat.com>
 <1274204560.17703.82.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1274204560.17703.82.camel@Joe-Laptop.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, bluesmoke-devel@lists.sourceforge.net, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Ben Woodard <woodard@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <bp@amd64.org>, Tony Luck <tony.luck@intel.com>, Brent Young <brent.young@intel.com>
List-Id: edac.vger.kernel.org


* Joe Perches <joe@perches.com> wrote:

> On Tue, 2010-05-18 at 13:44 -0300, Mauro Carvalho Chehab wrote:
> > IMO, the first
> > step is to provide an error core integrated to perf, and then start
> > integrating the several error systems around it.
> 
> Why integrated to perf?

It makes sense to use the kernel's performance events 
logging framework when we are logging events about how the 
system performs.

Furthermore it's NMI safe, offers structured logging, has 
various streaming, multiplexing and filtering capabilities 
that come handy for RAS purposes and more.

The other option would be to use an ad-hoc logging 
implementation, only used for EDAC/RAS, which couldnt be 
mixed with other system events. That approach has various 
obvious disadvanteges so we are aiming for a unified 
approach.

Thanks,

	Ingo
