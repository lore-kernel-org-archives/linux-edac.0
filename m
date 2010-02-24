From: Marvin <marvin24@gmx.de>
Subject: Re: ECC not detected
Date: Wed, 24 Feb 2010 12:51:05 +0100
Message-ID: <201002241251.05318.marvin24@gmx.de>
References: <201002232135.17497.marvin24@gmx.de>
	<4B84E4E3.9050701@buttersideup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <4B84E4E3.9050701@buttersideup.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Tim Small <tim@buttersideup.com>
Cc: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

> Marvin wrote:
> > I attached full dmesg, lspci and dmidecode (in case it helps) output. The
> > DRAM
> 
> The output of "decode-dimms" is often also worth a look....

unfortunately, there is no module available to communicate with the eeprom.

In the mean time I found the reason for the error. The "real" CPU is a two core 
Phenom (Phenom II X2 555 / BE 3.2 GHz). Two additional cores where enabled and 
overclocked to 3.6 GHz in the BIOS setup (so BIOS reports X4 B55 / 3.6 GHz). While 
this runs well under normal conditions (no crashes), other things seem to suffer - 
like EDAC (also powernow-k8 has problems selecting the right clock frequency and 
needs ignore_ppc option).

Sorry for the false report.

Marvin

------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
