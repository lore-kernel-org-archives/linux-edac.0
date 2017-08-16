Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Steven Rostedt <rostedt@goodmis.org>
Message-Id: <20170816102249.0c0d8d12@gandalf.local.home>
Date: Wed, 16 Aug 2017 10:22:49 -0400
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Kani, Toshimitsu" <toshi.kani@hpe.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCAxNiBBdWcgMjAxNyAxNjowMzo1MCArMDIwMApCb3Jpc2xhdiBQZXRrb3YgPGJwQGFs
aWVuOC5kZT4gd3JvdGU6Cgo+ID4gV2hhdCdzIHRoZSBsaWtlbGlob29kIG9mIHR3byBjYWxscyB0
byBnaGVzX2VkYWNfcmVnaXN0ZXIgYmVpbmcgZG9uZQo+ID4gc2ltdWx0YW5lb3VzbHk/ICBCZWNh
dXNlIHR3byBjYWxscyBhdCB0aGUgc2FtZSB0aW1lIHdpbGwgZ2V0IHBhc3QgdGhpcy4gIAo+IAo+
IFdlbGwsIHRoYXQgdGhpbmcgZ2V0cyBjYWxsZWQgcGVyIEdIRVMgcGxhdGZvcm0gZGV2aWNlIGFu
ZCBsYXN0IHRpbWUgSQo+IGNoZWNrZWQgdGhleSBkbyBnZXQgcHJvYmVkIGJhY2stdG8tYmFjayBi
dXQgSSdsbCBjaGVjayB0aGF0IGFnYWluLgoKTWF5YmUga2VlcCB0aGF0IG9yaWdpbmFsIG11dGV4
IGp1c3QgaW4gY2FzZS4KCi0tIFN0ZXZlCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlz
dDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtZWRhYyIgaW4KdGhlIGJvZHkgb2Yg
YSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5m
byBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
