From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH] edac/mpc85xx: Limit setting/clearing of HID1[RFXE] to
	e500v1/v2 cores
Date: Fri, 1 Apr 2011 08:03:56 -0500
Message-ID: <94F1D25E-6F38-42E5-A097-C4AB23E58D78@kernel.crashing.org>
References: <1301610194-29971-1-git-send-email-galak@kernel.crashing.org>
	<20110331224208.GA30426@us.ibm.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20110331224208.GA30426@us.ibm.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: linuxppc-dev@ozlabs.org, bluesmoke-devel@lists.sourceforge.net, dougthompson@xmission.com
List-Id: edac.vger.kernel.org


On Mar 31, 2011, at 5:42 PM, Nishanth Aravamudan wrote:

> On 31.03.2011 [17:23:14 -0500], Kumar Gala wrote:
>> Only the e500v1/v2 cores have HID1[RXFE] so we should attempt to set or
>> clear this register bit on them.  Otherwise we get crashes like:
> 
> <snip>
> 
>> diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
>> index b123bb3..5aef2ed 100644
>> --- a/drivers/edac/mpc85xx_edac.c
>> +++ b/drivers/edac/mpc85xx_edac.c
> 
> <snip>
> 
>> @@ -1209,10 +1215,15 @@ static void __exit mpc85xx_mc_restore_hid1(void *data)
>> static void __exit mpc85xx_mc_exit(void)
>> {
>> #ifdef CONFIG_FSL_SOC_BOOKE
>> -	on_each_cpu(mpc85xx_mc_restore_hid1, NULL, 0);
>> +	u32 pvr = mfspr(SPRN_PVR);
>> +
>> +	if ((PVR_VER(pvr) == PVR_VER_E500V1) ||
>> +	    (PVR_VER(pvr) == PVR_VER_E500V2)) {
>> +		on_each_cpu(mpc85xx_mc_restore_hid1, NULL, 0);
>> +	}
>> #endif
>> #ifdef CONFIG_PCI
>> -	of_unregister_platform_driver(&mpc85xx_pci_err_driver);
>> +	of_unregistr_platform_driver(&mpc85xx_pci_err_driver);
> 
> Unintended change?

Yep, thanks for catching.

- k
------------------------------------------------------------------------------
Create and publish websites with WebMatrix
Use the most popular FREE web apps or write code yourself; 
WebMatrix provides all the features you need to develop and 
publish your website. http://p.sf.net/sfu/ms-webmatrix-sf
