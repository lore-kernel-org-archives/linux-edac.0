Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181129131240.GB3070@nazgul.tnic>
Date: Thu, 29 Nov 2018 14:12:40 +0100
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, John Clemens <clemej@gmail.com>, Yazen Ghannam <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDk6NTI6NDBBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IExvb2tzIGdvb2QgSSB0aGluayEKPiAKPiAyZTZlOTAyZDE4NTAgKCJMaW51eCA0
LjIwLXJjNCIpCj4gKyB4ODYvTUNFL0FNRDogRml4IHRoZSB0aHJlc2hvbGRpbmcgbWFjaGluZXJ5
IGluaXRpYWxpemF0aW9uIG9yZGVyCj4gKyBkaWZmIGZyb20gPDIwMTgxMTI5MDgzNzA4LkdBMjM2
ODZAem4udG5pYz4KCllhcCwgdGhhbmtzLgoKSSdkIG5lZWQgdG8gZG8gc29tZSBtYWNybyBkYW5j
aW5nIGZvciB0aGUgZmluYWwgZml4IHNvIHRoYXQgd2UgZG9uJ3QKYnJlYWsgeGVuLiBXZSdsbCBz
ZWUuLi4KCj4gWyAgICA2LjIxNzg4Ml0gTUNFOiBJbi1rZXJuZWwgTUNFIGRlY29kaW5nIGVuYWJs
ZWQuCgpCdHcsIHlvdSBjb3VsZCBtYWtlIENPTkZJR19FREFDX0RFQ09ERV9NQ0UgYnVpbHRpbiwg
aS5lLiwgPXkgYW5kIGJvb3QKd2l0aCAicmFzPWNlY19kaXNhYmxlIiB0byBzZWUgaWYgdGhvc2Ug
TUNFcyBnZXQgZGVjb2RlZCBwcm9wZXJseS4uLgoKVGh4Lgo=
