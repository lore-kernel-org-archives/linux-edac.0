Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/2] x86/MCE: Add function to allow filtering of MCA errors
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190326075651.GB1867@zn.tnic>
Date: Tue, 26 Mar 2019 08:56:51 +0100
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>, "rafal@milecki.pl" <rafal@milecki.pl>, "clemej@gmail.com" <clemej@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMDQ6MzQ6MjJQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gRnJvbTogWWF6ZW4gR2hhbm5hbSA8eWF6ZW4uZ2hhbm5hbUBhbWQuY29tPgo+IAo+
IFNvbWUgc3lzdGVtcyBtYXkgcmVwb3J0IHNwdXJpb3VzIE1DQSBlcnJvcnMuIEluIGdlbmVyYWws
IHNwdXJpb3VzIE1DQQo+IGVycm9ycyBtYXkgYmUgZGlzYWJsZWQgYnkgY2xlYXJpbmcgYSBwYXJ0
aWN1bGFyIGJpdCBpbiBNQ0FfQ1RMLiBIb3dldmVyLAo+IGNsZWFyaW5nIGEgYml0IGluIE1DQV9D
VEwgbWF5IG5vdCBiZSByZWNvbW1lbmRlZCBmb3Igc29tZSBlcnJvcnMsIHNvIHRoZQo+IG9ubHkg
b3B0aW9uIGlzIHRvIGlnbm9yZSB0aGVtLgo+IAo+IEFuIE1DQSBlcnJvciBpcyBwcmludGVkIGFu
ZCBoYW5kbGVkIGFmdGVyIGl0IGhhcyBiZWVuIGFkZGVkIHRvIHRoZSBNQ0UKPiBldmVudCBwb29s
LiBTbyBhbiBNQ0EgZXJyb3IgY2FuIGJlIGlnbm9yZWQgYnkgbm90IGFkZGluZyBpdCB0byB0aGUg
cG9vbC4KPiAKPiBEZWZpbmUgYSBkZWZhdWx0IGZ1bmN0aW9uIHRoYXQgZG9lcyBub3QgZmlsdGVy
IGFueSBlcnJvcnMuCj4gCj4gQ2hlY2sgaWYgYW4gTUNBIGVycm9yIHNob3VsZCBiZSBmaWx0ZXJl
ZCBvdXQgd2hlbiBhZGRpbmcgaXQgdG8gdGhlIE1DRQo+IGV2ZW50IHBvb2wuCj4gCj4gQ2M6IDxz
dGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDUuMC54CgpUaGUgb2xkIHZlcnNpb24gb2YgdGhlIHBh
dGNoZXMgaGFkIDQuMTQueCBoZXJlIGFzIGEga2VybmVsIHZlcnNpb24uIFdoeQpjaGFuZ2U/Cg==
