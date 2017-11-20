Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86: disable IRQs before changing CR4
From: Andy Lutomirski <luto@kernel.org>
Message-Id: <CALCETrU0xi-TJXMAC7Y8Tsryd_=A-RYF0O7GH7sRaxaJoHp4iQ@mail.gmail.com>
Date: Mon, 20 Nov 2017 06:34:17 -0800
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Nadav Amit <namit@vmware.com>, linux-edac <linux-edac@vger.kernel.org>, kvm list <kvm@vger.kernel.org>, Nadav Amit <nadav.amit@gmail.com>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBOb3YgMjAsIDIwMTcgYXQgMzo1NSBBTSwgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+IE9uIEZyaSwgMTcgTm92IDIwMTcsIE5hZGF2IEFtaXQgd3Jv
dGU6Cj4KPj4gQ1I0IGNoYW5nZXMgbmVlZCB0byBiZSBwZXJmb3JtZWQgd2hpbGUgSVJRcyBhcmUg
ZGlzYWJsZWQgaW4gb3JkZXIgdG8KPj4gdXBkYXRlIHRoZSBDUjQgc2hhZG93IGFuZCB0aGUgYWN0
dWFsIHJlZ2lzdGVyIGF0b21pY2FsbHkuIEFjdHVhbGx5LCB0aGV5Cj4+IGFyZSBuZWVkZWQgcmVn
YXJkbGVzcyBvZiBDUjQgc2hhZG93aW5nLCBzaW5jZSBDUjQgYXJlIHBlcmZvcm1lZCBpbiBhCj4+
IHJlYWQtbW9kaWZ5LXdyaXRlIG1hbm5lci4KPgo+IEkgaGF2ZSBhIGhhcmQgdGltZSB0byBmaWd1
cmUgb3V0IHdoeSB0aGF0IFJNVyBwcm90ZWN0aW9ucyBuZWVkcyB0byBiZQo+IGludGVycnVwdCBk
aXNhYmxlLiBXaGljaCBjYWxsIHNpdGUgaGFwcGVucyB0byBiZSBpbiBpbnRlcnJ1cHQgY29udGV4
dD8KCkl0J3MgdGhlIGZsdXNoX3RsYl9hbGwoKSBzdHVmZi4gIFdlIHVzZSB0aGUgY3I0IGFjY2Vz
c29ycyBpbiB0aGUgSVBJIGhhbmRsZXIuCgo+Cj4gSWYgdGhlcmUgaXMgbm9uZSwgdGhlbiB0aGUg
cHJvcGVyIHByb3RlY3Rpb24gaXMgcHJlZW1wdGlvbiBkaXNhYmxlZCB3aGljaAo+IGNhbiBiZSBk
b25lIHdpdGhvdXQgYWxsIHRoYXQgY2h1cm4uCj4KPiBUaGFua3MsCj4KPiAgICAgICAgIHRnbHgK
LS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNj
cmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZn
ZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwu
b3JnL21ham9yZG9tby1pbmZvLmh0bWwK
