Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1502905904.2042.159.camel@hpe.com>
Date: Wed, 16 Aug 2017 18:01:30 +0000
To: "bp@alien8.de" <bp@alien8.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCAyMDE3LTA4LTE2IGF0IDE5OjQwICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIFdlZCwgQXVnIDE2LCAyMDE3IGF0IDA1OjI4OjUwUE0gKzAwMDAsIEthbmksIFRvc2hp
bWl0c3Ugd3JvdGU6DQo+ID4gQXNzdW1pbmcgdGhpcyBiaWcgc3BpbmxvY2sgd29ya3MsIHllcywg
dGhpcyBhZGRyZXNzZXMgbXkgY29uY2Vybg0KPiA+IHRoYXQNCj4gDQo+IFlvdSBtZWFuLCBsZW5n
dGh5IGxvY2tlZCBzZWN0aW9uLiBXZSBjYW4gYWx3YXlzIHN3aXRjaCB0byBvbi1zdGFjaw0KPiBi
dWZmZXJzIGlmIHRoZXJlIGFyZSBpc3N1ZXMgb3IgZXZlbiB0byBzb21ldGhpbmcgbW9yZSBmYW5j
eSBsaWtlDQo+IGdlbnBvb2wuDQoNClllcywgSSBtZWFudCB0aGUgbGVuZ3RoeSBsb2NrZWQgc2Vj
dGlvbi4gIEkgc3RpbGwgdGhpbmsgdGhhdCBtdWx0aXBsZQ0KbWNpcyBpcyBhIGJldHRlciBhcHBy
b2FjaCBmb3IgY29uY3VycmVuY3kgYXMgaXQgbmF0dXJhbGx5IGFkZHJlc3NlcyBpdC4NCkJ1dCBh
cyBsb25nIGFzIGVkYWMgZnVuYyBhbmQgZXJyb3IgaGFuZGxlcnMgYXJlIHRvbGVyYW50IHdpdGgg
dGhpcw0Kc3BpbmxvY2sgYW5kIHNlcmlhbGl6YXRpb24sIEkgYW0gT0sgd2l0aCB0aGF0Lg0KDQo+
ID4gSSB3aWxsIHRlc3QgdGhlIHBhdGNoIHdpdGggYW4gU0NJIHdoZW4gSSBnb3QgYSBjaGFuY2Uu
wqDCoEkgd29uJ3QgYmUNCj4gPiBhYmxlIHRvIHRlc3Qgb3RoZXIgbm90aWZpY2F0aW9uIHR5cGVz
IG9yIHJhY2UgY29uZGl0aW9ucywgdGhvdWdoLg0KPiANCj4gVGhhbmtzLCBoZXJlJ3MgdGhlIGxh
dGVzdCB2ZXJzaW9uIHdpdGggdGhlIGF0b21pYyByZWdpc3RyYXRpb24gdG9vLg0KDQpTdXJlLCBJ
IHdpbGwgdGVzdCB3aXRoIHRoaXMgdmVyc2lvbi4NCg0KVGhhbmtzLA0KLVRvc2hpCg==
