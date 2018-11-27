Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181127134010.GG26395@zn.tnic>
Date: Tue, 27 Nov 2018 14:40:10 +0100
To: Ingo Molnar <mingo@kernel.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, John Clemens <clemej@gmail.com>, Yazen Ghannam <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMDI6Mjk6NThQTSArMDEwMCwgSW5nbyBNb2xuYXIgd3Jv
dGU6Cj4gWWVhaCwgYW5kIG5vdGUgdGhhdCBpdCdzIGFsc28gYSBjbGVhciBhbmQgc2VyaW91cyBy
ZWdyZXNzaW9uLCBzbyBldmVuIGlmIAo+IHRoZSBmaXggaXMgbW9yZSBpbnZvbHZlZCB0aGVyZSdz
IGEganVzdGlmaWVkIGNhc2UgZm9yIGZpeGluZyB0aGUgYnVnIGFuZCAKPiBtYXJraW5nIGl0IC1z
dGFibGUgLSBhZmZlY3RlZCBzeXN0ZW1zIGFyZSBjcmFzaGluZyBvdGhlcndpc2UuCgpZZWFoLCBz
byBJIG5lZWQgdG8gaGFtbWVyIG9uIHRoaXMgY3VycmVudCBmaXggYSBiaXQgd2l0aCBhIGhvdHBs
dWcKc2NyaXB0IHRvIG1ha2Ugc3VyZSBDUFUgaG90cGx1ZyBzdGlsbCB3b3JrcyBiZWNhdXNlIHRo
YXQgImZpeGluZyIgaGVyZQpjYW1lIGFmdGVyIHRoZSBob3RwbHVnIHJld3JpdGUuLi4KClN0YXkg
dHVuZWQuCgpUaGUgbW9yZSBpbnZvbHZlZCBmaXhpbmcgd2UnbGwgZG8gbGF0ZXIsIHdoZW4gdGhl
cmUncyB0aW1lLgo=
