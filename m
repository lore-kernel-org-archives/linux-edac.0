From: "Colbert, Rusty" <rusty.colbert@hp.com>
Subject: RE: Module loads but has error.
Date: Wed, 21 Oct 2009 17:55:51 +0000
Message-ID: <EC2969A33F12344780D895AFCAA422CE5086261B8E@GVW1095EXB.americas.hpqcorp.net>
References: <375171.22182.qm@web50101.mail.re2.yahoo.com>
	<1256073500.31589.58.camel@keith-laptop>
	<20091021074749.743ef923@caramujo.chehab.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8475279349434629089=="
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

--===============8475279349434629089==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_EC2969A33F12344780D895AFCAA422CE5086261B8EGVW1095EXBame_"

--_000_EC2969A33F12344780D895AFCAA422CE5086261B8EGVW1095EXBame_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I checked my tree against a fresh linux-next download and found no differen=
ces in the edac dir. However, my DEBUG output has a different line number f=
or i7core_init. I cannot find your updated i7core_edac.c.



EDAC DEBUG: in /usr/src/linux-2.6.34-edac-memtest/drivers/edac/edac_mc_sysf=
s.c, line at 1028: edac_sysfs_setup_mc_kset()

EDAC DEBUG: in /usr/src/linux-2.6.34-edac-memtest/drivers/edac/edac_mc_sysf=
s.c, line at 1045: edac_sysfs_setup_mc_kset() Registered '.../edac/mc' kobj=
ect

EDAC DEBUG: in /usr/src/linux-2.6.34-edac-memtest/drivers/edac/i7core_edac.=
c, line at 1947: MC: /usr/src/linux-2.6.34-edac-memtest/drivers/edac/i7core=
_edac.c: i7core_init()
EDAC i7core: Device not found: dev 03.0 PCI ID 8086:2c18





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

> > Copying Mauro on this one as he has the lead on it. He is currently in =
Japan for a few days for the kernel summit

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

official linux-next tree), since it has all needed patches and fixes needed=
 for

PCI device for it to work.



One of the tests machine is a Xeon 5550 (motherboard uses a Supermicro mode=
l

X8DTN with Intel(R) Xeon(R) CPU X5550 @ 2.67GHz CPUs - not sure whose manuf=
actured

it, since I'm using it remotely), so I'm pretty sure that it works on such =
CPU's.



Those are the expected results:



# dmesg|grep -i edac

[   23.866982] EDAC MC: Ver: 2.1.0 Oct 19 2009

[   23.867007] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867030] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867054] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867077] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867097] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867117] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867137] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867157] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867178] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867199] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867219] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867239] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867258] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867277] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867295] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867315] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867334] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867353] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867372] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867391] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867409] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867428] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867447] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867466] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867502] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867532] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867562] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867593] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867625] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867702] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867734] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867765] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867797] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867837] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867871] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867904] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867937] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.867970] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868006] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868040] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868079] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868116] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868151] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868186] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868225] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868264] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 537: e=
dac_pci_dev_parity_clear()

[   23.868422] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 1028: e=
dac_sysfs_setup_mc_kset()

[   23.868553] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 1045: e=
dac_sysfs_setup_mc_kset() Registered '.../edac/mc' kobject

[   23.917015] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 2030: MC:=
 drivers/edac/i7core_edac.c: i7core_init()

[   23.952493] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:03.0 PCI ID 8086:2c18

[   23.952585] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:03.0 PCI ID 8086:2c18

[   23.952723] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:03.1 PCI ID 8086:2c19

[   23.952778] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:03.1 PCI ID 8086:2c19

[   23.952898] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:03.2 PCI ID 8086:2c1a

[   23.952964] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:03.2 PCI ID 8086:2c1a

[   23.953159] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:03.4 PCI ID 8086:2c1c

[   23.953224] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:03.4 PCI ID 8086:2c1c

[   23.953357] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:04.0 PCI ID 8086:2c20

[   23.953407] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:04.0 PCI ID 8086:2c20

[   23.953546] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:04.1 PCI ID 8086:2c21

[   23.953621] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:04.1 PCI ID 8086:2c21

[   23.953750] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:04.2 PCI ID 8086:2c22

[   23.953796] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:04.2 PCI ID 8086:2c22

[   23.953950] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:04.3 PCI ID 8086:2c23

[   23.954006] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:04.3 PCI ID 8086:2c23

[   23.954152] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:05.0 PCI ID 8086:2c28

[   23.954195] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:05.0 PCI ID 8086:2c28

[   23.954285] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:05.1 PCI ID 8086:2c29

[   23.954330] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:05.1 PCI ID 8086:2c29

[   23.954471] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:05.2 PCI ID 8086:2c2a

[   23.954539] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:05.2 PCI ID 8086:2c2a

[   23.954690] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:05.3 PCI ID 8086:2c2b

[   23.954748] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:05.3 PCI ID 8086:2c2b

[   23.954888] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:06.0 PCI ID 8086:2c30

[   23.954947] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:06.0 PCI ID 8086:2c30

[   23.955098] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:06.1 PCI ID 8086:2c31

[   23.955153] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:06.1 PCI ID 8086:2c31

[   23.955259] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:06.2 PCI ID 8086:2c32

[   23.955315] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:06.2 PCI ID 8086:2c32

[   23.955435] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:06.3 PCI ID 8086:2c33

[   23.955488] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:06.3 PCI ID 8086:2c33

[   23.955715] i7core_edac: detected a Nehalem Memory Controller

[   23.955724] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 0 dev ff:00.0 PCI ID 8086:2c41

[   23.955874] i7core_edac: detected a Nehalem Memory Controller

[   23.955886] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1342: Det=
ected socket 1 dev fe:00.0 PCI ID 8086:2c41

[   23.956042] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 513: Numb=
er of active channels on socket 0: 2

[   23.956077] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 670: ed=
ac_mc_register_sysfs_main_kobj()

[   23.956397] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 706: ed=
ac_mc_register_sysfs_main_kobj() Registered '.../edac/mc0' kobject

[   23.956409] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1821: MC:=
 drivers/edac/i7core_edac.c: i7core_register_mci(): mci =3D ffff8801398e800=
0

[   23.956435] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 3.0, dev =3D ffff88013e1cf000, socket 0

[   23.956444] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 3.1, dev =3D ffff88013e1cf800, socket 0

[   23.956452] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 3.2, dev =3D ffff88013e1cb000, socket 0

[   23.956462] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 3.4, dev =3D ffff88013e1c8800, socket 0

[   23.956483] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 4.0, dev =3D ffff88013c7df000, socket 0

[   23.956490] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 4.1, dev =3D ffff88013c7df800, socket 0

[   23.956499] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 4.2, dev =3D ffff88013c7de000, socket 0

[   23.956508] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 4.3, dev =3D ffff88013c7de800, socket 0

[   23.956515] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 5.0, dev =3D ffff88013c7dd000, socket 0

[   23.956523] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 5.1, dev =3D ffff88013c7dd800, socket 0

[   23.956529] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 5.2, dev =3D ffff88013a2d8000, socket 0

[   23.956534] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 5.3, dev =3D ffff88013a2d8800, socket 0

[   23.956541] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 6.0, dev =3D ffff88013a2d9000, socket 0

[   23.956549] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 6.1, dev =3D ffff88013a2d9800, socket 0

[   23.956555] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 6.2, dev =3D ffff88013a2da000, socket 0

[   23.956561] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 6.3, dev =3D ffff88013a2da800, socket 0

[   23.956566] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 0.0, dev =3D ffff88013e1c8000, socket 0

[   23.956578] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 541: QPI =
0 control=3D0x00000602 status=3D0x00000019 dod=3D0x00000090 map=3D0x0002448=
9

[   23.956583] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 545: ECC =
enabled with x8 SDCC

[   23.956590] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 564: DOD =
Max limits: DIMMS: 1, 1-ranked, 8-banked x4000 x 0x400

[   23.956596] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 573: Chan=
nel 0 is not active

[   23.956614] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 617: Ch1 =
phy rd1, wr1 (0x063ffc31): 2 ranks, RDIMMs

[   23.956620] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 640:  dim=
m 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000, col: 0x400

[   23.956641] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 692:  [1]=
 DIVBY3      REMOVED OFFSET

[   23.956646] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956651] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956657] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956661] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956665] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956673] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956680] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956685] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956695] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 617: Ch2 =
phy rd3, wr3 (0x063ffc31): 2 ranks, RDIMMs

[   23.956705] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 640:  dim=
m 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000, col: 0x400

[   23.956733] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 692:  [2]=
 DIVBY3      REMOVED OFFSET

[   23.956740] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956748] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956754] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956760] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956767] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956774] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956780] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956785] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.956793] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 473: edac_mc_=
add_mc()

[   23.956827] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 911: ed=
ac_create_sysfs_mci_device() idx=3D0

[   23.956880] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 802: ed=
ac_create_mci_instance_attributes()

[   23.956885] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file inject_section

[   23.956918] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file inject_type

[   23.956953] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file inject_eccmask

[   23.956993] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 818: ed=
ac_create_mci_instance_attributes() grp inject_addrmatch, mci ffff8801398e8=
000

[   23.957074] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 802: ed=
ac_create_mci_instance_attributes()

[   23.957082] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file channel

[   23.957106] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file dimm

[   23.957132] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file rank

[   23.957159] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file bank

[   23.957183] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file page

[   23.957212] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file col

[   23.957246] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file inject_enable

[   23.957878] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 296: edac_mc_=
workq_setup()

[   23.957892] EDAC MC0: Giving out device to 'i7core_edac.c' 'i7 core #0':=
 DEV 0000:ff:03.0

[   23.957899] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 49: edac_pci=
_alloc_ctl_info()

[   23.957920] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 346: edac_pc=
i_add_device()

[   23.957946] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 126: add_eda=
c_pci_to_global_list()

[   23.957953] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 101: find_ed=
ac_pci_by_dev()

[   23.957961] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 444: e=
dac_pci_create_sysfs() idx=3D0

[   23.957966] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 347: e=
dac_pci_main_kobj_setup()

[   23.958246] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 394: R=
egistered '.../edac/pci' kobject

[   23.958254] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 163: e=
dac_pci_create_instance_kobj()

[   23.958436] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 186: e=
dac_pci_create_instance_kobj() Register instance 'pci0' kobject

[   23.958468] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 274: edac_pc=
i_workq_setup()

[   23.958474] EDAC PCI0: Giving out device to module 'i7core_edac' control=
ler 'EDAC PCI controller': DEV '0000:ff:03.0' (POLLED)

[   23.958511] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 513: Numb=
er of active channels on socket 1: 2

[   23.958526] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 670: ed=
ac_mc_register_sysfs_main_kobj()

[   23.962494] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 706: ed=
ac_mc_register_sysfs_main_kobj() Registered '.../edac/mc1' kobject

[   23.962503] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1821: MC:=
 drivers/edac/i7core_edac.c: i7core_register_mci(): mci =3D ffff8801398ea00=
0

[   23.962533] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 3.0, dev =3D ffff88013a2de000, socket 1

[   23.962539] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 3.1, dev =3D ffff88013a2de800, socket 1

[   23.962545] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 3.2, dev =3D ffff88013a2df000, socket 1

[   23.962549] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 3.4, dev =3D ffff88013a2df800, socket 1

[   23.962554] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 4.0, dev =3D ffff88013a2f0000, socket 1

[   23.962561] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 4.1, dev =3D ffff88013a2f0800, socket 1

[   23.962571] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 4.2, dev =3D ffff88013a2f1000, socket 1

[   23.962582] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 4.3, dev =3D ffff88013a2f1800, socket 1

[   23.962595] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 5.0, dev =3D ffff88013a2f2000, socket 1

[   23.962609] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 5.1, dev =3D ffff88013a2f2800, socket 1

[   23.962622] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 5.2, dev =3D ffff88013a2f3000, socket 1

[   23.962630] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 5.3, dev =3D ffff88013a2f3800, socket 1

[   23.962645] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 6.0, dev =3D ffff88013cfc2800, socket 1

[   23.962653] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 6.1, dev =3D ffff88013cfc3000, socket 1

[   23.962662] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 6.2, dev =3D ffff88013cfc1800, socket 1

[   23.962674] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 6.3, dev =3D ffff88013cfc4800, socket 1

[   23.962682] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 1403: Ass=
ociated fn 0.0, dev =3D ffff88013a2db000, socket 1

[   23.962712] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 541: QPI =
1 control=3D0x00000602 status=3D0x00000019 dod=3D0x00000090 map=3D0x0002448=
9

[   23.962724] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 545: ECC =
enabled with x8 SDCC

[   23.962737] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 564: DOD =
Max limits: DIMMS: 1, 1-ranked, 8-banked x4000 x 0x400

[   23.962745] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 573: Chan=
nel 0 is not active

[   23.962766] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 617: Ch1 =
phy rd1, wr1 (0x063ffc31): 2 ranks, RDIMMs

[   23.962779] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 640:  dim=
m 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000, col: 0x400

[   23.962810] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 692:  [1]=
 DIVBY3      REMOVED OFFSET

[   23.962822] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962830] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962836] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962845] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962853] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962860] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962869] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962876] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962894] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 617: Ch2 =
phy rd3, wr3 (0x063ffc31): 2 ranks, RDIMMs

[   23.962903] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 640:  dim=
m 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000, col: 0x400

[   23.962943] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 692:  [2]=
 DIVBY3      REMOVED OFFSET

[   23.962954] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962966] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962978] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962987] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.962995] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.963005] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.963012] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.963021] EDAC DEBUG: in drivers/edac/i7core_edac.c, line at 697:     =
    0x0      0x0     0x0

[   23.963033] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 473: edac_mc_=
add_mc()

[   23.963044] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 911: ed=
ac_create_sysfs_mci_device() idx=3D1

[   23.963093] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 802: ed=
ac_create_mci_instance_attributes()

[   23.963105] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file inject_section

[   23.963134] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file inject_type

[   23.963161] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file inject_eccmask

[   23.963202] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 818: ed=
ac_create_mci_instance_attributes() grp inject_addrmatch, mci ffff8801398ea=
000

[   23.963278] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 802: ed=
ac_create_mci_instance_attributes()

[   23.963287] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file channel

[   23.963669] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file dimm

[   23.963713] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file rank

[   23.963749] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file bank

[   23.963786] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file page

[   23.963838] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file col

[   23.963878] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 835: ed=
ac_create_mci_instance_attributes() file inject_enable

[   23.964601] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 296: edac_mc_=
workq_setup()

[   23.964613] EDAC MC1: Giving out device to 'i7core_edac.c' 'i7 core #1':=
 DEV 0000:fe:03.0

[   23.964624] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 49: edac_pci=
_alloc_ctl_info()

[   23.964644] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 346: edac_pc=
i_add_device()

[   23.964655] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 126: add_eda=
c_pci_to_global_list()

[   23.964663] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 101: find_ed=
ac_pci_by_dev()

[   23.964671] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 444: e=
dac_pci_create_sysfs() idx=3D1

[   23.964678] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 347: e=
dac_pci_main_kobj_setup()

[   23.964689] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 163: e=
dac_pci_create_instance_kobj()

[   23.964918] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 186: e=
dac_pci_create_instance_kobj() Register instance 'pci1' kobject

[   23.964971] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 274: edac_pc=
i_workq_setup()

[   23.964978] EDAC PCI1: Giving out device to module 'i7core_edac' control=
ler 'EDAC PCI controller': DEV '0000:fe:03.0' (POLLED)

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



If you are not noticing the PCI devices starting with fe: and ff: and are u=
sing

my latest tree, then it is likely that your motherboard BIOS is doing somet=
hing

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

> > > ---------------------------------------------------------------------=
---------

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

> > -----------------------------------------------------------------------=
-------

> > Come build with us! The BlackBerry(R) Developer Conference in SF, CA

> > is the only developer event you need to attend this year. Jumpstart you=
r

> > developing skills, take BlackBerry mobile applications to market and st=
ay

> > ahead of the curve. Join us from November 9 - 12, 2009. Register now!

> > http://p.sf.net/sfu/devconference

> > _______________________________________________

> > bluesmoke-devel mailing list

> > bluesmoke-devel@lists.sourceforge.net

> > https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel

>

>

> -------------------------------------------------------------------------=
-----

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

--_000_EC2969A33F12344780D895AFCAA422CE5086261B8EGVW1095EXBame_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered)">

<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:#606420;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 77.95pt 1.0in 77.95pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3D"#606420">

<div class=3DSection1>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>I checked my tree against a fresh linux-next download and found no
differences in the edac dir. However, my DEBUG output has a different line
number for i7core_init. I cannot find your updated i7core_edac.c.</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>EDAC DEBUG: in /usr/src/linux-2.6.34-edac-memtest/drivers/edac/edac=
_mc_sysfs.c,
line at 1028: edac_sysfs_setup_mc_kset()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>EDAC DEBUG: in /usr/src/linux-2.6.34-edac-memtest/drivers/edac/edac=
_mc_sysfs.c,
line at 1045: edac_sysfs_setup_mc_kset() Registered '.../edac/mc' kobject</=
span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt;background:yellow'>EDAC DEBUG: in
/usr/src/linux-2.6.34-edac-memtest/drivers/edac/i7core_edac.c, line at 1947=
:
MC: /usr/src/linux-2.6.34-edac-memtest/drivers/edac/i7core_edac.c: i7core_i=
nit()</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 face=3D"C=
ourier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>EDAC i7core: Device no=
t
found: dev 03.0 PCI ID 8086:2c18</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>-----Original Message-----<br>
From: Mauro Carvalho Chehab [mailto:mchehab@infradead.org] <br>
Sent: Tuesday, October 20, 2009 5:48 PM<br>
To: Colbert, Rusty<br>
Cc: Keith Mannthey; Doug Thompson; bluesmoke ML<br>
Subject: Re: Module loads but has error.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Hi Rusty,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Em Tue, 20 Oct 2009 14:18:20 -0700</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Keith Mannthey &lt;kmannth@us.ibm.com&gt; escreveu:</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; On Tue, 2009-10-20 at 14:05 -0700, Doug Thompson wrote:</span>=
</font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; Copying Mauro on this one as he has the lead on it. He is
currently in Japan for a few days for the kernel summit</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; doug t</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; --- On Tue, 10/20/09, Colbert, Rusty
&lt;rusty.colbert@hp.com&gt; wrote:</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; From: Colbert, Rusty &lt;rusty.colbert@hp.com&gt;</s=
pan></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; Subject: Module loads but has error.</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; To: &quot;bluesmoke ML&quot; &lt;bluesmoke-devel@lis=
ts.sourceforge.net&gt;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; Date: Tuesday, October 20, 2009, 11:03 AM</span></fo=
nt></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; EDAC</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; i7core: Device not</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; found: dev 03.0 PCI ID 8086:2c18</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; Rusty, </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt;&nbsp;&nbsp; Are you using the current i7core git tree?&nbsp; W=
hat
version of the kernel</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; are you using? </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt;&nbsp;&nbsp; How many sockets do you have in your system?</span=
></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt;&nbsp;&nbsp; Are there any other edac printk statements?&nbsp;
Could you enable</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; EDAC_DEBUG and see if you get any more output? </span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt;&nbsp;&nbsp; After you try and load the driver what does lspci
show? </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Probably it didn't recognize the PCI buses 0xff and 0xfe.</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Be sure to be using the linux-next branch from my -git tree (or fro=
m
the</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>official linux-next tree), since it has all needed patches and fixe=
s
needed for</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>PCI device for it to work.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>One of the tests machine is a Xeon 5550 (motherboard uses a Supermi=
cro
model</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>X8DTN with Intel(R) Xeon(R) CPU X5550 @ 2.67GHz CPUs - not sure who=
se
manufactured</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>it, since I'm using it remotely), so I'm pretty sure that it works =
on
such CPU's.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Those are the expected results:</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'># dmesg|grep -i edac</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.866982] EDAC MC: Ver: 2.1.0 Oct 19 2009</span></fo=
nt></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867007] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867030] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867054] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867077] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867097] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867117] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[ &nbsp;&nbsp;23.867137] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867157] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867178] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867199] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867219] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867239] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867258] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867277] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867295] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867315] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867334] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867353] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867372] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867391] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867409] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867428] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867447] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867466] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867502] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867532] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867562] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867593] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867625] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867702] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867734] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[ &nbsp;&nbsp;23.867765] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867797] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867837] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867871] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867904] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867937] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.867970] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868006] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868040] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868079] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868116] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868151] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868186] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868225] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868264] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 537: edac_pci_dev_parity_clear()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868422] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 1028: edac_sysfs_setup_mc_kset()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.868553] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 1045: edac_sysfs_setup_mc_kset() Registered '.../edac/mc' kobject</=
span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.917015] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 2030: MC: drivers/edac/i7core_edac.c: i7core_init()</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.952493] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:03.0 PCI ID 8086:2c18</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.952585] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:03.0 PCI ID 8086:2c18</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.952723] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:03.1 PCI ID 8086:2c19</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.952778] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:03.1 PCI ID 8086:2c19</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.952898] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:03.2 PCI ID 8086:2c1a</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.952964] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:03.2 PCI ID 8086:2c1a</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953159] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:03.4 PCI ID 8086:2c1c</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953224] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:03.4 PCI ID 8086:2c1c</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953357] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:04.0 PCI ID 8086:2c20</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953407] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:04.0 PCI ID 8086:2c20</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953546] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:04.1 PCI ID 8086:2c21</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953621] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:04.1 PCI ID 8086:2c21</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953750] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:04.2 PCI ID 8086:2c22</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953796] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:04.2 PCI ID 8086:2c22</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.953950] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:04.3 PCI ID 8086:2c23</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954006] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:04.3 PCI ID 8086:2c23</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954152] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:05.0 PCI ID 8086:2c28</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954195] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:05.0 PCI ID 8086:2c28</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954285] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:05.1 PCI ID 8086:2c29</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954330] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:05.1 PCI ID 8086:2c29</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954471] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:05.2 PCI ID 8086:2c2a</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954539] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:05.2 PCI ID 8086:2c2a</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954690] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:05.3 PCI ID 8086:2c2b</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954748] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:05.3 PCI ID 8086:2c2b</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954888] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:06.0 PCI ID 8086:2c30</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.954947] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:06.0 PCI ID 8086:2c30</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955098] EDAC DEBUG: in drivers/edac/i7core_edac.c,=
 line
at 1342: Detected socket 0 dev ff:06.1 PCI ID 8086:2c31</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955153] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:06.1 PCI ID 8086:2c31</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955259] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:06.2 PCI ID 8086:2c32</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955315] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:06.2 PCI ID 8086:2c32</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955435] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:06.3 PCI ID 8086:2c33</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955488] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:06.3 PCI ID 8086:2c33</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955715] i7core_edac: detected a Nehalem Memory
Controller</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955724] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 0 dev ff:00.0 PCI ID 8086:2c41</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955874] i7core_edac: detected a Nehalem Memory
Controller</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.955886] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1342: Detected socket 1 dev fe:00.0 PCI ID 8086:2c41</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956042] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 513: Number of active channels on socket 0: 2</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956077] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 670: edac_mc_register_sysfs_main_kobj()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956397] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 706: edac_mc_register_sysfs_main_kobj() Registered '.../edac/mc0'
kobject</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956409] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1821: MC: drivers/edac/i7core_edac.c: i7core_register_mci(): mci =
=3D
ffff8801398e8000</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956435] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 3.0, dev =3D ffff88013e1cf000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956444] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 3.1, dev =3D ffff88013e1cf800, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956452] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 3.2, dev =3D ffff88013e1cb000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956462] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 3.4, dev =3D ffff88013e1c8800, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956483] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 4.0, dev =3D ffff88013c7df000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956490] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 4.1, dev =3D ffff88013c7df800, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956499] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 4.2, dev =3D ffff88013c7de000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956508] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 4.3, dev =3D ffff88013c7de800, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956515] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 5.0, dev =3D ffff88013c7dd000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956523] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 5.1, dev =3D ffff88013c7dd800, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956529] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 5.2, dev =3D ffff88013a2d8000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956534] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 5.3, dev =3D ffff88013a2d8800, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956541] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 6.0, dev =3D ffff88013a2d9000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956549] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 6.1, dev =3D ffff88013a2d9800, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956555] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 6.2, dev =3D ffff88013a2da000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956561] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 6.3, dev =3D ffff88013a2da800, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956566] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 0.0, dev =3D ffff88013e1c8000, socket 0</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956578] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 541: QPI 0 control=3D0x00000602 status=3D0x00000019 dod=3D0x0000009=
0
map=3D0x00024489</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956583] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 545: ECC enabled with x8 SDCC</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956590] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 564: DOD Max limits: DIMMS: 1, 1-ranked, 8-banked x4000 x 0x400</sp=
an></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956596] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 573: Channel 0 is not active</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956614] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 617: Ch1 phy rd1, wr1 (0x063ffc31): 2 ranks, RDIMMs</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956620] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 640:&nbsp; dimm 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000,
col: 0x400</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956641] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 692:&nbsp; [1] DIVBY3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REMOVED OFFSET<=
/span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956646] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956651] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956657] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956661] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956665] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956673] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956680] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956685] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956695] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 617: Ch2 phy rd3, wr3 (0x063ffc31): 2 ranks, RDIMMs</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956705] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 640:&nbsp; dimm 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000,
col: 0x400</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956733] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 692:&nbsp; [2] DIVBY3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REMOVED OFFSET<=
/span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956740] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956748] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956754] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956760] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956767] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;0x0&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956774] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956780] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956785] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956793] EDAC DEBUG: in drivers/edac/edac_mc.c, lin=
e at
473: edac_mc_add_mc()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956827] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 911: edac_create_sysfs_mci_device() idx=3D0</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956880] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 802: edac_create_mci_instance_attributes()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956885] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file inject_section</spa=
n></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956918] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file inject_type</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956953] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file inject_eccmask</spa=
n></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.956993] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 818: edac_create_mci_instance_attributes() grp inject_addrmatch, mc=
i
ffff8801398e8000</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957074] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 802: edac_create_mci_instance_attributes()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957082] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file channel</span></fon=
t></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957106] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file dimm</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957132] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file rank</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957159] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file bank</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957183] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file page</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957212] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file col</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957246] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file inject_enable</span=
></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957878] EDAC DEBUG: in drivers/edac/edac_mc.c, lin=
e at
296: edac_mc_workq_setup()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957892] EDAC MC0: Giving out device to 'i7core_eda=
c.c'
'i7 core #0': DEV 0000:ff:03.0</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957899] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 49: edac_pci_alloc_ctl_info()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957920] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 346: edac_pci_add_device()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957946] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 126: add_edac_pci_to_global_list()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957953] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 101: find_edac_pci_by_dev()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957961] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 444: edac_pci_create_sysfs() idx=3D0</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.957966] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 347: edac_pci_main_kobj_setup()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.958246] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 394: Registered '.../edac/pci' kobject</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.958254] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 163: edac_pci_create_instance_kobj()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.958436] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 186: edac_pci_create_instance_kobj() Register instance 'pci0' kobje=
ct</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.958468] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 274: edac_pci_workq_setup()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.958474] EDAC PCI0: Giving out device to module
'i7core_edac' controller 'EDAC PCI controller': DEV '0000:ff:03.0' (POLLED)=
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.958511] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 513: Number of active channels on socket 1: 2</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.958526] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 670: edac_mc_register_sysfs_main_kobj()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962494] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 706: edac_mc_register_sysfs_main_kobj() Registered '.../edac/mc1' k=
object</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962503] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1821: MC: drivers/edac/i7core_edac.c: i7core_register_mci(): mci =
=3D
ffff8801398ea000</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962533] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 3.0, dev =3D ffff88013a2de000, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962539] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 3.1, dev =3D ffff88013a2de800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962545] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 3.2, dev =3D ffff88013a2df000, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962549] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 3.4, dev =3D ffff88013a2df800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962554] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 4.0, dev =3D ffff88013a2f0000, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962561] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 4.1, dev =3D ffff88013a2f0800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962571] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 4.2, dev =3D ffff88013a2f1000, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962582] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 4.3, dev =3D ffff88013a2f1800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962595] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 5.0, dev =3D ffff88013a2f2000, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962609] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 5.1, dev =3D ffff88013a2f2800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962622] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 5.2, dev =3D ffff88013a2f3000, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962630] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 5.3, dev =3D ffff88013a2f3800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962645] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 6.0, dev =3D ffff88013cfc2800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962653] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 6.1, dev =3D ffff88013cfc3000, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962662] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 6.2, dev =3D ffff88013cfc1800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962674] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 6.3, dev =3D ffff88013cfc4800, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962682] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 1403: Associated fn 0.0, dev =3D ffff88013a2db000, socket 1</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962712] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 541: QPI 1 control=3D0x00000602 status=3D0x00000019 dod=3D0x0000009=
0
map=3D0x00024489</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962724] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 545: ECC enabled with x8 SDCC</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962737] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 564: DOD Max limits: DIMMS: 1, 1-ranked, 8-banked x4000 x 0x400</sp=
an></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962745] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 573: Channel 0 is not active</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962766] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 617: Ch1 phy rd1, wr1 (0x063ffc31): 2 ranks, RDIMMs</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962779] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 640:&nbsp; dimm 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000,
col: 0x400</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962810] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 692:&nbsp; [1] DIVBY3&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;REMOVED OFFSET<=
/span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962822] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962830] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962836] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962845] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962853] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp; &nbsp;&nbsp;0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962860] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962869] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962876] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962894] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 617: Ch2 phy rd3, wr3 (0x063ffc31): 2 ranks, RDIMMs</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962903] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 640:&nbsp; dimm 0 1024 Mb offset: 0, bank: 8, rank: 1, row: 0x4000,
col: 0x400</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962943] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 692:&nbsp; [2] DIVBY3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REMOVED OFFSET<=
/span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962954] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962966] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962978] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962987] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.962995] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963005] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963012] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963021] EDAC DEBUG: in drivers/edac/i7core_edac.c,
line at 697:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0x0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0&nbsp;&nbsp;&nbsp;&nbsp; 0x0</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963033] EDAC DEBUG: in drivers/edac/edac_mc.c, lin=
e at
473: edac_mc_add_mc()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963044] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 911: edac_create_sysfs_mci_device() idx=3D1</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963093] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 802: edac_create_mci_instance_attributes()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963105] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file inject_section</spa=
n></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963134] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file inject_type</span><=
/font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963161] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file inject_eccmask</spa=
n></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963202] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 818: edac_create_mci_instance_attributes() grp inject_addrmatch, mc=
i
ffff8801398ea000</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963278] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 802: edac_create_mci_instance_attributes()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963287] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file channel</span></fon=
t></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963669] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file dimm</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963713] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file rank</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963749] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file bank</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963786] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file page</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963838] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file col</span></font></=
p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.963878] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.=
c,
line at 835: edac_create_mci_instance_attributes() file inject_enable</span=
></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964601] EDAC DEBUG: in drivers/edac/edac_mc.c, lin=
e at
296: edac_mc_workq_setup()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964613] EDAC MC1: Giving out device to 'i7core_eda=
c.c'
'i7 core #1': DEV 0000:fe:03.0</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964624] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 49: edac_pci_alloc_ctl_info()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964644] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 346: edac_pci_add_device()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964655] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 126: add_edac_pci_to_global_list()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964663] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 101: find_edac_pci_by_dev()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964671] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 444: edac_pci_create_sysfs() idx=3D1</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964678] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 347: edac_pci_main_kobj_setup()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964689] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 163: edac_pci_create_instance_kobj()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964918] EDAC DEBUG: in drivers/edac/edac_pci_sysfs=
.c,
line at 186: edac_pci_create_instance_kobj() Register instance 'pci1' kobje=
ct</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964971] EDAC DEBUG: in drivers/edac/edac_pci.c, li=
ne
at 274: edac_pci_workq_setup()</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964978] EDAC PCI1: Giving out device to module
'i7core_edac' controller 'EDAC PCI controller': DEV '0000:fe:03.0' (POLLED)=
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>[&nbsp;&nbsp; 23.964985] EDAC i7core: Driver loaded.</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Also, you should be able to see the PCI buses ff and fe:</span></fo=
nt></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'># lspci -n|grep ^f</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:00.0 0600: 8086:2c40 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:00.1 0600: 8086:2c01 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:02.0 0600: 8086:2c10 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:02.1 0600: 8086:2c11 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:02.4 0600: 8086:2c14 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:02.5 0600: 8086:2c15 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:03.0 0600: 8086:2c18 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:03.1 0600: 8086:2c19 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:03.2 0600: 8086:2c1a (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:03.4 0600: 8086:2c1c (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:04.0 0600: 8086:2c20 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:04.1 0600: 8086:2c21 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:04.2 0600: 8086:2c22 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:04.3 0600: 8086:2c23 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:05.0 0600: 8086:2c28 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:05.1 0600: 8086:2c29 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:05.2 0600: 8086:2c2a (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:05.3 0600: 8086:2c2b (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:06.0 0600: 8086:2c30 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:06.1 0600: 8086:2c31 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:06.2 0600: 8086:2c32 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>fe:06.3 0600: 8086:2c33 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:00.0 0600: 8086:2c40 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:00.1 0600: 8086:2c01 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:02.0 0600: 8086:2c10 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:02.1 0600: 8086:2c11 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:02.4 0600: 8086:2c14 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:02.5 0600: 8086:2c15 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:03.0 0600: 8086:2c18 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:03.1 0600: 8086:2c19 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:03.2 0600: 8086:2c1a (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:03.4 0600: 8086:2c1c (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:04.0 0600: 8086:2c20 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:04.1 0600: 8086:2c21 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:04.2 0600: 8086:2c22 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:04.3 0600: 8086:2c23 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:05.0 0600: 8086:2c28 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:05.1 0600: 8086:2c29 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:05.2 0600: 8086:2c2a (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:05.3 0600: 8086:2c2b (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:06.0 0600: 8086:2c30 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:06.1 0600: 8086:2c31 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:06.2 0600: 8086:2c32 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>ff:06.3 0600: 8086:2c33 (rev 04)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>If you are not noticing the PCI devices starting with fe: and ff: a=
nd
are using</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>my latest tree, then it is likely that your motherboard BIOS is doi=
ng
something</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>weird to hide the Nehalem non-core PCI buses.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; Thanks,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt;&nbsp;&nbsp; Keith Mannthey </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt;&nbsp;&nbsp; LTC Real-Time </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; This would seem to be the</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; PCI_DEVICE_ID_INTEL_I7_MCR</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; The modules are loaded, but I think this</span></fon=
t></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; error may have caused them to</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; be ineffective. There are no files under</span></fon=
t></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; /sys/devices/system/edac/mc as in</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; older edac enabled kernels. </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; I have access to multiple platforms and</span></font=
></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; can acquire DIMMs with ECC</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; errors, but I don't see the point in installing them=
 if</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; the driver is not</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; installing properly.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; I am currently running on an HP ProLiant DL360. It</=
span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; has</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; Intel Xeon CPUs X5550.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; Any pointers on how I should approach</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; debugging this?</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt;&nbsp; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; -----Inline Attachment Follows-----</span></font></p=
>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt;
---------------------------------------------------------------------------=
---</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; Come build with us! The BlackBerry(R) Developer
Conference</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; in SF, CA</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; is the only developer event you need to attend this
year.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; Jumpstart your</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; developing skills, take BlackBerry mobile applicatio=
ns
to</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; market and stay </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; ahead of the curve. Join us from November 9 - 12, 20=
09.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; Register now!</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; http://p.sf.net/sfu/devconference</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; -----Inline Attachment Follows-----</span></font></p=
>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; _______________________________________________</spa=
n></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; bluesmoke-devel mailing list</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; bluesmoke-devel@lists.sourceforge.net</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt;
https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt;
---------------------------------------------------------------------------=
---</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; Come build with us! The BlackBerry(R) Developer Conferenc=
e in
SF, CA</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; is the only developer event you need to attend this year.
Jumpstart your</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; developing skills, take BlackBerry mobile applications to
market and stay </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; ahead of the curve. Join us from November 9 - 12, 2009.
Register now!</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; http://p.sf.net/sfu/devconference</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; _______________________________________________</span></f=
ont></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; bluesmoke-devel mailing list</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; bluesmoke-devel@lists.sourceforge.net</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; &gt; https://lists.sourceforge.net/lists/listinfo/bluesmoke-de=
vel</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt;
---------------------------------------------------------------------------=
---</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; Come build with us! The BlackBerry(R) Developer Conference in =
SF,
CA</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; is the only developer event you need to attend this year.
Jumpstart your</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; developing skills, take BlackBerry mobile applications to mark=
et
and stay </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; ahead of the curve. Join us from November 9 - 12, 2009. Regist=
er
now!</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; http://p.sf.net/sfu/devconference</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; _______________________________________________</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; bluesmoke-devel mailing list</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; bluesmoke-devel@lists.sourceforge.net</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&gt; https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel</=
span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Cheers,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Mauro</span></font></p>

</div>

</body>

</html>

--_000_EC2969A33F12344780D895AFCAA422CE5086261B8EGVW1095EXBame_--


--===============8475279349434629089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
--===============8475279349434629089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
bluesmoke-devel mailing list
bluesmoke-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel

--===============8475279349434629089==--
