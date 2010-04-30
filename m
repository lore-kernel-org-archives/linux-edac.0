From: Ben Woodard <woodard@redhat.com>
Subject: Re: EDAC linux-2.6.34-rc5 non correctable errors not reported on
	AMD64 opteron
Date: Fri, 30 Apr 2010 09:08:19 -0500
Message-ID: <1272636499.25697.1296.camel@snog.zork.net>
References: <20100429183003.GB20328@ppanchamukhi>
	<1272579222.3792.18.camel@keith-laptop>
	<20100429223121.GA20899@ppanchamukhi>
	<1272583087.3792.35.camel@keith-laptop>
	<20100430001241.GB20899@ppanchamukhi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100430001241.GB20899@ppanchamukhi>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: "Prasanna S. Panchamukhi" <prasanna.panchamukhi@riverbed.com>
Cc: Rob Becker <Rob.Becker@riverbed.com>, Arthur Jones <Arthur.Jones@riverbed.com>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, linux-edac@vger.kernel.org
List-Id: edac.vger.kernel.org

On Thu, 2010-04-29 at 17:12 -0700, Prasanna S. Panchamukhi wrote:
> On Thu, Apr 29, 2010 at 04:18:07PM -0700, Keith Mannthey wrote:
> > On Thu, 2010-04-29 at 15:31 -0700, Prasanna S. Panchamukhi wrote:
> > > On Thu, Apr 29, 2010 at 03:13:42PM -0700, Keith Mannthey wrote:
> > > > On Thu, 2010-04-29 at 11:30 -0700, Prasanna S. Panchamukhi wrote:
> > > > > Hi Doug,
> > > > > 
> > > > > I am testing Linux-2.6.34-rc5 EDAC driver on AMD64 Opteron.
> > > > > I am able to inject single bit errors and get the edac driver report the 
> > > > > correctable errors.
> > > > > But when I inject 2-bit errors, I did not see any notification or kernel 
> > > > > log, the system simply hangs.
> > > > > This happens with or without edac_mc_panic_on_ue enabled.
> > > > > Please let me know if I am missing something.
> > > > > Below are the details.
> > > > 
> > > > I would have to recheck the specs to be 100% sure but I would consider
> > > > double bit errors to be fatal on normal Opteron boxes. There is a good
> > > > chance your BIOS detects the fatal error and freezes the box to prevent
> > > > data corruption.
> > > 
> > > Shouldn't the edac driver be reporting Uncorrectable Errors even 
> > > before ..BIOS detects the fatal error and freezes the box?
> > > Did someone already tested the 2-bit error injection and reporting
> > > on AMD64?
> > 
> > I don't know your hardware or firmware but a SMI can be uses when the
> > fatal error is triggered. BIOS can get instant notification. 
> > 
> 
> Thanks Keith for your response.
> My current hardware is AMD64 Opteron Family F10.
> 

This highlights one of the biggest problems with that approach. If the
BIOS through SMI kills the box, then there is no way to make the system
reliable. 

Preventing data corruption is important but the BIOS doesn't have enough
information about the system to make decisions about what to do. A UE
doesn't have to be fatal, it depends on where it is:
        if the page has backing store -> take a page fault
        if free -> no worries
        if network buffer -> discard and allow the network stack to deal
        if user space page without backing store -> send program a
SIGBUS
A UE really doesn't need to be fatal unless the UE happens to be in some
certain kinds kernel pages. As the number of cores within a system
increases the overall system memory increases and the percentage used by
the kernel decreases. Therefore, the probability that a UE will occur in
the part of RAM that is used by the kernel will decrease. Therefore
using a big sledge hammer and killing the system will make the system
less reliable.

-ben


> > 
> > > Did the edac driver reported Uncorrectable Errors on other architectures
> > > Powerpc/Intel?
> > 
> > This is a very specific question that requires firmware level knowledge
> > of your system.  On my AMD and Intel system the bios steps in and kills
> > the box when faced with a double bit error and this is the safest
> > possible scenario for a double bit error.  From your report it sounds
> > like you box may be doing something similar. 
> 
> Killing of the system is expected. But even before the system
> gets killed, the edac driver should log saying..double bit UE detected.
> And from your above statement, it looks like neither you saw
> the Uncorrectable errors being reported but just the system gets killed.
> 
> I would expect the edac driver to report Uncorrectable errors
> before it kills the box.
> 
> Also there is "edac_mc_panic_on_ue" module param. if enabled it
> should result in system panic.
> 
> > 
> > I didn't get around to playing with the error injection code could be
> > something going on there.  I had real debug dims with switches on them
> > to generate an error.  
> > 
> 
> AMD error injection is a very cool feature, that helps us to check
> the system capabilites to report and detect the memory errors.
> 
> > You are triggering a double bit error and waiting around for over a min
> > for the box to hang? If so I doubt it is the BIOS that is killing your
> > box as that should happen right away.
> 
> My system does not have any services running, hence there is a delay
> before the system hangs. But generally its pretty quick.
> 
> Thanks
> Prasanna
> 
> > 
> > Thanks,
> >   Keith 
> > 
> > > Thanks
> > > Prasanna
> > > 
> > > 
> > > > 
> > > > Thanks,
> > > >   Keith 
> > > > 
> > > > > Thanks
> > > > > Prasanna
> > > > > 
> > > > > Steps to reproduce the problem:
> > > > > 
> > > > > 
> > > > > 1. Build Linux-2.6.34-rc5 using x86_64_defconfig with following additional config options enabled:
> > > > > CONFIG_EDAC_DECODE_MCE=y
> > > > > CONFIG_EDAC_MM_EDAC=y
> > > > > CONFIG_EDAC_AMD64=m
> > > > > CONFIG_EDAC_AMD64_ERROR_INJECTION=y
> > > > > CONFIG_EDAC_E752X=m
> > > > > CONFIG_EDAC_I82975X=m
> > > > > CONFIG_EDAC_I3000=m
> > > > > CONFIG_EDAC_I3200=m
> > > > > CONFIG_EDAC_X38=m
> > > > > CONFIG_EDAC_I5400=m
> > > > > CONFIG_EDAC_I5000=m
> > > > > CONFIG_EDAC_I5100=m
> > > > > 
> > > > > 2. insert the kernel module
> > > > > #insmod amd64_edac_mod.ko
> > > > > 
> > > > > 3. Inject errors
> > > > > 
> > > > > # echo 3 > /sys/devices/system/edac/mc/mc0/inject_section  
> > > > > # echo 7 > /sys/devices/system/edac/mc/mc0/inject_word
> > > > > # echo 0x88 > /sys/devices/system/edac/mc/mc0/inject_ecc_vector
> > > > > # echo 1 > /sys/devices/system/edac/mc/mc0/inject_read
> > > > > # echo 1 > /sys/devices/system/edac/mc/mc0/inject_write
> > > > > 
> > > > > 4. Should hang the system in few minutes.
> > > > > 
> > > > > Additional info:
> > > > > - AMD64 opteron
> > > > > # cat /proc/cpuinfo
> > > > > processor    : 0
> > > > > vendor_id    : AuthenticAMD
> > > > > cpu family   : 16
> > > > > model          : 2
> > > > > model name    : Quad-Core AMD Opteron(tm) Processor 2346 HE
> > > > > stepping       : 3
> > > > > cpu MHz      : 1800.023
> > > > > cache size    : 512 KB
> > > > > physical id   : 0
> > > > > siblings       : 4
> > > > > core id        : 0
> > > > > cpu cores    : 4
> > > > > apicid          : 0
> > > > > initial apicid    : 0
> > > > > fpu        : yes
> > > > > fpu_exception    : yes
> > > > > cpuid level    : 5
> > > > > wp        : yes
> > > > > flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
> > > > > cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt 
> > > > > pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nonstop_tsc 
> > > > > extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic 
> > > > > cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs npt lbrv svm_lock
> > > > > bogomips    : 3600.04
> > > > > TLB size    : 1024 4K pages
> > > > > clflush size    : 64
> > > > > cache_alignment    : 64
> > > > > address sizes    : 48 bits physical, 48 bits virtual
> > > > > power management: ts ttp tm stc 100mhzsteps hwpstate
> > > > > 
> > > > > processor    : 1
> > > > > vendor_id    : AuthenticAMD
> > > > > cpu family    : 16
> > > > > model        : 2
> > > > > model name    : Quad-Core AMD Opteron(tm) Processor 2346 HE
> > > > > stepping    : 3
> > > > > cpu MHz        : 1800.023
> > > > > cache size    : 512 KB
> > > > > physical id    : 0
> > > > > siblings    : 4
> > > > > core id        : 1
> > > > > cpu cores    : 4
> > > > > apicid        : 1
> > > > > initial apicid    : 1
> > > > > fpu        : yes
> > > > > fpu_exception    : yes
> > > > > cpuid level    : 5
> > > > > wp        : yes
> > > > > flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
> > > > > cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt 
> > > > > pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nonstop_tsc 
> > > > > extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic 
> > > > > cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs npt lbrv svm_lock
> > > > > bogomips    : 3600.08
> > > > > TLB size    : 1024 4K pages
> > > > > clflush size    : 64
> > > > > cache_alignment    : 64
> > > > > address sizes    : 48 bits physical, 48 bits virtual
> > > > > power management: ts ttp tm stc 100mhzsteps hwpstate
> > > > > 
> > > > > processor    : 2
> > > > > vendor_id    : AuthenticAMD
> > > > > cpu family    : 16
> > > > > model        : 2
> > > > > model name    : Quad-Core AMD Opteron(tm) Processor 2346 HE
> > > > > stepping    : 3
> > > > > cpu MHz        : 1800.023
> > > > > cache size    : 512 KB
> > > > > physical id    : 0
> > > > > siblings    : 4
> > > > > core id        : 2
> > > > > cpu cores    : 4
> > > > > apicid        : 2
> > > > > initial apicid    : 2
> > > > > fpu        : yes
> > > > > fpu_exception    : yes
> > > > > cpuid level    : 5
> > > > > wp        : yes
> > > > > flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
> > > > > cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt 
> > > > > pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nonstop_tsc 
> > > > > extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic 
> > > > > cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs npt lbrv svm_lock
> > > > > bogomips    : 3599.96
> > > > > TLB size    : 1024 4K pages
> > > > > clflush size    : 64
> > > > > cache_alignment    : 64
> > > > > address sizes    : 48 bits physical, 48 bits virtual
> > > > > power management: ts ttp tm stc 100mhzsteps hwpstate
> > > > > 
> > > > > processor    : 3
> > > > > vendor_id    : AuthenticAMD
> > > > > cpu family    : 16
> > > > > model        : 2
> > > > > model name    : Quad-Core AMD Opteron(tm) Processor 2346 HE
> > > > > stepping    : 3
> > > > > cpu MHz        : 1800.023
> > > > > cache size    : 512 KB
> > > > > physical id    : 0
> > > > > siblings    : 4
> > > > > core id        : 3
> > > > > cpu cores    : 4
> > > > > apicid        : 3
> > > > > initial apicid    : 3
> > > > > fpu        : yes
> > > > > fpu_exception    : yes
> > > > > cpuid level    : 5
> > > > > wp        : yes
> > > > > flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
> > > > > cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt 
> > > > > pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nonstop_tsc 
> > > > > extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic 
> > > > > cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs npt lbrv svm_lock
> > > > > bogomips    : 3600.01
> > > > > TLB size    : 1024 4K pages
> > > > > clflush size    : 64
> > > > > cache_alignment    : 64
> > > > > address sizes    : 48 bits physical, 48 bits virtual
> > > > > power management: ts ttp tm stc 100mhzsteps hwpstate
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > ------------------------------------------------------------------------------
> > > > > _______________________________________________
> > > > > bluesmoke-devel mailing list
> > > > > bluesmoke-devel@lists.sourceforge.net
> > > > > https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel
> > > > 
> > 
> 
> ------------------------------------------------------------------------------
> _______________________________________________
> bluesmoke-devel mailing list
> bluesmoke-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel



------------------------------------------------------------------------------
