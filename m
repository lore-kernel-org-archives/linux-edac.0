From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 18 May 2010 13:50:36 -0300
Message-ID: <4BF2C55C.9060200@redhat.com>
References: <4BF18995.6070008@redhat.com> <87r5laxiap.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87r5laxiap.fsf@basil.nowhere.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Kleen <andi@firstfloor.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, bluesmoke-devel@lists.sourceforge.net, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Ben Woodard <woodard@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <bp@amd64.org>, Tony Luck <tony.luck@intel.com>, Brent Young <brent.young@intel.com>
List-Id: edac.vger.kernel.org

Andi Kleen wrote:
> Mauro Carvalho Chehab <mchehab@redhat.com> writes:
>> There is an immediate need for error reporting on NHM-EP class
>> systems.
> 
> Just for the innocent readers who might be mislead by this:
> 
> Nehalem-EP DIMM error accounting already works fine today using
> mcelog for most cases, including RHEL5.5 (with some limits) 
> and RHEL6beta with no additional changes needed.
> 
> In RHEL6 the daemon does the accounting and the client reports the errors
> separated for each DIMM and separated in uc and ce.  In RHEL5
> the information is in a log file and can be gotten from there.
> 
> In addition the daemon supports various advanced RAS features including
> predictive bad page offlining and various threshold triggers.

Ok. It should be clear that the main target of the mini-summit is to define
how the several subsystems will integrate into a hardware-abstracted way
to report errors from kernel. So, we're looking on the next steps to improve
what we currently have, and avoid to have more than one different subsystem
trying to get the same info, eventually using the same registers, but providing
different interfaces to userspace.

-- 

Cheers,
Mauro
