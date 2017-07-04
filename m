Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Yang Zhang <yang.zhang.wz@gmail.com>
Message-Id: <22bd985d-739e-0a6e-7b16-9f6e3cd39445@gmail.com>
Date: Tue, 4 Jul 2017 10:19:28 +0800
To: Thomas Gleixner <tglx@linutronix.de>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Wanpeng Li <kernellwp@gmail.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>, tony.luck@intel.com, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, krzk@kernel.org, jpoimboe@redhat.com, Andy Lutomirski <luto@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Garnier <thgarnie@google.com>, Robert Gerst <rgerst@gmail.com>, Mathias Krause <minipli@googlemail.com>, douly.fnst@cn.fujitsu.com, Nicolai Stange <nicstange@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, dvlasenk@redhat.com, Daniel Bristot de Oliveira <bristot@redhat.com>, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, Chen Yu <yu.c.chen@intel.com>, aaron.lu@intel.com, Steven Rostedt <rostedt@goodmis.org>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, Prarit Bhargava <prarit@redhat.com>, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>, fgao@ikuai8.com, ebiederm@xmission.com, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Matt Fleming <matt@codeblueprint.co.uk>, Mel Gorman <mgorman@techsingularity.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm <kvm@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gMjAxNy83LzMgMTg6MDYsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBPbiBNb24sIDMgSnVs
IDIwMTcsIFlhbmcgWmhhbmcgd3JvdGU6Cj4+IFRoZSBiYWNrZ3JvdW5kIGlzIHRoYXQgd2UoQWxp
YmFiYSBDbG91ZCkgZG8gZ2V0IG1vcmUgYW5kIG1vcmUgY29tcGxhaW50cyBmcm9tCj4+IG91ciBj
dXN0b21lcnMgaW4gYm90aCBLVk0gYW5kIFhlbiBjb21wYXJlIHRvIGJhcmUtbWVudGFsLkFmdGVy
IGludmVzdGlnYXRpb25zLAo+PiB0aGUgcm9vdCBjYXVzZSBpcyBrbm93biB0byB1czogYmlnIGNv
c3QgaW4gbWVzc2FnZSBwYXNzaW5nIHdvcmtsb2FkKERhdmlkIHNob3cKPj4gaXQgaW4gS1ZNIGZv
cnVtIDIwMTUpCj4+Cj4+IEEgdHlwaWNhbCBtZXNzYWdlIHdvcmtsb2FkIGxpa2UgYmVsb3c6Cj4+
IHZjcHUgMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmNwdSAxCj4+IDEuIHNlbmQgaXBp
ICAgICAgICAgICAgICAgICAgICAgMi4gIGRvaW5nIGhsdAo+PiAzLiBnbyBpbnRvIGlkbGUgICAg
ICAgICAgICAgICAgIDQuICByZWNlaXZlIGlwaSBhbmQgd2FrZSB1cCBmcm9tIGhsdAo+PiA1LiB3
cml0ZSBBUElDIHRpbWUgdHdpY2UgICAgICAgIDYuICB3cml0ZSBBUElDIHRpbWUgdHdpY2UgdG8K
Pj4gICAgdG8gc3RvcCBzY2hlZCB0aW1lciAgICAgICAgICAgICAgcmVwcm9ncmFtIHNjaGVkIHRp
bWVyCj4+IDcuIGRvaW5nIGhsdCAgICAgICAgICAgICAgICAgICAgOC4gIGhhbmRsZSB0YXNrIGFu
ZCBzZW5kIGlwaSB0bwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2Y3B1
IDAKPj4gOS4gc2FtZSB0byA0LiAgICAgICAgICAgICAgICAgICAxMC4gc2FtZSB0byAzCj4+Cj4+
IE9uZSB0cmFuc2FjdGlvbiB3aWxsIGludHJvZHVjZSBhYm91dCAxMiB2bWV4aXRzKDIgaGx0IGFu
ZCAxMCBtc3Igd3JpdGUpLiBUaGUKPj4gY29zdCBvZiBzdWNoIHZtZXhpdHMgd2lsbCBkZWdyYWRl
cyBwZXJmb3JtYW5jZSBzZXZlcmVseS4gTGludXgga2VybmVsIGFscmVhZHkKPj4gcHJvdmlkZSBp
ZGxlPXBvbGwgdG8gbWl0aWdhdGUgdGhlIHRyZW5kLiBCdXQgaXQgb25seSBlbGltaW5hdGVzIHRo
ZSBJUEkgYW5kCj4+IGhsdCB2bWV4aXQuIEl0IGhhcyBub3RoaW5nIHRvIGRvIHdpdGggc3RhcnQv
c3RvcCBzY2hlZCB0aW1lci4gQSBjb21wcm9taXNlCj4+IHdvdWxkIGJlIHRvIHR1cm4gb2ZmIE5P
SFoga2VybmVsLCBidXQgaXQgaXMgbm90IHRoZSBkZWZhdWx0IGNvbmZpZyBmb3IgbmV3Cj4+IGRp
c3RyaWJ1dGlvbnMuCj4KPiBZb3Ugc3RpbGwgY2FuIHR1cm4gaWYgb2ZmIG9uIHRoZSBrZXJuZWwg
Y29tbWFuZCBsaW5lIHZpYSBub2h6PW9mZgoKWW91IGFyZSByaWdodC4gU2VuaW9yIHVzZXJzIHdp
bGwgdHVybiBvZmYgaXQgbWFudWFsbHkuIEJ1dCBpdCBvbmx5IHNvbHZlIAp0aGUgc2NoZWQgdGlt
ZXIuIFRoZXkgc3RpbGwgaGF2ZSB0aGUgSVBJL2hsdCBwcm9ibGVtLiBBbm90aGVyIHBvaW50IGlz
IAp3ZSByZWxlYXNlIHRoZSBkaXN0cmlidXRpb24gaW1hZ2UgdG8gY3VzdG9tZXIgd2l0aG91dCBh
bnkgZXh0cmEgCmNvbmZpZ3VyYXRpb24gdG8gYXZvaWQgbWlzbWF0Y2ggYmV0d2VlbiBWTSBhbmQg
YmFyZS1tZXRhbC4gVG8gY2hhbmdlIApzdWNoIGNvbmZpZ3VyYXRpb24gbmVlZHMgcmVib290LCBi
dXQgc29tZSBjdXN0b21lcidzIGJ1c2luZXNzIGNhbm5vdCBiZSAKaW50ZXJydXB0ZWQgYWZ0ZXIg
dGhleSBzdGFydCB0aGUgc2VydmljZShsaWtlIG9ubGluZSBnYW1pbmcpLiBJdCB3b3VsZCAKYmUg
YmV0dGVyIGlmIHdlIGNhbiBwcm92aWRlIHRoZSBzeXNjdGwgaW50ZXJmYWNlIHRvIGFsbG93IHJ1
bi10aW1lIAptb2RpZmljYXRpb24uIEJ5IHRoZSB3YXksIGlkbGU9cG9sbCBzZWVtcyB0b28gaGVh
dnkgdG8gdXNlLgoKCgo+Cj4gVGhhbmtzLAo+Cj4gCXRnbHgKPgo=
