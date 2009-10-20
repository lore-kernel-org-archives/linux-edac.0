From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: Module loads but has error.
Date: Tue, 20 Oct 2009 14:05:19 -0700 (PDT)
Message-ID: <375171.22182.qm@web50101.mail.re2.yahoo.com>
References: <EC2969A33F12344780D895AFCAA422CE508626136F@GVW1095EXB.americas.hpqcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <EC2969A33F12344780D895AFCAA422CE508626136F@GVW1095EXB.americas.hpqcorp.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke ML <bluesmoke-devel@lists.sourceforge.net>, RustyColbert <rusty.colbert@hp.com>
List-Id: edac.vger.kernel.org

Copying Mauro on this one as he has the lead on it. He is currently in Japa=
n for a few days for the kernel summit

doug t

--- On Tue, 10/20/09, Colbert, Rusty <rusty.colbert@hp.com> wrote:

> From: Colbert, Rusty <rusty.colbert@hp.com>
> Subject: Module loads but has error.
> To: "bluesmoke ML" <bluesmoke-devel@lists.sourceforge.net>
> Date: Tuesday, October 20, 2009, 11:03 AM
> =

> EDAC
> i7core: Device not
> found: dev 03.0 PCI ID 8086:2c18
> =

> =A0
> =

> This would seem to be the
> PCI_DEVICE_ID_INTEL_I7_MCR
> =

> =A0
> =

> The modules are loaded, but I think this
> error may have caused them to
> be ineffective. There are no files under
> /sys/devices/system/edac/mc as in
> older edac enabled kernels. =

> =

> =A0
> =

> I have access to multiple platforms and
> can acquire DIMMs with ECC
> errors, but I don't see the point in installing them if
> the driver is not
> installing properly.
> =

> =A0
> =

> I am currently running on an HP ProLiant DL360. It
> has
> Intel Xeon CPUs X5550.
> =

> Any pointers on how I should approach
> debugging this?
> =

> =

> =

>  =

> =

> =

> =

> -----Inline Attachment Follows-----
> =

> -------------------------------------------------------------------------=
-----
> Come build with us! The BlackBerry(R) Developer Conference
> in SF, CA
> is the only developer event you need to attend this year.
> Jumpstart your
> developing skills, take BlackBerry mobile applications to
> market and stay =

> ahead of the curve. Join us from November 9 - 12, 2009.
> Register now!
> http://p.sf.net/sfu/devconference
> -----Inline Attachment Follows-----
> =

> _______________________________________________
> bluesmoke-devel mailing list
> bluesmoke-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel
> =


---------------------------------------------------------------------------=
---
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay =

ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
