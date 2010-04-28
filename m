From: Prasanna Panchamukhi <ppanchamukhi@riverbed.com>
Subject: EDAC: Linux-2.6.34-rc5 non correctable errors not reported on AMD64
	Opteron
Date: Wed, 28 Apr 2010 10:14:02 -0700
Message-ID: <4BD86CDA.9090206@riverbed.com>
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
To: dougthompson@xmission.com, bluesmoke-devel@lists.sourceforge.net
Cc: Rob Becker <Rob.Becker@riverbed.com>, Arthur.Jones@riverbed.com
List-Id: edac.vger.kernel.org

Hi Doug,

I am trying to test Linux-2.6.34-rc5 EDAC driver on AMD64 Opteron.
I am able to inject single bit errors and get the edac driver report the 
correctable errors.
But when I inject 2-bit errors, I did not see any notification or kernel 
log, the system simply hangs.
This happens with or without edac_mc_panic_on_ue enabled.
Please let me know if I am missing something.
Below are the details.

Thanks
Prasanna

Steps to reproduce the problem:


1. Build Linux-2.6.34-rc5 using x86_64_defconfig with following additional config options enabled:
CONFIG_EDAC_DECODE_MCE=y
CONFIG_EDAC_MM_EDAC=y
CONFIG_EDAC_AMD64=m
CONFIG_EDAC_AMD64_ERROR_INJECTION=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m

2. insert the kernel module
#insmod amd64_edac_mod.ko

3. Inject errors

# echo 3 > /sys/devices/system/edac/mc/mc0/inject_section  
# echo 7 > /sys/devices/system/edac/mc/mc0/inject_word
# echo 0x88 > /sys/devices/system/edac/mc/mc0/inject_ecc_vector
# echo 1 > /sys/devices/system/edac/mc/mc0/inject_read
# echo 1 > /sys/devices/system/edac/mc/mc0/inject_write

4. Should hang the system in few minutes.

Additional info:
- AMD64 opteron
# cat /proc/cpuinfo
processor    : 0
vendor_id    : AuthenticAMD
cpu family   : 16
model          : 2
model name    : Quad-Core AMD Opteron(tm) Processor 2346 HE
stepping       : 3
cpu MHz      : 1800.023
cache size    : 512 KB
physical id   : 0
siblings       : 4
core id        : 0
cpu cores    : 4
apicid          : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 5
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt 
pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nonstop_tsc 
extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic 
cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs npt lbrv svm_lock
bogomips    : 3600.04
TLB size    : 1024 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

processor    : 1
vendor_id    : AuthenticAMD
cpu family    : 16
model        : 2
model name    : Quad-Core AMD Opteron(tm) Processor 2346 HE
stepping    : 3
cpu MHz        : 1800.023
cache size    : 512 KB
physical id    : 0
siblings    : 4
core id        : 1
cpu cores    : 4
apicid        : 1
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 5
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt 
pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nonstop_tsc 
extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic 
cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs npt lbrv svm_lock
bogomips    : 3600.08
TLB size    : 1024 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

processor    : 2
vendor_id    : AuthenticAMD
cpu family    : 16
model        : 2
model name    : Quad-Core AMD Opteron(tm) Processor 2346 HE
stepping    : 3
cpu MHz        : 1800.023
cache size    : 512 KB
physical id    : 0
siblings    : 4
core id        : 2
cpu cores    : 4
apicid        : 2
initial apicid    : 2
fpu        : yes
fpu_exception    : yes
cpuid level    : 5
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt 
pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nonstop_tsc 
extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic 
cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs npt lbrv svm_lock
bogomips    : 3599.96
TLB size    : 1024 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

processor    : 3
vendor_id    : AuthenticAMD
cpu family    : 16
model        : 2
model name    : Quad-Core AMD Opteron(tm) Processor 2346 HE
stepping    : 3
cpu MHz        : 1800.023
cache size    : 512 KB
physical id    : 0
siblings    : 4
core id        : 3
cpu cores    : 4
apicid        : 3
initial apicid    : 3
fpu        : yes
fpu_exception    : yes
cpuid level    : 5
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt 
pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nonstop_tsc 
extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic 
cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs npt lbrv svm_lock
bogomips    : 3600.01
TLB size    : 1024 4K pages
clflush size    : 64
cache_alignment    : 64
address sizes    : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate



------------------------------------------------------------------------------
