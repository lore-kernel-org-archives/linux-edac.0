From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Mon, 14 Jun 2010 13:06:59 -0700
Message-ID: <m14oh59y58.fsf@fess.ebiederm.org>
References: <1274204560.17703.82.camel@Joe-Laptop.home>
	<20100518185305.GA23921@elte.hu>
	<987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	<20100518222832.GJ22675@basil.fritz.box>
	<m1wrv0zo9q.fsf@fess.ebiederm.org> <20100519064619.GA30320@aftab>
	<20100519070919.GA9618@elte.hu>
	<50689ECC-A371-4923-BEBE-1A5A7E5B9D3B@ludd.ltu.se>
	<20100614114906.GG17092@basil.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100614114906.GG17092@basil.fritz.box> (Andi Kleen's message of
	"Mon\, 14 Jun 2010 13\:49\:06 +0200")
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
	Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

Andi Kleen <andi@firstfloor.org> writes:

>> Just left the above for reference. How would this affect other
>> aspects of EDAC such as the error injection, the sysfs
>> entries that (in most cases) reflect the layout of dimm's, and
>
> Some of this can be probably retained, about the way EDAC
> e.g. represents layout is quite unsuitable too. It includes
> a lot of internal implementation details that in some cases
> you can't even get anymore on modern design. Something
> with a proper abstract interface is better.  EDAC never had this.

It sounds like you can't be bothered to understand the EDAC code,
or the fact that some users actually like to know when their hardware
is having problems.

> Also the biggest problem is still that EDAC doesn't
> give you any silk screen labels, so unless you 
> have motherboard schemantics the layout it presents
> is fairly useless -- you still don't know which DIMM
> to exchange. So in theory EDAC looks great, but in practice ...

- In practice it works even without silk screen labels.
- The current EDAC code displays which DIMMS you have plugged
  in so you can tell if you unplug one, if it was the DIMM
  you were aiming at.

> On a lot of modern systems I checked DMI
> seems reasonably accurate in terms of layout, so I suspect they can 
> be handled with this. For others probably
> still need some special driver, but one 
> with a proper interface.

DMI is great on the days it works, there is a lot of variations
between BIOS's.  Also if the information is decent it can be
used to inform the current EDAC code as well as anything else.

You mean an interface that doesn't report the error so people
won't complain to you about a near useless kernel error
message.

> Anyways the old EDAC drivers for this are not going
> away, you can still use them. The interesting
> question though is how to properly define the interface
> for new hardware.
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

Setting the scrub rate isn't half so interesting as displaying
it.

Having basic hardware information displayed in sysfs seems to be the
design of the rest of linux.  I don't see abandoning that part of the
EDAC design as wise.

Displaying the fact that ECC is turned on in the hardware is one
of the more interesting bits.  That at least allows you to verify
that things are working.

>> replacing all instances of printk (when logging single bit
>> errors) with perf events, I don't really see that as a problem.
>
> I don't think perf is the right tool for this, the semantics
> are mostly unsuitable (it hasn't been designed as a error reporting
> tool, but as a performance tool and performance events are quite
> different from errors) and it doesn't provide most of the infrastructure
> needed for it anyways.

I will agree with that.  The argument that errors that should only
happen rarely need a high performance handler seems to indicate
there is some deep misunderstanding of the code.

>> But EDAC is much more than that today...
>
> Well it's a hodge podge of quite a lot of odd bits.
> I'm not sure "more" is the right word.

If the basic errors could be posted in some kind of NMI/machine check
safe data structure it would not be hard to get EDAC drivers to
consume them.

Eric

------------------------------------------------------------------------------
ThinkGeek and WIRED's GeekDad team up for the Ultimate 
GeekDad Father's Day Giveaway. ONE MASSIVE PRIZE to the 
lucky parental unit.  See the prize list and enter to win: 
http://p.sf.net/sfu/thinkgeek-promo
