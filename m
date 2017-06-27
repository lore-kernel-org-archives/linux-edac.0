Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <2771f905-d1b0-b118-9ae9-db5fb87f877c@redhat.com>
Date: Tue, 27 Jun 2017 15:56:35 +0200
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: Wanpeng Li <kernellwp@gmail.com>, Yang Zhang <yang.zhang.wz@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>, tony.luck@intel.com, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, krzk@kernel.org, jpoimboe@redhat.com, Andy Lutomirski <luto@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Garnier <thgarnie@google.com>, Robert Gerst <rgerst@gmail.com>, Mathias Krause <minipli@googlemail.com>, douly.fnst@cn.fujitsu.com, Nicolai Stange <nicstange@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, dvlasenk@redhat.com, Daniel Bristot de Oliveira <bristot@redhat.com>, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, Chen Yu <yu.c.chen@intel.com>, aaron.lu@intel.com, Steven Rostedt <rostedt@goodmis.org>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, Prarit Bhargava <prarit@redhat.com>, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>, fgao@ikuai8.com, ebiederm@xmission.com, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Matt Fleming <matt@codeblueprint.co.uk>, Mel Gorman <mgorman@techsingularity.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm <kvm@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gMjcvMDYvMjAxNyAxNTo0MCwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+PiAuLi4gd2hpY2gg
aXMgbm90IG5lY2Vzc2FyaWx5IF93cm9uZ18uICBJdCdzIGp1c3QgYSBkaWZmZXJlbnQgaGV1cmlz
dGljLgo+IFJpZ2h0LCBpdCdzIGp1c3QgaGFyZGVyIHRvIHVzZSB0aGFuIGhvc3QncyBzaW5nbGVf
dGFza19ydW5uaW5nKCkgLS0gdGhlCj4gVkNQVSBjYWxsaW5nIHZjcHVfaXNfcHJlZW1wdGVkKCkg
aXMgbmV2ZXIgcHJlZW1wdGVkLCBzbyB3ZSBoYXZlIHRvIGxvb2sKPiBhdCBvdGhlciBWQ1BVcyB0
aGF0IGFyZSBub3QgaGFsdGVkLCBidXQgc3RpbGwgcHJlZW1wdGVkLgo+IAo+IElmIHdlIHNlZSBz
b21lIHJhdGlvIG9mIHByZWVtcHRlZCBWQ1BVcyAoPiAwPyksIHRoZW4gd2Ugc3RvcCBwb2xsaW5n
IGFuZAo+IHlpZWxkIHRvIHRoZSBob3N0LiAgV29ya2luZyB1bmRlciB0aGUgYXNzdW1wdGlvbiB0
aGF0IHRoZXJlIGlzIHdvcmsgZm9yCj4gdGhpcyBQQ1BVIGlmIG90aGVyIFZDUFVzIGhhdmUgc3R1
ZmYgdG8gZG8uICBUaGUgZG93bnNpZGUgaXMgdGhhdCBpdAo+IG1pc3NlcyBpbmZvcm1hdGlvbiBh
Ym91dCBob3N0J3MgdG9wb2xvZ3ksIHNvIGl0IHdvdWxkIGJlIGhhcmQgdG8gbWFrZSBpdAo+IHdv
cmsgd2VsbC4KCkkgd291bGQganVzdCB1c2UgdmNwdV9pc19wcmVlbXB0ZWQgb24gdGhlIGN1cnJl
bnQgQ1BVLiAgRnJvbSBndWVzdCBQT1YKdGhpcyBvcHRpb24gaXMgcmVhbGx5IGEgImYqKiogZXZl
cnlvbmUgZWxzZSIgc2V0dGluZyBqdXN0IGxpa2UKaWRsZT1wb2xsLCBvbmx5IGEgbGl0dGxlIG1v
cmUgcG9saXRlLgoKSWYgd2UndmUgYmVlbiBwcmVlbXB0ZWQgYW5kIHdlIHdlcmUgcG9sbGluZywg
dGhlcmUgYXJlIHR3byBjYXNlcy4gIElmIGFuCmludGVycnVwdCB3YXMgcXVldWVkIHdoaWxlIHRo
ZSBndWVzdCB3YXMgcHJlZW1wdGVkLCB0aGUgcG9sbCB3aWxsIGJlCnRyZWF0ZWQgYXMgc3VjY2Vz
c2Z1bCBhbnl3YXkuICBJZiBpdCBoYXNuJ3QsIGxldCBvdGhlcnMgcnVuLS0tYnV0IHJlYWxseQp0
aGF0J3Mgbm90IGJlY2F1c2UgdGhlIGd1ZXN0IHdhbnRzIHRvIGJlIHBvbGl0ZSwgaXQncyB0byBh
dm9pZCB0aGF0IHRoZQpzY2hlZHVsZXIgcGVuYWxpemVzIGl0IGV4Y2Vzc2l2ZWx5LgoKU28gdW50
aWwgaXQncyBwcmVlbXB0ZWQsIEkgdGhpbmsgaXQncyBva2F5IGlmIHRoZSBndWVzdCBkb2Vzbid0
IGNhcmUKYWJvdXQgb3RoZXJzLiAgWW91IHdvdWxkbid0IHVzZSB0aGlzIG9wdGlvbiBhbnl3YXkg
aW4gb3ZlcmNvbW1pdHRlZApzaXR1YXRpb25zLgoKKEknbSBzdGlsbCBub3QgdmVyeSBjb252aW5j
ZWQgYWJvdXQgdGhlIGlkZWEpLgoKUGFvbG8KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBs
aXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBv
ZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBp
bmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
