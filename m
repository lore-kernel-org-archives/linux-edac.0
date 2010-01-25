From: Peter Tyser <ptyser@xes-inc.com>
Subject: Re: [PATCH 1/4] edac: Remove unused mpc85xx debug code
Date: Mon, 25 Jan 2010 11:20:13 -0600
Message-ID: <1264440013.22019.19.camel@localhost.localdomain>
References: <1258677749-15968-1-git-send-email-ptyser@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <1258677749-15968-1-git-send-email-ptyser@xes-inc.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net
Cc: linuxppc-dev@ozlabs.org, djiang@mvista.com
List-Id: edac.vger.kernel.org

On Thu, 2009-11-19 at 18:42 -0600, Peter Tyser wrote:
> Some unused, unsupported debug code existed in the mpc85xx EDAC driver
> that resulted in a build failure when CONFIG_EDAC_DEBUG was defined:
> 
>   drivers/edac/mpc85xx_edac.c: In function 'mpc85xx_mc_err_probe':
>   drivers/edac/mpc85xx_edac.c:1031: error: implicit declaration of function 'edac_mc_register_mcidev_debug'
>   drivers/edac/mpc85xx_edac.c:1031: error: 'debug_attr' undeclared (first use in this function)
>   drivers/edac/mpc85xx_edac.c:1031: error: (Each undeclared identifier is reported only once
>   drivers/edac/mpc85xx_edac.c:1031: error: for each function it appears in.)
> 
> Signed-off-by: Peter Tyser <ptyser@xes-inc.com>

<snip>

Any chance some of these will be picked up for 2.6.33?

I added Kumar on CC as I'm not sure if these should go through the EDAC
or PPC tree.

1/4 fixes a build error when CONFIG_EDAC_DEBUG is defined and is pretty
trivial.

2/4 fixes a regression which results in ECC detection not working.

3/4 and 4/4 are "improvements", but don't necessarily need to go into
2.6.33.

Best,
Peter


------------------------------------------------------------------------------
Throughout its 18-year history, RSA Conference consistently attracts the
world's best and brightest in the field, creating opportunities for Conference
attendees to learn about information security's most important issues through
interactions with peers, luminaries and emerging and established companies.
http://p.sf.net/sfu/rsaconf-dev2dev
