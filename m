From: Tony Luck <tony.luck@gmail.com>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Wed, 19 May 2010 10:30:17 -0700
Message-ID: <AANLkTilxFZygP7YJybluPxtdxVGqWeqR4g7CRr8EEocW@mail.gmail.com>
References: <4BF18995.6070008@redhat.com> <4BF2392A.9040409@jp.fujitsu.com>
	 <4BF2C3D1.10009@redhat.com>
	 <1274204560.17703.82.camel@Joe-Laptop.home>
	 <20100518185305.GA23921@elte.hu>
	 <987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	 <20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	 <20100518222832.GJ22675@basil.fritz.box>
	 <m1wrv0zo9q.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <m1wrv0zo9q.fsf@fess.ebiederm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Andi Kleen <andi@firstfloor.org>, Borislav Petkov <bp@amd64.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

On Tue, May 18, 2010 at 6:14 PM, Eric W. Biederman
<ebiederm@xmission.com> wrote:
> A log is a fine format for realizing you have a problem. =A0A
> log doesn't need to be the only place errors are reported
> but a log should be the default place ECC errors are reported.
> We do that with hard drive errors and other kinds of hardware
> errors and we have done it for years without problems.

Hard drives aren't really a similar situation ... we don't see any
of the low level errors from a modern hard drive because its
f/w handles the retries and block re-mapping transparently.
By the time something serious enough happens that it gets
reported to the OS, we pretty much already know that there
is a real problem.

We are still in the dark ages for memory errors where the OS
is expected to look at all the errors and figure out whether they
represent any kind of meaningful pattern that requires some
action to replace h/w components.

-Tony
