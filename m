From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: ECC not detected
Date: Tue, 23 Feb 2010 20:23:37 +0100
Message-ID: <20100223192336.GC2401@aftab>
References: <201002232008.37461.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <201002232008.37461.marvin24@gmx.de>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Marvin <marvin24@gmx.de>
Cc: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

From: Marvin <marvin24@gmx.de>
Date: Tue, Feb 23, 2010 at 08:08:36PM +0100

Hi,

> my system is a Phenom II with 4GB ECC memory and Asus "M4A785TD-V
> EVO" MoBo running current git kernel. ECC is enabled in the BIOS. The
> amd64_edac_mod module can only be loaded using the ecc_edac_override.
> Below is the output of debug messages enabled.

can you please send me your whole dmesg. Also do as root

lspci -s 18.3 -xxxx

and send me that output too. Furthermore, what is your exact BIOS
version and what is the exact model name of the DIMMs, how many are
there, are they identical and how are they placed?

Thanks.

-- 
Regards/Gruss,
Boris.

-
Advanced Micro Devices, Inc.
Operating Systems Research Center


------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
