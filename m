Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] ghes_edac: add platform check to enable ghes_edac
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1500661773.2042.53.camel@hpe.com>
Date: Fri, 21 Jul 2017 18:38:52 +0000
To: "mchehab@s-opensource.com" <mchehab@s-opensource.com>, "bp@alien8.de" <bp@alien8.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCAyMDE3LTA3LTIxIGF0IDE5OjIzICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQogOg0KPiBOb3Qgb25seSB0aGF0OiB0aHJlc2hvbGRzIGRlcGVuZCBvbiB0aGUgRElNTSB0eXBl
cyB3aGljaCBtZWFucywNCkJJT1MNCj4gbXVzdCBrbm93IHdoYXQgRElNTSB0eXBlcyBhcmUgaW4g
dGhlcmUgd2hpY2ggSSBkb3VidC4gDQoNCkJJT1Mga25vd3MgRElNTSBtb2RlbCBmcm9tIHRoZSBT
UEQgZGF0YS4NCg0KPiBTbyBleHBvc2luZyB0aGF0IHRvIGNvbmZpZ3VyYXRpb24gaW5zdGVhZCBv
ZiAiZGVjaWRpbmciIGZvciBwZW9wbGUNCj4gd291bGQgYmUgYmV0dGVyLg0KDQpFbnRlcnByaXNl
IHBsYXRmb3JtcyBoYXZlIHZlcnkgZGlmZmVyZW50IG1vZGVsIChJIGRvIG5vdCBzYXkgaXQncw0K
YmV0dGVyIGZvciBldmVyeW9uZSBmcm9tIHRoZSBjb3N0IHBlcnNwZWN0aXZlKS4gIFR5cGljYWxs
eSwgc3VjaA0KcGxhdGZvcm0gdmVuZG9ycyB3b3JrIHdpdGggRElNTSB2ZW5kb3JzIGRpcmVjdGx5
IHRvIGNvbWUgd2l0aCB0aGVpcg0Kc3VwcG9ydGVkIERJTU1zIHdpdGggb3duIHBhcnQgbnVtYmVy
cywgd2hpY2ggYXJlIGNlcnRpZmllZCBmb3IgdGhlDQpwbGF0Zm9ybXMgd2l0aCBleHRlbnNpdmUg
dmFsaWRhdGlvbiB0ZXN0aW5ncy4NCg0KVGhhbmtzLA0KLVRvc2hpCg==
