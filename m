Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,3/4] acpi: apei: Do not panic() when correctable errors are marked as fatal.
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180425173931.GD2597@pd.tnic>
Date: Wed, 25 Apr 2018 19:39:31 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, rjw@rjwysocki.net, lenb@kernel.org, tony.luck@intel.com, tbaicar@codeaurora.org, will.deacon@arm.com, james.morse@arm.com, shiju.jose@huawei.com, zjzhang@codeaurora.org, gengdongjiu@huawei.com, linux-kernel@vger.kernel.org, alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, devel@acpica.org, mchehab@kernel.org, robert.moore@intel.com, erik.schmauss@intel.com, Yazen Ghannam <yazen.ghannam@amd.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBBcHIgMjUsIDIwMTggYXQgMTI6Mjc6NTlQTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiBTVVJQUklTRSEhIQoKV2hhdCBkb2VzIHRoYXQgbWVhbj8gWW91J3ZlIGhhZCB0b28gbXVjaCBj
b2ZmZWU/Cgo+IEl0J3MgY29taW5nIChldmVudHVhbGx5KS4gSSdtIHRyeWluZyB0byBhdm9pZCBw
dXNoaW5nIG1vcmUgdGhhbiBvbmUKPiBzZXJpZXMgcGVyIHdlZWsuCgpZb3UgYmV0dGVyLiBGbG9v
ZGluZyBwZW9wbGUgd2l0aCBwYXRjaHNldHMgd29uJ3QgZ2V0IHlvdSB2ZXJ5IGZhci4K
