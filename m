From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: [GIT PATCHES] Add support for Lynnfield on i7core_edac
Date: Mon, 19 Oct 2009 10:32:27 -0700 (PDT)
Message-ID: <717538.81261.qm@web50105.mail.re2.yahoo.com>
References: <20091020015758.7ccb7875@caramujo.chehab.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20091020015758.7ccb7875@caramujo.chehab.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: bluesmoke ML <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

Great I will take a look

Did you get that email on the issue with the i5400 issuing reports on Supermicro with an add on board? If not, I can resend it to you

doug t

--- On Mon, 10/19/09, Mauro Carvalho Chehab <mchehab@infradead.org> wrote:

> From: Mauro Carvalho Chehab <mchehab@infradead.org>
> Subject: [GIT PATCHES] Add support for Lynnfield on i7core_edac
> To: "Doug Thompson" <norsk5@yahoo.com>
> Cc: "bluesmoke ML" <bluesmoke-devel@lists.sourceforge.net>
> Date: Monday, October 19, 2009, 10:57 AM
> Hi Doug,
> 
> I've just added support also for Lynnfield (Core i5
> 700/Core i7 800/Xeon 34xx)
> Intel memory controllers at i7core_edac.
> 
> Lynnfield has a different set of PCI ID registers, but most
> fields are equal on it
> and on Nehalem/Nehalem-EP. The basic difference is that
> Lynnfield has only 2 channels, while
> Nehalem has 3, and the test registers on Lynnfield are
> different. I'm not sure yet if Lynnfield
> supports error injection or memory error counts via reading
> the test registers. So, for now, i've
> just disabling the sysfs nodes for error injection and
> direct error count access if the processor
> is a Lynnfield.
> 
> Please review them. It is currently on a temporary branch
> on my i7core tree:
> 
> http://git.kernel.org/?p=linux/kernel/git/mchehab/i7core.git;a=shortlog;h=refs/heads/lynnfield
> 
> You'll notice there also the other patches I did to satisfy
> the feedback I've received.
> 
> PS.: I haven't yet added your acked-by at the patches on
> the tree. After
> getting your new ack, I intend to rebase it adding it to
> all patches.
> 
> 
> 
> Cheers,
> Mauro
> 

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
