From: "Colbert, Rusty" <rusty.colbert@hp.com>
Subject: RE: Module loads but has error.
Date: Wed, 21 Oct 2009 14:13:10 +0000
Message-ID: <EC2969A33F12344780D895AFCAA422CE5086261902@GVW1095EXB.americas.hpqcorp.net>
References: <375171.22182.qm@web50101.mail.re2.yahoo.com>
	<1256073500.31589.58.camel@keith-laptop>
	<20091021074749.743ef923@caramujo.chehab.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20091021074749.743ef923@caramujo.chehab.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Doug Thompson <norsk5@yahoo.com>, bluesmoke ML <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

It was a linux-next tree and is identified as 2.6.32-rc4, and edac is:
EDAC MC: Ver: 2.1.0 Oct 16 2009
There are 2 sockets in the system.
I don't see those addresses in the output of lspci. It is looking glum, if my BIOS is hiding buses. However, once I verify that that is the case, I'll contact someone on the ROM team to check on that.

If I look at another board with Nehalem, not running my kernel, should I see those buses? (does not show up on a DL380 G6 running SLES11 default kernel either)

I could not get git to connect from my dev server. So I went to git and found your latest tree and clicked on it.
http://git.kernel.org/?p=linux/kernel/git/mchehab/i7core.git;a=summary

Then I went down to linux_next, clicked on it and grabbed a snapshot from the top of the tree.



-----Original Message-----
From: Mauro Carvalho Chehab [mailto:mchehab@infradead.org]
Sent: Tuesday, October 20, 2009 5:48 PM
To: Colbert, Rusty
Cc: Keith Mannthey; Doug Thompson; bluesmoke ML
Subject: Re: Module loads but has error.

Hi Rusty,

Em Tue, 20 Oct 2009 14:18:20 -0700
Keith Mannthey <kmannth@us.ibm.com> escreveu:

> On Tue, 2009-10-20 at 14:05 -0700, Doug Thompson wrote:
> > Copying Mauro on this one as he has the lead on it. He is currently in Japan for a few days for the kernel summit
> >
> > doug t
> >
> > --- On Tue, 10/20/09, Colbert, Rusty <rusty.colbert@hp.com> wrote:
> >
> > > From: Colbert, Rusty <rusty.colbert@hp.com>
> > > Subject: Module loads but has error.
> > > To: "bluesmoke ML" <bluesmoke-devel@lists.sourceforge.net>
> > > Date: Tuesday, October 20, 2009, 11:03 AM
> > >
> > > EDAC
> > > i7core: Device not
> > > found: dev 03.0 PCI ID 8086:2c18
>
> Rusty,
>   Are you using the current i7core git tree?  What version of the kernel
> are you using?
>
>   How many sockets do you have in your system?
>
>   Are there any other edac printk statements?  Could you enable
> EDAC_DEBUG and see if you get any more output?
>
>   After you try and load the driver what does lspci show?

Probably it didn't recognize the PCI buses 0xff and 0xfe.

Be sure to be using the linux-next branch from my -git tree (or from the
official linux-next tree), since it has all needed patches and fixes needed for
PCI device for it to work.

One of the tests machine is a Xeon 5550 (motherboard uses a Supermicro model
X8DTN with Intel(R) Xeon(R) CPU X5550 @ 2.67GHz CPUs - not sure whose manufactured
it, since I'm using it remotely), so I'm pretty sure that it works on such CPU's.

Those are the expected results:

# dmesg|grep -i edac
[   23.866982] EDAC MC: Ver: 2.1.0 Oct 19 2009
[   23.867007] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867030] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867054] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867077] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867097] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867117] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867137] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867157] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867178] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867199] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867219] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867239] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867258] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867277] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867295] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867315] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867334] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867353] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867372] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867391] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867409] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867428] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867447] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867466] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867502] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867532] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867562] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867593] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867625] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867702] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867734] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867765] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867797] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867837] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867871] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867904] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867937] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.867970] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868006] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868040] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868079] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868116] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868151] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868186] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868225] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868264] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: edac_pci_dev_parity_clear()
[   23.868422] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 1028: edac_sysfs_setup_mc_kset()
[   23.868553] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 1045: edac_sysfs_setup_mc_kset() Registered '.../edac/mc' kobject
[   23.917015] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 2030: MC: drivers/edac/i7core_edac.c: i7core_init()
[   23.952493] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:03.0 PCI ID 8086:2c18
[   23.952585] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:03.0 PCI ID 8086:2c18
[   23.952723] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:03.1 PCI ID 8086:2c19
[   23.952778] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:03.1 PCI ID 8086:2c19
[   23.952898] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:03.2 PCI ID 8086:2c1a
[   23.952964] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:03.2 PCI ID 8086:2c1a
[   23.953159] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:03.4 PCI ID 8086:2c1c
[   23.953224] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:03.4 PCI ID 8086:2c1c
[   23.953357] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:04.0 PCI ID 8086:2c20
[   23.953407] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:04.0 PCI ID 8086:2c20
[   23.953546] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:04.1 PCI ID 8086:2c21
[   23.953621] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:04.1 PCI ID 8086:2c21
[   23.953750] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:04.2 PCI ID 8086:2c22
[   23.953796] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:04.2 PCI ID 8086:2c22
[   23.953950] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:04.3 PCI ID 8086:2c23
[   23.954006] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:04.3 PCI ID 8086:2c23
[   23.954152] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:05.0 PCI ID 8086:2c28
[   23.954195] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:05.0 PCI ID 8086:2c28
[   23.954285] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:05.1 PCI ID 8086:2c29
[   23.954330] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:05.1 PCI ID 8086:2c29
[   23.954471] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:05.2 PCI ID 8086:2c2a
[   23.954539] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:05.2 PCI ID 8086:2c2a
[   23.954690] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:05.3 PCI ID 8086:2c2b
[   23.954748] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:05.3 PCI ID 8086:2c2b
[   23.954888] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:06.0 PCI ID 8086:2c30
[   23.954947] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:06.0 PCI ID 8086:2c30
[   23.955098] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:06.1 PCI ID 8086:2c31
[   23.955153] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:06.1 PCI ID 8086:2c31
[   23.955259] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:06.2 PCI ID 8086:2c32
[   23.955315] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:06.2 PCI ID 8086:2c32
[   23.955435] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:06.3 PCI ID 8086:2c33
[   23.955488] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:06.3 PCI ID 8086:2c33
[   23.955715] i7core_edac: detected a Nehalem Memory Controller
[   23.955724] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 0 dev ff:00.0 PCI ID 8086:2c41
[   23.955874] i7core_edac: detected a Nehalem Memory Controller
[   23.955886] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Detected socket 1 dev fe:00.0 PCI ID 8086:2c41
[   23.956042] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 513: Number of active channels on socket 0: 2
[   23.956077] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 670: edac_mc_register_sysfs_main_kobj()
[   23.956397] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 706: edac_mc_register_sysfs_main_kobj() Registered '.../edac/mc0' kobject
[   23.956409] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1821: MC: drivers/edac/i7core_edac.c: i7core_register_mci(): mci = ffff8801398e8000
[   23.956435] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 3.0, dev = ffff88013e1cf000, socket 0
[   23.956444] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 3.1, dev = ffff88013e1cf800, socket 0
[   23.956452] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 3.2, dev = ffff88013e1cb000, socket 0
[   23.956462] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 3.4, dev = ffff88013e1c8800, socket 0
[   23.956483] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 4.0, dev = ffff88013c7df000, socket 0
[   23.956490] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 4.1, dev = ffff88013c7df800, socket 0
[   23.956499] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 4.2, dev = ffff88013c7de000, socket 0
[   23.956508] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 4.3, dev = ffff88013c7de800, socket 0
[   23.956515] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 5.0, dev = ffff88013c7dd000, socket 0
[   23.956523] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 5.1, dev = ffff88013c7dd800, socket 0
[   23.956529] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 5.2, dev = ffff88013a2d8000, socket 0
[   23.956534] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 5.3, dev = ffff88013a2d8800, socket 0
[   23.956541] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 6.0, dev = ffff88013a2d9000, socket 0
[   23.956549] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 6.1, dev = ffff88013a2d9800, socket 0
[   23.956555] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 6.2, dev = ffff88013a2da000, socket 0
[   23.956561] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 6.3, dev = ffff88013a2da800, socket 0
[   23.956566] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 0.0, dev = ffff88013e1c8000, socket 0
[   23.956578] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 541: QPI 0 control=0x00000602 status=0x00000019 dod=0x00000090 map=0x00024489
[   23.956583] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 545: ECC enabled with x8 SDCC
[   23.956590] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 564: DOD Max limits: DIMMS: 1, 1-ranked, 8-banked x4000 x 0x400
[   23.956596] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 573: Channel 0 is not active
[   23.956614] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 617: Ch1 phy rd1, wr1 (0x063ffc31): 2 ranks, RDIMMs
[   23.956620] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 640:  dimm 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000, col: 0x400
[   23.956641] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 692:  [1] DIVBY3      REMOVED OFFSET
[   23.956646] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956651] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956657] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956661] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956665] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956673] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956680] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956685] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956695] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 617: Ch2 phy rd3, wr3 (0x063ffc31): 2 ranks, RDIMMs
[   23.956705] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 640:  dimm 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000, col: 0x400
[   23.956733] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 692:  [2] DIVBY3      REMOVED OFFSET
[   23.956740] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956748] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956754] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956760] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956767] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956774] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956780] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956785] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.956793] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 473: edac_mc_add_mc()
[   23.956827] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 911: edac_create_sysfs_mci_device() idx=0
[   23.956880] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 802: edac_create_mci_instance_attributes()
[   23.956885] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file inject_section
[   23.956918] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file inject_type
[   23.956953] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file inject_eccmask
[   23.956993] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 818: edac_create_mci_instance_attributes() grp inject_addrmatch, mci ffff8801398e8000
[   23.957074] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 802: edac_create_mci_instance_attributes()
[   23.957082] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file channel
[   23.957106] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file dimm
[   23.957132] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file rank
[   23.957159] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file bank
[   23.957183] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file page
[   23.957212] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file col
[   23.957246] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file inject_enable
[   23.957878] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 296: edac_mc_workq_setup()
[   23.957892] EDAC MC0: Giving out device to 'i7core_edac.c' 'i7 core #0': DEV 0000:ff:03.0
[   23.957899] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 49: edac_pci_alloc_ctl_info()
[   23.957920] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 346: edac_pci_add_device()
[   23.957946] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 126: add_edac_pci_to_global_list()
[   23.957953] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 101: find_edac_pci_by_dev()
[   23.957961] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 444: edac_pci_create_sysfs() idx=0
[   23.957966] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 347: edac_pci_main_kobj_setup()
[   23.958246] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 394: Registered '.../edac/pci' kobject
[   23.958254] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 163: edac_pci_create_instance_kobj()
[   23.958436] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 186: edac_pci_create_instance_kobj() Register instance 'pci0' kobject
[   23.958468] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 274: edac_pci_workq_setup()
[   23.958474] EDAC PCI0: Giving out device to module 'i7core_edac' controller 'EDAC PCI controller': DEV '0000:ff:03.0' (POLLED)
[   23.958511] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 513: Number of active channels on socket 1: 2
[   23.958526] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 670: edac_mc_register_sysfs_main_kobj()
[   23.962494] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 706: edac_mc_register_sysfs_main_kobj() Registered '.../edac/mc1' kobject
[   23.962503] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1821: MC: drivers/edac/i7core_edac.c: i7core_register_mci(): mci = ffff8801398ea000
[   23.962533] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 3.0, dev = ffff88013a2de000, socket 1
[   23.962539] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 3.1, dev = ffff88013a2de800, socket 1
[   23.962545] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 3.2, dev = ffff88013a2df000, socket 1
[   23.962549] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 3.4, dev = ffff88013a2df800, socket 1
[   23.962554] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 4.0, dev = ffff88013a2f0000, socket 1
[   23.962561] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 4.1, dev = ffff88013a2f0800, socket 1
[   23.962571] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 4.2, dev = ffff88013a2f1000, socket 1
[   23.962582] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 4.3, dev = ffff88013a2f1800, socket 1
[   23.962595] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 5.0, dev = ffff88013a2f2000, socket 1
[   23.962609] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 5.1, dev = ffff88013a2f2800, socket 1
[   23.962622] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 5.2, dev = ffff88013a2f3000, socket 1
[   23.962630] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 5.3, dev = ffff88013a2f3800, socket 1
[   23.962645] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 6.0, dev = ffff88013cfc2800, socket 1
[   23.962653] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 6.1, dev = ffff88013cfc3000, socket 1
[   23.962662] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 6.2, dev = ffff88013cfc1800, socket 1
[   23.962674] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 6.3, dev = ffff88013cfc4800, socket 1
[   23.962682] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Associated fn 0.0, dev = ffff88013a2db000, socket 1
[   23.962712] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 541: QPI 1 control=0x00000602 status=0x00000019 dod=0x00000090 map=0x00024489
[   23.962724] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 545: ECC enabled with x8 SDCC
[   23.962737] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 564: DOD Max limits: DIMMS: 1, 1-ranked, 8-banked x4000 x 0x400
[   23.962745] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 573: Channel 0 is not active
[   23.962766] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 617: Ch1 phy rd1, wr1 (0x063ffc31): 2 ranks, RDIMMs
[   23.962779] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 640:  dimm 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000, col: 0x400
[   23.962810] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 692:  [1] DIVBY3      REMOVED OFFSET
[   23.962822] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962830] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962836] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962845] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962853] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962860] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962869] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962876] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962894] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 617: Ch2 phy rd3, wr3 (0x063ffc31): 2 ranks, RDIMMs
[   23.962903] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 640:  dimm 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000, col: 0x400
[   23.962943] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 692:  [2] DIVBY3      REMOVED OFFSET
[   23.962954] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962966] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962978] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962987] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.962995] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.963005] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.963012] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.963021] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:         0x0      0x0     0x0
[   23.963033] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 473: edac_mc_add_mc()
[   23.963044] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 911: edac_create_sysfs_mci_device() idx=1
[   23.963093] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 802: edac_create_mci_instance_attributes()
[   23.963105] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file inject_section
[   23.963134] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file inject_type
[   23.963161] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file inject_eccmask
[   23.963202] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 818: edac_create_mci_instance_attributes() grp inject_addrmatch, mci ffff8801398ea000
[   23.963278] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 802: edac_create_mci_instance_attributes()
[   23.963287] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file channel
[   23.963669] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file dimm
[   23.963713] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file rank
[   23.963749] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file bank
[   23.963786] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file page
[   23.963838] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file col
[   23.963878] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: edac_create_mci_instance_attributes() file inject_enable
[   23.964601] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 296: edac_mc_workq_setup()
[   23.964613] EDAC MC1: Giving out device to 'i7core_edac.c' 'i7 core #1': DEV 0000:fe:03.0
[   23.964624] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 49: edac_pci_alloc_ctl_info()
[   23.964644] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 346: edac_pci_add_device()
[   23.964655] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 126: add_edac_pci_to_global_list()
[   23.964663] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 101: find_edac_pci_by_dev()
[   23.964671] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 444: edac_pci_create_sysfs() idx=1
[   23.964678] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 347: edac_pci_main_kobj_setup()
[   23.964689] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 163: edac_pci_create_instance_kobj()
[   23.964918] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 186: edac_pci_create_instance_kobj() Register instance 'pci1' kobject
[   23.964971] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 274: edac_pci_workq_setup()
[   23.964978] EDAC PCI1: Giving out device to module 'i7core_edac' controller 'EDAC PCI controller': DEV '0000:fe:03.0' (POLLED)
[   23.964985] EDAC i7core: Driver loaded.

Also, you should be able to see the PCI buses ff and fe:

# lspci -n|grep ^f
fe:00.0 0600: 8086:2c40 (rev 04)
fe:00.1 0600: 8086:2c01 (rev 04)
fe:02.0 0600: 8086:2c10 (rev 04)
fe:02.1 0600: 8086:2c11 (rev 04)
fe:02.4 0600: 8086:2c14 (rev 04)
fe:02.5 0600: 8086:2c15 (rev 04)
fe:03.0 0600: 8086:2c18 (rev 04)
fe:03.1 0600: 8086:2c19 (rev 04)
fe:03.2 0600: 8086:2c1a (rev 04)
fe:03.4 0600: 8086:2c1c (rev 04)
fe:04.0 0600: 8086:2c20 (rev 04)
fe:04.1 0600: 8086:2c21 (rev 04)
fe:04.2 0600: 8086:2c22 (rev 04)
fe:04.3 0600: 8086:2c23 (rev 04)
fe:05.0 0600: 8086:2c28 (rev 04)
fe:05.1 0600: 8086:2c29 (rev 04)
fe:05.2 0600: 8086:2c2a (rev 04)
fe:05.3 0600: 8086:2c2b (rev 04)
fe:06.0 0600: 8086:2c30 (rev 04)
fe:06.1 0600: 8086:2c31 (rev 04)
fe:06.2 0600: 8086:2c32 (rev 04)
fe:06.3 0600: 8086:2c33 (rev 04)
ff:00.0 0600: 8086:2c40 (rev 04)
ff:00.1 0600: 8086:2c01 (rev 04)
ff:02.0 0600: 8086:2c10 (rev 04)
ff:02.1 0600: 8086:2c11 (rev 04)
ff:02.4 0600: 8086:2c14 (rev 04)
ff:02.5 0600: 8086:2c15 (rev 04)
ff:03.0 0600: 8086:2c18 (rev 04)
ff:03.1 0600: 8086:2c19 (rev 04)
ff:03.2 0600: 8086:2c1a (rev 04)
ff:03.4 0600: 8086:2c1c (rev 04)
ff:04.0 0600: 8086:2c20 (rev 04)
ff:04.1 0600: 8086:2c21 (rev 04)
ff:04.2 0600: 8086:2c22 (rev 04)
ff:04.3 0600: 8086:2c23 (rev 04)
ff:05.0 0600: 8086:2c28 (rev 04)
ff:05.1 0600: 8086:2c29 (rev 04)
ff:05.2 0600: 8086:2c2a (rev 04)
ff:05.3 0600: 8086:2c2b (rev 04)
ff:06.0 0600: 8086:2c30 (rev 04)
ff:06.1 0600: 8086:2c31 (rev 04)
ff:06.2 0600: 8086:2c32 (rev 04)
ff:06.3 0600: 8086:2c33 (rev 04)

If you are not noticing the PCI devices starting with fe: and ff: and are using
my latest tree, then it is likely that your motherboard BIOS is doing something
weird to hide the Nehalem non-core PCI buses.


>
> Thanks,
>   Keith Mannthey
>   LTC Real-Time
>
> > >
> > >
> > > This would seem to be the
> > > PCI_DEVICE_ID_INTEL_I7_MCR
> > >
> > >
> > >
> > > The modules are loaded, but I think this
> > > error may have caused them to
> > > be ineffective. There are no files under
> > > /sys/devices/system/edac/mc as in
> > > older edac enabled kernels.
> > >
> > >
> > >
> > > I have access to multiple platforms and
> > > can acquire DIMMs with ECC
> > > errors, but I don't see the point in installing them if
> > > the driver is not
> > > installing properly.
> > >
> > >
> > >
> > > I am currently running on an HP ProLiant DL360. It
> > > has
> > > Intel Xeon CPUs X5550.
> > >
> > > Any pointers on how I should approach
> > > debugging this?
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > -----Inline Attachment Follows-----
> > >
> > > ------------------------------------------------------------------------------
> > > Come build with us! The BlackBerry(R) Developer Conference
> > > in SF, CA
> > > is the only developer event you need to attend this year.
> > > Jumpstart your
> > > developing skills, take BlackBerry mobile applications to
> > > market and stay
> > > ahead of the curve. Join us from November 9 - 12, 2009.
> > > Register now!
> > > http://p.sf.net/sfu/devconference
> > > -----Inline Attachment Follows-----
> > >
> > > _______________________________________________
> > > bluesmoke-devel mailing list
> > > bluesmoke-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel
> > >
> >
> > ------------------------------------------------------------------------------
> > Come build with us! The BlackBerry(R) Developer Conference in SF, CA
> > is the only developer event you need to attend this year. Jumpstart your
> > developing skills, take BlackBerry mobile applications to market and stay
> > ahead of the curve. Join us from November 9 - 12, 2009. Register now!
> > http://p.sf.net/sfu/devconference
> > _______________________________________________
> > bluesmoke-devel mailing list
> > bluesmoke-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel
>
>
> ------------------------------------------------------------------------------
> Come build with us! The BlackBerry(R) Developer Conference in SF, CA
> is the only developer event you need to attend this year. Jumpstart your
> developing skills, take BlackBerry mobile applications to market and stay
> ahead of the curve. Join us from November 9 - 12, 2009. Register now!
> http://p.sf.net/sfu/devconference
> _______________________________________________
> bluesmoke-devel mailing list
> bluesmoke-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel




Cheers,
Mauro

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
