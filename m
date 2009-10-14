From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/3] edac: Create an unique instance for each kobj
Date: Tue, 13 Oct 2009 20:01:17 -0700
Message-ID: <20091013200117.895885a6.akpm@linux-foundation.org>
References: <20090924192821.7fcffc80@pedra.chehab.org>
	<20091004164354.5ff55ea1@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20091004164354.5ff55ea1@pedra.chehab.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Ingo Molnar <mingo@elte.hu>, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: edac.vger.kernel.org

On Sun, 4 Oct 2009 16:43:54 -0300 Mauro Carvalho Chehab <mchehab@redhat.com> wrote:

> Current code only works when there's just one memory
> controller, since we need one kobj for each instance.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
> ---
>  drivers/edac/edac_core.h     |   21 ++++++++---
>  drivers/edac/edac_mc_sysfs.c |   75 +++++++++++++++++++++++++++--------------
>  2 files changed, 64 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/edac/edac_core.h b/drivers/edac/edac_core.h
> index d035ee9..f84da6e 100644
> --- a/drivers/edac/edac_core.h
> +++ b/drivers/edac/edac_core.h
> @@ -341,23 +341,29 @@ struct csrow_info {
>  };
>  
>  struct mcidev_sysfs_group {
> -	const char *name;
> -	struct mcidev_sysfs_attribute *mcidev_attr;
> -	struct kobject kobj;
> +	const char *name;				/* group name */
> +	struct mcidev_sysfs_attribute *mcidev_attr;	/* group attributes */
> +};
> +
> +struct mcidev_sysfs_group_kobj {
> +	struct list_head list;		/* list for all instances within a mc */
> +
> +	struct kobject kobj;		/* kobj for the group */
>  
> +	struct mcidev_sysfs_group *grp;	/* group description table */
>  	struct mem_ctl_info *mci;	/* the parent */
>  };

I don't know which kernel you're patching here, but it doesn't look
anything like mine...

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
