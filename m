Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,4/4] EDAC, skx_edac: Detect non-volatile DIMMs
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20171205214441.pfxusrz5lpew5kre@pd.tnic>
Date: Tue, 5 Dec 2017 22:44:41 +0100
To: "Luck, Tony" <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Jean Delvare <jdelvare@suse.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org, Lv Zheng <lv.zheng@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Aristeu Rozanski <aris@redhat.com>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBEZWMgMDUsIDIwMTcgYXQgMTI6MDM6MzdQTSAtMDgwMCwgTHVjaywgVG9ueSB3cm90
ZToKPiBJIGNvdWxkLiBCdXQgd2hhdCBoYXBwZW5zIHdoZW4gc29tZW9uZSBlbmRzIHVwIG9uIGEg
c3lzdGVtIHdpdGgKPiBhbiBlZGFjIGRyaXZlciBjb25maWd1cmVkIHdpdGhvdXQgQUNQSV9ORklU
IHRoYXQgZG9lcyBoYXZlIE5WRElNTXM/CgpTYW1lIHRoaW5nIHdoZW4geW91IGxhbmQgb24gYSBz
eXN0ZW0gd2l0aCBhIGtlcm5lbCB3aGVyZSB0aGUgZHJpdmVyIGZvcgphIHBpZWNlIG9mIGh3IGlz
IG5vdCBlbmFibGVkLiBJIG1lYW4sIHRoaXMgd29uJ3QgYmUgYW4gaXNzdWUgb24gZGlzdHJvcwph
cyB0aGVyZSAqZXZlcnl0aGluZyogaXMgZW5hYmxlZCBidXQgZm9yIHRhaWxvcmVkIGNvbmZpZ3Ms
IHdoZXJlIHBlb3BsZQp3YW50IHNreF9lZGFjIGJ1dCBkb24ndCBuZWVkIHRoZSBudmRpbW0gcGFy
dC4KCj4gSSBjYW4gbWFrZSBhIHN0dWIgdmVyc2lvbiBvZiBuZml0X2dldF9zbWJpb3NfaWQoKSB0
aGF0IHJldHVybnMgc29tZQo+IGVycm9yIGNvZGUgLi4uIGFuZCBoYXZlIHRoZSBFREFDIGRyaXZl
ciByZXBvcnQgc2l6ZT09MC4KPiAKPiBXb3VsZCB0aGF0IGJlIE9LPwoKU3VyZSwgdGhhbmtzIQoK
PiAvbWUgZmluZHMgdGhhdCB0aGUgIkVudGVyIiBrZXkgb24gaGlzIGtleWJvYXJkIHdpbGwgcHV0
IGluIGEgbmV3bGluZS4KPiBIdXJyYWghIG5vdyBJIGRvbid0IGhhdmUgdG8gY29weS9wYXN0ZSB0
aGVtIGZyb20gQm9yaXMuCgpDaGVlcnMhIDotKSkpCg==
