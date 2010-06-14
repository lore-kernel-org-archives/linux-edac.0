From: Nils Carlson <nils.carlson@ludd.ltu.se>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Mon, 14 Jun 2010 21:47:33 +0200
Message-ID: <9D5E19B6-5313-43B4-9C3D-493C8C226E8D@ludd.ltu.se>
References: <1274204560.17703.82.camel@Joe-Laptop.home>
	<20100518185305.GA23921@elte.hu>
	<987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	<20100518222832.GJ22675@basil.fritz.box>
	<m1wrv0zo9q.fsf@fess.ebiederm.org>
	<20100519064619.GA30320@aftab> <20100519070919.GA9618@elte.hu>
	<50689ECC-A371-4923-BEBE-1A5A7E5B9D3B@ludd.ltu.se>
	<20100614114906.GG17092@basil.fritz.box>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100614114906.GG17092@basil.fritz.box>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Andi Kleen <andi@firstfloor.org>
Cc: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, "Luck,
	Tony" <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young,
	Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, Matt Domsch <Matt_Domsch@dell.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

On Jun 14, 2010, at 1:49 PM, Andi Kleen wrote:

>> Just left the above for reference. How would this affect other
>> aspects of EDAC such as the error injection, the sysfs
>> entries that (in most cases) reflect the layout of dimm's, and
>
> Some of this can be probably retained, about the way EDAC
> e.g. represents layout is quite unsuitable too. It includes
> a lot of internal implementation details that in some cases
> you can't even get anymore on modern design. Something
> with a proper abstract interface is better.  EDAC never had this.
>
A lot of core edac doesn't reflect modern motherboards it's true.

> Also the biggest problem is still that EDAC doesn't
> give you any silk screen labels, so unless you
> have motherboard schemantics the layout it presents
> is fairly useless -- you still don't know which DIMM
> to exchange. So in theory EDAC looks great, but in practice ...
>
I do have motherboard schematics, or rather, we build our own
boards. But the point is valid, a lot of people don't make their own
hardware. On the other hand, the people who do use this part of
EDAC perhaps aren't your typical home computer users?

> On a lot of modern systems I checked DMI
> seems reasonably accurate in terms of layout, so I suspect they can
> be handled with this. For others probably
> still need some special driver, but one
> with a proper interface.
>
> For error injection: some modern systems support this
> though ACPI EINJ which has an separate non EDAC
> interface. For others I've been simply using some scripts
> that twiddle the bits from user space. You can do that
> with a shell script. If it was staying in the kernel
> it could be probably moved into a proper error injection
> framework that is not arbitarily tied to memory.
> Lots of different devices have error injection
> support and exposing some of that a in a general
> frame work would likely make sense.
>

This is true, and this is the way things are going on
our end as well. I guess that would mean
one driver that hooks into all frameworks though?
So you wouldn't go to the EDAC sysfs directory
to find everything to do with the same piece of hardware
anymore, but would have to go the n different
directories looking for all the pieces? I don't really
like that...

> Anyways the old EDAC drivers for this are not going
> away, you can still use them. The interesting
> question though is how to properly define the interface
> for new hardware.

But all new hardware will look the way the hardware
designers want it to, so our interface will be a moving
target? Maybe it's time to let hardware makers provide
a board specification with device tree and memory
layout? (Pure speculation)

>
>> allow the setting of scrub rate? If we're just talking about
>
> I never quite saw the point of that one, but yes
> there's no replacement for this anywhere else.
>
> Normally scrub rate can be simply set in the BIOS,
> is that not good enough? Is there a use case for
> changing it dynamically?
>
> Note that modern hardware typically has demand scrubbing
> anyways, that is when there is an error it automatically
> scrubs.
>
There is a use-case. A lot has to do with how different patrol
scrub rates work, some just go through memory at a constant
speed (MB/s), others vary according to load. The thing is,
different applications want their memory scrubbed within
different time frames, and as the amount of memory on boards
varies and the bios doesn't vary this implies the need for setting
scrub rate from userspace.

Patrol scrubbing is normally used because it discovers errors
faster in seldom accessed memory allowing a DIMM with
too many errors to be replaced faster. Some applications
like to use demand scrubbing as well, and some consider
it to increase memory latency too much.

<snip>
>
>> But EDAC is much more than that today...
>
> Well it's a hodge podge of quite a lot of odd bits.
> I'm not sure "more" is the right word.

Oh, a hodge podge is much more than just single bit
correctable error reporting... :-) You never know what
you'll find in the sysfs directory for a given memory
controller.

/Nils Carlson

------------------------------------------------------------------------------
ThinkGeek and WIRED's GeekDad team up for the Ultimate 
GeekDad Father's Day Giveaway. ONE MASSIVE PRIZE to the 
lucky parental unit.  See the prize list and enter to win: 
http://p.sf.net/sfu/thinkgeek-promo
