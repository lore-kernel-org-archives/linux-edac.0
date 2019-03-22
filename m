Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/2] x86/MCE/AMD: Don't report L1 BTB MCA errors on some Family 17h models
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190322193228.GN12472@zn.tnic>
Date: Fri, 22 Mar 2019 20:32:28 +0100
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>, "rafal@milecki.pl" <rafal@milecki.pl>, "clemej@gmail.com" <clemej@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBNYXIgMjIsIDIwMTkgYXQgMDc6MjQ6MDFQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gR2VuZXJhbGx5LCB0aGUgbW9kZWwgZ3JvdXBzIHNoYXJlIHRoZSBzYW1lIGhhcmR3
YXJlIGRlc2lnbiBhbmQgc28gdGhlCj4gc2FtZSBxdWlya3MuIFNvIEknbSB0aGlua2luZyB0aGF0
IGl0J2QgYmUgbW9yZSBlZmZpY2llbnQgdG8gaGF2ZSBhCj4gZmlsdGVyIGZ1bmN0aW9uIHRoYXQg
dGFyZ2V0cyBhIHNwZWNpZmljIGdyb3VwIG9mIG1vZGVscyByYXRoZXIgdGhhbgo+IG9uZSB0aGF0
IGNoZWNrcyBhbGwga25vd24gcXVpcmtzIG9uIGFsbCBtb2RlbHMuCgpPciBzaW1wbHkgc3RhcnQg
d2l0aCBhIGFtZF9maWx0ZXJfbWNlKCkgZnVuY3Rpb24gYW5kIHdoZW4gaXQgZ3Jvd3MgYmlnCmFu
ZCB1bndpZWxkeSwgb25seSAqdGhlbiogc3RhcnQgdGhpbmtpbmcgYWJvdXQgc3BsaXR0aW5nIGl0
IGludG8gbW9kZWxzCmFuZCBmYW1pbGllcy4gRm9yIG5vdywgeW91J3JlIGZpbmUgd2l0aCBhIHNp
bmdsZSBBTUQtc3BlY2lmaWMgZnVuY3Rpb24uCgo+IE1vc3Qgb2YgdGhlIHF1aXJrcyBhcmUgZGVh
bHQgd2l0aCBhdCBpbml0IHRpbWUsIGJ1dCB0aGlzIG5lZWRzIGJlIHRvCj4gZG9uZSBkdXJpbmcg
cnVuIHRpbWUgZm9yIGVhY2ggTUNFIHRoYXQgaXMgbG9nZ2VkLiBTbyBJIGRpZG4ndCB3YW50IHRv
Cj4gYWRkIHVubmVjZXNzYXJ5IGNoZWNrcyB0byB0aGUgTUNFIGhhbmRsZXJzLiBXZSBoYXZlIHF1
aXJrX25vX3dheV9vdXQoKQo+IHRoYXQgZG9lcyBzb21ldGhpbmcgc2ltaWxhci4KCkkgZG9uJ3Qg
dGhpbmsgYSBjb3VwbGUgb2YgaW5zdHJ1Y3Rpb25zIGNoZWNraW5nIHZlbmRvciBhbmQgZmFtaWx5
IHdvdWxkCmJlIGF0IGFsbCBub3RpY2VhYmxlIHNvIGxldCdzIHN0YXJ0IHNpbXBsZS4K
