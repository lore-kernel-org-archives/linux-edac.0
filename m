From: Borislav Petkov <bp@amd64.org>
Subject: Re: Interpreting EDAC errors
Date: Mon, 20 Jun 2011 09:34:22 +0200
Message-ID: <20110620073422.GB9070@aftab>
References: <BANLkTin-O8co99AnG+KT3+CUGmgaudRvYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <BANLkTin-O8co99AnG+KT3+CUGmgaudRvYA@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Kevin Bowling <kevin.bowling@kev009.com>
Cc: "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

Hi,

On Mon, Jun 20, 2011 at 12:57:26AM -0400, Kevin Bowling wrote:
> Hello,
> 
> I've been seeing the following errors from the EDAC system.  I'm not
> quite sure how to associate the output from edac-util to physical
> DIMMs.  How do we account for multi-rank DIMMs, interleaving, NUMA,
> etc?

Judging by the mainboard, this is a dual socket Magny-Cours. A couple of
things:

* interpreting DRAM ECC errors is still suboptimal and we're working on
it, I'll try to come up with an interim solution to make the decoded
error info a bit more understandable.

* you have one singe-bit error which got corrected by the memory
controller on 4 DIMMs and over the current system uptime so I wouldn't
worry too much. I would monitor the DIMMs though and take action only if
those error rates start to grow over time.

You have 4 8G DIMMs per node but I don't know they rank
count so please take the below with a grain of salt. Wait,
http://www.alldatasheet.com/datasheet-pdf/pdf/332888/HYNIX/HMT31GR7BFR4C-H9.html
says that yours are actually dual-ranked.

Btw, kernel dmesg output of EDAC should help to pinpoint them better.

> root@PM-LAS-PROD-0:~# edac-util
> mc0: csrow3: ch0: 1 Corrected Errors

This should be P1_DIMM1A if your DIMMs are quadranked, P1_DIMM2A if
dual-ranked.

> mc1: csrow2: ch0: 1 Corrected Errors

P1_DIMM3A or P1_DIMM4A as above. Also, I'm assuming that the increasing
nomenclature in the silkscreen labeling is mapping the memory
controllers in the same way, i.e.:

mc0 -> 1A, 2A
mc1 -> 3A, 4A

> mc2: csrow3: ch0: 1 Corrected Errors
> mc2: csrow3: ch1: 1 Corrected Errors

This looks like P2_DIMM3A

So, yeah, it is suboptimal and it needs fixing, I know.

HTH.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551

------------------------------------------------------------------------------
EditLive Enterprise is the world's most technically advanced content
authoring tool. Experience the power of Track Changes, Inline Image
Editing and ensure content is compliant with Accessibility Checking.
http://p.sf.net/sfu/ephox-dev2dev
