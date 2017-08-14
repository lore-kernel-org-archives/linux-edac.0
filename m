Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1502741290.2042.147.camel@hpe.com>
Date: Mon, 14 Aug 2017 20:17:54 +0000
To: "bp@alien8.de" <bp@alien8.de>
Cc: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCAyMDE3LTA4LTE0IGF0IDIxOjM0ICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIE1vbiwgQXVnIDE0LCAyMDE3IGF0IDA3OjAyOjE1UE0gKzAwMDAsIEthbmksIFRvc2hp
bWl0c3Ugd3JvdGU6DQo+ID4gSSBkbyBub3Qga25vdyBob3cgbGlrZWx5IHdlIHNlZSBzdWNoIGNh
c2UsIGJ1dCB0aGUgY29kZSBzaG91bGQgYmUNCj4gPiB3cml0dGVuIGFjY29yZGluZyB0byB0aGUg
c3BlYy4NCj4gDQo+IFdlbGwsIHRoZW4geW91J2xsIGhhdmUgdG8gbWFrZSBnaGVzX2VkYWNfcmVw
b3J0X21lbV9lcnJvcigpDQo+IHJlZW50cmFudC4gV2hpY2ggZG9lc24ndCBsb29rIHRoYXQgaGFy
ZCBhcyB0aGUgb25seSB0aGluZyBpdCByZWFsbHkNCj4gbmVlZHMgZnJvbSBzdHJ1Y3QgZ2hlc19l
ZGFjX3B2dCBhcmUgdGhvc2Ugc3RyaW5nIGJ1ZmZlcnMuIEkgZ3Vlc3MgeW91DQo+IGNhbiB0cnkg
dG8gZG8gdGhlIHNpbXBsZXN0IHRoaW5nIGZpcnN0IGFuZCBhbGxvY2F0ZSB0aGVtIG9uIHRoZQ0K
PiBzdGFjay4NCg0KZ2hlc19lZGFjX3JlcG9ydF9tZW1fZXJyb3IoKSBpcyByZWVudHJhbnQgYXMg
aXQgaXMgbm93LiAgSSB0aGluayB0aGUNCmN1cnJlbnQgY29kZSBkZXNpZ24gb2YgYWxsb2NhdGlu
ZyBtY2kgJiBnaGVzX2VkYWNfcHZ0IGZvciBlYWNoIEdIRVMNCnNvdXJjZSBlbnRyeSBtYWtlcyBz
ZW5zZS4gIGVkYWNfcmF3X21jX2hhbmRsZV9lcnJvcigpIGFsc28gaGFzIHRoZSBzYW1lDQogIGV4
cGVjdGF0aW9uIHRoYXQgdGhlIGNhbGwgaXMgc2VyaWFsaXplZCBwZXIgbWNpLg0KDQpUaGFua3Ms
DQotVG9zaGkK
