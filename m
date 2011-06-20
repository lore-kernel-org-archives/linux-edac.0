From: Kevin Bowling <kevin.bowling@kev009.com>
Subject: Re: Interpreting EDAC errors
Date: Mon, 20 Jun 2011 01:31:43 -0700
Message-ID: <BANLkTimvzEFi0cBFU_Zc-H2eKFXc_gV9_g@mail.gmail.com>
References: <BANLkTin-O8co99AnG+KT3+CUGmgaudRvYA@mail.gmail.com>
	<20110620073422.GB9070@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20110620073422.GB9070@aftab>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Borislav Petkov <bp@amd64.org>
Cc: "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

On Mon, Jun 20, 2011 at 12:34 AM, Borislav Petkov <bp@amd64.org> wrote:
> Hi,
>
> On Mon, Jun 20, 2011 at 12:57:26AM -0400, Kevin Bowling wrote:
>> Hello,
>>
>> I've been seeing the following errors from the EDAC system. =A0I'm not
>> quite sure how to associate the output from edac-util to physical
>> DIMMs. =A0How do we account for multi-rank DIMMs, interleaving, NUMA,
>> etc?
>
> Judging by the mainboard, this is a dual socket Magny-Cours. A couple of
> things:

Correct.

> * interpreting DRAM ECC errors is still suboptimal and we're working on
> it, I'll try to come up with an interim solution to make the decoded
> error info a bit more understandable.

Ok, glad the confusion wasn't solely my own ignorance :p

> * you have one singe-bit error which got corrected by the memory
> controller on 4 DIMMs and over the current system uptime so I wouldn't
> worry too much. I would monitor the DIMMs though and take action only if
> those error rates start to grow over time.

The system is readily throwing these single-bit errors every 1-2 days
across reboots.

This machine has an identical twin at the same site that is not
exhibiting this problem and is even running a bit hotter internally.
The RAM for these machines came in a large tray so I would guess they
are the same batch.

I've run EDAC on many systems and never seen one this chatty.  I
recall reading literature in the past that DRAM errors should be a bit
more rare than this.  I'm suspecting the motherboard since it's across
so many DIMMs.  It does scare me to say the least as this box will be
part of a mission critical system.

> You have 4 8G DIMMs per node but I don't know they rank
> count so please take the below with a grain of salt. Wait,
> http://www.alldatasheet.com/datasheet-pdf/pdf/332888/HYNIX/HMT31GR7BFR4C-=
H9.html
> says that yours are actually dual-ranked.

Looking at the dmesg output, I agree; dual-ranked.

> Btw, kernel dmesg output of EDAC should help to pinpoint them better.

[    9.086759] EDAC MC: Ver: 2.1.0 Apr 11 2011
[    9.100467] EDAC amd64_edac: v3.3.0
[    9.100576] EDAC amd64: DRAM ECC enabled.
[    9.100587] EDAC amd64: F10h detected (node 0).
[    9.100607] EDAC MC: DCT0 chip selects:
[    9.100608] EDAC amd64: MC: 0:     0MB 1:     0MB
[    9.100610] EDAC amd64: MC: 2:  4096MB 3:  4096MB
[    9.100612] EDAC amd64: MC: 4:     0MB 5:     0MB
[    9.100614] EDAC amd64: MC: 6:     0MB 7:     0MB
[    9.100615] EDAC MC: DCT1 chip selects:
[    9.100616] EDAC amd64: MC: 0:     0MB 1:     0MB
[    9.100618] EDAC amd64: MC: 2:  4096MB 3:  4096MB
[    9.100619] EDAC amd64: MC: 4:     0MB 5:     0MB
[    9.100621] EDAC amd64: MC: 6:     0MB 7:     0MB
[    9.100622] EDAC amd64: using x8 syndromes.
[    9.100624] EDAC amd64: MCT channel count: 2
[    9.100649] EDAC amd64: CS2: Registered DDR3 RAM
[    9.100651] EDAC amd64: CS3: Registered DDR3 RAM
[    9.100671] EDAC MC0: Giving out device to 'amd64_edac' 'F10h': DEV
0000:00:18.2
[    9.100778] EDAC amd64: DRAM ECC enabled.
[    9.100820] EDAC amd64: F10h detected (node 1).
[    9.100853] EDAC MC: DCT0 chip selects:
[    9.100855] EDAC amd64: MC: 0:     0MB 1:     0MB
[    9.100857] EDAC amd64: MC: 2:  4096MB 3:  4096MB
[    9.100859] EDAC amd64: MC: 4:     0MB 5:     0MB
[    9.100860] EDAC amd64: MC: 6:     0MB 7:     0MB
[    9.100862] EDAC MC: DCT1 chip selects:
[    9.100863] EDAC amd64: MC: 0:     0MB 1:     0MB
[    9.100865] EDAC amd64: MC: 2:  4096MB 3:  4096MB
[    9.100866] EDAC amd64: MC: 4:     0MB 5:     0MB
[    9.100868] EDAC amd64: MC: 6:     0MB 7:     0MB
[    9.100869] EDAC amd64: using x8 syndromes.
[    9.100871] EDAC amd64: MCT channel count: 2
[    9.100903] EDAC amd64: CS2: Registered DDR3 RAM
[    9.100905] EDAC amd64: CS3: Registered DDR3 RAM
[    9.100932] EDAC MC1: Giving out device to 'amd64_edac' 'F10h': DEV
0000:00:19.2
[    9.101050] EDAC amd64: DRAM ECC enabled.
[    9.101091] EDAC amd64: F10h detected (node 2).
[    9.101125] EDAC MC: DCT0 chip selects:
[    9.101127] EDAC amd64: MC: 0:     0MB 1:     0MB
[    9.101129] EDAC amd64: MC: 2:  4096MB 3:  4096MB
[    9.101131] EDAC amd64: MC: 4:     0MB 5:     0MB
[    9.101132] EDAC amd64: MC: 6:     0MB 7:     0MB
[    9.101134] EDAC MC: DCT1 chip selects:
[    9.101135] EDAC amd64: MC: 0:     0MB 1:     0MB
[    9.101137] EDAC amd64: MC: 2:  4096MB 3:  4096MB
[    9.101138] EDAC amd64: MC: 4:     0MB 5:     0MB
[    9.101140] EDAC amd64: MC: 6:     0MB 7:     0MB
[    9.101141] EDAC amd64: using x8 syndromes.
[    9.101143] EDAC amd64: MCT channel count: 2
[    9.101180] EDAC amd64: CS2: Registered DDR3 RAM
[    9.101182] EDAC amd64: CS3: Registered DDR3 RAM
[    9.101221] EDAC MC2: Giving out device to 'amd64_edac' 'F10h': DEV
0000:00:1a.2
[    9.101337] EDAC amd64: DRAM ECC enabled.
[    9.101383] EDAC amd64: F10h detected (node 3).
[    9.101424] EDAC MC: DCT0 chip selects:
[    9.101426] EDAC amd64: MC: 0:     0MB 1:     0MB
[    9.101428] EDAC amd64: MC: 2:  4096MB 3:  4096MB
[    9.101430] EDAC amd64: MC: 4:     0MB 5:     0MB
[    9.101431] EDAC amd64: MC: 6:     0MB 7:     0MB
[    9.101433] EDAC MC: DCT1 chip selects:
[    9.101434] EDAC amd64: MC: 0:     0MB 1:     0MB
[    9.101436] EDAC amd64: MC: 2:  4096MB 3:  4096MB
[    9.101437] EDAC amd64: MC: 4:     0MB 5:     0MB
[    9.101439] EDAC amd64: MC: 6:     0MB 7:     0MB
[    9.101440] EDAC amd64: using x8 syndromes.
[    9.101442] EDAC amd64: MCT channel count: 2
[    9.101495] EDAC amd64: CS2: Registered DDR3 RAM
[    9.101497] EDAC amd64: CS3: Registered DDR3 RAM
[    9.101533] EDAC MC3: Giving out device to 'amd64_edac' 'F10h': DEV
0000:00:1b.2
[    9.101622] EDAC PCI0: Giving out device to module 'amd64_edac'
controller 'EDAC PCI controller': DEV '0000:00:18.2' (POLLED)

[282601.860098] [Hardware Error]:
MC4_STATUS[Over|CE|MiscV|-|AddrV|CECC]: 0xdc7f400097080813
[282601.863567] [Hardware Error]: Northbridge Error (node 1): DRAM ECC
error detected on the NB.
[282601.867178] EDAC amd64 MC1: CE ERROR_ADDRESS=3D 0x81fc93d00
[282601.869445] EDAC MC1: CE page 0x81fc93, offset 0xd00, grain 0,
syndrome 0x97fe, row 2, channel 0, label "": amd64_edac
[282601.869452] [Hardware Error]: cache level: L3/GEN, mem/io: MEM,
mem-tx: RD, part-proc: SRC (no timeout)
[282601.873529] Disabling lock debugging due to kernel taint
[282601.873535] [Hardware Error]: Machine check events logged
[321603.500128] [Hardware Error]: MC4_STATUS[-|CE|MiscV|-|AddrV|CECC]:
0x9c00c10004080a13
[321603.503484] [Hardware Error]: Northbridge Error (node 2): DRAM ECC
error detected on the NB.
[321603.507096] EDAC amd64 MC2: CE ERROR_ADDRESS=3D 0x85a8eec40
[321603.509362] EDAC MC2: CE page 0x85a8ee, offset 0xc40, grain 0,
syndrome 0x401, row 3, channel 1, label "": amd64_edac
[321603.509369] [Hardware Error]: cache level: L3/GEN, mem/io: MEM,
mem-tx: RD, part-proc: RES (no timeout)
[321603.513450] [Hardware Error]: Machine check events logged
[402125.606309] audit_printk_skb: 36 callbacks suppressed
[402125.606318] type=3D1400 audit(1308314274.325:23): apparmor=3D"STATUS"
operation=3D"profile_replace" name=3D"/usr/sbin/libvirtd" pid=3D14994
comm=3D"apparmor_parser"
[402125.644372] type=3D1400 audit(1308314274.365:24): apparmor=3D"STATUS"
operation=3D"profile_replace" name=3D"/usr/lib/libvirt/virt-aa-helper"
pid=3D14996 comm=3D"apparmor_parser"
[492000.040077] [Hardware Error]:
MC4_STATUS[Over|CE|MiscV|-|AddrV|CECC]: 0xdc7840001e080a13
[492000.043538] [Hardware Error]: Northbridge Error (node 0): DRAM ECC
error detected on the NB.
[492000.047150] EDAC amd64 MC0: CE ERROR_ADDRESS=3D 0x3fcec0040
[492000.049415] EDAC MC0: CE page 0x3fcec0, offset 0x40, grain 0,
syndrome 0x1ef0, row 3, channel 0, label "": amd64_edac
[492000.049422] [Hardware Error]: cache level: L3/GEN, mem/io: MEM,
mem-tx: RD, part-proc: RES (no timeout)
[492000.053499] [Hardware Error]: Machine check events logged
[547053.500095] [Hardware Error]:
MC4_STATUS[Over|CE|MiscV|-|AddrV|CECC]: 0xdc41c10077080a13
[547053.503561] [Hardware Error]: Northbridge Error (node 2): DRAM ECC
error detected on the NB.
[547053.507172] EDAC amd64 MC2: CE ERROR_ADDRESS=3D 0xbff5c9600
[547053.581042] EDAC MC2: CE page 0xbff5c9, offset 0x600, grain 0,
syndrome 0x7783, row 3, channel 0, label "": amd64_edac
[547053.581049] [Hardware Error]: cache level: L3/GEN, mem/io: MEM,
mem-tx: RD, part-proc: RES (no timeout)
[547053.730417] [Hardware Error]: Machine check events logged

>
>> root@PM-LAS-PROD-0:~# edac-util
>> mc0: csrow3: ch0: 1 Corrected Errors
>
> This should be P1_DIMM1A if your DIMMs are quadranked, P1_DIMM2A if
> dual-ranked.
>
>> mc1: csrow2: ch0: 1 Corrected Errors
>
> P1_DIMM3A or P1_DIMM4A as above. Also, I'm assuming that the increasing
> nomenclature in the silkscreen labeling is mapping the memory
> controllers in the same way, i.e.:
>
> mc0 -> 1A, 2A
> mc1 -> 3A, 4A
>
>> mc2: csrow3: ch0: 1 Corrected Errors
>> mc2: csrow3: ch1: 1 Corrected Errors
>
> This looks like P2_DIMM3A
>
> So, yeah, it is suboptimal and it needs fixing, I know.
>
> HTH.
>
> --
> Regards/Gruss,
> Boris.
>
> Advanced Micro Devices GmbH
> Einsteinring 24, 85609 Dornach
> GM: Alberto Bozzo
> Reg: Dornach, Landkreis Muenchen
> HRB Nr. 43632 WEEE Registernr: 129 19551
>

---------------------------------------------------------------------------=
---
EditLive Enterprise is the world's most technically advanced content
authoring tool. Experience the power of Track Changes, Inline Image
Editing and ensure content is compliant with Accessibility Checking.
http://p.sf.net/sfu/ephox-dev2dev
