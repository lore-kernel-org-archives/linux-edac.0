From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Wed, 19 May 2010 08:54:39 -0300
Message-ID: <4BF3D17F.5000605@redhat.com>
References: <4BF2392A.9040409@jp.fujitsu.com> <4BF2C3D1.10009@redhat.com>
	<1274204560.17703.82.camel@Joe-Laptop.home>
	<20100518185305.GA23921@elte.hu>
	<987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	<20100518222832.GJ22675@basil.fritz.box>
	<m1wrv0zo9q.fsf@fess.ebiederm.org>
	<20100519064619.GA30320@aftab> <20100519070919.GA9618@elte.hu>
Mime-Version: 1.0
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
	Tony" <tony.luck@intel.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Andi Kleen <andi@firstfloor.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>
List-Id: edac.vger.kernel.org

Ingo Molnar wrote:
> Regarding dmesg, there's a WIP patch on lkml that 
> integrates printks into this framework as well - makes 
> each printk also available as a special string event.
> 
> That way a tool can have both programmatic access to 
> printk output (without having to interact with the syslog 
> buffer itself) - together with all the other structured 
> log sources, while humans can also see what is happening.

Some system admins prefer to have everything on dmesg, as they
can enable a serial console, and catch the logs remotely, even
when the machine crashes for example due to a hardware failure.

So, IMHO, one feature that the perf event needs is the capability
to report errors via a serial console also, or a mechanism where
some events are sent via dmesg.

-- 

Cheers,
Mauro

------------------------------------------------------------------------------
