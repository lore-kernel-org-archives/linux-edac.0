From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 2/2] mpc85xx_edac: change to use new definitions for PCI
	EDAC regspace
Date: Thu, 22 Jul 2010 14:25:52 -0500
Message-ID: <20100722142552.1e01dba8@schlenkerla.am.freescale.net>
References: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
	<1279756992-29543-2-git-send-email-dbaryshkov@gmail.com>
	<566EC982-1CDA-4806-8EC0-8C9F36448F83@kernel.crashing.org>
	<AANLkTim7kbHsouc==7gRAuRO6AYMNVdA4yyPFpRBC+QR@mail.gmail.com>
	<20100722132548.6eef941b@schlenkerla.am.freescale.net>
	<95F6CFEA-DC74-4CF6-A195-4CBFABAAB7F0@kernel.crashing.org>
	<AANLkTikX8An80SMZiypoO63Be8MKyCsmNzviwqR6syQd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <AANLkTikX8An80SMZiypoO63Be8MKyCsmNzviwqR6syQd@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linuxppc-dev@ozlabs.org, Doug Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

On Thu, 22 Jul 2010 23:03:03 +0400
Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:

> Hello,
> 
> On Thu, Jul 22, 2010 at 10:40 PM, Kumar Gala <galak@kernel.crashing.org> wrote:
> >
> > On Jul 22, 2010, at 1:25 PM, Scott Wood wrote:
> >> How about keeping the error stuff as a separate device from Linux's
> >> perspective, but have the main Freescale PCI code create it as a
> >> platform device instead of putting it in the device tree?
> >
> > I'd be good with that solution.
> 
> Then we come back to the question that was raised before (during initial
> review of edac driver): as PCI code is probbed long before other parts
> of the kernel and mpc85xx_edac code can be compiled as module,
> it's not possible to directly call mpc85xx_edac code from fsl_pci.c

Right, that's why I suggested creating a platform device rather than
just a function call.

> Two initial suggestions were:
> 1) creating special platform device
> 2) creating special of_platform device from dts
> 
> Which approach should I choose? Did i miss any other opportunities?

#1, as it keeps the split out of the device tree.

Besides the theoretical/aesthetic issues of putting Linux
implementation concerns into the device tree, #2 would mean that the
edac driver wouldn't work when Linux is booted with an old device tree.

-Scott


------------------------------------------------------------------------------
This SF.net email is sponsored by Sprint
What will you do first with EVO, the first 4G phone?
Visit sprint.com/first -- http://p.sf.net/sfu/sprint-com-first
