From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Wed, 19 May 2010 08:39:33 +0200
Message-ID: <20100519063933.GA32581@elte.hu>
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

> > 3) Another new perf feature of interest is 'perf 
> > inject' (this too went upstream today): to inject 
> > artificial events into the stream of events. This 
> > mechanism could be used to simulate rare error 
> > conditions and to test out policy reactions 
> > systematically - an important part of system error 
> > recovery testing.
> 
> Simulated errors are handy for testing the very top 
> level of the s/w stack. But real errors are better. 
> There's some APEI code in Len's tree that can inject 
> real errors (on systems with the right BIOS hooks 
> enabled).

Agreed, hardware assisted error injection is by far the 
best and most complete solution.

Thanks,

	Ingo
