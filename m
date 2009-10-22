From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: Module loads but has error.
Date: Fri, 23 Oct 2009 05:02:49 +0900
Message-ID: <20091023050249.26eb0ba0@caramujo.chehab.org>
References: <375171.22182.qm@web50101.mail.re2.yahoo.com>
	<1256073500.31589.58.camel@keith-laptop>
	<20091021074749.743ef923@caramujo.chehab.org>
	<EC2969A33F12344780D895AFCAA422CE5086261902@GVW1095EXB.americas.hpqcorp.net>
	<1256138770.31589.92.camel@keith-laptop>
	<20091022050359.5e91bcd8@caramujo.chehab.org>
	<EC2969A33F12344780D895AFCAA422CE50862C8999@GVW1095EXB.americas.hpqcorp.net>
	<20091022080335.1f2e044e@caramujo.chehab.org>
	<EC2969A33F12344780D895AFCAA422CE50862C8CE1@GVW1095EXB.americas.hpqcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <EC2969A33F12344780D895AFCAA422CE50862C8CE1@GVW1095EXB.americas.hpqcorp.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: "Colbert, Rusty" <rusty.colbert@hp.com>
Cc: Doug Thompson <norsk5@yahoo.com>, bluesmoke ML <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

Em Thu, 22 Oct 2009 15:04:18 +0000
"Colbert, Rusty" <rusty.colbert@hp.com> escreveu:

> Cat /proc/cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 15
> model           : 6
> model name      : Intel(R) Xeon(TM) MV CPU 3.20GHz
> stepping        : 4
> cpu MHz         : 3200.369
> cache size      : 2048 KB
> physical id     : 0
> siblings        : 4
> core id         : 0
> cpu cores       : 2
> apicid          : 0
> initial apicid  : 0
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 6
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall lm constant_tsc pebs bts pni dtes64 monitor ds_cpl vmx cid cx16 xtpr pdcm lahf_lm tpr_shadow
> bogomips        : 6400.73
> clflush size    : 64
> cache_alignment : 128
> address sizes   : 36 bits physical, 48 bits virtual
> power management:

Ok, this is where the things diverge. This is the cpu model on my test machine:

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 26
model name      : Intel(R) Xeon(R) CPU           X5550  @ 2.67GHz
stepping        : 4
cpu MHz         : 1596.000
cache size      : 8192 KB
physical id     : 0
siblings        : 8
core id         : 0
cpu cores       : 4
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 11
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good xtopology tsc_reliable nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm dca sse4_1 sse4_2 popcnt lahf_lm ida tpr_shadow vnmi flexpriority ept vpid
bogomips        : 5336.25
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management:

So, basically, your CPU model is 6, while mine is 26.

According with:
	http://www.intel.com/support/processors/xeon5k/sb/cs-022297.htm

The MV processor is a Xeon 5063, being part of Xeon 5000 series. The Intel
datasheets for this series doesn't mention a memory controller on it. It was
covered only by this spec update:

	http://www.intel.com/Assets/en_US/PDF/specupdate/313065.pdf


AFAIK, the Xeon 5000 series were not meant to have a memory controller inside, but
I suspect that this MV chip has the same memory controller as a Xeon 35xx. 

We need to double check this with Intel, to be sure that it is safe to enable EDAC
on those machines.



Cheers,
Mauro

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
