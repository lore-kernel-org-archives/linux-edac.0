From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: EDAC on CentOS
Date: Sat, 19 Dec 2009 01:59:55 -0800 (PST)
Message-ID: <377252.27805.qm@web50107.mail.re2.yahoo.com>
References: <1EF3CF9F513A9A44B30143B82AD87DC501F90C42@BRIMSGV1.QUANTUM.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <1EF3CF9F513A9A44B30143B82AD87DC501F90C42@BRIMSGV1.QUANTUM.COM>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net, Srinivasa Palakodeti <Srinivasa.Palakodeti@quantum.com>
List-Id: edac.vger.kernel.org

Man that is old version. EDAC began in 2.6.16 and then it was VERY primitive to what we have today in 2.6.33. I did a backport to 2.6.9 for a MIPS cluster mfg'er a couple of years ago but that took me several months and they paided me for it, plus doing their unique memory controller. They have since upgraded to newer kernels

There is way too much deltas now between a good version of EDAC and 2.6.12. I won't be able to do such

doug thompson


--- On Mon, 12/14/09, Srinivasa Palakodeti <Srinivasa.Palakodeti@quantum.com> wrote:

> From: Srinivasa Palakodeti <Srinivasa.Palakodeti@quantum.com>
> Subject: EDAC on CentOS
> To: bluesmoke-devel@lists.sourceforge.net
> Date: Monday, December 14, 2009, 11:31 PM
> 
> 
>  
>  
>  
> Hi,
> 
> We would like to track ECC corrections (Uncorrectable 
> Errors, Correctable Errors ) on our CentOS version 4. Is it
> possible to build 
> for this OS version?
> 
> Our OS version is
> 
> cat /proc/version
> Linux 
> version 2.6.12-5smp gcc version 4.0.3) #1 SMP Fri Jul 3
> 17:36:50 IST 
> 2009
> 
> And will EDAC detect the DRAM failures/errors in shared
> 
> memory and DRAM failures/errors in Xscale ram
> area 
> ?
> 
> 
> Regards,
> Srinivas
> 
> The information contained in this transmission may be
> confidential. Any disclosure, copying, or further
> distribution of confidential information is not permitted
> unless such privilege is explicitly granted in writing by
> Quantum. Quantum reserves the right to have electronic
> communications, including email and attachments, sent across
> its networks filtered through anti virus and spam software
> programs and retain such messages in order to comply with
> applicable data security and retention requirements. Quantum
> is not responsible for the proper and complete transmission
> of the substance of this communication or for any delay in
> its receipt.
> 
>  
> 
> -----Inline Attachment Follows-----
> 
> ------------------------------------------------------------------------------
> This SF.Net email is sponsored by the Verizon Developer
> Community
> Take advantage of Verizon's best-in-class app development
> support
> A streamlined, 14 day to market process makes app
> distribution fast and easy
> Join now and get one step closer to millions of Verizon
> customers
> http://p.sf.net/sfu/verizon-dev2dev 
> -----Inline Attachment Follows-----
> 
> _______________________________________________
> bluesmoke-devel mailing list
> bluesmoke-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel
> 

------------------------------------------------------------------------------
This SF.Net email is sponsored by the Verizon Developer Community
Take advantage of Verizon's best-in-class app development support
A streamlined, 14 day to market process makes app distribution fast and easy
Join now and get one step closer to millions of Verizon customers
http://p.sf.net/sfu/verizon-dev2dev 
