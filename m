Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] ghes_edac: add platform check to enable ghes_edac
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1500911226.2042.60.camel@hpe.com>
Date: Mon, 24 Jul 2017 15:56:27 +0000
To: "bp@alien8.de" <bp@alien8.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@s-opensource.com" <mchehab@s-opensource.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCAyMDE3LTA3LTI0IGF0IDE3OjM3ICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIE1vbiwgSnVsIDI0LCAyMDE3IGF0IDAzOjI1OjM0UE0gKzAwMDAsIEthbmksIFRvc2hp
bWl0c3Ugd3JvdGU6DQogOg0KPiANCj4gPiBXZSd2ZSBiZWVuIHByb3ZpZGluZyB0aGlzIG1vZGVs
IGZvciBtYW55IHllYXJzIG5vdy4NCj4gDQo+IER1ZGUsIHJlbGF4LCBJJ20gb25seSB0cnlpbmcg
dG8gcG9pbnQgb3V0IHRvIHlvdSB0aGF0IHRoZXJlIGFyZQ0KPiBjdXN0b21lcnMgd2hvIHdhbnQg
dG8gc2VlICpldmVyeSogZXJyb3IgYW5kIHRodXMgdHJhY2sgaG93IHRoZWlyDQo+IGhhcmR3YXJl
IGJlaGF2ZXMuIEFuZCB0aGF0IGZvciB0aG9zZSBjdXN0b21lcnMgaXQgaXMgcHJvYmFibHkgd29y
dGgNCj4gY29uc2lkZXJpbmcgZXhwb3NpbmcgdGhhdCBpbmZvIGFuZCBwcm92aWRpbmcgYSBzd2l0
Y2ggdG8gZGlzYWJsZSB0aGF0DQo+IGR1bWJpbmcgb2YgdGhlIFJBUyBmdW5jdGlvbmFsaXR5IGlu
IHRoZSBCSU9TIHNvIHRoYXQgcGVvcGxlIGNhbg0KPiBkZWNpZGUgZm9yIHRoZW1zZWx2ZXMuIFRo
YXQncyBhbGwuDQoNClllcywgTWF1cm8gaGFzIGFscmVhZHkgcG9pbnRlZCB0aGlzIG91dC4gIEFz
IEkgcmVwbGllZCB0byBoaW0sIHdlIGRvDQpoYXZlIGEgc2VwYXJhdGUgc2VyaWVzIG9mIHBsYXRm
b3JtcyB0aGF0IGRvIG5vdCBoYXZlIGJ1aWx0LWluIFJBUywgYW5kDQpyZXBvcnQgYWxsIGVycm9y
cy4gwqBTdWNoIGN1c3RvbWVycyBjYW4gc2ltcGx5IGNob29zZSB0aGVtLiAgVGhleSBkbyBub3QN
Cm5lZWQgdG8gcGF5IGZvciBidWlsdC1pbiBSQVMuDQoNClRoZSBtb2RlbCB3LyBidWlsdC1pbiBS
QVMgcHJvdmlkZXMgd2FycmFudHkgJiBmdWxsIHN1cHBvcnQuICBBcyBJIHNhaWQsDQppdCdzIGEg
ZGlmZmVyZW50IG1vZGVsLiANCg0KVGhhbmtzLA0KLVRvc2hpCg==
