Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/2] nfit, mce: validate the mce->addr before using it
From: Dan Williams <dan.j.williams@intel.com>
Message-Id: <CAPcyv4g=7HZjxQCdA+fYAacEeRPwcuONGiDUZPunL=_V4jf3qQ@mail.gmail.com>
Date: Tue, 6 Nov 2018 10:02:46 -0800
To: Borislav Petkov <bp@alien8.de>
Cc: Vishal L Verma <vishal.l.verma@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-edac@vger.kernel.org, "Elliott, Robert (Persistent Memory)" <elliott@hpe.com>, stable <stable@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBOb3YgNiwgMjAxOCBhdCA5OjUzIEFNIEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44
LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDA2LCAyMDE4IGF0IDA4OjIwOjM4QU0gLTA4MDAs
IERhbiBXaWxsaWFtcyB3cm90ZToKPiA+IEkgcmVjb21tZW5kZWQgdGhlIHNwbGl0IHNvIHRoZSBm
aXhlcyBjYW4gYmUgdHJhY2tlZCBhbmQgLyBvciByZXZlcnRlZAo+ID4gaW5kZXBlbmRlbnRseSBp
ZiB0aGV5IGNhdXNlIHByb2JsZW1zLgo+Cj4gRG8geW91IGhhdmUgYW55dGhpbmcgY29uY3JldGUg
aW4gbWluZCB0aGF0IG1pZ2h0IGdvIHdyb25nIG9yIGp1c3QgYQo+IGdlbmVyYWwgY2F1dGlvdXNu
ZXNzPwoKSnVzdCBnZW5lcmFsIGNhdXRpb3VzbmVzcywgSSdtIG5vdCBvcHBvc2VkIHRvIHNxdWFz
aGluZyB0aGVtLgoKPiBPciBkbyB5b3UgdGhpbmsgdGhlIGh3IG1pZ2h0IG5vdCBzcGl0IHdoYXQg
bWNlX3VzYWJsZV9hZGRyZXNzKCkgaXMKPiBjaGVja2luZyBmb3IsIGZvciBOVkRJTU0gTUNFcywg
c28gdGhhdCB5b3UnZCBsaWtlIHRvIGJlIGFibGUgdG8gcmV2ZXJ0Cj4gdGhhdCBzZWNvbmQgcGF0
Y2g/CgptY2VfdXNhYmxlX2FkZHJlc3MoKSBzaG91bGQgbm90IGhhdmUgYW55IHNlbnNpdGl2aXR5
IHRvIE5WRElNTSB2cyBEUkFNIE1DRXMuCg==
