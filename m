From: ST <st@iss.tu-darmstadt.de>
Subject: AMD DDR3 ECC
Date: Fri, 9 Oct 2009 21:21:21 +0200
Message-ID: <200910092121.21754.st@iss.tu-darmstadt.de>
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

Hi

I've bought a new mainboard and i'd like to get the EDAC support running for 
this board. It seems as if my hardware is not supported but detected:
dmesg gives me after a "modprobe amd64_edac_mod":
EDAC amd64_edac:  Ver: 3.2.0 Oct  9 2009
EDAC amd64: ECC is enabled by BIOS.
EDAC MC: F10h CPU detected
EDAC amd64: f10_probe_valid_hardware() This machine is running with DDR3 
memory. This is not currently supported. DCHR0=0x3f58090d DCHR1=0x3f58090d
EDAC amd64:    Contact 'amd64_edac' module MAINTAINER to help add support.

This is with 2.6.32-rc3-00256-g36a0790. I would be thankful for any hint to 
get the HW up and running.

Thanks
ST

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
