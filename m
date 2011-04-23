From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for April 21 (i82975x_edac)
Date: Sat, 23 Apr 2011 08:45:10 -0700
Message-ID: <4DB2F406.404@oracle.com>
References: <20110421132045.5af1b953.sfr@canb.auug.org.au>	<20110421085124.4a44d048.randy.dunlap@oracle.com>
	<BANLkTinoi1SeuuPj5SeTzssyBTvTQu6pMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <BANLkTinoi1SeuuPj5SeTzssyBTvTQu6pMA@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Arvind R <arvino55@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ranganathan Desikan <ravi@jetztechnologies.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net, linux-edac@vger.kernel.org
List-Id: edac.vger.kernel.org

On 04/23/11 01:21, Arvind R wrote:
> On Thu, Apr 21, 2011 at 9:21 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
>> On Thu, 21 Apr 2011 13:20:45 +1000 Stephen Rothwell wrote:
>>
>>> Changes since 20110420:
>>
>>
>> on i386:
>>
>> drivers/edac/i82975x_edac.c:298: warning: integer constant is too large for 'unsigned long' type
>>
>> which is:
>>
>>        if (info->xeap & 1)
>>                page |= 0x100000000ul; <<<<<<<<<<<<<<<
>>
>> but page is unsigned long (32 bits), while 0x100000000ul is more than 32 bits,
>> so that line isn't setting a bit in <page>.  Is it a bug, or this driver isn't
>> applicable to X86_32, or what?
>>
> would defining page variable to unsigned long long solve it for x86_32?

I think that the goal should be to get your 4-patch series merged.

> That would still not fix the wrong error-info reported by the driver - this is
> fixed by the patch-set titled '[RFC PATCH 2.6.37 0/4] i3000_edac : merge
> i82975x support' dated 2011-02-14 in the linux-edac archives.
> 
> Please advise on getting the patch into main-stream. The I3000 is a re-labeled
> i82975x (or vice-versa). Hence the patch-set to merge the drivers. If separate
> i82975x driver is needed - I can provide the patch. The reported bug is not
> present in the merge-patched driver.

Doug, any plans to merge this 4-patch series from Arvind?

Arvind, was bluesmoke-devel@lists.sourceforge.net copied on this patch series?

and was the I3000 driver maintainer copied?  (added)
I can't tell this from the marc.info archives.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

------------------------------------------------------------------------------
Fulfilling the Lean Software Promise
Lean software platforms are now widely adopted and the benefits have been 
demonstrated beyond question. Learn why your peers are replacing JEE 
containers with lightweight application servers - and what you can gain 
from the move. http://p.sf.net/sfu/vmware-sfemails
