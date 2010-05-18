From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 18 May 2010 14:06:34 -0300
Message-ID: <4BF2C91A.8000101@redhat.com>
References: <4BF18995.6070008@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <4BF18995.6070008@redhat.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, bluesmoke-devel@lists.sourceforge.net, Linux Edac Mailing List <linux-edac@vger.kernel.org>
Cc: Tony Luck <tony.luck@intel.com>, Brent Young <brent.young@intel.com>, Borislav Petkov <bp@amd64.org>, Ingo Molnar <mingo@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: edac.vger.kernel.org

The current i7core_edac driver is ready for merge upstream, using the current
edac API. It supports the following processor families:
	i7core, i5core, Lynnfield, Nehalem, Nehalem-EP and Westmere-EP

The tree is available at:

git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/i7core.git linux_next

This driver doesn't support Nehalem-EX. From the discussions we had during
the mini-summit, the MCU of -EX family is very different, so, a separate
driver will be required for it.

Please review. My plan is to submit this driver for upstream merge this week.

-- 

Cheers,
Mauro

------------------------------------------------------------------------------
