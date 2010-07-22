From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH 2/2] mpc85xx_edac: change to use new definitions for PCI
	EDAC regspace
Date: Thu, 22 Jul 2010 10:38:56 -0500
Message-ID: <566EC982-1CDA-4806-8EC0-8C9F36448F83@kernel.crashing.org>
References: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
	<1279756992-29543-2-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1078)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1279756992-29543-2-git-send-email-dbaryshkov@gmail.com>
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
Cc: linuxppc-dev@ozlabs.org, Doug Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net, Dave Jiang <djiang@mvista.com>
List-Id: edac.vger.kernel.org


On Jul 21, 2010, at 7:03 PM, Dmitry Eremin-Solenikov wrote:

> Currently (as mpc8540-pci) devices are not created on of_platform bus,
> mpc85xx_edac can't probe to them. Follow the change to dts trees to bind
> not to the main mpc8540-pci node but to special mpc85xx-pci-error nodes,
> present on soc bus.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> drivers/edac/mpc85xx_edac.c |   18 +++++++++---------
> 1 files changed, 9 insertions(+), 9 deletions(-)

Nak.

We already have a node in the dts for the PCI controller.  Lets update the platform code to add the pci controller to the of_platform_bus_probe list.

- k
