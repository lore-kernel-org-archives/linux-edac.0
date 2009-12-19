From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: EDAC and DDR3 memory
Date: Sat, 19 Dec 2009 16:13:52 +0100
Message-ID: <20091219151352.GA25072@aftab>
References: <4B2CBA37.2090101@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <4B2CBA37.2090101@web.de>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Joachim Ernst <joachim.ernst@web.de>
Cc: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

On Sat, Dec 19, 2009 at 12:34:15PM +0100, Joachim Ernst wrote:
> Dear EDAC-Developers,
> =

> is there a chance to get DDR3 running with EDAC?
> Here is the output of dmesg | grep EDAC:
> =

> EDAC MC: Ver: 2.1.0 Dec 8 2009
> EDAC amd64_edac: Ver: 3.2.0 Dec 8 2009
> EDAC amd64: ECC is enabled by BIOS, Proceeding with EDAC module
> initialization
> EDAC MC: F10h CPU detected
> EDAC amd64: f10_probe_valid_hardware() This machine is running with DDR3
> memory. This is not currently supported. DCHR0=3D0x3f58090d DCHR1=3D0x3f5=
8090d
> EDAC amd64: Contact 'amd64_edac' module MAINTAINER to help add support.

DDR3 support got merged last week so you can give 2.6.33-rc1 a try.

-- =

Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Germany
 Research | Gesch=E4ftsf=FChrer: Andrew Bowd, Thomas M. McCoy, Giuliano Mer=
oni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632


---------------------------------------------------------------------------=
---
This SF.Net email is sponsored by the Verizon Developer Community
Take advantage of Verizon's best-in-class app development support
A streamlined, 14 day to market process makes app distribution fast and easy
Join now and get one step closer to millions of Verizon customers
http://p.sf.net/sfu/verizon-dev2dev =
