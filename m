From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: Module loads but has error.
Date: Thu, 22 Oct 2009 05:03:59 +0900
Message-ID: <20091022050359.5e91bcd8@caramujo.chehab.org>
References: <375171.22182.qm@web50101.mail.re2.yahoo.com>
	<1256073500.31589.58.camel@keith-laptop>
	<20091021074749.743ef923@caramujo.chehab.org>
	<EC2969A33F12344780D895AFCAA422CE5086261902@GVW1095EXB.americas.hpqcorp.net>
	<1256138770.31589.92.camel@keith-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <1256138770.31589.92.camel@keith-laptop>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Keith Mannthey <kmannth@us.ibm.com>
Cc: Doug Thompson <norsk5@yahoo.com>, bluesmoke ML <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

Em Wed, 21 Oct 2009 08:26:10 -0700
Keith Mannthey <kmannth@us.ibm.com> escreveu:

> On Wed, 2009-10-21 at 14:13 +0000, Colbert, Rusty wrote:
> > It was a linux-next tree and is identified as 2.6.32-rc4, and edac is:
> > EDAC MC: Ver: 2.1.0 Oct 16 2009
> > There are 2 sockets in the system.
> > I don't see those addresses in the output of lspci. It is looking glum, if my BIOS is hiding buses. However, once I verify that that is the case, I'll contact someone on the ROM team to check on that.
> 
> You might ask someone on your ROM team.

Yes. A worthy trial would be to use lastbus=255 pci parameter during the boot.

> > If I look at another board with Nehalem, not running my kernel, should I see those buses? (does not show up on a DL380 G6 running SLES11 default kernel either)
> 
> No.  There is something weird going on with the Xeons.  For some reason
> vendors are not listing the cpu pci busses in ACPI, when the kernel
> boots it will not know about the devices.  The i7core driver created a
> hook to directly probe these device at module load time. 
> 
> Without loading the module you won't see the devices in lspci or any
> other place. After you load or attempt to load you should see the device
> if they are really there at 0xff and below. 

It should also be added that, with some other memory controller drivers, it was
noticed that some BIOS have the bad habit of protecting the memory registers
via SMI. While we haven't observed this behavior yet with Nehalem, I don't
doubt it will happen with certain devices.

Cheers,
Mauro

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
