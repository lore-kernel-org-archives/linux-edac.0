From: Borislav Petkov <bp@amd64.org>
Subject: Re: EDAC linux-2.6.34-rc5 non correctable errors not reported on
	AMD64 opteron
Date: Fri, 30 Apr 2010 13:00:23 +0200
Message-ID: <20100430110023.GA6554@aftab>
References: <20100429183003.GB20328@ppanchamukhi>
	<1272579222.3792.18.camel@keith-laptop>
	<20100429223121.GA20899@ppanchamukhi>
	<1272583087.3792.35.camel@keith-laptop>
	<20100430001241.GB20899@ppanchamukhi>
	<1272587918.3792.59.camel@keith-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <1272587918.3792.59.camel@keith-laptop>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Keith Mannthey <kmannth@us.ibm.com>
Cc: Rob Becker <Rob.Becker@riverbed.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Arthur Jones <Arthur.Jones@riverbed.com>, "dougthompson@xmission.com" <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org

Hi Prasanna, Keith,

from what I could see, you're doing the injection correctly and
the injection code accesses the right bits so that should work ok.
What happens is rather what Keith explained in detail with the only
correction that it is not the BIOS but the hardware itself that takes
action to prevent the system from damaging the data.

See, double-bit errors are deemed uncorrectable and your machine
syncfloods=B9, i.e. it terminates further stale data propagation.
Therefore, no software gets to run, not even the machine check handler
(not to mention the clumsy EDAC error polling mechanism). And that's
why you don't get the errors reported; OTOH, if you want to test the
amd64_edac driver, injecting single-bit errors should work and you can
report to me any issues you encounter.

Hope that helps.

Thanks.



=B9 See the section on Sync Flooding in the Hyper Transport spec if you
want to know more details on that.

-- =

Regards/Gruss,
Boris.

--
Advanced Micro Devices, Inc.
Operating Systems Research Center

---------------------------------------------------------------------------=
---
