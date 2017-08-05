Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170805051615.GC23214@nazgul.tnic>
Date: Sat, 5 Aug 2017 07:16:15 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBBdWcgMDQsIDIwMTcgYXQgMDk6MDI6MTdQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBHSEVTIHBsYXRmb3JtIGRldmljZXMgY29ycmVzcG9uZCB0byBHSEVTIGVudHJp
ZXMsIHdoaWNoIGRlZmluZSBmaXJtd2FyZQo+IGludGVyZmFjZXMgdG8gcmVwb3J0IGdlbmVyaWMg
bWVtb3J5IGVycm9ycyB0byB0aGUgT1MsIHN1Y2ggYXMgTk1JIGFuZAo+IFNDSS4gIFRoZXNlIGRl
dmljZXMgYXJlIGFzc29jaWF0ZWQgd2l0aCBhbGwgRElNTXMsIG5vdCBhIHBhcnRpY3VsYXIKPiBE
SU1NLgoKQW5kPyBTdGF0aW5nIHRoZSBvYnZpb3VzIGJyaW5ncyB5b3Ugd2hhdCBleGFjdGx5PwoK
SU9XLCB5b3Ugc3RpbGwgaGF2ZW4ndCBhbnN3ZXJlZCBteSBxdWVzdGlvbi4K
