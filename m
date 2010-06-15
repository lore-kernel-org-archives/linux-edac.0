From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: Hardware Error Kernel Mini-Summit
Date: Tue, 15 Jun 2010 11:15:31 -0700
Message-ID: <987664A83D2D224EAE907B061CE93D530143FDA773@orsmsx505.amr.corp.intel.com>
References: <AANLkTil_mDFOsDUjvnp_NFZvkj0Ij-qww6BqewJ4lpHP@mail.gmail.com>
 <35525.41387.qm@web50105.mail.re2.yahoo.com>
 <20100615065630.GC6727@basil.fritz.box>
 <Pine.GSO.4.58.1006150951150.17579@dexter.ludd.ltu.se>
 <20100615114135.GH6727@basil.fritz.box>
 <Pine.GSO.4.58.1006151411370.17929@dexter.ludd.ltu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.58.1006151411370.17929@dexter.ludd.ltu.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nils Carlson <nils.carlson@ludd.ltu.se>, Andi Kleen <andi@firstfloor.org>
Cc: Doug Thompson <norsk5@yahoo.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@elte.hu>, Borislav Petkov <bp@amd64.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>, Nils Carlson <nils.carlson@ericsson.com>
List-Id: edac.vger.kernel.org

> Could we come up with some plan that doesn't involve
> trusting to the goodwill (and competence) of BIOS writes?

That would be nice - but there already exists a platform
(Xeon-7500 series a.k.a. Nehalem-EX) where the hardware
chipset registers that you would need to do your own
memory topology reverse engineering in Linux are only
accessible to SMM level code.  I've finally come to the
conclusion that an EDAC style driver just isn't possible
for this set of systems.

>I personally really like the device tree compiler for PowerPC.
>It allows you to be explicit about what you have. Not for everyone,
>but maybe there could be some way to apply the same principle? Maybe
>some way of loading modules with parameters or configuring your setup
>from sysfs?

Even when the chip set registers are accessible, it can be very
complex to do this for the general case (think of boards that
support arbitrary mixing of different size/speed DIMMs - the
BIOS may have done some interesting somersaults while computing
which interleaving modes to use).

Even more complex on high end systems when BIOS may handle row
sparing transparently to the OS. Memory mirroring is also
becoming fashionable - how can EDAC represent this (when
the h/w view of the memory doesn't match the OS view)?

-Tony
