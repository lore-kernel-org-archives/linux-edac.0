Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/2] x86/MCE: Add function to allow filtering of MCA errors
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190326092825.GF1867@zn.tnic>
Date: Tue, 26 Mar 2019 10:28:25 +0100
To: "rafal@milecki.pl" <rafal@milecki.pl>, "clemej@gmail.com" <clemej@gmail.com>
Cc: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMDQ6MzQ6MjJQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gRnJvbTogWWF6ZW4gR2hhbm5hbSA8eWF6ZW4uZ2hhbm5hbUBhbWQuY29tPgo+IAo+
IFNvbWUgc3lzdGVtcyBtYXkgcmVwb3J0IHNwdXJpb3VzIE1DQSBlcnJvcnMuIEluIGdlbmVyYWws
IHNwdXJpb3VzIE1DQQo+IGVycm9ycyBtYXkgYmUgZGlzYWJsZWQgYnkgY2xlYXJpbmcgYSBwYXJ0
aWN1bGFyIGJpdCBpbiBNQ0FfQ1RMLiBIb3dldmVyLAo+IGNsZWFyaW5nIGEgYml0IGluIE1DQV9D
VEwgbWF5IG5vdCBiZSByZWNvbW1lbmRlZCBmb3Igc29tZSBlcnJvcnMsIHNvIHRoZQo+IG9ubHkg
b3B0aW9uIGlzIHRvIGlnbm9yZSB0aGVtLgoKT2ssIEkgY2xlYW5lZCB0aG9zZSB1cCBhbmQgYXBw
bGllZCB0aGVtIGhlcmU6CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9icC9icC5naXQvbG9nLz9oPXRpcC14ODYtdXJnZW50LXJhcwoKUmFmYcWCLCBKb2hu
LCBjYW4geW91IGd1eXMgdGVzdCB0aGVtIHBscz8KClRoeC4K
