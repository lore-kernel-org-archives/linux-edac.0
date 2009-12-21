From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: EDAC and DDR3 memory
Date: Mon, 21 Dec 2009 13:23:00 -0800 (PST)
Message-ID: <569393.31507.qm@web50105.mail.re2.yahoo.com>
References: <4B2CBA37.2090101@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <4B2CBA37.2090101@web.de>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net, Joachim Ernst <joachim.ernst@web.de>
List-Id: edac.vger.kernel.org

Looks like  Boris has that in his lastest git tree, so it is  coming

At the time I make the mods, DDR3 cost too much for me to get a system with. Since then, they are much more reasonable

doug t

--- On Sat, 12/19/09, Joachim Ernst <joachim.ernst@web.de> wrote:

> From: Joachim Ernst <joachim.ernst@web.de>
> Subject: EDAC and DDR3 memory
> To: bluesmoke-devel@lists.sourceforge.net
> Date: Saturday, December 19, 2009, 4:34 AM
> Dear EDAC-Developers,
> 
> is there a chance to get DDR3 running with EDAC?
> Here is the output of dmesg | grep EDAC:
> 
> EDAC MC: Ver: 2.1.0 Dec 8 2009
> EDAC amd64_edac: Ver: 3.2.0 Dec 8 2009
> EDAC amd64: ECC is enabled by BIOS, Proceeding with EDAC
> module
> initialization
> EDAC MC: F10h CPU detected
> EDAC amd64: f10_probe_valid_hardware() This machine is
> running with DDR3
> memory. This is not currently supported. DCHR0=0x3f58090d
> DCHR1=0x3f58090d
> EDAC amd64: Contact 'amd64_edac' module MAINTAINER to help
> add support.
> 
> Using Phenom II CPU with unbuffered ECC-RAM
> (2xKVR1333D3E9SK2/4G) on an
> AM3-Motherboard(Biostar TA790GX A3+).
> 
> If you need more information don't dare to ask.
> 
> Sincerly
> Joachim Ernst
> 
> ------------------------------------------------------------------------------
> This SF.Net email is sponsored by the Verizon Developer
> Community
> Take advantage of Verizon's best-in-class app development
> support
> A streamlined, 14 day to market process makes app
> distribution fast and easy
> Join now and get one step closer to millions of Verizon
> customers
> http://p.sf.net/sfu/verizon-dev2dev 
> _______________________________________________
> bluesmoke-devel mailing list
> bluesmoke-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel
> 

------------------------------------------------------------------------------
This SF.Net email is sponsored by the Verizon Developer Community
Take advantage of Verizon's best-in-class app development support
A streamlined, 14 day to market process makes app distribution fast and easy
Join now and get one step closer to millions of Verizon customers
http://p.sf.net/sfu/verizon-dev2dev 
