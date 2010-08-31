From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: [PATCH] edac: make inst_grp_ops const
Date: Tue, 31 Aug 2010 15:59:06 -0700 (PDT)
Message-ID: <984674.34247.qm@web50103.mail.re2.yahoo.com>
References: <20100831152402.22b5e897@nehalam>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100831152402.22b5e897@nehalam>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, bluesmoke-devel@lists.sourceforge.net, Stephen Hemminger <shemminger@vyatta.com>
List-Id: edac.vger.kernel.org



--- On Tue, 8/31/10, Stephen Hemminger <shemminger@vyatta.com> wrote:

> From: Stephen Hemminger <shemminger@vyatta.com>
> Subject: [PATCH] edac: make inst_grp_ops const
> To: "Doug Thompson" <dougthompson@xmission.com>, "Mauro Carvalho Chehab" =
<mchehab@redhat.com>, bluesmoke-devel@lists.sourceforge.net
> Date: Tuesday, August 31, 2010, 4:24 PM
> This sysfs_ops should be const like
> all the others in the kernel.
> =

> Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

Acked-by: Doug Thompson <dougthompson@xmission.com>


> =

> --- a/drivers/edac/edac_mc_sysfs.c=A0=A0=A0
> 2010-08-31 15:10:29.692381171 -0700
> +++ b/drivers/edac/edac_mc_sysfs.c=A0=A0=A0
> 2010-08-31 15:11:24.072859199 -0700
> @@ -764,7 +764,7 @@ static void
> edac_inst_grp_release(struct
>  }
>  =

>  /* Intermediate show/store table */
> -static struct sysfs_ops inst_grp_ops =3D {
> +static const struct sysfs_ops inst_grp_ops =3D {
>  =A0=A0=A0 .show =3D inst_grp_show,
>  =A0=A0=A0 .store =3D inst_grp_store
>  };
> =


---------------------------------------------------------------------------=
---
This SF.net Dev2Dev email is sponsored by:

Show off your parallel programming skills.
Enter the Intel(R) Threading Challenge 2010.
http://p.sf.net/sfu/intel-thread-sfd
