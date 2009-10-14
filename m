From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH 1/3] edac: Create an unique instance for each kobj
Date: Wed, 14 Oct 2009 06:41:38 -0300
Message-ID: <20091014064138.250777cd@pedra.chehab.org>
References: <20090924192821.7fcffc80@pedra.chehab.org>
	<20091004164354.5ff55ea1@pedra.chehab.org>
	<20091013200117.895885a6.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20091013200117.895885a6.akpm@linux-foundation.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@elte.hu>, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: edac.vger.kernel.org

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
