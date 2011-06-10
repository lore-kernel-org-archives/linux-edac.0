From: Connor Hansen <cmdkhh@gmail.com>
Subject: Re: [PATCH RESEND]Remove a warning for drivers/edac/i82975x_edac.c
Date: Thu, 9 Jun 2011 23:42:30 -0700
Message-ID: <BANLkTi=ATS_ULg2egLZrG9B9NAbq6887Yg@mail.gmail.com>
References: <20110609030401.GA2615@gmail.com>
	<20110609103747.59805668.randy.dunlap@oracle.com>
	<20110610052047.GB3643@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110610052047.GB3643@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, arvino55@gmail.com
Cc: ravi@jetztechnologies.com, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

My system is 64bit, thus not showing a warning

adding cc to maintainer, and dev list

2011/6/9 Harry Wei <jiaweiwei.xiyou@gmail.com>:
> On Thu, Jun 09, 2011 at 10:37:47AM -0700, Randy Dunlap wrote:
>> On Thu, 9 Jun 2011 11:04:13 +0800 Harry Wei wrote:
>>
>> > - =C2=A0 page =3D (unsigned long) info->eap;
>> > + =C2=A0 page =3D (unsigned long long) info->eap;
>>
>> But page is still unsigned long, not unsigned long long...
> Yup, but if we can define a 'unsigned long long' type?
>>
>> > =C2=A0 =C2=A0 if (info->xeap & 1)
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page |=3D 0x100000000ul;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page |=3D 0x100000000ull;
>>
>> and just making this second change fixes the warning.
> I will try my best. Can anyone give some other comments?
>>
>> I don't know what the right answer is, but this patch does not look
>> complete to me.
> I will try to give a v2.
>>
>> Back in April there was a discussion about this warning message and =
the
>> conclusion was that this driver should be replaced. =C2=A0See
>> https://lkml.org/lkml/2011/4/21/232 and its replies.
>> But we seem to be having problems reaching the EDAC subsystem mainta=
iner
>> (again cc-ed).
> You have not got a exact conclusion about this warning.
> Maybe Arvind knows more about this warning.(cc'ed)
>
>
> Thanks
> Harry Wei
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/
>


older convo for new cc's

On Thu, 9 Jun 2011 11:04:13 +0800 Harry Wei wrote:

> From: Harry Wei <harryxiyou@gmail.com>
>
> When i compile 2.6.39.1, a warning shows like below.
> This patch can fix the warning. And i works well with
> my PC.
>
> [...]
> CC [M]  drivers/edac/e752x_edac.o
> CC [M]  drivers/edac/i82875p_edac.o
> CC [M]  drivers/edac/i82975x_edac.o
> drivers/edac/i82975x_edac.c: In function =EF=BF=BD=EF=BF=BD=EF=BF=BDi=
82975x_process_error_info=EF=BF=BD=EF=BF=BD=EF=BF=BD:
> drivers/edac/i82975x_edac.c:298: warning: integer constant is too lar=
ge for =EF=BF=BD=EF=BF=BD=EF=BF=BDunsigned long=EF=BF=BD=EF=BF=BD=EF=BF=
=BD type
> CC [M]  drivers/edac/i3000_edac.o
> CC [M]  drivers/edac/i3200_edac.o
> CC [M]  drivers/edac/x38_edac.o
> CC [M]  drivers/edac/i82860_edac.o
> [...]
>
>
> Signed-off-by: Harry Wei <harryxiyou@gmail.com>
> Index: prj/drivers/edac/i82975x_edac.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- prj.orig/drivers/edac/i82975x_edac.c      2011-06-04 10:09:55.351=
174516 +0800
> +++ prj/drivers/edac/i82975x_edac.c   2011-06-04 10:10:30.875168437 +=
0800
> @@ -293,9 +293,9 @@
>               info->errsts =3D info->errsts2;
>       }
>
> -     page =3D (unsigned long) info->eap;
> +     page =3D (unsigned long long) info->eap;

But page is still unsigned long, not unsigned long long...

>       if (info->xeap & 1)
> -             page |=3D 0x100000000ul;
> +             page |=3D 0x100000000ull;

and just making this second change fixes the warning.

I don't know what the right answer is, but this patch does not look
complete to me.

Back in April there was a discussion about this warning message and the
conclusion was that this driver should be replaced.  See
https://lkml.org/lkml/2011/4/21/232 and its replies.
But we seem to be having problems reaching the EDAC subsystem maintaine=
r
(again cc-ed).


>       chan =3D page & 1;
>       page >>=3D 1;
>       offst =3D page & ((1 << PAGE_SHIFT) - 1);
> --

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
- Show quoted text -
