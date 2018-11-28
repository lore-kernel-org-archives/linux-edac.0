Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/MCE/AMD: Fix the thresholding machinery initialization order
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181128090929.GA16830@zn.tnic>
Date: Wed, 28 Nov 2018 10:09:29 +0100
To: John Clemens <john@deater.net>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMTA6MDY6NTVQTSAtMDUwMCwgSm9obiBDbGVtZW5zIHdy
b3RlOgo+IE5vdCB0aGF0IGFueW9uZSBuZWVkcyBmdXJ0aGVyIHZlcmlmaWNhdGlvbiBhdCB0aGlz
IHBvaW50LCBidXQgdGVzdGVkIHdvcmtpbmcKPiBvbiB0b3Agb2YgNC4xOS41LCBvbiB0aGUgSFAg
RWxpdGVCb29rIDc0NSBHNSwgQklPUyBRODEgdjAxLjAzLjAxIChzYW1lIGFzCj4gYnVnemlsbGEg
cmVwb3J0KS4KPiAKPiBUZXN0ZWQtYnk6IEpvaG4gQ2xlbWVucyA8am9obkBkZWF0ZXIubmV0PgoK
VGhhbmtzIGZvciB0ZXN0aW5nIQo=
