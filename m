From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: amd64_edac driver availability, status?
Date: Mon, 12 Oct 2009 07:45:09 +0200
Message-ID: <20091012054509.GC27799@aftab>
References: <20091009211423.GA35447@cons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <20091009211423.GA35447@cons.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Martin Cracauer <cracauer@cons.org>
Cc: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

On Fri, Oct 09, 2009 at 05:14:23PM -0400, Martin Cracauer wrote:
> Hello,
> =

> I can't seem to find md64_edac, neither in the mainline kernel, nor
> the tarball nor in

it is in mainline since 2.6.31:

[boris $] ls -l drivers/edac/amd64_edac*
-rw-r--r-- 1 boris boris 93473 2009-10-08 08:18 drivers/edac/amd64_edac.c
-rw-r--r-- 1 boris boris  5406 2009-10-08 08:18 drivers/edac/amd64_edac_dbg=
.c
-rw-r--r-- 1 boris boris 17286 2009-10-08 08:18 drivers/edac/amd64_edac.h
-rw-r--r-- 1 boris boris  4304 2009-08-26 07:51 drivers/edac/amd64_edac_inj=
.c

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
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay =

ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
