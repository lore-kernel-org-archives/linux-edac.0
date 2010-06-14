From: Tony Luck <tony.luck@intel.com>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Mon, 14 Jun 2010 14:34:22 -0700
Message-ID: <AANLkTil_mDFOsDUjvnp_NFZvkj0Ij-qww6BqewJ4lpHP@mail.gmail.com>
References: <987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	<20100518222832.GJ22675@basil.fritz.box>
	<m1wrv0zo9q.fsf@fess.ebiederm.org> <20100519064619.GA30320@aftab>
	<20100519070919.GA9618@elte.hu>
	<50689ECC-A371-4923-BEBE-1A5A7E5B9D3B@ludd.ltu.se>
	<20100614114906.GG17092@basil.fritz.box>
	<m14oh59y58.fsf@fess.ebiederm.org>
	<20100614203611.GE369@basil.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100614203611.GE369@basil.fritz.box>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Andi Kleen <andi@firstfloor.org>
Cc: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young,
	Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, Matt Domsch <Matt_Domsch@dell.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

On Mon, Jun 14, 2010 at 1:36 PM, Andi Kleen <andi@firstfloor.org> wrote:
> On Mon, Jun 14, 2010 at 01:06:59PM -0700, Eric W. Biederman wrote:
>> Displaying the fact that ECC is turned on in the hardware is one
>> of the more interesting bits. =A0That at least allows you to verify
>> that things are working.
>
> There are hundreds to thousands of BIOS level hardware knobs for memory
> configuration (and if you count all BIOS knobs for everything far more)
>
> Why do you want to check a single bit only? (which is actually not
> a single bit but also a lot of different ways to set this)

There was a case mentioned at the collaboration summit
meeting where a BIOS bug mis-reported whether ECC was
enabled - claiming it was on, when in fact it was off.

Error injection could be used to check for another instance
of a lying BIOS (inject an error - make sure it gets counted).
Not as direct as seeing that the right bits are enabled in the
memory controller configuration registers, but still effective.
Perhaps more so as this technique validates different pieces
of the chipset specific code against each other. An EDAC
driver that tells you that ECC is enabled might be lying too,
if it is looking at the wrong bit or the wrong register.

-Tony

---------------------------------------------------------------------------=
---
ThinkGeek and WIRED's GeekDad team up for the Ultimate =

GeekDad Father's Day Giveaway. ONE MASSIVE PRIZE to the =

lucky parental unit.  See the prize list and enter to win: =

http://p.sf.net/sfu/thinkgeek-promo
