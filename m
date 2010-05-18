From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 18 May 2010 20:10:02 +0200
Message-ID: <20100518181002.GG22675@basil.fritz.box>
References: <4BF18995.6070008@redhat.com> <87r5laxiap.fsf@basil.nowhere.org>
	<4BF2C55C.9060200@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <4BF2C55C.9060200@redhat.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Tony Luck <tony.luck@intel.com>, Brent Young <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, bluesmoke-devel@lists.sourceforge.net, Andi Kleen <andi@firstfloor.org>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

On Tue, May 18, 2010 at 01:50:36PM -0300, Mauro Carvalho Chehab wrote:
> Ok. It should be clear that the main target of the mini-summit is to define
> how the several subsystems will integrate into a hardware-abstracted way
> to report errors from kernel. So, we're looking on the next steps to improve
> what we currently have, and avoid to have more than one different subsystem
> trying to get the same info, eventually using the same registers, but providing
> different interfaces to userspace.

Well there are different use cases.

mcelog mainly deals in thresholds (including fancy ones like 
per page and per object thresholds) and events and actions to thresholds
(= more events), all your proposals are dealing with objects counts currently.

It does per object counting too, but only incidentially.

I suspect there are use cases for both, although I personally suspect
for most people events, thresholds and their actions are the most useful
thing to handle by default. But one size doesn't fit all.

Anyways it boils down you need different interfaces for different things.

For example there will be always events versus accounting. 

You can synthesize accounting from events (that is what mcelog
does today). The other way round does not work so well unfortunately,
or at least would be rather inefficient.

Also large parts of the actions can be only usefully done in user space, so 
you need a user space component.

I am somewhat biased of course but I think mcelog is doing a reasonable
good job today at being this user space component. It definitely
has areas that could be improved too, but at lot of the basics
are there and doing ok.

In principle mcelog could feed from another API too, but it would
definitely prefer to not to have to poll it or having to parse
printks.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.

------------------------------------------------------------------------------
