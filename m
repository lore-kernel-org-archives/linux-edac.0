From: Marvin <marvin24@gmx.de>
Subject: ECC not detected
Date: Tue, 23 Feb 2010 20:08:36 +0100
Message-ID: <201002232008.37461.marvin24@gmx.de>
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

Hi,

my system is a Phenom II with 4GB ECC memory and Asus "M4A785TD-V EVO" MoBo running current git kernel.
ECC is enabled in the BIOS. The amd64_edac_mod module can only be loaded using the ecc_edac_override. Below
is the output of debug messages enabled.

[ 7108.117856] EDAC MC: Ver: 2.1.0 Feb 23 2010
[ 7108.117941] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 905: edac_sysfs_setup_mc_kset()
[ 7108.117944] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 922: edac_sysfs_setup_mc_kset() Registered '.../edac/mc' kobject
[ 7108.119395] EDAC amd64_edac:  Ver: 3.3.0 Feb 23 2010
[ 7108.119597] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2899: (MC node=0,mc_type='Family 10h')
[ 7108.119624] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2265:     Addr Map device PCI Bus ID:  0000:00:18.1
[ 7108.119632] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2267:     DRAM MEM-CTL PCI Bus ID:     0000:00:18.2
[ 7108.119638] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2269:     Misc device PCI Bus ID:      0000:00:18.3
[ 7108.119646] EDAC amd64: This node reports that Memory ECC is currently disabled, set F3x44[22] (0000:00:18.3).
[ 7108.119666] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2523: core: 0, MCG_CTL: 0x3f, NB MSR is enabled
[ 7108.119674] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2523: core: 1, MCG_CTL: 0x3f, NB MSR is enabled
[ 7108.119681] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2523: core: 2, MCG_CTL: 0x3f, NB MSR is enabled
[ 7108.119687] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2523: core: 3, MCG_CTL: 0x3f, NB MSR is enabled
[ 7108.119695] EDAC amd64: ECC disabled in the BIOS or no ECC capability, module will not load.
[ 7108.119698]  Either enable ECC checking or force module loading by setting 'ecc_enable_override'.
[ 7108.119701]  (Note that use of the override may cause unknown side effects.)
[ 7108.119709] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2908: ret=-22
[ 7108.119726] amd64_edac: probe of 0000:00:18.2 failed with error -22


and the same with forced loading.
 
[    6.517375] EDAC MC: Ver: 2.1.0 Feb 23 2010                                                                                                                                               
[    6.526125] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 905: edac_sysfs_setup_mc_kset()                                                                                           
[    6.526129] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 922: edac_sysfs_setup_mc_kset() Registered '.../edac/mc' kobject                                                          
[    6.756316] EDAC amd64_edac:  Ver: 3.3.0 Feb 23 2010                                                                                                                                       
[    6.772419] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2899: (MC node=0,mc_type='Family 10h')                                                                                       
[    6.772427] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2265:     Addr Map device PCI Bus ID:  0000:00:18.1                                                                          
[    6.772428] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2267:     DRAM MEM-CTL PCI Bus ID:     0000:00:18.2                                                                          
[    6.772430] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2269:     Misc device PCI Bus ID:      0000:00:18.3                                                                          
[    6.772431] EDAC amd64: This node reports that Memory ECC is currently disabled, set F3x44[22] (0000:00:18.3).                                                                             
[    6.817251] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2523: core: 0, MCG_CTL: 0x3f, NB MSR is enabled                                                                              
[    6.817253] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2523: core: 1, MCG_CTL: 0x3f, NB MSR is enabled                                                                              
[    6.817254] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2523: core: 2, MCG_CTL: 0x3f, NB MSR is enabled                                                                              
[    6.817256] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2523: core: 3, MCG_CTL: 0x3f, NB MSR is enabled                                                                              
[    6.817267] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2294:   TOP_MEM:  0x00000000e0000000                                                                                         
[    6.817267] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2300:   TOP_MEM2: 0x0000000120000000                                                                                         
[    6.817279] EDAC MC: F10h CPU detected                                                                                                                                                     
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1344: F2x110 (DCTL Sel. Low): 0x000005c4, High range addresses at: 0x0                                                       
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1348:   DCT mode: unganged, All DCTs on: yes                                                                                 
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1352:   Address range split per DCT: no                                                                                      
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1357:   DCT data interleave for ECC: disabled, DRAM cleared since last warm reset: yes                                       
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1362:   DCT channel interleave: enabled, DCT interleave bits selector: 0x3                                                   
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2328:   DRAM-BASE[0]: 0x0000000000000000 DRAM-LIMIT:  0x000000011fffffff                                                     
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2337:         IntlvEn=Disabled W R IntlvSel=0 DstNode=0                                                                      
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 984:   DCSB0[0]=0x00000000 reg: F2x40                                                                                        
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 992:   DCSB1[0]=0x00000000 reg: F2x140                                                                                       
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 984:   DCSB0[1]=0x00000000 reg: F2x44                                                                                        
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 992:   DCSB1[1]=0x00000000 reg: F2x144                                                                                       
[    6.817279] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 984:   DCSB0[2]=0x00000001 reg: F2x48                                                                                        
[    6.817280] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 992:   DCSB1[2]=0x00000001 reg: F2x148                                                                                       
[    6.817281] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 984:   DCSB0[3]=0x00000109 reg: F2x4c                                                                                        
[    6.817283] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 992:   DCSB1[3]=0x00000109 reg: F2x14c                                                                                       
[    6.817284] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 984:   DCSB0[4]=0x00000000 reg: F2x50                                                                                        
[    6.817286] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 992:   DCSB1[4]=0x00000000 reg: F2x150                                                                                       
[    6.817287] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 984:   DCSB0[5]=0x00000000 reg: F2x54                                                                                        
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 992:   DCSB1[5]=0x00000000 reg: F2x154                                                                                       
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 984:   DCSB0[6]=0x00000000 reg: F2x58                                                                                        
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 992:   DCSB1[6]=0x00000000 reg: F2x158                                                                                       
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 984:   DCSB0[7]=0x00000000 reg: F2x5c                                                                                        
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 992:   DCSB1[7]=0x00000000 reg: F2x15c                                                                                       
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1002:     DCSM0[0]=0x00000000 reg: F2x60                                                                                     
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1010:     DCSM1[0]=0x00000000 reg: F2x160                                                                                    
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1002:     DCSM0[1]=0x00783ee0 reg: F2x64                                                                                     
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1010:     DCSM1[1]=0x00783ee0 reg: F2x164                                                                                    
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1002:     DCSM0[2]=0x00000000 reg: F2x68                                                                                     
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1010:     DCSM1[2]=0x00000000 reg: F2x168                                                                                    
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1002:     DCSM0[3]=0x00000000 reg: F2x6c                                                                                     
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1010:     DCSM1[3]=0x00000000 reg: F2x16c                                                                                    
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 862: F3xE8 (NB Cap): 0x02077f19                                                                                              
[    6.817309] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 865:   NB two channel DRAM capable: yes                                                                                      
[    6.817310] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 869:   ECC capable: yes, ChipKill ECC capable: yes                                                                           
[    6.817311] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 838: F2x090 (DRAM Cfg Low): 0x00090000                                                                                       
[    6.817312] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 842:   DIMM type: unbuffered; all DIMMs support ECC: yes                                                                     
[    6.817313] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 845:   PAR/ERR parity: disabled                                                                                              
[    6.817315] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 848:   DCT 128bit mode width: 64b                                                                                            
[    6.817316] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 854:   x4 logical DIMMs present: L0: no L1: no L2: no L3: no                                                                 
[    6.817317] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 873: F3xB0 (Online Spare): 0x00000000                                                                                        
[    6.817319] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 880: F1xF0 (DRAM Hole Address): 0xe0002003, base: 0xe0000000, offset: 0x20000000                                             
[    6.817320] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 883:   DramHoleValid: yes                                                                                                    
[    6.817321] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 838: F2x190 (DRAM Cfg Low): 0x00090000                                                                                       
[    6.817322] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 842:   DIMM type: unbuffered; all DIMMs support ECC: yes                                                                     
[    6.817324] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 845:   PAR/ERR parity: disabled                                                                                              
[    6.817325] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 848:   DCT 128bit mode width: 64b                                                                                            
[    6.817326] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 854:   x4 logical DIMMs present: L0: no L1: no L2: no L3: no                                                                 
[    6.817328] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1719: F2x080 (DRAM Bank Address Mapping): 0x00000050                                                                         
[    6.817329] EDAC MC: DCT0 chip selects:                                                                                                                                                    
[    6.817330] EDAC MC:  0:     0MB 1:     0MB                                                                                                                                                
[    6.817331] EDAC MC:  2:  1024MB 3:  1024MB                                                                                                                                                
[    6.817331] EDAC MC:  4:     0MB 5:     0MB                                                                                                                                                
[    6.817332] EDAC MC:  6:     0MB 7:     0MB                                                                                                                                                
[    6.817333] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1719: F2x180 (DRAM Bank Address Mapping): 0x00000050                                                                         
[    6.817334] EDAC MC: DCT1 chip selects:                                                                                                                                                    
[    6.817335] EDAC MC:  0:     0MB 1:     0MB                                                                                                                                                
[    6.817336] EDAC MC:  2:  1024MB 3:  1024MB                                                                                                                                                
[    6.817337] EDAC MC:  4:     0MB 5:     0MB                                                                                                                                                
[    6.817338] EDAC MC:  6:     0MB 7:     0MB                                                                                                                                                
[    6.817339] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1210: Data width is not 128 bits - need more decoding                                                                        
[    6.817340] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1232: MCT channel count: 2                                                                                                   
[    6.817343] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 666: edac_mc_register_sysfs_main_kobj()                                                                                   
[    6.817351] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 702: edac_mc_register_sysfs_main_kobj() Registered '.../edac/mc0' kobject                                                 
[    6.817353] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2439: NBCFG= 0x4ab0005c  CHIPKILL= Enabled DRAM ECC= Disabled                                                                
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2446: ----CSROW 0 EMPTY for node 0                                                                                           
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2446: ----CSROW 1 EMPTY for node 0
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2451: ----CSROW 2 VALID for MC node 0
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2414:   (csrow=2) DBAM map index= 5
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2416:     nr_pages= 524288  channel-count = 2
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 671:     InputAddr 0x0 translates to DramAddr of same value
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 511:   DHAR info for node 0 base 0xe0000000 offset 0x20000000 size 0x20000000
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 732:     Node 0, DramAddr 0x0 to SysAddr 0x0
[    6.817388] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 671:     InputAddr 0xffffffe07ffeffff translates to DramAddr of same value
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 511:   DHAR info for node 0 base 0xe0000000 offset 0x20000000 size 0x20000000
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 732:     Node 0, DramAddr 0xffffffe07ffeffff to SysAddr 0xffffffe07ffeffff
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1030:   Memory type is: Unbuffered DDR3 RAM
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2465:   for MC node 0 csrow 2:
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2468:     input_addr_min: 0x0 input_addr_max: 0xffffffe07ffeffff
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2470:     sys_addr: 0xffffffe07ffeffff  page_mask: 0x1f80010000
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2474:     nr_pages: 524288  first_page: 0x0 last_page: 0xfe07ffef
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2451: ----CSROW 3 VALID for MC node 0
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2414:   (csrow=3) DBAM map index= 5
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2416:     nr_pages= 524288  channel-count = 2
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 671:     InputAddr 0x10000 translates to DramAddr of same value
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 511:   DHAR info for node 0 base 0xe0000000 offset 0x20000000 size 0x20000000
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 732:     Node 0, DramAddr 0x10000 to SysAddr 0x10000
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 671:     InputAddr 0xffffffe07fffffff translates to DramAddr of same value
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 511:   DHAR info for node 0 base 0xe0000000 offset 0x20000000 size 0x20000000
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 732:     Node 0, DramAddr 0xffffffe07fffffff to SysAddr 0xffffffe07fffffff
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 1030:   Memory type is: Unbuffered DDR3 RAM
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2465:   for MC node 0 csrow 3:
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2468:     input_addr_min: 0x10000 input_addr_max: 0xffffffe07fffffff
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2470:     sys_addr: 0xffffffe07fffffff  page_mask: 0x1f80010000
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2474:     nr_pages: 524288  first_page: 0x10 last_page: 0xfe07ffff
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2446: ----CSROW 4 EMPTY for node 0
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2446: ----CSROW 5 EMPTY for node 0
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2446: ----CSROW 6 EMPTY for node 0
[    6.817401] EDAC DEBUG: in drivers/edac/amd64_edac.c, line at 2446: ----CSROW 7 EMPTY for node 0
[    6.817402] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 497: edac_mc_add_mc()
[    6.817404] EDAC DEBUG: in drivers/edac/edac_mc_sysfs.c, line at 794: edac_create_sysfs_mci_device() idx=0
[    6.817453] EDAC DEBUG: in drivers/edac/edac_mc.c, line at 320: edac_mc_workq_setup()
[    6.817453] EDAC MC0: Giving out device to 'amd64_edac' 'Family 10h': DEV 0000:00:18.2
[    6.835523] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 49: edac_pci_alloc_ctl_info()
[    6.835524] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 346: edac_pci_add_device()
[    6.835526] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 126: add_edac_pci_to_global_list()
[    6.835527] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 101: find_edac_pci_by_dev()
[    6.835529] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 444: edac_pci_create_sysfs() idx=0
[    6.835530] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 347: edac_pci_main_kobj_setup()
[    6.835541] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 394: Registered '.../edac/pci' kobject
[    6.835542] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 163: edac_pci_create_instance_kobj()
[    6.835549] EDAC DEBUG: in drivers/edac/edac_pci_sysfs.c, line at 186: edac_pci_create_instance_kobj() Register instance 'pci0' kobject
[    6.835549] EDAC DEBUG: in drivers/edac/edac_pci.c, line at 274: edac_pci_workq_setup()
[    6.835549] EDAC PCI0: Giving out device to module 'amd64_edac' controller 'EDAC PCI controller': DEV '0000:00:18.2' (POLLED)

I know there a BIOS bugs out there ... is there a way to workaround this and is the driver working 
 at all?

Thanks!

Marvin

------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
