From: Joachim Ernst <joachim.ernst@web.de>
Subject: EDAC and DDR3 memory
Date: Sat, 19 Dec 2009 12:34:15 +0100
Message-ID: <4B2CBA37.2090101@web.de>
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

Dear EDAC-Developers,

is there a chance to get DDR3 running with EDAC?
Here is the output of dmesg | grep EDAC:

EDAC MC: Ver: 2.1.0 Dec 8 2009
EDAC amd64_edac: Ver: 3.2.0 Dec 8 2009
EDAC amd64: ECC is enabled by BIOS, Proceeding with EDAC module
initialization
EDAC MC: F10h CPU detected
EDAC amd64: f10_probe_valid_hardware() This machine is running with DDR3
memory. This is not currently supported. DCHR0=0x3f58090d DCHR1=0x3f58090d
EDAC amd64: Contact 'amd64_edac' module MAINTAINER to help add support.

Using Phenom II CPU with unbuffered ECC-RAM (2xKVR1333D3E9SK2/4G) on an
AM3-Motherboard(Biostar TA790GX A3+).

If you need more information don't dare to ask.

Sincerly
Joachim Ernst

------------------------------------------------------------------------------
This SF.Net email is sponsored by the Verizon Developer Community
Take advantage of Verizon's best-in-class app development support
A streamlined, 14 day to market process makes app distribution fast and easy
Join now and get one step closer to millions of Verizon customers
http://p.sf.net/sfu/verizon-dev2dev 
