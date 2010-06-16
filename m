From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Wed, 16 Jun 2010 11:40:10 +0200
Message-ID: <20100616094010.GC17599@basil.fritz.box>
References: <AANLkTil_mDFOsDUjvnp_NFZvkj0Ij-qww6BqewJ4lpHP@mail.gmail.com>
	<35525.41387.qm@web50105.mail.re2.yahoo.com>
	<20100615065630.GC6727@basil.fritz.box>
	<Pine.GSO.4.58.1006150951150.17579@dexter.ludd.ltu.se>
	<20100615114135.GH6727@basil.fritz.box>
	<Pine.GSO.4.58.1006151411370.17929@dexter.ludd.ltu.se>
	<20100615193519.GA12845@basil.fritz.box>
	<3B694326-F435-4A54-AC36-AE059AD9161D@ludd.ltu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <3B694326-F435-4A54-AC36-AE059AD9161D@ludd.ltu.se>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Nils Carlson <nils.carlson@ludd.ltu.se>
Cc: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, BrentYoung <brent.young@intel.com>, Nils Carlson <nils.carlson@ericsson.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Andi Kleen <andi@firstfloor.org>, Thomas Gleixner <tglx@linutronix.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Doug Thompson <norsk5@yahoo.com>, Ingo Molnar <mingo@elte.hu>, Matt Domsch <Matt_Domsch@dell.com>, Ingo Molnar <mingo@redhat.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org


> Could you maybe give me an example from the board of your choosing
> of a DMI table print out, explain the format and then show how to use it?

The only requirement the current mcelog parser has is
(that is what it actually uses, it parses more things but I abandoned
them):

- List of DIMMs (type 17) 
- It's useful if they have the correct size for display to the user.
- Correct serial/part numbers/manufacturer are also useful (for display), but
not strictly required.
- Locator should match the silk screen label of the DIMM on the board
- Bank Locator is in the format prefix_Node%u_Channel%u_Dimm%u
prefix can be arbitary, but should not contain '_'
Node matching SOCKETID coming from CPU, Channel matching Channel, Dimm
matching Dimm number from CPU.
This requirement is the only extension over the standard.

-Andi

------------------------------------------------------------------------------
ThinkGeek and WIRED's GeekDad team up for the Ultimate 
GeekDad Father's Day Giveaway. ONE MASSIVE PRIZE to the 
lucky parental unit.  See the prize list and enter to win: 
http://p.sf.net/sfu/thinkgeek-promo
