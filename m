Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: EDAC, ghes: Do not register instance if platform is not whitelisted
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180423202836.GH22238@pd.tnic>
Date: Mon, 23 Apr 2018 22:28:36 +0200
To: "Kani, Toshi" <toshi.kani@hpe.com>
Cc: "tony.luck@intel.com" <tony.luck@intel.com>, "alex_gagniuc@dellteam.com" <alex_gagniuc@dellteam.com>, "austin_bolen@dell.com" <austin_bolen@dell.com>, "james.morse@arm.com" <james.morse@arm.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBcHIgMjMsIDIwMTggYXQgMDg6MTM6MjNQTSArMDAwMCwgS2FuaSwgVG9zaGkgd3Jv
dGU6Cj4gVW1tLi4uLCBJIGRvIG5vdCB0aGluayB0aGlzIGNoYW5nZSBpcyBjb3JyZWN0LiAgVGhp
cyBjYXVzZXMgYW4gZXJyb3IgdG8KPiBnaGVzX3Byb2JlKCksIHdoaWNoIGRpc2FibGVzIEdIRVMg
aXRzZWxmLiAgZ2hlcyBhbmQgZ2hlc19lZGFjIGFyZQo+IHNlcGFyYXRlIG1vZHVsZXMuICBUaGF0
IGlzLCBnaGVzX2VkYWMgd29ya3Mgb24gdG9wIG9mIGdoZXMgYXMgYW4KPiBvcHRpb25hbCBtb2R1
bGUuCj4gCj4gSSB0aGluayB0aGUgcmlnaHQgZml4IGlzIHRvIHNpbXBseSByZW1vdmUgdGhlIGVy
cm9yIG1lc3NhZ2UuICBUaGlzIHdpbGwKPiBtYWtlIGl0IGNvbnNpc3RlbnQgd2l0aCB0aGUgY2Fz
ZSBvZiBDT05GSUdfRURBQ19HSEVTIGRpc2FibGVkLiAgUGxlYXNlCj4gc2VlIGluY2x1ZGUvYWNw
aS9naGVzLmguCgpJIGd1ZXNzLiBBbHRob3VnaCBhbiBldmVuIHJpZ2h0LWVyIGZpeCB3b3VsZCBi
ZSB0byBub3QgY2FsbApnaGVzX2VkYWNfcmVwb3J0X21lbV9lcnJvcigpIGF0IGFsbCwgaWYgdGhl
cmUncyBubyBnaGVzX2VkYWMgbW9kdWxlCnJlZ2lzdGVyZWQuCgpUaGF0IHdvdWxkIG5lZWQgbW9y
ZSBkaXNzZWN0aW5nIHRob3VnaC4uLi4K
