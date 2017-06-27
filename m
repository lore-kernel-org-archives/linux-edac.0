Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Wanpeng Li <kernellwp@gmail.com>
Message-Id: <CANRm+Cyd4ycNdDN8=M66re5RhnrJF=3HPiPuJeMAUgLRb1qBcg@mail.gmail.com>
Date: Tue, 27 Jun 2017 20:23:27 +0800
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Yang Zhang <yang.zhang.wz@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>, tony.luck@intel.com, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, krzk@kernel.org, jpoimboe@redhat.com, Andy Lutomirski <luto@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Garnier <thgarnie@google.com>, Robert Gerst <rgerst@gmail.com>, Mathias Krause <minipli@googlemail.com>, douly.fnst@cn.fujitsu.com, Nicolai Stange <nicstange@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, dvlasenk@redhat.com, Daniel Bristot de Oliveira <bristot@redhat.com>, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, Chen Yu <yu.c.chen@intel.com>, aaron.lu@intel.com, Steven Rostedt <rostedt@goodmis.org>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, Prarit Bhargava <prarit@redhat.com>, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>, fgao@ikuai8.com, ebiederm@xmission.com, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Matt Fleming <matt@codeblueprint.co.uk>, Mel Gorman <mgorman@techsingularity.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm <kvm@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

MjAxNy0wNi0yNyAyMDowNyBHTVQrMDg6MDAgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT46Cj4KPgo+IE9uIDI3LzA2LzIwMTcgMTM6MjIsIFlhbmcgWmhhbmcgd3JvdGU6Cj4+Pj4K
Pj4+PiBSZWdhcmRpbmcgdGhlIGdvb2QvYmFkIGlkZWEgcGFydCwgS1ZNJ3MgcG9sbGluZyBpcyBt
YWRlIG11Y2ggbW9yZQo+Pj4+IGFjY2VwdGFibGUgYnkgc2luZ2xlX3Rhc2tfcnVubmluZygpLiAg
QXQgbGVhc3QgeW91IG5lZWQgdG8gaW50ZWdyYXRlIGl0Cj4+Pj4gd2l0aCBwYXJhdmlydHVhbGl6
YXRpb24uICBJZiB0aGUgVk0gaXMgc2NoZWR1bGVkIG91dCwgeW91IHNocmluayB0aGUKPj4+PiBw
b2xsaW5nIHBlcmlvZC4gIFRoZXJlIGlzIGFscmVhZHkgdmNwdV9pc19wcmVlbXB0ZWQgZm9yIHRo
aXMsIGl0IGlzIHVzZWQKPj4+PiBieSBtdXRleGVzLgo+Pj4KPj4+IEkgaGF2ZSBjb25zaWRlcmVk
IHNpbmdsZV90YXNrX3J1bm5pbmcoKSBiZWZvcmUuIEJ1dCBzaW5jZSB0aGVyZSBpcyBubwo+Pj4g
c3VjaCBwYXJhdmlydHVhbCBpbnRlcmZhY2UgY3VycmVudGx5IGFuZCBpIGFtIG5vdCBzdXJlIHdo
ZXRoZXIgaXQgaXMgYQo+Pj4gaW5mb3JtYXRpb24gbGVhayBmcm9tIGhvc3QgaWYgaW50cm9kdWNp
bmcgc3VjaCBpbnRlcmZhY2UsIHNvIGkgZGlkbid0IGRvCj4+PiBpdC4gRG8geW91IG1lYW4gdmNw
dV9pc19wcmVlbXB0ZWQgY2FuIGRvIHRoZSBzYW1lIHRoaW5nPyBJIGNoZWNrIHRoZQo+Pj4gY29k
ZSBhbmQgc2VlbXMgaXQgb25seSB0ZWxscyB3aGV0aGVyIHRoZSBWQ1BVIGlzIHNjaGVkdWxlZCBv
dXQgb3Igbm90Cj4+PiB3aGljaCBjYW5ub3Qgc2F0aXNmeSB0aGUgbmVlZHMuCj4+Cj4+IENhbiB5
b3UgaGVscCB0byBhbnN3ZXIgbXkgY29uZnVzaW9uPyBJIGhhdmUgZG91YmxlIGNoZWNrZWQgdGhl
IGNvZGUsIGJ1dAo+PiBzdGlsbCBub3QgZ2V0IHlvdXIgcG9pbnQuIERvIHlvdSB0aGluayBpdCBp
cyBuZWNlc3NhcnkgdG8gaW50cm9kdWNlIGFuCj4+IHBhcmF2aXJ0dWFsIGludGVyZmFjZSB0byBl
eHBvc2Ugc2luZ2xlX3Rhc2tfcnVubmluZygpIHRvIGd1ZXN0Pwo+Cj4gSSB0aGluayB2Y3B1X2lz
X3ByZWVtcHRlZCBpcyBhIGdvb2QgZW5vdWdoIHJlcGxhY2VtZW50LgoKRm9yIGV4YW1wbGUsIHZj
cHUtPmFyY2guc3Quc3RlYWwucHJlZW1wdGVkIGlzIDAgd2hlbiB0aGUgdkNQVSBpcyBzY2hlZApp
biBhbmQgdm1lbnRyeSwgdGhlbiBzZXZlcmFsIHRhc2tzIGFyZSBlbnF1ZXVlZCBvbiB0aGUgc2Ft
ZSBwQ1BVIGFuZAp3YWl0aW5nIG9uIGNmcyByZWQtYmxhY2sgdHJlZSwgdGhlIGd1ZXN0IHNob3Vs
ZCBhdm9pZCB0byBwb2xsIGluIHRoaXMKc2NlbmFyaW8sIGhvd2V2ZXIsIHZjcHVfaXNfcHJlZW1w
dGVkIHJldHVybnMgZmFsc2UgYW5kIGd1ZXN0IGRlY2lkZXMKdG8gcG9sbC4KClJlZ2FyZHMsCldh
bnBlbmcgTGkKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5l
ICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFq
b3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdl
ci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
