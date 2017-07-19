Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] ghes_edac: add platform check to enable ghes_edac
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1500482822.2042.31.camel@hpe.com>
Date: Wed, 19 Jul 2017 16:56:17 +0000
To: "bp@alien8.de" <bp@alien8.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCAyMDE3LTA3LTE5IGF0IDE4OjIyICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIFdlZCwgSnVsIDE5LCAyMDE3IGF0IDA0OjEwOjA3UE0gKzAwMDAsIEthbmksIFRvc2hp
bWl0c3Ugd3JvdGU6DQo+ID4gSSBkbyBwcmVmZXIgdG8gYXZvaWQgYW55IHdoaXRlIC8gYmxhY2sg
bGlzdGluZy7CoMKgQnV0IEkgZG8gbm90IHNlZQ0KPiA+IGhvdyBpdCBzb2x2ZXMgdGhlIGJ1Z2d5
IERNSS9TTUJJT1MgaW5mbyBhcyBhbiBleGFtcGxlIG9mIGZpcm13YXJlDQo+ID4gYnVncyB3ZSBt
YXkgaGF2ZSB0byBkZWFsIHdpdGguDQo+IA0KPiBTbyBob3cgZG8geW91IHdhbnQgdG8gZGVhbCB3
aXRoIHRoaXM/DQo+IA0KPiBNYWludGFpbiBhbiBldmVyZ3Jvd2luZyB3aGl0ZWxpc3Qgb2YgcGxh
dGZvcm1zIHdoaWNoIGFyZSBPSyBhbmQgdGhlbg0KPiB0aGUgbW9tZW50IGEgbmV3IHBsYXRmb3Jt
IGNvbWVzIGFsb25nLCB5b3Ugc2VuZCBhIHBhdGNoIHRvIGFkZCBpdCB0bw0KPiB0aGF0IHdoaXRl
bGlzdD8NCj4gDQo+IEknbSBzdXJlIHlvdSBjYW4gc2VlIHRoZSBwcm9ibGVtcyB3aXRoIHRoYXQg
YXBwcm9hY2guDQoNClNpbmNlIGdoZXNfZWRhYyBoYXMgbm90IGJlZW4gdXNlZCBmb3IgYSBsb25n
IHRpbWUsIEkgaGF2ZSBhIGZlZWxpbmcNCnRoYXQgbm90IHNvIG1hbnkgdmVuZG9ycyB3YW50IHRv
IHVzZSBpdC4gIEluIHRoZSBjYXNlIG9mIEhQRSwgd2UgZG8gbm90DQpuZWVkIHRvIHVwZGF0ZSB3
aXRoIGVhY2ggcGxhdGZvcm0gc2luY2UgIkhQRSIgIlNlcnZlciIgd2lsbCBjb3ZlciBhbGwNCnBs
YXRmb3JtcyB3ZSBuZWVkLg0KDQpUaGFua3MsDQotVG9zaGkK
