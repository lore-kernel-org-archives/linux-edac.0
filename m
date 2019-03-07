Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190307170830.GH26566@zn.tnic>
Date: Thu, 7 Mar 2019 18:08:30 +0100
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, John Clemens <clemej@gmail.com>, Tony Luck <tony.luck@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDQ6NTU6NTRQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gVGhhdCdzIHJpZ2h0LiBCdXQgSSB0aG91Z2h0IHRoYXQgdGhlc2UgZXJyb3JzIGFy
ZSBjb250aW51b3VzbHkKPiBnZW5lcmF0ZWQuIFNvIEkganVzdCBtZWFudCB0aGF0IHRoZXkgY291
bGQgYmUgbWFza2VkIG9uY2UgeW91IGdldCB0bwo+IHVzZXJzcGFjZS4KClRoYXQgZG9lc24ndCBo
ZWxwIFJhZmHFgiAtIGhlIGtub3dzIHRoYXQgdGhvc2Ugc2hvdWxkIGJlIGlnbm9yZWQuIFdlCm5l
ZWQgYSBnZW5lcmFsIHByb3BlciBmaXggd2hpY2ggbWFza3MgdGhlIGVycm9yIHNpZ25hdHVyZSBi
ZWNhdXNlCmFwcGFyZW50bHkgb3RoZXJzIGFyZSBzZWVpbmcgdGhlbSB0b28uCg==
