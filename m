From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH 2/2] mpc85xx_edac: change to use new definitions for PCI
	EDAC regspace
Date: Thu, 22 Jul 2010 13:40:19 -0500
Message-ID: <95F6CFEA-DC74-4CF6-A195-4CBFABAAB7F0@kernel.crashing.org>
References: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
	<1279756992-29543-2-git-send-email-dbaryshkov@gmail.com>
	<566EC982-1CDA-4806-8EC0-8C9F36448F83@kernel.crashing.org>
	<AANLkTim7kbHsouc==7gRAuRO6AYMNVdA4yyPFpRBC+QR@mail.gmail.com>
	<20100722132548.6eef941b@schlenkerla.am.freescale.net>
Mime-Version: 1.0 (Apple Message framework v1078)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100722132548.6eef941b@schlenkerla.am.freescale.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Scott Wood <scottwood@freescale.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, linuxppc-dev@ozlabs.org, bluesmoke-devel@lists.sourceforge.net, Doug Thompson <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org


On Jul 22, 2010, at 1:25 PM, Scott Wood wrote:

> On Thu, 22 Jul 2010 20:48:15 +0400
> Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
> 
>> Hello,
>> 
>> On Thu, Jul 22, 2010 at 7:38 PM, Kumar Gala <galak@kernel.crashing.org> wrote:
>>> 
>>> On Jul 21, 2010, at 7:03 PM, Dmitry Eremin-Solenikov wrote:
>>> 
>>>> Currently (as mpc8540-pci) devices are not created on of_platform bus,
>>>> mpc85xx_edac can't probe to them. Follow the change to dts trees to bind
>>>> not to the main mpc8540-pci node but to special mpc85xx-pci-error nodes,
>>>> present on soc bus.
>>>> 
>>>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>>> ---
>>>> drivers/edac/mpc85xx_edac.c |   18 +++++++++---------
>>>> 1 files changed, 9 insertions(+), 9 deletions(-)
>>> 
>>> Nak.
>>> 
>>> We already have a node in the dts for the PCI controller.  Lets update the platform code to add the pci controller to the of_platform_bus_probe list.
>> 
>> I've had that idea. However it's really look strange to me to call
>> of_platform_bus_probe() on the bus node, for which we (IMO) explicitly
>> won't like for
>> child devices (PCI devices) to be added to of_platform bus.
> 
> Right, and it's also not great for a driver for one aspect of PCI to
> claim to be the driver for the whole thing.
> 
> But changing the device tree because of this Linux-internal concern is
> also not good.
> 
> How about keeping the error stuff as a separate device from Linux's
> perspective, but have the main Freescale PCI code create it as a
> platform device instead of putting it in the device tree?

I'd be good with that solution.

- k
------------------------------------------------------------------------------
This SF.net email is sponsored by Sprint
What will you do first with EVO, the first 4G phone?
Visit sprint.com/first -- http://p.sf.net/sfu/sprint-com-first
