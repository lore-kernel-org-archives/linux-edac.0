From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: AMD DDR3 ECC
Date: Mon, 19 Oct 2009 17:31:02 -0700 (PDT)
Message-ID: <197145.42496.qm@web50104.mail.re2.yahoo.com>
References: <200910092121.21754.st@iss.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <200910092121.21754.st@iss.tu-darmstadt.de>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net, ST <st@iss.tu-darmstadt.de>
List-Id: edac.vger.kernel.org

--- On Fri, 10/9/09, ST <st@iss.tu-darmstadt.de> wrote:

> From: ST <st@iss.tu-darmstadt.de>
> Subject: AMD DDR3 ECC
> To: bluesmoke-devel@lists.sourceforge.net
> Date: Friday, October 9, 2009, 1:21 PM
> Hi
> =

> I've bought a new mainboard and i'd like to get the EDAC
> support running for =

> this board. It seems as if my hardware is not supported but
> detected:
> dmesg gives me after a "modprobe amd64_edac_mod":
> EDAC amd64_edac:=A0 Ver: 3.2.0 Oct=A0 9 2009
> EDAC amd64: ECC is enabled by BIOS.
> EDAC MC: F10h CPU detected
> EDAC amd64: f10_probe_valid_hardware() This machine is
> running with DDR3 =

> memory. This is not currently supported. DCHR0=3D0x3f58090d
> DCHR1=3D0x3f58090d
> EDAC amd64:=A0 =A0 Contact 'amd64_edac' module
> MAINTAINER to help add support.

At this time DDR3 has not been added. We just got the driver into the kerne=
l in 2.6.31.

I will copy boris on any planned schedule for DDR3

doug t

> =

> This is with 2.6.32-rc3-00256-g36a0790. I would be thankful
> for any hint to =

> get the HW up and running.
> =

> Thanks
> ST


---------------------------------------------------------------------------=
---
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay =

ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
