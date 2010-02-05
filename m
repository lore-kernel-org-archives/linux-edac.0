From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: [PATCH 6/7] edac: mpc85xx fsb ecc
Date: Thu, 4 Feb 2010 21:48:34 -0800 (PST)
Message-ID: <324607.19392.qm@web50108.mail.re2.yahoo.com>
References: <1265304134.14589.152.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1265304134.14589.152.camel@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: dougthompson@xmission.com, Peter Tyser <ptyser@xes-inc.com>
Cc: kolifer@gmail.com, akpm@linux-foundation.org, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: edac.vger.kernel.org



--- On Thu, 2/4/10, Peter Tyser <ptyser@xes-inc.com> wrote:

> From: Peter Tyser <ptyser@xes-inc.com>
> Subject: Re: [PATCH 6/7] edac: mpc85xx fsb ecc
> To: dougthompson@xmission.com
> Cc: kolifer@gmail.com, akpm@linux-foundation.org, bluesmoke-devel@lis=
ts.sourceforge.net, linux-kernel@vger.kernel.org
> Date: Thursday, February 4, 2010, 10:22 AM
> Hi Doug and Konstantin,
>=20
> On Wed, 2010-02-03 at 23:46 -0700, dougthompson@xmission.com
> wrote:
> > From: Konstantin Olifer <kolifer@gmail.com>
> >=20
> > Patch is for Kernel 2.6.33. e752x_edac suppose that
> fsb ECC exist, for example, on
> > Celeron + 3100. That is wrong.=20
> > ECC FSB supported only on Xeon for our vision
> (www.setdsp.ru) and datasheet from developer intel www.=20
> > Fixed.
> > Signed-off-by:=A0 Konstantin Olifer <kolifer@gmail.com>
> > Signed-off-by:=A0 Doug Thompson <dougthompson@xmission.com>
> > ---
> >=A0 e752x_edac.c |=A0=A0=A010 ++--------
> >=A0 1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> It looks like 6/7 and 7/7 in this series have the wrong
> subject/title.
> Patches 6 and 7 are for the e752x instead of the mpc85xx.

my bad while I was constructing the titles. missed the driver name

thanks andrew for fixing that


doug t
