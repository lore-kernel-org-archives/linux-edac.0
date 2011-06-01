From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 1/2] ppc/85xx: create a platform node for PCI EDAC device
Date: Wed, 1 Jun 2011 18:55:35 +0400
Message-ID: <BANLkTi=xFcZRd4x1FQSKJzmt3A7_tZs+sQ@mail.gmail.com>
References: <1306931292-2313-1-git-send-email-dbaryshkov@gmail.com>
	<20110601132519.GA16125@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20110601132519.GA16125@oksana.dev.rtsoft.ru>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Anton Vorontsov <avorontsov@mvista.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, bluesmoke-devel@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>
List-Id: edac.vger.kernel.org

On 6/1/11, Anton Vorontsov <avorontsov@mvista.com> wrote:
> On Wed, Jun 01, 2011 at 04:28:11PM +0400, Dmitry Eremin-Solenikov wrote:
> [...]
>> --- a/arch/powerpc/sysdev/fsl_pci.h
>> +++ b/arch/powerpc/sysdev/fsl_pci.h
>> @@ -92,6 +92,7 @@ extern int fsl_add_bridge(struct device_node *dev, int
>> is_primary);
>>  extern void fsl_pcibios_fixup_bus(struct pci_bus *bus);
>>  extern int mpc83xx_add_bridge(struct device_node *dev);
>>  u64 fsl_pci_immrbar_base(struct pci_controller *hose);
>> +int fsl_add_pci_err(void);
>
> With
>
> #ifdef CONFIG_PCI
> int fsl_add_pci_err(void);
> #else
> static inline int fsl_add_pci_err(void) { return -ENODEV; }
> #endif
>
> You won't need endless ifdefs in the board files:

OK, will redo this patch.

>
> #ifdef CONFIG_PCI
> 	fsl_add_pci_err();
> #endif
>
> Also, why not add this call to the fsl_add_bridge(), so you
> won't need to touch board files at all.

Because fsl_add_bridge is called too early, so allocation
of platform device fails.

-- 
With best wishes
Dmitry

------------------------------------------------------------------------------
Simplify data backup and recovery for your virtual environment with vRanger. 
Installation's a snap, and flexible recovery options mean your data is safe,
secure and there when you need it. Data protection magic?
Nope - It's vRanger. Get your free trial download today. 
http://p.sf.net/sfu/quest-sfdev2dev
