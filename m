From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 2/2] mpc85xx_edac: change to use new definitions for PCI
	EDAC regspace
Date: Sat, 24 Jul 2010 04:20:41 +0400
Message-ID: <AANLkTik-3cujkh774H6WQB8sHD+gkKLT2FQp=8HYaWBt@mail.gmail.com>
References: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
	<1279756992-29543-2-git-send-email-dbaryshkov@gmail.com>
	<566EC982-1CDA-4806-8EC0-8C9F36448F83@kernel.crashing.org>
	<AANLkTim7kbHsouc==7gRAuRO6AYMNVdA4yyPFpRBC+QR@mail.gmail.com>
	<AANLkTimsKcn3n90cyqQTQ4Ycy2dlsHdi7afeiNX4M0v5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <AANLkTimsKcn3n90cyqQTQ4Ycy2dlsHdi7afeiNX4M0v5@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@ozlabs.org, Doug Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

Hello,

On 7/22/10, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Thu, Jul 22, 2010 at 10:48 AM, Dmitry Eremin-Solenikov
> <dbaryshkov@gmail.com> wrote:
>> Hello,
>>
>> On Thu, Jul 22, 2010 at 7:38 PM, Kumar Gala <galak@kernel.crashing.org>
>> wrote:
>>>
>>> On Jul 21, 2010, at 7:03 PM, Dmitry Eremin-Solenikov wrote:
>>>
>>>> Currently (as mpc8540-pci) devices are not created on of_platform bus,
>>>> mpc85xx_edac can't probe to them. Follow the change to dts trees to bind
>>>> not to the main mpc8540-pci node but to special mpc85xx-pci-error nodes,
>>>> present on soc bus.
>>>>
>>>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>>> ---
>>>> drivers/edac/mpc85xx_edac.c |   18 +++++++++---------
>>>> 1 files changed, 9 insertions(+), 9 deletions(-)
>>>
>>> Nak.
>>>
>>> We already have a node in the dts for the PCI controller.  Lets update
>>> the platform code to add the pci controller to the of_platform_bus_probe
>>> list.
>>
>> I've had that idea. However it's really look strange to me to call
>> of_platform_bus_probe() on the bus node, for which we (IMO) explicitly
>> won't like for
>> child devices (PCI devices) to be added to of_platform bus. Would it
>> be suitable to just call of_platform_device_create for it (Or do i
>> miss someth<ing)?
>
> Try the attached patch (lightly tested).  If it works for you then
> I'll post it for wider review.

Yes, this patch worked for me. However it looks a bit like a hack for me.

-- 
With best wishes
Dmitry

------------------------------------------------------------------------------
This SF.net email is sponsored by Sprint
What will you do first with EVO, the first 4G phone?
Visit sprint.com/first -- http://p.sf.net/sfu/sprint-com-first
