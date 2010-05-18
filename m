From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 18 May 2010 20:45:29 +0200
Message-ID: <87eih9xd4m.fsf@basil.nowhere.org>
References: <4BF18995.6070008@redhat.com> <4BF2392A.9040409@jp.fujitsu.com>
	<4BF2C3D1.10009@redhat.com>
	<1274204560.17703.82.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1274204560.17703.82.camel@Joe-Laptop.home> (Joe Perches's message of "Tue\, 18 May 2010 10\:42\:40 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, bluesmoke-devel@lists.sourceforge.net, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Ben Woodard <woodard@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <bp@amd64.org>, Tony Luck <tony.luck@intel.com>, Brent Young <brent.young@intel.com>
List-Id: edac.vger.kernel.org

Joe Perches <joe@perches.com> writes:

> On Tue, 2010-05-18 at 13:44 -0300, Mauro Carvalho Chehab wrote:
>> IMO, the first
>> step is to provide an error core integrated to perf, and then start
>> integrating the several error systems around it.
>
> Why integrated to perf?

For a different perspective on this see also

http://permalink.gmane.org/gmane.linux.kernel/952061

AFAIK all the issues mentioned there are still open.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
