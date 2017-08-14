Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1502732561.2042.141.camel@hpe.com>
Date: Mon, 14 Aug 2017 17:52:25 +0000
To: "bp@alien8.de" <bp@alien8.de>
Cc: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCAyMDE3LTA4LTE0IGF0IDE5OjA1ICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIE1vbiwgQXVnIDE0LCAyMDE3IGF0IDA0OjQ4OjU3UE0gKzAwMDAsIEthbmksIFRvc2hp
bWl0c3Ugd3JvdGU6DQo+ID4gUmlnaHQsIGJ1dCB0aGUgaXNzdWUgaXMgaG93IFtnaGVzX2VkYWNf
XXJlcG9ydF9tZW1fZXJyb3IoKSBwcm90ZWN0cw0KPiA+IGZyb20gcG9zc2libGUgY29uY3VycmVu
dCBjYWxscyBmcm9tIG11bHRpcGxlIEdIRVMgc291cmNlcyB3aGVuDQo+ID4gdGhlcmUgaXMgb25s
eSBhIHNpbmdsZSBtY2kuDQo+IA0KPiBEbyB5b3Uga25vdyBvZiBhbiBhY3R1YWwgZmlybXdhcmUg
cmVwb3J0aW5nIG11bHRpcGxlIGVycm9ycw0KPiBjb25jdXJyZW50bHk/DQoNCkkgZG8gbm90IGtu
b3cuICBXZSBoYXZlIG11bHRpcGxlIEdIRVMgZW50cmllcywgYnV0IHRoZXkgYWxsIHVzZSBTQ0ku
IA0KU2luY2UgQUNQSUNBIHVzZXMgYSBzaW5nbGUgdGhyZWFkZWQgd29ya3F1ZXVlIGZvciBub3Rp
ZnkgaGFuZGxlcnMsIHRoZXkNCmFyZSBzZXJpYWxpemVkIGFtb25nIFNDSXMuDQoNCkFDUEkgNi4y
IGRlZmluZXMgbXVsdGlwbGUgbm90aWZpY2F0aW9uIHR5cGVzIGluIFRhYmxlIDE4LTM4MywgYW5k
DQpnaGVzX3Byb2MoKSBjYW4gYmUgY2FsbGVkIGZyb20gZ2hlc19wb2xsX2Z1bmMoKSwgZ2hlc19p
cnFfZnVuYygpLCBhbmQNCmdoZXNfbm90aWZ5X3NjaSgpLiAgU28sIEkgdGhpbmsgaXQgaXMgc2Fm
ZSB0byBvcGVyYXRlIHBlciBhbiBlbnRyeQ0KYmFzaXMuDQoNCj4gR0hFUyB2MiBldmVuIG5lZWRz
IHRvIEFDSyB0aGUgY3VycmVudCBlcnJvciBmaXJzdCBiZWZvcmUgaXQgY2FuIHJlYWQNCj4gdGhl
IG5leHQgb25lLg0KDQpZZXMsIGJ1dCB0aGlzIEFDSyBpcyBkb25lIHBlciBhIEdIRVMgZW50cnkg
YXMgd2VsbC4NCg0KVGhhbmtzLA0KLVRvc2hpCg==
