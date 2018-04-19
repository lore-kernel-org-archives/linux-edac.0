Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,2/4] acpi: apei: Split GHES handlers outside of ghes_do_proc
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180419164043.GC5635@pd.tnic>
Date: Thu, 19 Apr 2018 18:40:43 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, rjw@rjwysocki.net, lenb@kernel.org, tony.luck@intel.com, tbaicar@codeaurora.org, will.deacon@arm.com, james.morse@arm.com, shiju.jose@huawei.com, zjzhang@codeaurora.org, gengdongjiu@huawei.com, linux-kernel@vger.kernel.org, alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, devel@acpica.org, mchehab@kernel.org, robert.moore@intel.com, erik.schmauss@intel.com
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMTA6NDY6MTVBTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiBUaGUgYnVsayBvZiB0aGUgZnVuY3Rpb24gaXMgdGhlIGlmL2Vsc2UgbWFwcGluZyBmcm9tIFVV
SUQgdG8gZXJyb3IKPiBoYW5kbGVyLiBJIGRvbid0IHNlZSBob3cgdGhhdCBjYW4gYmUgZWFzaWx5
IHNwbGl0IHVwLCBoZW5jZSB3aHkgSQo+IG9yaWdpbmFsbHkgcmVzb3J0ZWQgdG8gdGhlIG1hcHBp
bmcuIEFzIHlvdSBzYWlkLCB3ZSdsbCBrZWVwIGl0IHNpbXBsZSBhdAo+IGZpcnN0LgoKU28gdGhh
dCBmdW5jdGlvbiBpcyA0MyBsaW5lcyBub3cuIFdoeSBhcmUgd2UgZXZlbiB0YWxraW5nIGFib3V0
IHRoaXM/IQoKSnVzdCBhZGQgeW91ciBVVUlEIGNoZWNrIHRvIHRoZSBpZi1lbHNlIHN0YXRlbWVu
dCBhbmQgYmUgZG9uZSB3aXRoIGl0CmFscmVhZHkuIE5vIGhhbmRsZXJzIG5vIG5vdGhpbmcuCg==
