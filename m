From: Nils Carlson <nils.carlson@ludd.ltu.se>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Mon, 14 Jun 2010 23:02:00 +0200
Message-ID: <003C04A4-26AC-4331-A80E-EDC112A6C73C@ludd.ltu.se>
References: <987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	<20100518222832.GJ22675@basil.fritz.box>
	<m1wrv0zo9q.fsf@fess.ebiederm.org>
	<20100519064619.GA30320@aftab> <20100519070919.GA9618@elte.hu>
	<50689ECC-A371-4923-BEBE-1A5A7E5B9D3B@ludd.ltu.se>
	<20100614114906.GG17092@basil.fritz.box>
	<9D5E19B6-5313-43B4-9C3D-493C8C226E8D@ludd.ltu.se>
	<20100614202109.GD369@basil.fritz.box>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="===============8461664109843230837=="
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100614202109.GD369@basil.fritz.box>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Andi Kleen <andi@firstfloor.org>
Cc: Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, "Luck,
	Tony" <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young,
	Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@amd64.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, Matt Domsch <Matt_Domsch@dell.com>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org


--===============8461664109843230837==
Content-Type: multipart/alternative; boundary=Apple-Mail-2--258106017


--Apple-Mail-2--258106017
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

On Jun 14, 2010, at 10:21 PM, Andi Kleen wrote:

> On Mon, Jun 14, 2010 at 09:47:33PM +0200, Nils Carlson wrote:
>>> Also the biggest problem is still that EDAC doesn't
>>> give you any silk screen labels, so unless you
>>> have motherboard schemantics the layout it presents
>>> is fairly useless -- you still don't know which DIMM
>>> to exchange. So in theory EDAC looks great, but in practice ...
>>>
>> I do have motherboard schematics, or rather, we build our own
>> boards. But the point is valid, a lot of people don't make their own
>
> Just supply correct DMI tables then?

Will ask the BIOS team what they're currently doing...
Unfortunately most of them have a windows world view,
and I know nothing of what windows does.
>
>>
>> This is true, and this is the way things are going on
>> our end as well. I guess that would mean
>> So you wouldn't go to the EDAC sysfs directory
>> to find everything to do with the same piece of hardware
>> anymore, but would have to go the n different
>> directories looking for all the pieces? I don't really
>> like that...
>
> Let me try to understand that.
>
> You want to inject errors on a random computer you don't
> know anything about? Do you do that frequently? Why
> are you doing this?

Didn't I mention above that we make our own boards?
>
>> There is a use-case. A lot has to do with how different patrol
>> scrub rates work, some just go through memory at a constant
>> speed (MB/s), others vary according to load. The thing is,
>> different applications want their memory scrubbed within
>> different time frames, and as the amount of memory on boards
>
> What's the theory behind varying scrub rates?
> I would be interested in more details.

Don't know what sort of theory you're looking for... Think you'd have
to contact Intel and AMD and ask. My guess is that they vary so that
scrubbing doesn't interfere with memory usage, that is, higher load
leads to slower scrubbing. We measure it as best we can under
different loads.

>
>> Patrol scrubbing is normally used because it discovers errors
>> faster in seldom accessed memory allowing a DIMM with
>> too many errors to be replaced faster. Some applications
>
> Yes, but why do you want to vary the rate?
> Normally it should just depend on memory size and expected
> error rate (that is the more memory the faster you scrub)

Because different applications have decided on different time
maximum times for scrubbing the memory. Why do applications
decide on different times? I don't know... But the telecoms business
is all about trade-offs and guaranteeing minimal down-time, so
normally it's a combination of system capacity weighted against
who knows what. If you're really interested I can ask some people,
I mostly provide hooks, no policy.

>
>> like to use demand scrubbing as well, and some consider
>> it to increase memory latency too much.
>
> That sounds odd -- if you have so many errors that you worry
> about that you have other problems definitely?
> Is this based on some benchmarking?
>
Demand scrubbing does increase memory latency, see for example
http://www.intel.com/products/server/chipsets/5100-memory-controller-hub/5100-memory-controller-hub-overview.htm

And other problems, well, yes. Our systems run in an embedded  
environment
where sending a service technician to replace a DIMM is very expensive.
So the faster errors are detected the better.

/Nils
--Apple-Mail-2--258106017
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><div><div>On Jun 14, 2010, at =
10:21 PM, Andi Kleen wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div>On =
Mon, Jun 14, 2010 at 09:47:33PM +0200, Nils Carlson =
wrote:<br><blockquote type=3D"cite"><blockquote type=3D"cite">Also the =
biggest problem is still that EDAC =
doesn't<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite">give you any silk screen labels, so unless =
you<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">have motherboard schemantics the layout it =
presents<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">is fairly useless -- you still =
don't know which DIMM<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">to exchange. So in theory EDAC =
looks great, but in practice =
...<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote type=3D"cite">I =
do have motherboard schematics, or rather, we build our =
own<br></blockquote><blockquote type=3D"cite">boards. But the point is =
valid, a lot of people don't make their own<br></blockquote><br>Just =
supply correct DMI tables =
then?<br></div></blockquote><div><br></div><div>Will ask the BIOS team =
what they're currently doing...</div><div>Unfortunately most of them =
have a windows world view,</div><div>and I know nothing of what windows =
does.</div><blockquote type=3D"cite"><div><font class=3D"Apple-style-span"=
 color=3D"#000000"><br></font><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">This is true, =
and this is the way things are going on<br></blockquote><blockquote =
type=3D"cite">our end as well. I guess that would =
mean<br></blockquote><blockquote type=3D"cite">So you wouldn't go to the =
EDAC sysfs directory<br></blockquote><blockquote type=3D"cite">to find =
everything to do with the same piece of =
hardware<br></blockquote><blockquote type=3D"cite">anymore, but would =
have to go the n different<br></blockquote><blockquote =
type=3D"cite">directories looking for all the pieces? I don't =
really<br></blockquote><blockquote type=3D"cite">like =
that...<br></blockquote><br>Let me try to understand that.<br><br>You =
want to inject errors on a random computer you don't<br>know anything =
about? Do you do that frequently? Why<br>are you doing this? =
<br></div></blockquote><div><br></div>Didn't I mention above that we =
make our own boards?<br><blockquote type=3D"cite"><div><br><blockquote =
type=3D"cite">There is a use-case. A lot has to do with how different =
patrol<br></blockquote><blockquote type=3D"cite">scrub rates work, some =
just go through memory at a constant<br></blockquote><blockquote =
type=3D"cite">speed (MB/s), others vary according to load. The thing =
is,<br></blockquote><blockquote type=3D"cite">different applications =
want their memory scrubbed within<br></blockquote><blockquote =
type=3D"cite">different time frames, and as the amount of memory on =
boards<br></blockquote><br>What's the theory behind varying scrub rates? =
<br>I would be interested in more =
details.<br></div></blockquote><div><br></div><div>Don't know what sort =
of theory you're looking for... Think you'd have</div><div>to contact =
Intel and AMD and ask. My guess is that they vary so =
that</div><div>scrubbing doesn't interfere with memory usage, that is, =
higher load</div><div>leads to slower scrubbing. We measure it as best =
we can under</div><div>different loads.</div><br><blockquote =
type=3D"cite"><div><br><blockquote type=3D"cite">Patrol scrubbing is =
normally used because it discovers errors<br></blockquote><blockquote =
type=3D"cite">faster in seldom accessed memory allowing a DIMM =
with<br></blockquote><blockquote type=3D"cite">too many errors to be =
replaced faster. Some applications<br></blockquote><br>Yes, but why do =
you want to vary the rate?<br>Normally it should just depend on memory =
size and expected<br>error rate (that is the more memory the faster you =
scrub) <br></div></blockquote><div><br></div><div>Because different =
applications have decided on different time</div><div>maximum times for =
scrubbing the memory. Why do applications</div><div>decide on different =
times? I don't know... But the telecoms business</div><div>is all about =
trade-offs and guaranteeing minimal down-time, so</div><div>normally =
it's a combination of system capacity weighted against</div><div>who =
knows what. If you're really interested I can ask some =
people,</div><div>I mostly provide hooks, no =
policy.</div><br><blockquote type=3D"cite"><div><br><blockquote =
type=3D"cite">like to use demand scrubbing as well, and some =
consider<br></blockquote><blockquote type=3D"cite">it to increase memory =
latency too much.<br></blockquote><br>That sounds odd -- if you have so =
many errors that you worry<br>about that you have other problems =
definitely? <br>Is this based on some =
benchmarking?<br><br></div></blockquote><div>Demand scrubbing does =
increase memory latency, see for example</div><div><a =
href=3D"http://www.intel.com/products/server/chipsets/5100-memory-controll=
er-hub/5100-memory-controller-hub-overview.htm">http://www.intel.com/produ=
cts/server/chipsets/5100-memory-controller-hub/5100-memory-controller-hub-=
overview.htm</a></div><div><br></div><div>And other problems, well, yes. =
Our systems run in an embedded environment</div><div>where sending a =
service technician to replace a DIMM is very expensive.</div><div>So the =
faster errors are detected the =
better.</div><div><br></div><div>/Nils</div></div></body></html>=

--Apple-Mail-2--258106017--


--===============8461664109843230837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
ThinkGeek and WIRED's GeekDad team up for the Ultimate 
GeekDad Father's Day Giveaway. ONE MASSIVE PRIZE to the 
lucky parental unit.  See the prize list and enter to win: 
http://p.sf.net/sfu/thinkgeek-promo
--===============8461664109843230837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
bluesmoke-devel mailing list
bluesmoke-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel

--===============8461664109843230837==--
