From: Nils Carlson <nils.carlson@ludd.ltu.se>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 15 Jun 2010 10:06:33 +0200 (MEST)
Message-ID: <Pine.GSO.4.58.1006150951150.17579@dexter.ludd.ltu.se>
References: <AANLkTil_mDFOsDUjvnp_NFZvkj0Ij-qww6BqewJ4lpHP@mail.gmail.com>
	<35525.41387.qm@web50105.mail.re2.yahoo.com>
	<20100615065630.GC6727@basil.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100615065630.GC6727@basil.fritz.box>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Andi Kleen <andi@firstfloor.org>
Cc: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, BrentYoung <brent.young@intel.com>, Nils Carlson <nils.carlson@ericsson.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Doug Thompson <norsk5@yahoo.com>, Ingo Molnar <mingo@elte.hu>, Matt Domsch <Matt_Domsch@dell.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

On Tue, 15 Jun 2010, Andi Kleen wrote:

> On Mon, Jun 14, 2010 at 04:46:40PM -0700, Doug Thompson wrote:
>
> Hi Doug,
>
> >
> > Maybe I didn't see it covered (or I missed it), but EDAC is used on more than just x86 based machines, though they are the majority by volume. We should have an abstraction that covers all the archs, like we do with other subsystems of Linux.
>
> The way I envision it to working is that a abstracted dimm interface
> (or edac2 or whatever you want to call it) can be fed from any reasonable
> DIMM layout driver. This could be either DMI on x86 or some other
> driver. There would be nothing really x86 specific about that.

Could you maybe provide some references on how DIMM layout
could be read from DMI? I can't find anything nearly this specific,
or is it something we're expecting to happen in future BIOS's?

Also, there would probably need to be some standard describing
different DIMM layouts in general, though maybe such a thing exists.

In other words, there would be have to be some way of ascertaining
that the info you read from DMI is sufficient to decode MCEs so that
a faulting DIMM can be identified. In an ideal world, this could
be tested by some simple tool that could be run by the BIOS writers
to test that they're providing the OS with sufficient info.

/Nils

------------------------------------------------------------------------------
ThinkGeek and WIRED's GeekDad team up for the Ultimate 
GeekDad Father's Day Giveaway. ONE MASSIVE PRIZE to the 
lucky parental unit.  See the prize list and enter to win: 
http://p.sf.net/sfu/thinkgeek-promo
