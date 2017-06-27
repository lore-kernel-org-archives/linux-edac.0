Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <05ec7efc-fb9c-ae24-5770-66fc472545a4@redhat.com>
Date: Tue, 27 Jun 2017 14:28:17 +0200
To: Wanpeng Li <kernellwp@gmail.com>
Cc: Yang Zhang <yang.zhang.wz@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>, tony.luck@intel.com, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, krzk@kernel.org, jpoimboe@redhat.com, Andy Lutomirski <luto@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Garnier <thgarnie@google.com>, Robert Gerst <rgerst@gmail.com>, Mathias Krause <minipli@googlemail.com>, douly.fnst@cn.fujitsu.com, Nicolai Stange <nicstange@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, dvlasenk@redhat.com, Daniel Bristot de Oliveira <bristot@redhat.com>, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, Chen Yu <yu.c.chen@intel.com>, aaron.lu@intel.com, Steven Rostedt <rostedt@goodmis.org>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, Prarit Bhargava <prarit@redhat.com>, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>, fgao@ikuai8.com, ebiederm@xmission.com, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Matt Fleming <matt@codeblueprint.co.uk>, Mel Gorman <mgorman@techsingularity.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm <kvm@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gMjcvMDYvMjAxNyAxNDoyMywgV2FucGVuZyBMaSB3cm90ZToKPj4+PiBJIGhhdmUgY29uc2lk
ZXJlZCBzaW5nbGVfdGFza19ydW5uaW5nKCkgYmVmb3JlLiBCdXQgc2luY2UgdGhlcmUgaXMgbm8K
Pj4+PiBzdWNoIHBhcmF2aXJ0dWFsIGludGVyZmFjZSBjdXJyZW50bHkgYW5kIGkgYW0gbm90IHN1
cmUgd2hldGhlciBpdCBpcyBhCj4+Pj4gaW5mb3JtYXRpb24gbGVhayBmcm9tIGhvc3QgaWYgaW50
cm9kdWNpbmcgc3VjaCBpbnRlcmZhY2UsIHNvIGkgZGlkbid0IGRvCj4+Pj4gaXQuIERvIHlvdSBt
ZWFuIHZjcHVfaXNfcHJlZW1wdGVkIGNhbiBkbyB0aGUgc2FtZSB0aGluZz8gSSBjaGVjayB0aGUK
Pj4+PiBjb2RlIGFuZCBzZWVtcyBpdCBvbmx5IHRlbGxzIHdoZXRoZXIgdGhlIFZDUFUgaXMgc2No
ZWR1bGVkIG91dCBvciBub3QKPj4+PiB3aGljaCBjYW5ub3Qgc2F0aXNmeSB0aGUgbmVlZHMuCj4+
PiBDYW4geW91IGhlbHAgdG8gYW5zd2VyIG15IGNvbmZ1c2lvbj8gSSBoYXZlIGRvdWJsZSBjaGVj
a2VkIHRoZSBjb2RlLCBidXQKPj4+IHN0aWxsIG5vdCBnZXQgeW91ciBwb2ludC4gRG8geW91IHRo
aW5rIGl0IGlzIG5lY2Vzc2FyeSB0byBpbnRyb2R1Y2UgYW4KPj4+IHBhcmF2aXJ0dWFsIGludGVy
ZmFjZSB0byBleHBvc2Ugc2luZ2xlX3Rhc2tfcnVubmluZygpIHRvIGd1ZXN0Pwo+Cj4gSSB0aGlu
ayB2Y3B1X2lzX3ByZWVtcHRlZCBpcyBhIGdvb2QgZW5vdWdoIHJlcGxhY2VtZW50Lgo+IEZvciBl
eGFtcGxlLCB2Y3B1LT5hcmNoLnN0LnN0ZWFsLnByZWVtcHRlZCBpcyAwIHdoZW4gdGhlIHZDUFUg
aXMgc2NoZWQKPiBpbiBhbmQgdm1lbnRyeSwgdGhlbiBzZXZlcmFsIHRhc2tzIGFyZSBlbnF1ZXVl
ZCBvbiB0aGUgc2FtZSBwQ1BVIGFuZAo+IHdhaXRpbmcgb24gY2ZzIHJlZC1ibGFjayB0cmVlLCB0
aGUgZ3Vlc3Qgc2hvdWxkIGF2b2lkIHRvIHBvbGwgaW4gdGhpcwo+IHNjZW5hcmlvLCBob3dldmVy
LCB2Y3B1X2lzX3ByZWVtcHRlZCByZXR1cm5zIGZhbHNlIGFuZCBndWVzdCBkZWNpZGVzCj4gdG8g
cG9sbC4KCi4uLiB3aGljaCBpcyBub3QgbmVjZXNzYXJpbHkgX3dyb25nXy4gIEl0J3MganVzdCBh
IGRpZmZlcmVudCBoZXVyaXN0aWMuCgpJbiB0aGUgZW5kLCB0aGUgZ3Vlc3QgY291bGQgcnVuIHdp
dGggImlkbGU9cG9sbCIgZXZlbiwgYW5kIHRoZXJlJ3MKbGl0dGxlIHRoZSBob3N0IHNjaGVkdWxl
ciBjYW4gZG8gYWJvdXQgaXQsIGV4Y2VwdCB0cmVhdGluZyBpdCBhcyBhIENQVQpib3VuZCB0YXNr
LgoKUGFvbG8KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5l
ICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFq
b3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdl
ci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
