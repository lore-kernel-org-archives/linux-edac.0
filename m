From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: Module loads but has error.
Date: Thu, 22 Oct 2009 05:15:11 +0900
Message-ID: <20091022051511.0d241030@caramujo.chehab.org>
References: <375171.22182.qm@web50101.mail.re2.yahoo.com>
	<1256073500.31589.58.camel@keith-laptop>
	<20091021074749.743ef923@caramujo.chehab.org>
	<EC2969A33F12344780D895AFCAA422CE5086261B8E@GVW1095EXB.americas.hpqcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <EC2969A33F12344780D895AFCAA422CE5086261B8E@GVW1095EXB.americas.hpqcorp.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: "Colbert, Rusty" <rusty.colbert@hp.com>
Cc: Doug Thompson <norsk5@yahoo.com>, bluesmoke ML <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

Em Wed, 21 Oct 2009 17:55:51 +0000
"Colbert, Rusty" <rusty.colbert@hp.com> escreveu:

> I checked my tree against a fresh linux-next download and found no differences in the edac dir. However, my DEBUG output has a different line number for i7core_init. I cannot find your updated i7core_edac.c.
> 
> 
> 
> EDAC DEBUG: in /usr/src/linux-2.6.34-edac-memtest/drivers/edac/edac_mc_sysfs.c, line at 1028: edac_sysfs_setup_mc_kset()
> 
> EDAC DEBUG: in /usr/src/linux-2.6.34-edac-memtest/drivers/edac/edac_mc_sysfs.c, line at 1045: edac_sysfs_setup_mc_kset() Registered '.../edac/mc' kobject
> 
> EDAC DEBUG: in /usr/src/linux-2.6.34-edac-memtest/drivers/edac/i7core_edac.c, line at 1947: MC: /usr/src/linux-2.6.34-edac-memtest/drivers/edac/i7core_edac.c: i7core_init()
> EDAC i7core: Device not found: dev 03.0 PCI ID 8086:2c18
> 

The version I've ran the tests is a version where there were some new patches
applied there, that are under tests. As none of the patches touch the PCI ID
detection, this shouldn't cause any differences for you.



Cheers,
Mauro

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
