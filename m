Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170814183551.sgk2i7lxpmpyodhv@pd.tnic>
Date: Mon, 14 Aug 2017 20:35:51 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMTQsIDIwMTcgYXQgMDY6MTc6NDdQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBSaWdodCwgZ2hlc19lZGFjX3JlcG9ydF9tZW1fZXJyb3IoKSBnZXRzIHNlcmlh
bGl6ZWQgcGVyIGEgR0hFUyBlbnRyeSwKPiBidXQgbm90IGdsb2JhbGx5LgoKR2xvYmFsbHkgd2hh
dD8KCldoYXQgaXMgdGhlIGFjdHVhbCBwb3RlbnRpYWwgc2NlbmFyaW8gZm9yIGNvbmN1cnJlbmN5
IGlzc3VlcyB5b3Ugc2VlPwpFeGFtcGxlIHBscy4K
