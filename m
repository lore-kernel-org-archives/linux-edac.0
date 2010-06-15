From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 15 Jun 2010 08:56:31 +0200
Message-ID: <20100615065630.GC6727@basil.fritz.box>
References: <AANLkTil_mDFOsDUjvnp_NFZvkj0Ij-qww6BqewJ4lpHP@mail.gmail.com> <35525.41387.qm@web50105.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <35525.41387.qm@web50105.mail.re2.yahoo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Thompson <norsk5@yahoo.com>
Cc: Andi Kleen <andi@firstfloor.org>, Tony Luck <tony.luck@intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Nils Carlson <nils.carlson@ludd.ltu.se>, Ingo Molnar <mingo@elte.hu>, Borislav Petkov <bp@amd64.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, BrentYoung <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>
List-Id: edac.vger.kernel.org

On Mon, Jun 14, 2010 at 04:46:40PM -0700, Doug Thompson wrote:

Hi Doug,

> 
> Maybe I didn't see it covered (or I missed it), but EDAC is used on more than just x86 based machines, though they are the majority by volume. We should have an abstraction that covers all the archs, like we do with other subsystems of Linux.

The way I envision it to working is that a abstracted dimm interface
(or edac2 or whatever you want to call it) can be fed from any reasonable
DIMM layout driver. This could be either DMI on x86 or some other
driver. There would be nothing really x86 specific about that.

That said I think overall the focus for memory error handling
should focus on smart event handling, not dumb accounting.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
