Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190307165301.GE26566@zn.tnic>
Date: Thu, 7 Mar 2019 17:53:01 +0100
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, John Clemens <clemej@gmail.com>, Tony Luck <tony.luck@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDQ6MTU6NTVQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gSG93ZXZlciwgcGxlYXNlIHRyeSB0aGUgZm9sbG93aW5nIGFzIGEgd29ya2Fyb3Vu
ZCB0byByZWR1Y2UgdGhlIG51bWJlciBvZiByZXBvcnRlZCBlcnJvcnMuCj4gCj4gVGhpcyB3aWxs
IGRpc2FibGUgdGhlIHRocmVzaG9sZCBpbnRlcnJ1cHQgb24gdGhlIGJhbmtzIHRoYXQgY291bGQg
c2VlIHRoaXMgZXJyb3I6Cj4gZmluZCAvc3lzL2RldmljZXMvc3lzdGVtL21hY2hpbmVjaGVjay8g
LXdob2xlbmFtZSAqL2luc25fZmV0Y2gvaW50ZXJydXB0X2VuYWJsZSAtZXhlYyBzaCAtYyAiZWNo
byAwID4ge30iIFw7CgpJIGRvbid0IHRoaW5rIHRoYXQgaGVscHMgZm9yIHRoZSBzaW1wbGUgcmVh
c29uIHRoYXQgdGhvc2UgZXJyb3JzIGhhcHBlbgp2ZXJ5IGVhcmx5LCBhbmQgd2UgZG9uJ3QgaGF2
ZSB1c2Vyc3BhY2UgeWV0Lgo=
