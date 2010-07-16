From: anil kumar dahiya <anilkumardahiya@yahoo.com>
Subject: which types of error can be detected and logged using EDAC core module
Date: Fri, 16 Jul 2010 16:38:45 +0530 (IST)
Message-ID: <785949.46963.qm@web95614.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi
 =

I am naive to EDAC. We are using RHEL5.5 (Linux kernel 2.6.18-194) on syste=
m having two quad-core Intel=AE Xeon=AE  processors L5518. But RHEL 5.5 doe=
s not have support for i7core_edac driver.

When I loaded edac_mc module on the system following directory structure wa=
s visible:

/sys/devices/system/edac =

|
|
------ mc
|      |
|      log_ce  log_ue  panic_on_ue  poll_msec
|
---- pci
       |
       check_pci_parity  panic_on_pci_parity  pci_parity_count

My question is that,on my system using only EDAC core module which types of=
 error can be detected and logged ?

>From  linux-2.6.18-194/Documentation/edac.txt, I am able to make out that E=
DAC core module can detect and log PCI errors ? Correct me if I am wrong.

But I could not understand whats the use of /sys/devices/system/edac/mc dir=
ectory , Can you provide more details on it?

Thanks in advance,

Regards,
Anil




---------------------------------------------------------------------------=
---
This SF.net email is sponsored by Sprint
What will you do first with EVO, the first 4G phone?
Visit sprint.com/first -- http://p.sf.net/sfu/sprint-com-first
