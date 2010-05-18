From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Wed, 19 May 2010 00:00:02 +0200
Message-ID: <20100518220002.GA23739@elte.hu>
References: <4BF18995.6070008@redhat.com>
 <4BF2392A.9040409@jp.fujitsu.com>
 <4BF2C3D1.10009@redhat.com>
 <1274204560.17703.82.camel@Joe-Laptop.home>
 <20100518185305.GA23921@elte.hu>
 <987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
 <20100518193022.GB30936@elte.hu>
 <20100518204204.GA23204@elte.hu>
 <AANLkTimPRvuoW5-OcPlPx5cvnCTJa7xhAQDSLrYziB4j@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTimPRvuoW5-OcPlPx5cvnCTJa7xhAQDSLrYziB4j@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Luck <tony.luck@intel.com>
Cc: Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Ben Woodard <woodard@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <bp@amd64.org>, "Young, Brent" <brent.young@intel.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>
List-Id: edac.vger.kernel.org


* Tony Luck <tony.luck@intel.com> wrote:

> > This gives us a broad platform to add various RAS 
> > events as well, beyond raw hardware events: we could 
> > for example events for various system anomalies such 
> > as lockup messages, kernel warnings/oopses, IOMMU 
> > exceptions - maybe even pure software concepts such as 
> > fatal segmentation fault events, etc. etc.
> 
> This looks like sticky ground.  I can see the event 
> mechanism passing data to a user daemon working well for 
> all kinds of corrected and minor errors. But when you 
> start talking about lockups and fatal errors things get 
> a lot trickier. Often the main concern at this point is 
> error containment. Making sure that the flaky data 
> doesn't become visible (saved to storage, transmitted to 
> the network, etc.). [...]

I was pointing beyond the narrow hardware (memory) error 
point of view, towards a more generic 'system health' 
thinking.

In the broader view it may makes sense to for example 
define policy over excessive number of segfaults on a 
server system (where excessive segfaults are an anomaly), 
or a suspiciously large number of soft IO errors, etc.

But yes, of course, when it comes to hard memory errors, 
those take precedence, and handling them (and 
saving/propagating information about them while we still 
can) is a priority.

> [...] Getting from a machine check handler through some 
> context switches (and page faults etc.) to a user level 
> daemon before the error gets recorded looks to be really 
> hard.

As Boris mentioned it too, critical policy action can and 
will be done straight in the kernel.

	Ingo
