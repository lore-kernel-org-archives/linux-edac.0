Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,6/7] EDAC: add edac_check_mc_owner() to check MC owner
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1501859527.2042.111.camel@hpe.com>
Date: Fri, 4 Aug 2017 15:21:40 +0000
To: "lkp@intel.com" <lkp@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "kbuild-all@01.org" <kbuild-all@01.org>, "bp@alien8.de" <bp@alien8.de>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCAyMDE3LTA4LTA0IGF0IDIxOjA2ICswODAwLCBrYnVpbGQgdGVzdCByb2JvdCB3cm90
ZToNCj4gSGkgVG9zaGksDQo+IA0KPiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gcG0vbGlu
dXgtbmV4dF0NCj4gW2Fsc28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHY0LjEzLXJjM10NCj4gW2Nh
bm5vdCBhcHBseSB0byBlZGFjL2xpbnV4X25leHQgYnAvZm9yLW5leHQgbmV4dC0yMDE3MDgwNF0N
Cj4gW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBsZWFz
ZSBkcm9wIHVzIGENCj4gbm90ZSB0byBoZWxwIGltcHJvdmUgdGhlIHN5c3RlbV0NCj4gDQo+IHVy
bDrCoMKgwqDCoGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvVG9zaGkt
S2FuaS9lbmFibGUtZ2gNCj4gZXNfZWRhYy1vbi1zZWxlY3RlZC1wbGF0Zm9ybXMvMjAxNzA4MDQt
MTkwODQ2DQo+IGJhc2U6wqDCoMKgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmFmYWVsL2xpbnV4LQ0KPiBwbS5naXQgbGludXgtbmV4dA0KPiByZXByb2R1
Y2U6IG1ha2UgaHRtbGRvY3MNCj4gDQo+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQg
YnkgPj4pOg0KIDoNCj4gCcKgwqDCoHVuc2lnbmVkIHN6X3B2dCk7DQo+IMKgwqDCoDEyOQkNCj4g
wqDCoMKgMTMwCS8qKg0KPiDCoD4gMTMxCcKgKg0KDQpSZW1vdmVkIHRoaXMgZXh0cmEgY29tbWVu
dGVkIGxpbmUuDQoNClRoYW5rcyENCi1Ub3NoaQ0KDQoNCj4gwqDCoMKgMTMyCcKgKiBlZGFjX2No
ZWNrX21jX293bmVyIC0gQ2hlY2sgdGhlIG93bmVyIG9mIEVEQUMgTUMNCj4gwqDCoMKgMTMzCcKg
Kg0KPiDCoMKgwqAxMzQJwqAqIEBtb2RfbmFtZTogcG9pbnRlciB0byB0aGUgbW9kdWxlIG5hbWUN
Cj4gwqDCoMKgMTM1CcKgKg0KPiDCoMKgwqAxMzYJwqAqIFJldHVybnM6DQo+IMKgwqDCoDEzNwnC
oCoJMSB3aGVuIEVEQUMgTUMgaXMgZnJlZSBvciBvd25lZCBieSB0aGUgbW9kdWxlDQo+IG5hbWUN
Cj4gwqDCoMKgMTM4CcKgKgkwIHdoZW4gRURBQyBNQyBpcyBvd25lZCBieSBvdGhlciBtb2R1bGUN
Cj4gwqDCoMKgMTM5CcKgKi8NCj4gwqDCoMKgMTQwCWV4dGVybiBpbnQgZWRhY19jaGVja19tY19v
d25lcihjb25zdCBjaGFyICptb2RfbmFtZSk7DQo+IMKgwqDCoDE0MQo=
