Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC] x86/mce: Check MCi_STATUS[MISCV] for usable addr on Intel only
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170418221113.voi7vdq7gaimyvbg@pd.tnic>
Date: Wed, 19 Apr 2017 00:11:13 +0200
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBBcHIgMTgsIDIwMTcgYXQgMDk6MjY6MDNQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gV2UgZGVmaW5pdGVseSBkb24ndCBuZWVkIHRvIGxvb2sgYXQgTWlzY1YuCj4gCj4g
QnV0IHRoZSB2YWx1ZSBpbiBNQ0FfQUREUiBpc24ndCBuZWNlc3NhcmlseSBhIHN5c3RlbSBwaHlz
aWNhbCBhZGRyZXNzLiBJdCBjYW4gYmUsCj4gb3IgaXQgY2FuIGJlIGEgbm9ybWFsaXplZCBhZGRy
ZXNzIGluIHRoZSBjYXNlIG9mIFVNQ3MsIG9yIGl0IGNhbiBhIHNldC93YXkgZm9yIGNhY2hlcy4K
PiBTbyBpdCBkZXBlbmRzIG9uIHRoZSBiYW5rIHR5cGUgYW5kIGVycm9yIHR5cGUuCgpSaWdodCwg
dGhpcyBpcyBhbGwgZnV0dXJlIHdvcmsuIG1jZV91c2FibGVfYWRkcmVzcygpIHdvdWxkIG5lZWQg
c29tZQpiZWVmaW5nIHVwIHRoZW4uCgo+IEFsbCB0aGlzIG1heSBqdXN0IGJlIGZvciBTTUNBIHN5
c3RlbXMgdGhvdWdoLiBJIG5lZWQgdG8gZG91YmxlIGNoZWNrLgoKVGhhbmtzIQo=
