Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,2/4] acpi: apei: Split GHES handlers outside of ghes_do_proc
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180419152933.GD3600@pd.tnic>
Date: Thu, 19 Apr 2018 17:29:33 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, rjw@rjwysocki.net, lenb@kernel.org, tony.luck@intel.com, tbaicar@codeaurora.org, will.deacon@arm.com, james.morse@arm.com, shiju.jose@huawei.com, zjzhang@codeaurora.org, gengdongjiu@huawei.com, linux-kernel@vger.kernel.org, alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, devel@acpica.org, mchehab@kernel.org, robert.moore@intel.com, erik.schmauss@intel.com
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDk6NTc6MDhBTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiBBbmQgdGhhdCB3YXMgdGhlIG1vdGl2YXRpb24gYmVoaW5kIG15IHNwbGl0dGluZyBpdCBpbiB0
aGlzIHBhdGNoLgoKQnkgInNwbGl0IiBJIGRvbid0IG1lYW4gYWRkIGEgZnVuY3Rpb24gcG9pbnRl
ciB3aGljaCBnZXRzIHNlbGVjdGVkIGFuZAp0aGVuIGNhbGxlZCAtIGlmIHRoZSBmdW5jdGlvbiBi
ZWNvbWVzIHRvbyBsb25nLCB5b3Ugc2ltcGx5IHNwbGl0IHRoZQpmdW5jdGlvbiBib2R5IHByb3Bl
cmx5LgoKPiBZb3UgZG9uJ3QgbmVlZCB0aGUgZW50aXJlIEdIRVMgc3RydWN0dXJlIC0tIHdpZGUg
Y29udGV4dC4gSW5kaXZpZHVhbAo+IGhhbmRsZXJzIHNob3VsZCBub3QgYmUgYWJsZSB0byBhY2Nl
c3MgdGhlIGVudGlyZSBnaGVzLgoKQnV0IHlvdSByZW1vdmUgdGhlIEBnaGVzIGFyZ3VtZW50IGlu
IHBhdGNoIDEuIFNvIHdoYXQgYXJlIHdlIGV2ZW4KdGFsa2luZyBhYm91dD8K
