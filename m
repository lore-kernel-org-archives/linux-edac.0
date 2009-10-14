From: "Colbert, Rusty" <rusty.colbert@hp.com>
Subject: RE: [PATCH 1/3] edac: Create an unique instance for each kobj
Date: Wed, 14 Oct 2009 14:50:10 +0000
Message-ID: <EC2969A33F12344780D895AFCAA422CE50861619C0@GVW1095EXB.americas.hpqcorp.net>
References: <20090924192821.7fcffc80@pedra.chehab.org>
	<20091004164354.5ff55ea1@pedra.chehab.org>
	<20091013200117.895885a6.akpm@linux-foundation.org>
	<20091014064138.250777cd@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20091014064138.250777cd@pedra.chehab.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Mauro Carvalho Chehab <mchehab@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@elte.hu>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: edac.vger.kernel.org

Is this all into a dev tree, or are there patches for a SLES 11 (2.6.27) ?

-----Original Message-----
From: Mauro Carvalho Chehab [mailto:mchehab@redhat.com]
Sent: Wednesday, October 14, 2009 4:42 AM
To: Andrew Morton
Cc: Ingo Molnar; bluesmoke-devel@lists.sourceforge.net; linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] edac: Create an unique instance for each kobj

Hi Andrew,

Em Tue, 13 Oct 2009 20:01:17 -0700
Andrew Morton <akpm@linux-foundation.org> escreveu:

> On Sun, 4 Oct 2009 16:43:54 -0300 Mauro Carvalho Chehab <mchehab@redhat.com> wrote:
>
> > Current code only works when there's just one memory
> > controller, since we need one kobj for each instance.
>
> I don't know which kernel you're patching here, but it doesn't look
> anything like mine...

It is on i7core_edac git tree. This tree were added to linux-next. You'll be
able to see it starting from today's linux-next.

Cheers,
Mauro

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
_______________________________________________
bluesmoke-devel mailing list
bluesmoke-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
