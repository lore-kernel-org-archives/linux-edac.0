Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1502736750.2042.145.camel@hpe.com>
Date: Mon, 14 Aug 2017 19:02:15 +0000
To: "bp@alien8.de" <bp@alien8.de>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCAyMDE3LTA4LTE0IGF0IDIwOjM1ICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIE1vbiwgQXVnIDE0LCAyMDE3IGF0IDA2OjE3OjQ3UE0gKzAwMDAsIEthbmksIFRvc2hp
bWl0c3Ugd3JvdGU6DQo+ID4gUmlnaHQsIGdoZXNfZWRhY19yZXBvcnRfbWVtX2Vycm9yKCkgZ2V0
cyBzZXJpYWxpemVkIHBlciBhIEdIRVMNCj4gPiBlbnRyeSwgYnV0IG5vdCBnbG9iYWxseS4NCj4g
DQo+IEdsb2JhbGx5IHdoYXQ/DQoNCkdIRVMgdjIncyBBQ0vCoGlzIG5vdCBhIGdsb2JhbCBsb2Nr
LiAgU28sIGl0IGRvZXMgbm90IGd1YXJhbnRlZSB0aGF0DQpnaGVzX2VkYWNfcmVwb3J0X21lbV9l
cnJvcigpIG5ldmVyIGdldHMgY2FsbGVkIGNvbmN1cnJlbnRseS4NCg0KPiBXaGF0IGlzIHRoZSBh
Y3R1YWwgcG90ZW50aWFsIHNjZW5hcmlvIGZvciBjb25jdXJyZW5jeSBpc3N1ZXMgeW91IHNlZT8N
Cj4gRXhhbXBsZSBwbHMuDQoNCmdoZXNfcHJvYmUoKSBzdXBwb3J0cyBtdWx0aXBsZSBzb3VyY2Vz
IGRlZmluZWQgaW4NCmFjcGlfaGVzdF9ub3RpZnlfdHlwZXMuICBTYXksIHRoZXJlIGFyZSB0d28g
ZW50cmllcyBmb3IgbWVtb3J5IGVycm9ycywNCm9uZSB3aXRoIEFDUElfSEVTVF9OT1RJRllfRVhU
RVJOQUwgYW5kIHRoZSBvdGhlciB3aXRoDQpBQ1BJX0hFU1RfTk9USUZZX1NDSS4gIFRoZXkgbWF5
IHJlcG9ydCBlcnJvcnMgaW5kZXBlbmRlbnRseS4gIFdoaWxlDQpnaGVzX2VkYWNfcmVwb3J0X21l
bV9lcnJvcigpIGlzIGJlaW5nIGNhbGxlZCBmcm9tIHRoZSBTQ0ksIGl0IGNhbiBiZQ0KY2FsbGVk
IGZyb20gdGhlIGV4dCBpbnRlcnJ1cHQgYXQgYSBzYW1lIHRpbWUuDQoNCkkgZG8gbm90IGtub3cg
aG93IGxpa2VseSB3ZSBzZWUgc3VjaCBjYXNlLCBidXQgdGhlIGNvZGUgc2hvdWxkIGJlDQp3cml0
dGVuIGFjY29yZGluZyB0byB0aGUgc3BlYy4NCg0KVGhhbmtzLA0KLVRvc2hpCg==
