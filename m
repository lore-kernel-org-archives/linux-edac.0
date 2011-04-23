From: Arvind R <arvino55@gmail.com>
Subject: Re: linux-next: Tree for April 21 (i82975x_edac)
Date: Sat, 23 Apr 2011 13:51:04 +0530
Message-ID: <BANLkTinoi1SeuuPj5SeTzssyBTvTQu6pMA@mail.gmail.com>
References: <20110421132045.5af1b953.sfr@canb.auug.org.au>
	<20110421085124.4a44d048.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20110421085124.4a44d048.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ranganathan Desikan <ravi@jetztechnologies.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, bluesmoke-devel@lists.sourceforge.net, linux-edac@vger.kernel.org
List-Id: edac.vger.kernel.org

On Thu, Apr 21, 2011 at 9:21 PM, Randy Dunlap <randy.dunlap@oracle.com>=
 wrote:
> On Thu, 21 Apr 2011 13:20:45 +1000 Stephen Rothwell wrote:
>
>> Changes since 20110420:
>
>
> on i386:
>
> drivers/edac/i82975x_edac.c:298: warning: integer constant is too lar=
ge for 'unsigned long' type
>
> which is:
>
> =A0 =A0 =A0 =A0if (info->xeap & 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0page |=3D 0x100000000ul; <<<<<<<<<<<<<=
<<
>
> but page is unsigned long (32 bits), while 0x100000000ul is more than=
 32 bits,
> so that line isn't setting a bit in <page>. =A0Is it a bug, or this d=
river isn't
> applicable to X86_32, or what?
>
would defining page variable to unsigned long long solve it for x86_32?

That would still not fix the wrong error-info reported by the driver - =
this is
fixed by the patch-set titled '[RFC PATCH 2.6.37 0/4] i3000_edac : merg=
e
i82975x support' dated 2011-02-14 in the linux-edac archives.

Please advise on getting the patch into main-stream. The I3000 is a re-=
labeled
i82975x (or vice-versa). Hence the patch-set to merge the drivers. If s=
eparate
i82975x driver is needed - I can provide the patch. The reported bug is=
 not
present in the merge-patched driver.

Thanks,
Arvind.
