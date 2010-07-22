From: Peter Tyser <ptyser@xes-inc.com>
Subject: Re: [PATCH 1/2] MPC85xx: add definitions for PCI error detection
	soc part
Date: Thu, 22 Jul 2010 10:19:35 -0500
Message-ID: <1279811975.7232.8696.camel@petert>
References: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linuxppc-dev@ozlabs.org, Dave Jiang <djiang@mvista.com>, bluesmoke-devel@lists.sourceforge.net, Doug Thompson <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org

Hi Dmitry,

On Thu, 2010-07-22 at 04:03 +0400, Dmitry Eremin-Solenikov wrote:
> Add definitions for PCI error detection device to be handled by (already
> existing) mpc85xx_edac.c driver.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  arch/powerpc/boot/dts/mpc8536ds.dts        |    7 +++++++
>  arch/powerpc/boot/dts/mpc8536ds_36b.dts    |    7 +++++++
>  arch/powerpc/boot/dts/mpc8540ads.dts       |    8 ++++++++
>  arch/powerpc/boot/dts/mpc8541cds.dts       |   14 ++++++++++++++
>  arch/powerpc/boot/dts/mpc8544ds.dts        |    7 +++++++
>  arch/powerpc/boot/dts/mpc8548cds.dts       |   14 ++++++++++++++
>  arch/powerpc/boot/dts/mpc8555cds.dts       |   14 ++++++++++++++
>  arch/powerpc/boot/dts/mpc8560ads.dts       |    7 +++++++
>  arch/powerpc/boot/dts/mpc8568mds.dts       |    7 +++++++
>  arch/powerpc/boot/dts/sbc8548.dts          |    7 +++++++
>  arch/powerpc/boot/dts/sbc8560.dts          |    7 +++++++
>  arch/powerpc/boot/dts/socrates.dts         |    7 +++++++
>  arch/powerpc/boot/dts/stx_gp3_8560.dts     |    7 +++++++
>  arch/powerpc/boot/dts/tqm8540.dts          |   10 ++++++++++
>  arch/powerpc/boot/dts/tqm8541.dts          |    7 +++++++
>  arch/powerpc/boot/dts/tqm8548-bigflash.dts |    7 +++++++
>  arch/powerpc/boot/dts/tqm8548.dts          |    7 +++++++
>  arch/powerpc/boot/dts/tqm8555.dts          |    7 +++++++
>  arch/powerpc/boot/dts/tqm8560.dts          |    7 +++++++
>  arch/powerpc/boot/dts/xpedite5200.dts      |    7 +++++++
>  arch/powerpc/boot/dts/xpedite5200_xmon.dts |    7 +++++++
>  21 files changed, 172 insertions(+), 0 deletions(-)

It looks like the dts files for the MPC8572-based boards weren't
included in this change despite patch 2/2 adding support for them.  I'd
guess some other Freescale CPUs (eg P1020, P2020, etc) could be
supported by the same driver if you are inclined to add them to this
patch series.

Best,
Peter


------------------------------------------------------------------------------
This SF.net email is sponsored by Sprint
What will you do first with EVO, the first 4G phone?
Visit sprint.com/first -- http://p.sf.net/sfu/sprint-com-first
