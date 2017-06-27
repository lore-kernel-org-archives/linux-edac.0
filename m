Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: =?utf-8?b?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Message-Id: <20170627134043.GA1487@potion>
Date: Tue, 27 Jun 2017 15:40:44 +0200
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Wanpeng Li <kernellwp@gmail.com>, Yang Zhang <yang.zhang.wz@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>, tony.luck@intel.com, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, krzk@kernel.org, jpoimboe@redhat.com, Andy Lutomirski <luto@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Garnier <thgarnie@google.com>, Robert Gerst <rgerst@gmail.com>, Mathias Krause <minipli@googlemail.com>, douly.fnst@cn.fujitsu.com, Nicolai Stange <nicstange@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, dvlasenk@redhat.com, Daniel Bristot de Oliveira <bristot@redhat.com>, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, Chen Yu <yu.c.chen@intel.com>, aaron.lu@intel.com, Steven Rostedt <rostedt@goodmis.org>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, Prarit Bhargava <prarit@redhat.com>, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>, fgao@ikuai8.com, ebiederm@xmission.com, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Matt Fleming <matt@codeblueprint.co.uk>, Mel Gorman <mgorman@techsingularity.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm <kvm@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

MjAxNy0wNi0yNyAxNDoyOCswMjAwLCBQYW9sbyBCb256aW5pOgo+IE9uIDI3LzA2LzIwMTcgMTQ6
MjMsIFdhbnBlbmcgTGkgd3JvdGU6Cj4+Pj4+IEkgaGF2ZSBjb25zaWRlcmVkIHNpbmdsZV90YXNr
X3J1bm5pbmcoKSBiZWZvcmUuIEJ1dCBzaW5jZSB0aGVyZSBpcyBubwo+Pj4+PiBzdWNoIHBhcmF2
aXJ0dWFsIGludGVyZmFjZSBjdXJyZW50bHkgYW5kIGkgYW0gbm90IHN1cmUgd2hldGhlciBpdCBp
cyBhCj4+Pj4+IGluZm9ybWF0aW9uIGxlYWsgZnJvbSBob3N0IGlmIGludHJvZHVjaW5nIHN1Y2gg
aW50ZXJmYWNlLCBzbyBpIGRpZG4ndCBkbwo+Pj4+PiBpdC4gRG8geW91IG1lYW4gdmNwdV9pc19w
cmVlbXB0ZWQgY2FuIGRvIHRoZSBzYW1lIHRoaW5nPyBJIGNoZWNrIHRoZQo+Pj4+PiBjb2RlIGFu
ZCBzZWVtcyBpdCBvbmx5IHRlbGxzIHdoZXRoZXIgdGhlIFZDUFUgaXMgc2NoZWR1bGVkIG91dCBv
ciBub3QKPj4+Pj4gd2hpY2ggY2Fubm90IHNhdGlzZnkgdGhlIG5lZWRzLgo+Pj4+IENhbiB5b3Ug
aGVscCB0byBhbnN3ZXIgbXkgY29uZnVzaW9uPyBJIGhhdmUgZG91YmxlIGNoZWNrZWQgdGhlIGNv
ZGUsIGJ1dAo+Pj4+IHN0aWxsIG5vdCBnZXQgeW91ciBwb2ludC4gRG8geW91IHRoaW5rIGl0IGlz
IG5lY2Vzc2FyeSB0byBpbnRyb2R1Y2UgYW4KPj4+PiBwYXJhdmlydHVhbCBpbnRlcmZhY2UgdG8g
ZXhwb3NlIHNpbmdsZV90YXNrX3J1bm5pbmcoKSB0byBndWVzdD8KPj4KPj4gSSB0aGluayB2Y3B1
X2lzX3ByZWVtcHRlZCBpcyBhIGdvb2QgZW5vdWdoIHJlcGxhY2VtZW50Lgo+PiBGb3IgZXhhbXBs
ZSwgdmNwdS0+YXJjaC5zdC5zdGVhbC5wcmVlbXB0ZWQgaXMgMCB3aGVuIHRoZSB2Q1BVIGlzIHNj
aGVkCj4+IGluIGFuZCB2bWVudHJ5LCB0aGVuIHNldmVyYWwgdGFza3MgYXJlIGVucXVldWVkIG9u
IHRoZSBzYW1lIHBDUFUgYW5kCj4+IHdhaXRpbmcgb24gY2ZzIHJlZC1ibGFjayB0cmVlLCB0aGUg
Z3Vlc3Qgc2hvdWxkIGF2b2lkIHRvIHBvbGwgaW4gdGhpcwo+PiBzY2VuYXJpbywgaG93ZXZlciwg
dmNwdV9pc19wcmVlbXB0ZWQgcmV0dXJucyBmYWxzZSBhbmQgZ3Vlc3QgZGVjaWRlcwo+PiB0byBw
b2xsLgo+IAo+IC4uLiB3aGljaCBpcyBub3QgbmVjZXNzYXJpbHkgX3dyb25nXy4gIEl0J3MganVz
dCBhIGRpZmZlcmVudCBoZXVyaXN0aWMuCgpSaWdodCwgaXQncyBqdXN0IGhhcmRlciB0byB1c2Ug
dGhhbiBob3N0J3Mgc2luZ2xlX3Rhc2tfcnVubmluZygpIC0tIHRoZQpWQ1BVIGNhbGxpbmcgdmNw
dV9pc19wcmVlbXB0ZWQoKSBpcyBuZXZlciBwcmVlbXB0ZWQsIHNvIHdlIGhhdmUgdG8gbG9vawph
dCBvdGhlciBWQ1BVcyB0aGF0IGFyZSBub3QgaGFsdGVkLCBidXQgc3RpbGwgcHJlZW1wdGVkLgoK
SWYgd2Ugc2VlIHNvbWUgcmF0aW8gb2YgcHJlZW1wdGVkIFZDUFVzICg+IDA/KSwgdGhlbiB3ZSBz
dG9wIHBvbGxpbmcgYW5kCnlpZWxkIHRvIHRoZSBob3N0LiAgV29ya2luZyB1bmRlciB0aGUgYXNz
dW1wdGlvbiB0aGF0IHRoZXJlIGlzIHdvcmsgZm9yCnRoaXMgUENQVSBpZiBvdGhlciBWQ1BVcyBo
YXZlIHN0dWZmIHRvIGRvLiAgVGhlIGRvd25zaWRlIGlzIHRoYXQgaXQKbWlzc2VzIGluZm9ybWF0
aW9uIGFib3V0IGhvc3QncyB0b3BvbG9neSwgc28gaXQgd291bGQgYmUgaGFyZCB0byBtYWtlIGl0
Cndvcmsgd2VsbC4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBs
aW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8g
bWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8v
dmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
