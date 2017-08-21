Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/5] ACPI / blacklist: add acpi_match_platform_list()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170821173612.i3zxlmxklmvv5kzd@pd.tnic>
Date: Mon, 21 Aug 2017 19:36:12 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMjEsIDIwMTcgYXQgMDU6MjM6MzdQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiA+ID4gJ2RhdGEnIGhlcmUgaXMgcHJpdmF0ZSB0byB0aGUgY2FsbGVyLsKgwqBT
bywgSSBkbyBub3QgdGhpbmsgd2UgbmVlZAo+ID4gPiB0byBkZWZpbmUgdGhlIGJpdHMuwqDCoFNo
YWxsIEkgY2hhbmdlIHRoZSBuYW1lIHRvICdkcml2ZXJfZGF0YScgdG8KPiA+ID4gbWFrZSBpdCBt
b3JlIGV4cGxpY2l0Pwo+ID4gCj4gPiBZb3UgY2hhbmdlZCBpdCB0byAnZGF0YScuIEl0IHdhcyBh
IHUzMi11c2VkLWFzLWJvb2xlYW4KPiA+IGlzX2NyaXRpY2FsX2Vycm9yIGJlZm9yZS4KPiA+IAo+
ID4gU28geW91IGNhbiBqdXN0IGFzIHdlbGwgbWFrZSBpdCBpbnRvIGZsYWdzIGFuZCBwZW9wbGUg
Y2FuIGV4dGVuZAo+ID4gdGhvc2UgZmxhZ3MgaWYgbmVlZGVkLiBBIGZsYWcgYml0IHNob3VsZCBi
ZSBlbm91Z2ggaW4gbW9zdCBjYXNlcwo+ID4gYW55d2F5LiBJZiB0aGV5IHJlYWxseSBuZWVkIGRy
aXZlcl9kYXRhLCB0aGVuIHRoZXkgY2FuIGFkZCBhIHZvaWQgKgo+ID4gbWVtYmVyLgo+IAo+IEht
bS4uIEluIHBhdGNoIDIsIGludGVsX3BzdGF0ZV9wbGF0Zm9ybV9wd3JfbWdtdF9leGlzdHMoKSB1
c2VzIHRoaXMKPiBmaWVsZCBmb3IgUFNTIGFuZCBQQ0MsIHdoaWNoIGFyZSBlbnVtIHZhbHVlcy4g
IEkgdGhpbmsgd2Ugc2hvdWxkIGFsbG93Cj4gZHJpdmVycyB0byBzZXQgYW55IHZhbHVlcyBoZXJl
LiAgSSBhZ3JlZSB0aGF0IGl0IG1heSBuZWVkIHRvIGJlIHZvaWQgKgo+IGlmIHdlIGFsc28gYWxs
b3cgZHJpdmVycyB0byBzZXQgYSBwb2ludGVyIGhlcmUuCgpMZXQncyBzZWUgd2hhdCBSYWZhZWwg
cHJlZmVycy4K
