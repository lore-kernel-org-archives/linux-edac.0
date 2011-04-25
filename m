From: Jason Uhlenkott <juhlenko@akamai.com>
Subject: Re: linux-next: Tree for April 21 (i82975x_edac)
Date: Mon, 25 Apr 2011 00:00:49 -0700
Message-ID: <20110425070049.GD2123@juhlenko-desk.sanmateo.corp.akamai.com>
References: <20110421132045.5af1b953.sfr@canb.auug.org.au> <20110421085124.4a44d048.randy.dunlap@oracle.com> <BANLkTinoi1SeuuPj5SeTzssyBTvTQu6pMA@mail.gmail.com> <4DB2F406.404@oracle.com> <BANLkTikWa7wZYonWLHMqWkBRHfi7tLiyuA@mail.gmail.com> <4ac1d916ddc0ab9e7e94b81bc77880be.squirrel@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4ac1d916ddc0ab9e7e94b81bc77880be.squirrel@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Arvind R <arvino55@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Ranganathan Desikan <ravi@jetztechnologies.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Doug Thompson <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org

On Sun, Apr 24, 2011 at 21:13:16 -0500, Randy Dunlap wrote:
> > Added myself to the driver maintainer in the i3000_edac.c file. The
> > patch-set adds support for i82975x in the i3000 driver, which is
> > better structured.
> > TODO:
> >     1. Change Kconfig file - select I3000 for i82975x support
> >     2. Delete i82975x_edac.c file
> >     3. Update MAINTAINERS file
> 
> Did the other EDAC-I3000 maintainer respond?

I'm happy to let Arvind take over this driver; I haven't done any edac
work in quite a while.

Acked-by: Jason Uhlenkott <juhlenko@akamai.com>
