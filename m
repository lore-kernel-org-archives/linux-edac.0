Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce: suspicious RCU usage in 4.13.4
From: Andi Kleen <ak@linux.intel.com>
Message-Id: <871smasqux.fsf@linux.intel.com>
Date: Tue, 10 Oct 2017 13:13:58 -0700
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Jeremy Cline <jcline@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Laura Abbott <labbott@redhat.com>
List-ID: <edac.vger.kernel.org>

Ikx1Y2ssIFRvbnkiIDx0b255Lmx1Y2tAaW50ZWwuY29tPiB3cml0ZXM6Cgo+PiAgCWZvciAoOzsp
IHsKPj4gIAkJZW50cnkgPSBtY2VfbG9nX2dldF9pZHhfY2hlY2sobWNlbG9nLm5leHQpOwo+Cj4g
Q2FuJ3QgdGhpcyBnZXQgZXZlbiBzaW1wbGVyPyBEbyB3ZSBuZWVkIHRoZSBsb29wPyBUaGUgbXV0
ZXgKPiB3aWxsIG5vdyBwcm90ZWN0IHVzIHdoaWxlIHdlIGNoZWNrIHRvIHNlZSBpZiB0aGVyZSBp
cyBhIHNsb3QKPiB0byBzdGFzaCB0aGlzIG5ldyBlbnRyeS4gQWxzbyBqdXN0IHNheToKCklNSE8g
dGhlIHdhcm5pbmcgaXMganVzdCBib2d1cy4gVGhlcmUncyBub3RoaW5nIGhlcmUgdGhhdCBhY3R1
YWxseQp1c2VzIFJDVS4gSSB3b3VsZCBqdXN0IHJlbW92ZSBpdC4KCj4+ICAJCQlpZiAoZW50cnkg
Pj0gTUNFX0xPR19MRU4pIHsKPj4gLQkJCQlzZXRfYml0KE1DRV9PVkVSRkxPVywKPj4gLQkJCQkJ
KHVuc2lnbmVkIGxvbmcgKikmbWNlbG9nLmZsYWdzKTsKPj4gKwkJCQlzZXRfYml0KE1DRV9PVkVS
RkxPVywgKHVuc2lnbmVkIGxvbmcgKikmbWNlbG9nLmZsYWdzKTsKPgo+IE5lZWQgdG8gbXV0ZXhf
dW5sb2NrKCZtY2VfY2hyZGV2X3JlYWRfbXV0ZXgpOyBoZXJlLgoKQW5kIHllcyB0aGF0IHRvby4K
Ci1BbmRpCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAi
dW5zdWJzY3JpYmUgbGludXgtZWRhYyIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9y
ZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIu
a2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
