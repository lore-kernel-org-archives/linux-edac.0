From: Arvind R <arvino55@gmail.com>
Subject: Re: linux-next: Tree for April 21 (i82975x_edac)
Date: Sun, 24 Apr 2011 11:59:40 +0530
Message-ID: <BANLkTikWa7wZYonWLHMqWkBRHfi7tLiyuA@mail.gmail.com>
References: <20110421132045.5af1b953.sfr@canb.auug.org.au>
	<20110421085124.4a44d048.randy.dunlap@oracle.com>
	<BANLkTinoi1SeuuPj5SeTzssyBTvTQu6pMA@mail.gmail.com>
	<4DB2F406.404@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <4DB2F406.404@oracle.com>
Sender: linux-next-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ranganathan Desikan <ravi@jetztechnologies.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, bluesmoke-devel@lists.sourceforge.net, linux-edac@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Jason Uhlenkott <juhlenko@akamai.com>
List-Id: edac.vger.kernel.org

On Sat, Apr 23, 2011 at 9:15 PM, Randy Dunlap <randy.dunlap@oracle.com>=
 wrote:
> On 04/23/11 01:21, Arvind R wrote:
>> On Thu, Apr 21, 2011 at 9:21 PM, Randy Dunlap <randy.dunlap@oracle.c=
om> wrote:
>>> On Thu, 21 Apr 2011 13:20:45 +1000 Stephen Rothwell wrote:
>>>
>>>> Changes since 20110420:
>>>
>>>
>>> on i386:
>>>
>>> drivers/edac/i82975x_edac.c:298: warning: integer constant is too l=
arge for 'unsigned long' type

> I think that the goal should be to get your 4-patch series merged.
>
>> That would still not fix the wrong error-info reported by the driver=
 - this is
>> fixed by the patch-set titled '[RFC PATCH 2.6.37 0/4] i3000_edac : m=
erge
>> i82975x support' dated 2011-02-14 in the linux-edac archives.
>>
>> Please advise on getting the patch into main-stream. The I3000 is a =
re-labeled
>> i82975x (or vice-versa). Hence the patch-set to merge the drivers. I=
f separate
>> i82975x driver is needed - I can provide the patch. The reported bug=
 is not
>> present in the merge-patched driver.
>
> Doug, any plans to merge this 4-patch series from Arvind?
>
> Arvind, was bluesmoke-devel@lists.sourceforge.net copied on this patc=
h series?
No - thought that the bluesmoke-list had moved to linux-edac.

>
> and was the I3000 driver maintainer copied? =A0(added)
> I can't tell this from the marc.info archives.
Added myself to the driver maintainer in the i3000_edac.c file. The
patch-set adds support for i82975x in the i3000 driver, which is
better structured.
TODO:
    1. Change Kconfig file - select I3000 for i82975x support
    2. Delete i82975x_edac.c file
    3. Update MAINTAINERS file
>

Arvind
