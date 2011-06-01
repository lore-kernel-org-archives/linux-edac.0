From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 1/2] ppc/85xx: create a platform node for PCI EDAC device
Date: Wed, 1 Jun 2011 11:48:23 -0500
Message-ID: <20110601114823.2e57c691@schlenkerla.am.freescale.net>
References: <1306931292-2313-1-git-send-email-dbaryshkov@gmail.com>
	<20110601132519.GA16125@oksana.dev.rtsoft.ru>
	<BANLkTi=xFcZRd4x1FQSKJzmt3A7_tZs+sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <BANLkTi=xFcZRd4x1FQSKJzmt3A7_tZs+sQ@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>, Anton Vorontsov <avorontsov@mvista.com>, linuxppc-dev@lists.ozlabs.org, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

On Wed, 1 Jun 2011 18:55:35 +0400
Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:

> On 6/1/11, Anton Vorontsov <avorontsov@mvista.com> wrote:
> > On Wed, Jun 01, 2011 at 04:28:11PM +0400, Dmitry Eremin-Solenikov wrote:
> > [...]
> > Also, why not add this call to the fsl_add_bridge(), so you
> > won't need to touch board files at all.
> 
> Because fsl_add_bridge is called too early, so allocation
> of platform device fails.

That doesn't seem like a good reason for putting more stuff in board
files that isn't board-specific.  Why not just make fsl_add_pci_err() an
initcall?  It already only works when a compatible device tree node is
found.  Is there any case where a board would not want this PCI code to be
used, even if the device tree node is present?  If so, fsl_add_bridge could
set a flag that fsl_add_pci_err() could check -- but I doubt it's needed.

-Scott


------------------------------------------------------------------------------
Simplify data backup and recovery for your virtual environment with vRanger. 
Installation's a snap, and flexible recovery options mean your data is safe,
secure and there when you need it. Data protection magic?
Nope - It's vRanger. Get your free trial download today. 
http://p.sf.net/sfu/quest-sfdev2dev
