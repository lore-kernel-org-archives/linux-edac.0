From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 2/2] mpc85xx_edac: change to use new definitions for PCI
	EDAC regspace
Date: Thu, 22 Jul 2010 13:25:48 -0500
Message-ID: <20100722132548.6eef941b@schlenkerla.am.freescale.net>
References: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
	<1279756992-29543-2-git-send-email-dbaryshkov@gmail.com>
	<566EC982-1CDA-4806-8EC0-8C9F36448F83@kernel.crashing.org>
	<AANLkTim7kbHsouc==7gRAuRO6AYMNVdA4yyPFpRBC+QR@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <AANLkTim7kbHsouc==7gRAuRO6AYMNVdA4yyPFpRBC+QR@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linuxppc-dev@ozlabs.org, Doug Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

On Thu, 22 Jul 2010 20:48:15 +0400
Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:

> Hello,
> =

> On Thu, Jul 22, 2010 at 7:38 PM, Kumar Gala <galak@kernel.crashing.org> w=
rote:
> >
> > On Jul 21, 2010, at 7:03 PM, Dmitry Eremin-Solenikov wrote:
> >
> >> Currently (as mpc8540-pci) devices are not created on of_platform bus,
> >> mpc85xx_edac can't probe to them. Follow the change to dts trees to bi=
nd
> >> not to the main mpc8540-pci node but to special mpc85xx-pci-error node=
s,
> >> present on soc bus.
> >>
> >> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> >> ---
> >> drivers/edac/mpc85xx_edac.c | =A0 18 +++++++++---------
> >> 1 files changed, 9 insertions(+), 9 deletions(-)
> >
> > Nak.
> >
> > We already have a node in the dts for the PCI controller. =A0Lets updat=
e the platform code to add the pci controller to the of_platform_bus_probe =
list.
> =

> I've had that idea. However it's really look strange to me to call
> of_platform_bus_probe() on the bus node, for which we (IMO) explicitly
> won't like for
> child devices (PCI devices) to be added to of_platform bus.

Right, and it's also not great for a driver for one aspect of PCI to
claim to be the driver for the whole thing.

But changing the device tree because of this Linux-internal concern is
also not good.

How about keeping the error stuff as a separate device from Linux's
perspective, but have the main Freescale PCI code create it as a
platform device instead of putting it in the device tree?

-Scott
