From: Peter Tyser <ptyser@xes-inc.com>
Subject: Re: [PATCH 6/7] edac: mpc85xx fsb ecc
Date: Thu, 04 Feb 2010 11:22:14 -0600
Message-ID: <1265304134.14589.152.camel@localhost.localdomain>
References: <4b6a6d39.qA/tt48S/7odhQ+i%dougthompson@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <4b6a6d39.qA/tt48S/7odhQ+i%dougthompson@xmission.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: dougthompson@xmission.com
Cc: kolifer@gmail.com, akpm@linux-foundation.org, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: edac.vger.kernel.org

Hi Doug and Konstantin,

On Wed, 2010-02-03 at 23:46 -0700, dougthompson@xmission.com wrote:
> From: Konstantin Olifer <kolifer@gmail.com>
> 
> Patch is for Kernel 2.6.33. e752x_edac suppose that fsb ECC exist, for example, on
> Celeron + 3100. That is wrong. 
> ECC FSB supported only on Xeon for our vision (www.setdsp.ru) and datasheet from developer intel www. 
> Fixed.
> Signed-off-by:  Konstantin Olifer <kolifer@gmail.com>
> Signed-off-by:  Doug Thompson <dougthompson@xmission.com>
> ---
>  e752x_edac.c |   10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

It looks like 6/7 and 7/7 in this series have the wrong subject/title.
Patches 6 and 7 are for the e752x instead of the mpc85xx.

When changing the subjects, it might be nice to change this commit
message to something more straightforward such as:
"FSB parity is only supported on the Xeon processor.  Previously it was
incorrectly enabled for the Celeron as well."

Best,
Peter


------------------------------------------------------------------------------
The Planet: dedicated and managed hosting, cloud storage, colocation
Stay online with enterprise data centers and the best network in the business
Choose flexible plans and management services without long-term contracts
Personal 24x7 support from experience hosting pros just a phone call away.
http://p.sf.net/sfu/theplanet-com
