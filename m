From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] edac/Kconfig: reenable edac_mpc85xx on MPC85xx
Date: Wed, 21 Jul 2010 19:33:26 +0400
Message-ID: <AANLkTimr363aK=DTj7Eb1hJiu9d80Z460feU9K920H-w@mail.gmail.com>
References: <1279321888-27335-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1279321888-27335-1-git-send-email-dbaryshkov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Doug Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net, stable@kernel.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: edac.vger.kernel.org

Hello,

What about this patch. Is it ok?

On Sat, Jul 17, 2010 at 3:11 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Somewhere after 2.6.32 MPC85xx got renamed to FSL_BOOKE (to include
> QorIQ family of chips). However drivers/edac/Kconfig wasn't updated t=
o
> reflect this change. Fix it now.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: stable@kernel.org
> ---
> =A0drivers/edac/Kconfig | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index aedef79..2328c95 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -209,7 +209,7 @@ config EDAC_I5100
>
> =A0config EDAC_MPC85XX
> =A0 =A0 =A0 =A0tristate "Freescale MPC83xx / MPC85xx"
> - =A0 =A0 =A0 depends on EDAC_MM_EDAC && FSL_SOC && (PPC_83xx || MPC8=
5xx)
> + =A0 =A0 =A0 depends on EDAC_MM_EDAC && FSL_SOC && (PPC_83xx || FSL_=
SOC_BOOKE)
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Support for error detection and correction on the =
=46reescale
> =A0 =A0 =A0 =A0 =A0MPC8349, MPC8560, MPC8540, MPC8548
> --
> 1.7.1
>
>



--=20
With best wishes
Dmitry
