Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86: mce: fix type mismatch warning
From: Thomas Gleixner <tglx@linutronix.de>
Message-Id: <alpine.DEB.2.20.1801141249430.2371@nanos>
Date: Sun, 14 Jan 2018 12:52:52 +0100 (CET)
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Yazen Ghannam <yazen.ghannam@amd.com>, Xunlei Pang <xlpang@redhat.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gV2VkLCAxMCBKYW4gMjAxOCwgQXJuZCBCZXJnbWFubiB3cm90ZToKCj4gVGhlIHByaW50ZWQg
c3ltYm9sIGlzIGEgNjQtYml0IGFkZHJlc3MsIHNvIHdlIGdldCBhIHdhcm5pbmcgd2hlbgo+IGJ1
aWxkaW5nIHRoaXMgY29kZSBmb3IgMzItYml0IGtlcm5lbHM6Cj4gCj4gYXJjaC94ODYva2VybmVs
L2NwdS9tY2hlY2svbWNlLmM6IEluIGZ1bmN0aW9uICdfX3ByaW50X21jZSc6Cj4gYXJjaC94ODYv
a2VybmVsL2NwdS9tY2hlY2svbWNlLmM6MjM3OjIxOiBlcnJvcjogY2FzdCB0byBwb2ludGVyIGZy
b20gaW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdlcnJvcj1pbnQtdG8tcG9pbnRlci1jYXN0
XQo+IAo+IFRoaXMgdXNlcyBhbiBleHRyYSB1aW50cHRyX3QgY2FzdCB0byBhdm9pZCB0aGUgd2Fy
bmluZy4KPiAKPiBGaXhlczogN2I2MDYxNjI3ZWI4ICgieDg2OiBkbyBub3QgdXNlIHByaW50X3N5
bWJvbCgpIikKCkkgaGF2ZSBubyBpZGVhIHdoZXJlIHRoaXMgY29tbWl0IGNvbWVzIGZyb20gLi4u
LiBJdCdzIG5laXRoZXIgaW4gTGludXMgdHJlZQpub3IgaW4gdGlwLgoKVGhhbmtzLAoKCXRnbHgK
LS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNj
cmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZn
ZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwu
b3JnL21ham9yZG9tby1pbmZvLmh0bWwK
