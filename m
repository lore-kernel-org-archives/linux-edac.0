From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Tue, 18 May 2010 13:44:01 -0300
Message-ID: <4BF2C3D1.10009@redhat.com>
References: <4BF18995.6070008@redhat.com> <4BF2392A.9040409@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <4BF2392A.9040409@jp.fujitsu.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>
Cc: Tony Luck <tony.luck@intel.com>, Brent Young <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Ingo Molnar <mingo@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Thomas Gleixner <tglx@linutronix.de>, bluesmoke-devel@lists.sourceforge.net, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

Hidetoshi Seto wrote:
> (2010/05/18 3:23), Mauro Carvalho Chehab wrote:
>> During the last LF Collaboration Summit, we've done a mini-summit [1],
>> intended to improve the hardware error detection in kernel, currently
>> provided by MCE and EDAC subsystems.
>>
>> The idea of this mini-summit came up after Thomas Gleixner and Ingo
>> Molnar suggestions that edac and mce should converge into an error
>> subsystem.
>>
>> I'm enclosing the minutes of the meeting, in order to allow it to be
>> reviewed by other kernel hackers that are interested on the theme but
>> unfortunately couldn't come to the meeting.
>>
>> Btw, during the meeting, it were decided that EDAC ML could better work
>> if moved to vger, so I'm copying here both the old and the new edac
>> mailing lists.
>>
>> [1] http://events.linuxfoundation.org/lfcs2010/edac
>>
>> ---
> 
> Thank you very much for providing this report.
> 
> I agree that we should have a well organized error subsystem that
> covers all error sources in the system and that provides enough
> simple and powerful API for users. As one of interested absentee,
> I think I could be of some help to you (e.g. x86 low level).

Thank you for your offer. Any help is welcome.
>
> It might be off-topic here, but I'd like to point that you missed
> the presence of PCIe AER subsystem that handle hardware errors on
> PCIe devices nowadays (It works well on ppc, x86 and so on).
> Given that APEI also covers PCIe errors and that some system can
> map MC registers to PCI configuration space, I think there is no
> way for the new error subsystem to ignore I/O device errors while
> it care errors on CPU/memory and cooperate with APEI.

Yes, it makes sense to integrate also PCIe AER subystem. IMO, the first
step is to provide an error core integrated to perf, and then start
integrating the several error systems around it.

-- 

Cheers,
Mauro

------------------------------------------------------------------------------
