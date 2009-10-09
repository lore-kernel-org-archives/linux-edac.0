From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: i7core_edac tree
Date: Sat, 10 Oct 2009 00:48:15 +1100
Message-ID: <20091010004815.481c0da7.sfr@canb.auug.org.au>
References: <20091009101653.44b2f448.sfr@canb.auug.org.au>
	<126686523.1755491255056754615.JavaMail.root@zmail05.collab.prod.int.phx2.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__10_Oct_2009_00_48_15_+1100_q.aGd./rGAkUryNv"
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <126686523.1755491255056754615.JavaMail.root@zmail05.collab.prod.int.phx2.redhat.com>
Sender: linux-next-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, dougthompson@xmission.com, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

--Signature=_Sat__10_Oct_2009_00_48_15_+1100_q.aGd./rGAkUryNv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Thu, 8 Oct 2009 22:52:34 -0400 (EDT) Mauro Carvalho Chehab <mchehab@redh=
at.com> wrote:
>
> Hmm... it didn't created a new branch there... Fixed. The branch were alr=
eady pushed.

OK, I will add it on Monday.

Boilerplate:

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Sat__10_Oct_2009_00_48_15_+1100_q.aGd./rGAkUryNv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrPPx8ACgkQjjKRsyhoI8yMHwCdEjoDy2bbpyW/owy9THYazAL9
fgEAn348CbJKYYM+I2B3wzJAJyBuwysE
=2R9T
-----END PGP SIGNATURE-----

--Signature=_Sat__10_Oct_2009_00_48_15_+1100_q.aGd./rGAkUryNv--
