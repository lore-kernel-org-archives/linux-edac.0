From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 15 Jun 2010 21:37:54 +0200
Message-ID: <20100615193754.GB12845@basil.fritz.box>
References: <AANLkTil_mDFOsDUjvnp_NFZvkj0Ij-qww6BqewJ4lpHP@mail.gmail.com>
	<35525.41387.qm@web50105.mail.re2.yahoo.com>
	<20100615065630.GC6727@basil.fritz.box>
	<Pine.GSO.4.58.1006150951150.17579@dexter.ludd.ltu.se>
	<20100615114135.GH6727@basil.fritz.box>
	<Pine.GSO.4.58.1006151411370.17929@dexter.ludd.ltu.se>
	<987664A83D2D224EAE907B061CE93D530143FDA773@orsmsx505.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <987664A83D2D224EAE907B061CE93D530143FDA773@orsmsx505.amr.corp.intel.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young,
	Brent" <brent.young@intel.com>, Nils Carlson <nils.carlson@ericsson.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Andi Kleen <andi@firstfloor.org>, Thomas Gleixner <tglx@linutronix.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Doug Thompson <norsk5@yahoo.com>, Ingo Molnar <mingo@elte.hu>, Matt Domsch <Matt_Domsch@dell.com>, Ingo Molnar <mingo@redhat.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

> Even when the chip set registers are accessible, it can be very
> complex to do this for the general case (think of boards that
> support arbitrary mixing of different size/speed DIMMs - the
> BIOS may have done some interesting somersaults while computing
> which interleaving modes to use).

... and the numbers that come out of this may have no relation
to your motherboard labels at all. What do you do then? 
Read schemantics again?  Or do binary search on the DIMM again
like Eric suggested? 

For all of this a system specific mapping table is needed
and the only place to get this as a default option without 
explicit configuration for each motherboard is the BIOS.

-Andi
-- 
ak@linux.intel.com -- Speaking for myself only.

------------------------------------------------------------------------------
ThinkGeek and WIRED's GeekDad team up for the Ultimate 
GeekDad Father's Day Giveaway. ONE MASSIVE PRIZE to the 
lucky parental unit.  See the prize list and enter to win: 
http://p.sf.net/sfu/thinkgeek-promo
