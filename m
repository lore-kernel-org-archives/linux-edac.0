From: Nishanth Aravamudan <nacc@us.ibm.com>
Subject: Re: [PATCH] edac/mpc85xx: Limit setting/clearing of HID1[RFXE] to
	e500v1/v2 cores
Date: Thu, 31 Mar 2011 15:42:08 -0700
Message-ID: <20110331224208.GA30426@us.ibm.com>
References: <1301610194-29971-1-git-send-email-galak@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <1301610194-29971-1-git-send-email-galak@kernel.crashing.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: linuxppc-dev@ozlabs.org, bluesmoke-devel@lists.sourceforge.net, dougthompson@xmission.com
List-Id: edac.vger.kernel.org

On 31.03.2011 [17:23:14 -0500], Kumar Gala wrote:
> Only the e500v1/v2 cores have HID1[RXFE] so we should attempt to set or
> clear this register bit on them.  Otherwise we get crashes like:

<snip>

> diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
> index b123bb3..5aef2ed 100644
> --- a/drivers/edac/mpc85xx_edac.c
> +++ b/drivers/edac/mpc85xx_edac.c

<snip>

> @@ -1209,10 +1215,15 @@ static void __exit mpc85xx_mc_restore_hid1(void *data)
>  static void __exit mpc85xx_mc_exit(void)
>  {
>  #ifdef CONFIG_FSL_SOC_BOOKE
> -	on_each_cpu(mpc85xx_mc_restore_hid1, NULL, 0);
> +	u32 pvr = mfspr(SPRN_PVR);
> +
> +	if ((PVR_VER(pvr) == PVR_VER_E500V1) ||
> +	    (PVR_VER(pvr) == PVR_VER_E500V2)) {
> +		on_each_cpu(mpc85xx_mc_restore_hid1, NULL, 0);
> +	}
>  #endif
>  #ifdef CONFIG_PCI
> -	of_unregister_platform_driver(&mpc85xx_pci_err_driver);
> +	of_unregistr_platform_driver(&mpc85xx_pci_err_driver);

Unintended change?

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
