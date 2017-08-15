Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1502811804.2042.151.camel@hpe.com>
Date: Tue, 15 Aug 2017 15:53:09 +0000
To: "tony.luck@intel.com" <tony.luck@intel.com>
Cc: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCAyMDE3LTA4LTE1IGF0IDA4OjQ4IC0wNzAwLCBMdWNrLCBUb255IHdyb3RlOg0KPiBP
biBUdWUsIEF1ZyAxNSwgMjAxNyBhdCAwODozNTo1MUFNIC0wNzAwLCBLYW5pLCBUb3NoaW1pdHN1
IHdyb3RlOg0KPiA+IFVzZXIgYXBwcyBsaWtlIHJhcy1tYy1jdGwgd29ya3MgYXMgZXhwZWN0ZWQg
Zm9yIGEgZ2l2ZW4gKG5vdC1zby0NCj4gPiBncmVhdCkgRElNTSBpbmZvIGZyb20gU01CSU9TIGFz
IHdlbGwuwqDCoEkgZG8gbm90IHNlZSBhIHByb2JlbG0gZnJvbQ0KPiA+IHVzZXIgcGVyc3BlY3Rp
dmUsIGVpdGhlci4NCj4gDQo+IFdvbid0IHRoZSB1c2VyIHNlZSBhbGwgdGhlaXIgRElNTXMgcmVw
b3J0ZWQgZm9yIGVhY2ggbWVtb3J5DQo+IGNvbnRyb2xsZXIgdW5kZXIgL3N5cy9kZXZpY2VzL3N5
c3RlbS9lZGFjL21jL21jKi9kaW1tKiA/DQo+IA0KPiBUaGF0IHNvdW5kcyBjb25mdXNpbmcuDQoN
CmdoZXNfZWRhYyBvbmx5IGZpbGxzIGRpbW1faW5mbyB0byB0aGUgZmlyc3QgbWNpLiAgU28sIHVz
ZXJzIGRvIG5vdCBzZWUNCmR1cGxpY2F0ZWQgaW5mby4NCg0KVGhhbmtzLA0KLVRvc2hpCg==
