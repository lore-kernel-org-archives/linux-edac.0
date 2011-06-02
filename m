From: "David Laight" <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 1/2] ppc/85xx: create a platform node for PCI EDAC device
Date: Thu, 2 Jun 2011 16:15:38 +0100
Message-ID: <AE90C24D6B3A694183C094C60CF0A2F6D8AD6B@saturn3.aculab.com>
References: <20110602151413.GA6590@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-class: urn:content-classes:message
In-Reply-To: <20110602151413.GA6590@oksana.dev.rtsoft.ru>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Anton Vorontsov <avorontsov@mvista.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

 
> > +int __init fsl_add_pci_err(void)
> 
> static :-)

and why __ ?
aren't such names reserved in the C language for some purpose.

	David
