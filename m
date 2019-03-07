Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190307145335.GC26566@zn.tnic>
Date: Thu, 7 Mar 2019 15:53:35 +0100
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Yazen Ghannam <Yazen.Ghannam@amd.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, John Clemens <clemej@gmail.com>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDE6NTU6NTFQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEkgaG9wZSBteSBwaW5nIG9uIHRoaXMgaXMganVzdGlmaWVkLiBDYW4geW91IHBy
b3ZpZGUgYW55IHVwZGF0ZSBvbiB0aGF0Cj4gaXNzdWUsIHBsZWFzZT8gSSBrZWVwIHNlZWluZyBl
cnJvcnMgd2l0aCB0aGUgNS4wLjAuCgpJIGJlbGlldmUgWWF6ZW4gd2FzIGFib3V0IHRvIHNlbmQg
YSBwYXRjaCwgQUZBSVIuCgpZYXplbj8K
