From: Tony Luck <tony.luck@intel.com>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 15 Jun 2010 15:33:51 -0700
Message-ID: <AANLkTikS9ocvQm2WK_9PFeiMNCcBGeW-8o1r30nnb59Y@mail.gmail.com>
References: <AANLkTil_mDFOsDUjvnp_NFZvkj0Ij-qww6BqewJ4lpHP@mail.gmail.com>
	<35525.41387.qm@web50105.mail.re2.yahoo.com>
	<20100615065630.GC6727@basil.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100615065630.GC6727@basil.fritz.box>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Kleen <andi@firstfloor.org>
Cc: Doug Thompson <norsk5@yahoo.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Nils Carlson <nils.carlson@ludd.ltu.se>, Ingo Molnar <mingo@elte.hu>, Borislav Petkov <bp@amd64.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, BrentYoung <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>
List-Id: edac.vger.kernel.org

On Mon, Jun 14, 2010 at 11:56 PM, Andi Kleen <andi@firstfloor.org> wrote:
> The way I envision it to working is that a abstracted dimm interface
> (or edac2 or whatever you want to call it) can be fed from any reasonable
> DIMM layout driver. This could be either DMI on x86 or some other
> driver. There would be nothing really x86 specific about that.

You could go one stage further and make DIMMs just one example of
a field replaceable unit.  So the "error analysis subsystem" would keep track
of errors reported by any component (cpu, DIMM, I/O card, fan, power
supply, disk, ...).  Each category could have different "X errors per Y
interval" parameter that made sense for it.

-Tony
