Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/3] ACPI / adxl: Add address translation interface using ACPI DSM
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181031181633.GN15955@zn.tnic>
Date: Wed, 31 Oct 2018 19:16:33 +0100
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rafael Wysocki <rafael.j.wysocki@intel.com>, qiuxu.zhuo@intel.com, aris@redhat.com, mchehab@s-opensource.com, "open list:EDAC-CORE" <linux-edac@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMTE6MDg6MDFBTSAtMDcwMCwgTHVjaywgVG9ueSB3cm90
ZToKPiBJdCdzIG5vdCBleGFjdGx5IGlkZWFsIHRvIGJ1aWxkIHRoZSBza3hfZWRhYy5jIGRyaXZl
ciB3aXRoIHRoZXNlCj4gc3R1YnMuIFN1cmUsIGl0IG1ha2UgdGhlIGtlcm5lbCBsaW5rIHdpdGhv
dXQgZXJyb3JzLiBCdXQgbm93IHlvdQo+IHNpbGVudGx5IGVuZCB1cCB3aXRoIGEgZHJpdmVyIHRo
YXQgZG9lc24ndCByZWFsbHkgZG8gYWxsIHlvdSB3YW50Cj4gaXQgdG8gZG8uCj4gCj4gUGVyaGFw
cyB0aGlzIGlzbid0IGEgaHVnZSBpc3N1ZS4gT25seSAicmFuZGNvbmZpZyIgd291bGQgdHJ5IHRv
Cj4gYnVpbGQgYSBrZXJuZWwgd2l0aG91dCBBQ1BJLiBUaGUgdXNlciB3aWxsIGZpbmQgb3RoZXIg
c3R1ZmYgaXMKPiBicm9rZW4gaW4gYW4gQUNQST1uIGtlcm5lbCBsb25nIGJlZm9yZSB0aGV5IG5v
dGljZSB0aGUgbGFjayBvZgo+IEVEQUMgZXJyb3IgcmVwb3J0aW5nLgoKRXhhY3RseSEKCj4gU286
Cj4gCj4gQWNrZWQtYnk6IFRvbnkgTHVjayA8dG9ueS5sdWNrQGludGVsLmNvbT4KClRoeC4gSSds
bCBhZGQgaXQgdG8gdGhlIGxpbmV1cCBmb3IgTGludXMuCgo+IE9vcHMuIFJldHVybiBmcm9tIHRo
aXMgaXNuJ3QgImJvb2wiLiBDYWxsZXIgZXhwZWN0cyAwID0gc3VjY2Vzcy4KPiAKPiA+ICtzdGF0
aWMgaW5saW5lIGludCBhZHhsX2RlY29kZSh1NjQgYWRkciwgdTY0IGNvbXBvbmVudF92YWx1ZXNb
XSkgICB7IHJldHVybiBmYWxzZTsgfQo+IAo+IFRoaXMgc2hvdWxkIHJldHVybiAtRU9QTk9UU1VQ
UDsKCkRvbmUuCgpUaHguCg==
