Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] ras: fix an off-by-one error in __find_elem()
From: Cong Wang <xiyou.wangcong@gmail.com>
Message-Id: <CAM_iQpVom+7oHCUh1=oWrR9NiHfDSGOWoOFV4tkdT6nnZKicmw@mail.gmail.com>
Date: Tue, 16 Apr 2019 19:37:41 -0700
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgNzozMSBQTSBDb25nIFdhbmcgPHhpeW91Lndhbmdjb25n
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gWWVzIGl0IGlzLCBJIGhhdmUgYSBzdGFja3RyYWNlIGluIHBy
b2R1Y3Rpb24gd2hpY2ggY2xlYXJseSBzaG93cwo+IGRlbF9lbGVtLmlzcmEuMSsweDM0LzB4NDAs
IHVubGlrZSB0aGUgb25lIEkgdHJpZ2dlcmVkIHZpYSBmYWtlCj4gUEZOJ3MuIEkgY2FuIHNob3cg
eW91IGlmIHlvdSB3YW50LCBpdCBpcyBvbiA0LjE0LCBzbyB2ZXJ5IHVubGlrZWx5Cj4gaXQgaXMg
aW50ZXJlc3RpbmcgdG8gYW55b25lIGhlcmUuCgpDb3JyZWN0IG15c2VsZjoKClRoZSBvbmUgdHJp
Z2dlcmVkIHZpYSBmYWtlIFBGTidzIGFsc28gc2hvd3MKZGVsX2VsZW0uY29uc3Rwcm9wLjErMHgz
OS8weDQwLgoKU29ycnkgZm9yIHRoZSBtaXN0YWtlLCBJIGtpbmRhIHJlYWQgaW50byBhbm90aGVy
IGNyYXNoLi4uCg==
