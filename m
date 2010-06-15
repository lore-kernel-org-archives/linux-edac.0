From: Holger Schletz <schletz@zfg-dortmund.de>
Subject: Message: "UE overwrote CE"
Date: Tue, 15 Jun 2010 13:00:57 +0200
Message-ID: <201006151300.58402.schletz@zfg-dortmund.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: kmail@zfg15.zfg, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

Hi,

I got the following message in my log:

EDAC MC0: CE - no information available: UE overwrote CE

I have not found any information about this message except references to the 
source code, which is not helpful.
My system is a Fujitsu Siemens Primergy Econel S2 with Intel E3200 chipset and 
kernel 2.6.32. Output of "edac-util -v" is:

mc0: 0 Uncorrected Errors with no DIMM info
mc0: 1 Corrected Errors with no DIMM info
mc0: csrow0: ch0|ch1: 0 Uncorrected Errors
mc0: csrow0: ch0: 0 Corrected Errors
mc0: csrow0: ch1: 0 Corrected Errors
mc0: csrow4: ch0|ch1: 0 Uncorrected Errors
mc0: csrow4: ch0: 0 Corrected Errors
mc0: csrow4: ch1: 0 Corrected Errors
mc0: csrow5: ch0|ch1: 0 Uncorrected Errors
mc0: csrow5: ch0: 0 Corrected Errors
mc0: csrow5: ch1: 0 Corrected Errors

What does the message mean? Is it something to worry about?

Best regards
Holger Schletz

------------------------------------------------------------------------------
This SF.net email is sponsored by Sprint
What will you do first with EVO, the first 4G phone?
Visit sprint.com/first -- http://p.sf.net/sfu/sprint-com-first
