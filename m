From: Anton Vorontsov <avorontsov@mvista.com>
Subject: Re: [PATCH 1/2] ppc/85xx: create a platform node for PCI EDAC device
Date: Wed, 1 Jun 2011 17:25:19 +0400
Message-ID: <20110601132519.GA16125@oksana.dev.rtsoft.ru>
References: <1306931292-2313-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <1306931292-2313-1-git-send-email-dbaryshkov@gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, bluesmoke-devel@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>
List-Id: edac.vger.kernel.org

On Wed, Jun 01, 2011 at 04:28:11PM +0400, Dmitry Eremin-Solenikov wrote:
[...]
> --- a/arch/powerpc/sysdev/fsl_pci.h
> +++ b/arch/powerpc/sysdev/fsl_pci.h
> @@ -92,6 +92,7 @@ extern int fsl_add_bridge(struct device_node *dev, int is_primary);
>  extern void fsl_pcibios_fixup_bus(struct pci_bus *bus);
>  extern int mpc83xx_add_bridge(struct device_node *dev);
>  u64 fsl_pci_immrbar_base(struct pci_controller *hose);
> +int fsl_add_pci_err(void);

With

#ifdef CONFIG_PCI
int fsl_add_pci_err(void);
#else
static inline int fsl_add_pci_err(void) { return -ENODEV; }
#endif

You won't need endless ifdefs in the board files:

#ifdef CONFIG_PCI
	fsl_add_pci_err();
#endif

Also, why not add this call to the fsl_add_bridge(), so you
won't need to touch board files at all.

Thanks,

-- 
Anton Vorontsov
Email: cbouatmailru@gmail.com
