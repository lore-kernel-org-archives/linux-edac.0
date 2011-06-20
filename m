From: Kevin Bowling <kevin.bowling@kev009.com>
Subject: Interpreting EDAC errors
Date: Sun, 19 Jun 2011 21:57:26 -0700
Message-ID: <BANLkTin-O8co99AnG+KT3+CUGmgaudRvYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

Hello,

I've been seeing the following errors from the EDAC system.  I'm not
quite sure how to associate the output from edac-util to physical
DIMMs.  How do we account for multi-rank DIMMs, interleaving, NUMA,
etc?

Any help would be greatly appreciated.

Regards,
Kevin


root@PM-LAS-PROD-0:~# edac-util
mc0: csrow3: ch0: 1 Corrected Errors
mc1: csrow2: ch0: 1 Corrected Errors
mc2: csrow3: ch0: 1 Corrected Errors
mc2: csrow3: ch1: 1 Corrected Errors

root@PM-LAS-PROD-0:~# edac-ctl --mainboard
edac-ctl: mainboard: Supermicro H8DGU

root@PM-LAS-PROD-0:~# dmidecode -t memory
# dmidecode 2.9
SMBIOS 2.6 present.

Handle 0x0011, DMI type 16, 15 bytes
Physical Memory Array
       Location: System Board Or Motherboard
       Use: System Memory
       Error Correction Type: Multi-bit ECC
       Maximum Capacity: Unknown
       Error Information Handle: Not Provided
       Number Of Devices: 8

Handle 0x0013, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0011
       Error Information Handle: Not Provided
       Total Width: Unknown
       Data Width: Unknown
       Size: No Module Installed
       Form Factor: <OUT OF SPEC>
       Set: None
       Locator: P1_DIMM1B
       Bank Locator: BANK0
       Type: Unknown
       Type Detail: None
       Speed: Unknown
       Manufacturer: Manufacturer00
       Serial Number: SerNum00
       Asset Tag: AssetTagNum0
       Part Number: ModulePartNumber00

Handle 0x0015, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0011
       Error Information Handle: Not Provided
       Total Width: 72 bits
       Data Width: 64 bits
       Size: 8192 MB
       Form Factor: DIMM
       Set: None
       Locator: P1_DIMM1A
       Bank Locator: BANK1
       Type: <OUT OF SPEC>
       Type Detail: Synchronous
       Speed: 1333 MHz (0.8 ns)
       Manufacturer: Hyundai
       Serial Number: C0073434
       Asset Tag: AssetTagNum1
       Part Number: HMT31GR7BFR4C-H9

Handle 0x0017, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0011
       Error Information Handle: Not Provided
       Total Width: Unknown
       Data Width: Unknown
       Size: No Module Installed
       Form Factor: <OUT OF SPEC>
       Set: None
       Locator: P1_DIMM2B
       Bank Locator: BANK2
       Type: Unknown
       Type Detail: None
       Speed: Unknown
       Manufacturer: Manufacturer02
       Serial Number: SerNum02
       Asset Tag: AssetTagNum2
       Part Number: ModulePartNumber02

Handle 0x0019, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0011
       Error Information Handle: Not Provided
       Total Width: 72 bits
       Data Width: 64 bits
       Size: 8192 MB
       Form Factor: DIMM
       Set: None
       Locator: P1_DIMM2A
       Bank Locator: BANK3
       Type: <OUT OF SPEC>
       Type Detail: Synchronous
       Speed: 1333 MHz (0.8 ns)
       Manufacturer: Hyundai
       Serial Number: 5A1F440F
       Asset Tag: AssetTagNum3
       Part Number: HMT31GR7BFR4C-H9

Handle 0x001B, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0011
       Error Information Handle: Not Provided
       Total Width: Unknown
       Data Width: Unknown
       Size: No Module Installed
       Form Factor: <OUT OF SPEC>
       Set: None
       Locator: P1_DIMM3B
       Bank Locator: BANK4
       Type: Unknown
       Type Detail: None
       Speed: Unknown
       Manufacturer: Manufacturer04
       Serial Number: SerNum04
       Asset Tag: AssetTagNum4
       Part Number: ModulePartNumber04

Handle 0x001D, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0011
       Error Information Handle: Not Provided
       Total Width: 72 bits
       Data Width: 64 bits
       Size: 8192 MB
       Form Factor: DIMM
       Set: None
       Locator: P1_DIMM3A
       Bank Locator: BANK5
       Type: <OUT OF SPEC>
       Type Detail: Synchronous
       Speed: 1333 MHz (0.8 ns)
       Manufacturer: Hyundai
       Serial Number: 7BEB1017
       Asset Tag: AssetTagNum5
       Part Number: HMT31GR7BFR4C-H9

Handle 0x001F, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0011
       Error Information Handle: Not Provided
       Total Width: Unknown
       Data Width: Unknown
       Size: No Module Installed
       Form Factor: <OUT OF SPEC>
       Set: None
       Locator: P1_DIMM4B
       Bank Locator: BANK6
       Type: Unknown
       Type Detail: None
       Speed: Unknown
       Manufacturer: Manufacturer06
       Serial Number: SerNum06
       Asset Tag: AssetTagNum6
       Part Number: ModulePartNumber06

Handle 0x0021, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0011
       Error Information Handle: Not Provided
       Total Width: 72 bits
       Data Width: 64 bits
       Size: 8192 MB
       Form Factor: DIMM
       Set: None
       Locator: P1_DIMM4A
       Bank Locator: BANK7
       Type: <OUT OF SPEC>
       Type Detail: Synchronous
       Speed: 1333 MHz (0.8 ns)
       Manufacturer: Hyundai
       Serial Number: E6CCC22E
       Asset Tag: AssetTagNum7
       Part Number: HMT31GR7BFR4C-H9

Handle 0x0023, DMI type 16, 15 bytes
Physical Memory Array
       Location: System Board Or Motherboard
       Use: System Memory
       Error Correction Type: Multi-bit ECC
       Maximum Capacity: Unknown
       Error Information Handle: Not Provided
       Number Of Devices: 8

Handle 0x0025, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0023
       Error Information Handle: Not Provided
       Total Width: Unknown
       Data Width: Unknown
       Size: No Module Installed
       Form Factor: <OUT OF SPEC>
       Set: None
       Locator: P2_DIMM1B
       Bank Locator: BANK8
       Type: Unknown
       Type Detail: None
       Speed: Unknown
       Manufacturer: Manufacturer08
       Serial Number: SerNum08
       Asset Tag: AssetTagNum8
       Part Number: ModulePartNumber08

Handle 0x0027, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0023
       Error Information Handle: Not Provided
       Total Width: 72 bits
       Data Width: 64 bits
       Size: 8192 MB
       Form Factor: DIMM
       Set: None
       Locator: P2_DIMM1A
       Bank Locator: BANK9
       Type: <OUT OF SPEC>
       Type Detail: Synchronous
       Speed: 1333 MHz (0.8 ns)
       Manufacturer: Hyundai
       Serial Number: 651FC40F
       Asset Tag: AssetTagNum9
       Part Number: HMT31GR7BFR4C-H9

Handle 0x0029, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0023
       Error Information Handle: Not Provided
       Total Width: Unknown
       Data Width: Unknown
       Size: No Module Installed
       Form Factor: <OUT OF SPEC>
       Set: None
       Locator: P2_DIMM2B
       Bank Locator: BANK10
       Type: Unknown
       Type Detail: None
       Speed: Unknown
       Manufacturer: Manufacturer10
       Serial Number: SerNum10
       Asset Tag: AssetTagNum10
       Part Number: ModulePartNumber10

Handle 0x002B, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0023
       Error Information Handle: Not Provided
       Total Width: 72 bits
       Data Width: 64 bits
       Size: 8192 MB
       Form Factor: DIMM
       Set: None
       Locator: P2_DIMM2A
       Bank Locator: BANK11
       Type: <OUT OF SPEC>
       Type Detail: Synchronous
       Speed: 1333 MHz (0.8 ns)
       Manufacturer: Hyundai
       Serial Number: 841F440F
       Asset Tag: AssetTagNum11
       Part Number: HMT31GR7BFR4C-H9

Handle 0x002D, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0023
       Error Information Handle: Not Provided
       Total Width: Unknown
       Data Width: Unknown
       Size: No Module Installed
       Form Factor: <OUT OF SPEC>
       Set: None
       Locator: P2_DIMM3B
       Bank Locator: BANK12
       Type: Unknown
       Type Detail: None
       Speed: Unknown
       Manufacturer: Manufacturer12
       Serial Number: SerNum12
       Asset Tag: AssetTagNum12
       Part Number: ModulePartNumber12

Handle 0x002F, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0023
       Error Information Handle: Not Provided
       Total Width: 72 bits
       Data Width: 64 bits
       Size: 8192 MB
       Form Factor: DIMM
       Set: None
       Locator: P2_DIMM3A
       Bank Locator: BANK13
       Type: <OUT OF SPEC>
       Type Detail: Synchronous
       Speed: 1333 MHz (0.8 ns)
       Manufacturer: Hyundai
       Serial Number: 771F940F
       Asset Tag: AssetTagNum13
       Part Number: HMT31GR7BFR4C-H9

Handle 0x0031, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0023
       Error Information Handle: Not Provided
       Total Width: Unknown
       Data Width: Unknown
       Size: No Module Installed
       Form Factor: <OUT OF SPEC>
       Set: None
       Locator: P2_DIMM4B
       Bank Locator: BANK14
       Type: Unknown
       Type Detail: None
       Speed: Unknown
       Manufacturer: Manufacturer14
       Serial Number: SerNum14
       Asset Tag: AssetTagNum14
       Part Number: ModulePartNumber14

Handle 0x0033, DMI type 17, 28 bytes
Memory Device
       Array Handle: 0x0023
       Error Information Handle: Not Provided
       Total Width: 72 bits
       Data Width: 64 bits
       Size: 8192 MB
       Form Factor: DIMM
       Set: None
       Locator: P2_DIMM4A
       Bank Locator: BANK15
       Type: <OUT OF SPEC>
       Type Detail: Synchronous
       Speed: 1333 MHz (0.8 ns)
       Manufacturer: Hyundai
       Serial Number: 881F540F
       Asset Tag: AssetTagNum15
       Part Number: HMT31GR7BFR4C-H9

------------------------------------------------------------------------------
EditLive Enterprise is the world's most technically advanced content
authoring tool. Experience the power of Track Changes, Inline Image
Editing and ensure content is compliant with Accessibility Checking.
http://p.sf.net/sfu/ephox-dev2dev
