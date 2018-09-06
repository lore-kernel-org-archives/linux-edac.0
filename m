Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/3] EDAC, sb_edac: Early return on ADDRV bit and address type test
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Message-Id: <E6AF1AFDEA62A94A97508F458CBDD47F6F6EBDEB@SHSMSX101.ccr.corp.intel.com>
Date: Thu, 6 Sep 2018 13:18:06 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Aristeu Rozanski <aris@redhat.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

PiBBYm92ZSB5b3UgYXJlIGV4cGxhaW5pbmcgKndoYXQqIHRoaXMgcGF0Y2ggY2hhbmdlcyBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UNCj4gd2hlcmVhcyB5b3Ugc2hvdWxkIGJlIGV4cGxhaW5pbmcgKndo
eSogaXQgaXMgYmVpbmcgY2hhbmdlZC4gVGhlICp3aGF0KiBpcw0KPiB2aXNpYmxlIGZyb20gdGhl
IGRpZmYgYmVsb3cuDQo+IA0KPiBJbiBnZW5lcmFsLCB3aGVuIHdyaXRpbmcgYSBjb21taXQgbWVz
c2FnZSwgdHJ5IHRvIHN0cnVjdHVyZSBpdCBzb21ld2hhdCBsaWtlDQo+IHRoaXM6DQo+IA0KPiBQ
cm9ibGVtIGlzIEEuDQo+IA0KPiBJdCBoYXBwZW5zIGJlY2F1c2Ugb2YgQi4NCj4gDQo+IEZpeCBp
dCBieSBkb2luZyBDLg0KPiANCj4gKFBvdGVudGlhbGx5IGRvIEQpLg0KPiANCg0KT0ssIHdpbGwg
dXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSB3aXRoIGFib3ZlIHN0cnVjdHVyZSBpbiB2Mi4K
