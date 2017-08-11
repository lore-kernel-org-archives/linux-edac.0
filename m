Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170811090414.GB9432@nazgul.tnic>
Date: Fri, 11 Aug 2017 11:04:14 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMDcsIDIwMTcgYXQgMDU6NTk6MTVQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBJIHRoaW5rIHdlIHNob3VsZCBrZWVwIHRoZSBjdXJyZW50IHNjaGVtZSwgd2hp
Y2ggcmVnaXN0ZXJzIGFuIG1jaSBmb3IKCk5vIHdlIHNob3VsZG4ndC4KCj4gZWFjaCBHSEVTIGVu
dHJ5LiAgZ2hlc19lZGFjX3JlcG9ydF9tZW1fZXJyb3IoKSBleHBlY3RzIHRoYXQgZXJyb3ItCj4g
cmVwb3J0aW5nIGlzIHNlcmlhbGl6ZWQgcGVyIGEgR0hFUyBlbnRyeS4gIFNoYXJpbmcgYSBzaW5n
bGUgbWNpIGFtb25nCj4gYWxsIEdIRVMgZW50cmllcyAvIGVycm9yIGludGVyZmFjZXMgbWlnaHQg
bGVhZCB0byBhIHJhY2UgY29uZGl0aW9uLgoKU2VlIGhvdyBJIHNvbHZlZCBpdCBpbiBteSBwYXRj
aHNldCBhbmQgZmVlbCBmcmVlIHRvIHJldXNlIGl0Lgo=
