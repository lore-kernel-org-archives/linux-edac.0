Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181127162958.GM26395@zn.tnic>
Date: Tue, 27 Nov 2018 17:29:59 +0100
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, John Clemens <clemej@gmail.com>, Tony Luck <tony.luck@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMDM6MDI6MDVQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gUmlnaHQsIEkgdGhpbmsgd2UgbWF5IHdhbnQgdG8gYnJpbmcgYmFjayB0aGUgc2Vw
YXJhdGUgZGVjb2RlciByaW5nL3F1ZXVlIHRoYXQKPiB3ZSB1c2VkIHRvIGhhdmUuIERvIHlvdSB0
aGluayB0aGF0IHdvdWxkIGJlIG9rYXksIG9yIGlzIHRoZXJlIGFub3RoZXIgbWV0aG9kCj4gdGhh
dCB3b3VsZCBiZSBiZXR0ZXI/CgpUaGUgcHJvYmxlbSB3aXRoIGVhcmx5IE1DRXMgaXMgdGhhdCBz
dHVmZiBpcyBzaW1wbHkgbm90IHJlYWR5IHRvIGxvYWQKYW55IGRlY29kaW5nIG1vZHVsZXMgeWV0
LgoKU28gZWl0aGVyIHdlIGNvdWxkIGRvIGEgdXNlcnNwYWNlIHRvb2wgdG8gZG8gdGhlIGRlY29k
aW5nIG9yIHdlIGNhbgpzaW1wbHkgcmV1c2UgdGhlIG1jZV9hbWQuYyBjb2RlIGFuZCAqZWNobyog
dGhlIGVycm9yIHN0YW56YSBmcm9tCnVzZXJzcGFjZSBhbmQgaXQnbGwgZHVtcCB0aGUgZGVjb2Rl
ZCBpbmZvLiBUaGlzIGRvbmUgb24gdGhlIHNhbWUKbWFjaGluZS4KCkFuZCAqYWN0dWFsbHkqLCB3
ZSBhbHJlYWR5IGhhdmUgYWxsIHRoZSBjb2RlIGluIG1jZS1pbmplY3QuYyAtIHNvCmRlY29kaW5n
IHdvdWxkIHNpbXBseSBiZSBhbiBNQ0UgaW5qZWN0aW9uIHdpdGggdHlwZSBTV19JTkouIEknbSBs
b29raW5nCmF0IGRvX2luamVjdCgpOgoKICAgICAgICBpZiAoaW5qX3R5cGUgPT0gU1dfSU5KKSB7
CiAgICAgICAgICAgICAgICBtY2VfaW5qZWN0X2xvZygmaV9tY2UpOwogICAgICAgICAgICAgICAg
cmV0dXJuOwogICAgICAgIH0KCkhhIQoKVGhhdCdzIHNvbyBjb29sIGFuZCBmb3IgbGF6eSBwZW9w
bGUgbGlrZSBtZSA6LSkK
