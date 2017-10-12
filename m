Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce: suspicious RCU usage in 4.13.4
From: Andi Kleen <ak@linux.intel.com>
Message-Id: <20171012221351.GN5109@tassilo.jf.intel.com>
Date: Thu, 12 Oct 2017 15:13:51 -0700
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, Jeremy Cline <jcline@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Laura Abbott <labbott@redhat.com>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBPY3QgMTIsIDIwMTcgYXQgMTE6MDI6NTJBTSArMDIwMCwgQm9yaXNsYXYgUGV0a292
IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDExLCAyMDE3IGF0IDA0OjExOjM3UE0gLTA3MDAsIEFuZGkg
S2xlZW4gd3JvdGU6Cj4gPiBTb3JyeSBJIHRha2UgYmFjayB3aGF0IEkgd3JvdGUgZWFybGllci4g
VGhpcyBSQ1UgaXMgYWN0dWFsbHkgc3RpbGwgbmVlZGVkLAo+ID4gb3RoZXJ3aXNlIHRoZSByZWFk
ZXIgY291bGQgc2VlIHBhcnRpYWxseSB3cml0dGVuIGVudHJpZXMuCj4gCj4gV2h5PyBBbGwgdGhl
IHJlYWRlcnMgYW5kIHdyaXRlcnMgdGFrZSB0aGUgbXV0ZXggbm93LgoKT2sgZmFpciBlbm91Z2gu
Ci1BbmRpCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAi
dW5zdWJzY3JpYmUgbGludXgtZWRhYyIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9y
ZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIu
a2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
