From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: [PATCH 0/3] i7core_edac and edac_mce
Date: Sun, 4 Oct 2009 16:16:04 -0300
Message-ID: <20091004161604.255340f8@pedra.chehab.org>
References: <20090924192821.7fcffc80@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20090924192821.7fcffc80@pedra.chehab.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, bluesmoke-devel@lists.sourceforge.net, Andrew Morton <akpm@linux-foundation.org>
List-Id: edac.vger.kernel.org

As pointed By Arjan, Hidetoshi and Borislav, the edac glue had the
risk of causing dead locks with NMI code. Due to that, I'm submitting
a patch that replaces it to use, instead, a ringbuffer.

I also found a bug at the new edac sysfs methods when more than one memory 
controller were used, and added a small patch to improve error injection
address mask.

Please review.

The entire patch series is available at:
	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/i7core.git for_linus

Cheers,
Maur

-- 

Cheers,
Mauro

------------------------------------------------------------------------------
Come build with us! The BlackBerry&reg; Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9&#45;12, 2009. Register now&#33;
http://p.sf.net/sfu/devconf
