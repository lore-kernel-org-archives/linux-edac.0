Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86: disable IRQs before changing CR4
From: Thomas Gleixner <tglx@linutronix.de>
Message-Id: <alpine.DEB.2.20.1711201904590.1734@nanos>
Date: Mon, 20 Nov 2017 19:05:54 +0100 (CET)
To: Andy Lutomirski <luto@kernel.org>
Cc: Nadav Amit <namit@vmware.com>, linux-edac <linux-edac@vger.kernel.org>, kvm list <kvm@vger.kernel.org>, Nadav Amit <nadav.amit@gmail.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, lkml@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gTW9uLCAyMCBOb3YgMjAxNywgQW5keSBMdXRvbWlyc2tpIHdyb3RlOgoKPiBPbiBNb24sIE5v
diAyMCwgMjAxNyBhdCAzOjU1IEFNLCBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT4gd3JvdGU6Cj4gPiBPbiBGcmksIDE3IE5vdiAyMDE3LCBOYWRhdiBBbWl0IHdyb3RlOgo+ID4K
PiA+PiBDUjQgY2hhbmdlcyBuZWVkIHRvIGJlIHBlcmZvcm1lZCB3aGlsZSBJUlFzIGFyZSBkaXNh
YmxlZCBpbiBvcmRlciB0bwo+ID4+IHVwZGF0ZSB0aGUgQ1I0IHNoYWRvdyBhbmQgdGhlIGFjdHVh
bCByZWdpc3RlciBhdG9taWNhbGx5LiBBY3R1YWxseSwgdGhleQo+ID4+IGFyZSBuZWVkZWQgcmVn
YXJkbGVzcyBvZiBDUjQgc2hhZG93aW5nLCBzaW5jZSBDUjQgYXJlIHBlcmZvcm1lZCBpbiBhCj4g
Pj4gcmVhZC1tb2RpZnktd3JpdGUgbWFubmVyLgo+ID4KPiA+IEkgaGF2ZSBhIGhhcmQgdGltZSB0
byBmaWd1cmUgb3V0IHdoeSB0aGF0IFJNVyBwcm90ZWN0aW9ucyBuZWVkcyB0byBiZQo+ID4gaW50
ZXJydXB0IGRpc2FibGUuIFdoaWNoIGNhbGwgc2l0ZSBoYXBwZW5zIHRvIGJlIGluIGludGVycnVw
dCBjb250ZXh0Pwo+IAo+IEl0J3MgdGhlIGZsdXNoX3RsYl9hbGwoKSBzdHVmZi4gIFdlIHVzZSB0
aGUgY3I0IGFjY2Vzc29ycyBpbiB0aGUgSVBJIGhhbmRsZXIuCgpGYWlyIGVub3VnaC4gVGhlbiB0
aGlzIHdhbnRzIHRvIGJlIHNwZWxsZWQgb3V0IGluIHRoZSBjaGFuZ2UgbG9nLgoKVGhhbmtzLAoK
CXRnbHgKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1
bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jk
b21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5r
ZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
