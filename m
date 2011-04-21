From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for April 21 (i82975x_edac)
Date: Thu, 21 Apr 2011 08:51:24 -0700
Message-ID: <20110421085124.4a44d048.randy.dunlap@oracle.com>
References: <20110421132045.5af1b953.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110421132045.5af1b953.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ranganathan Desikan <ravi@jetztechnologies.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, arvino55@gmail.com, bluesmoke-devel@lists.sourceforge.net, linux-edac@vger.kernel.org
List-Id: edac.vger.kernel.org

On Thu, 21 Apr 2011 13:20:45 +1000 Stephen Rothwell wrote:

> Changes since 20110420:


on i386:

drivers/edac/i82975x_edac.c:298: warning: integer constant is too large for 'unsigned long' type

which is:

	if (info->xeap & 1)
		page |= 0x100000000ul; <<<<<<<<<<<<<<<

but page is unsigned long (32 bits), while 0x100000000ul is more than 32 bits,
so that line isn't setting a bit in <page>.  Is it a bug, or this driver isn't
applicable to X86_32, or what?


thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
