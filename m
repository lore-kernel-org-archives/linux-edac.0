Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Thomas Gleixner <tglx@linutronix.de>
Message-Id: <alpine.DEB.2.20.1707031205060.2188@nanos>
Date: Mon, 3 Jul 2017 12:06:19 +0200 (CEST)
To: Yang Zhang <yang.zhang.wz@gmail.com>
Cc: =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Wanpeng Li <kernellwp@gmail.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>, tony.luck@intel.com, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, krzk@kernel.org, jpoimboe@redhat.com, Andy Lutomirski <luto@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Garnier <thgarnie@google.com>, Robert Gerst <rgerst@gmail.com>, Mathias Krause <minipli@googlemail.com>, douly.fnst@cn.fujitsu.com, Nicolai Stange <nicstange@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, dvlasenk@redhat.com, Daniel Bristot de Oliveira <bristot@redhat.com>, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, Chen Yu <yu.c.chen@intel.com>, aaron.lu@intel.com, Steven Rostedt <rostedt@goodmis.org>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, Prarit Bhargava <prarit@redhat.com>, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>, fgao@ikuai8.com, ebiederm@xmission.com, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Matt Fleming <matt@codeblueprint.co.uk>, Mel Gorman <mgorman@techsingularity.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm <kvm@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCAzIEp1bCAyMDE3LCBZYW5nIFpoYW5nIHdyb3RlOgo+IFRoZSBiYWNrZ3JvdW5kIGlz
IHRoYXQgd2UoQWxpYmFiYSBDbG91ZCkgZG8gZ2V0IG1vcmUgYW5kIG1vcmUgY29tcGxhaW50cyBm
cm9tCj4gb3VyIGN1c3RvbWVycyBpbiBib3RoIEtWTSBhbmQgWGVuIGNvbXBhcmUgdG8gYmFyZS1t
ZW50YWwuQWZ0ZXIgaW52ZXN0aWdhdGlvbnMsCj4gdGhlIHJvb3QgY2F1c2UgaXMga25vd24gdG8g
dXM6IGJpZyBjb3N0IGluIG1lc3NhZ2UgcGFzc2luZyB3b3JrbG9hZChEYXZpZCBzaG93Cj4gaXQg
aW4gS1ZNIGZvcnVtIDIwMTUpCj4gCj4gQSB0eXBpY2FsIG1lc3NhZ2Ugd29ya2xvYWQgbGlrZSBi
ZWxvdzoKPiB2Y3B1IDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZjcHUgMQo+IDEuIHNl
bmQgaXBpICAgICAgICAgICAgICAgICAgICAgMi4gIGRvaW5nIGhsdAo+IDMuIGdvIGludG8gaWRs
ZSAgICAgICAgICAgICAgICAgNC4gIHJlY2VpdmUgaXBpIGFuZCB3YWtlIHVwIGZyb20gaGx0Cj4g
NS4gd3JpdGUgQVBJQyB0aW1lIHR3aWNlICAgICAgICA2LiAgd3JpdGUgQVBJQyB0aW1lIHR3aWNl
IHRvCj4gICAgdG8gc3RvcCBzY2hlZCB0aW1lciAgICAgICAgICAgICAgcmVwcm9ncmFtIHNjaGVk
IHRpbWVyCj4gNy4gZG9pbmcgaGx0ICAgICAgICAgICAgICAgICAgICA4LiAgaGFuZGxlIHRhc2sg
YW5kIHNlbmQgaXBpIHRvCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmNw
dSAwCj4gOS4gc2FtZSB0byA0LiAgICAgICAgICAgICAgICAgICAxMC4gc2FtZSB0byAzCj4gCj4g
T25lIHRyYW5zYWN0aW9uIHdpbGwgaW50cm9kdWNlIGFib3V0IDEyIHZtZXhpdHMoMiBobHQgYW5k
IDEwIG1zciB3cml0ZSkuIFRoZQo+IGNvc3Qgb2Ygc3VjaCB2bWV4aXRzIHdpbGwgZGVncmFkZXMg
cGVyZm9ybWFuY2Ugc2V2ZXJlbHkuIExpbnV4IGtlcm5lbCBhbHJlYWR5Cj4gcHJvdmlkZSBpZGxl
PXBvbGwgdG8gbWl0aWdhdGUgdGhlIHRyZW5kLiBCdXQgaXQgb25seSBlbGltaW5hdGVzIHRoZSBJ
UEkgYW5kCj4gaGx0IHZtZXhpdC4gSXQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBzdGFydC9zdG9w
IHNjaGVkIHRpbWVyLiBBIGNvbXByb21pc2UKPiB3b3VsZCBiZSB0byB0dXJuIG9mZiBOT0haIGtl
cm5lbCwgYnV0IGl0IGlzIG5vdCB0aGUgZGVmYXVsdCBjb25maWcgZm9yIG5ldwo+IGRpc3RyaWJ1
dGlvbnMuCgpZb3Ugc3RpbGwgY2FuIHR1cm4gaWYgb2ZmIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBs
aW5lIHZpYSBub2h6PW9mZgoKVGhhbmtzLAoKCXRnbHgKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20g
dGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUg
Ym9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9y
ZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
