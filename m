From: Nils Carlson <nils.carlson@ludd.ltu.se>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Mon, 14 Jun 2010 12:03:20 +0200
Message-ID: <50689ECC-A371-4923-BEBE-1A5A7E5B9D3B@ludd.ltu.se>
References: <4BF2392A.9040409@jp.fujitsu.com> <4BF2C3D1.10009@redhat.com>
	<1274204560.17703.82.camel@Joe-Laptop.home>
	<20100518185305.GA23921@elte.hu>
	<987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	<20100518222832.GJ22675@basil.fritz.box>
	<m1wrv0zo9q.fsf@fess.ebiederm.org>
	<20100519064619.GA30320@aftab> <20100519070919.GA9618@elte.hu>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100519070919.GA9618@elte.hu>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Ingo Molnar <mingo@elte.hu>
Cc: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, "Luck,
	Tony" <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young,
	Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Andi Kleen <andi@firstfloor.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Domsch <Matt_Domsch@dell.com>, Ingo Molnar <mingo@redhat.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org


On May 19, 2010, at 9:09 AM, Ingo Molnar wrote:
>
> Basically the idea behind the generic structured logging
> framework (the perf events kernel subsystem) is to have
> both ASCII output (where desired: critical errors), but to
> also have well-specified event format parsable to
> user-space tools.
>
> Plus there's the need for fast, lightweight, flexible
> event passing mechanism - which is given by the perf
> events transport which enables arbitrary size in-memory
> ring-buffers, poll() and epoll support, etc.
>
> perf events supports all these different usecases and
> comes with a (constantly growing) set of events already
> defined upstream. We've got more than a dozen different
> upstream subsystems that have defined events and we have
> over a hundred individual events. There's a rapidly
> growing tool space that makes case by case use of these
> event sources to measure/observe various aspects of the
> system.
>
> Regarding dmesg, there's a WIP patch on lkml that
> integrates printks into this framework as well - makes
> each printk also available as a special string event.
>
> That way a tool can have both programmatic access to
> printk output (without having to interact with the syslog
> buffer itself) - together with all the other structured
> log sources, while humans can also see what is happening.

Just left the above for reference. How would this affect other
aspects of EDAC such as the error injection, the sysfs
entries that (in most cases) reflect the layout of dimm's, and
allow the setting of scrub rate? If we're just talking about
replacing all instances of printk (when logging single bit
errors) with perf events, I don't really see that as a problem.
But EDAC is much more than that today...

Thoughts, comments?

/Nils Carlson

------------------------------------------------------------------------------
ThinkGeek and WIRED's GeekDad team up for the Ultimate 
GeekDad Father's Day Giveaway. ONE MASSIVE PRIZE to the 
lucky parental unit.  See the prize list and enter to win: 
http://p.sf.net/sfu/thinkgeek-promo
