Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,2/4] acpi: apei: Split GHES handlers outside of ghes_do_proc
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180419143018.GC3600@pd.tnic>
Date: Thu, 19 Apr 2018 16:30:19 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, rjw@rjwysocki.net, lenb@kernel.org, tony.luck@intel.com, tbaicar@codeaurora.org, will.deacon@arm.com, james.morse@arm.com, shiju.jose@huawei.com, zjzhang@codeaurora.org, gengdongjiu@huawei.com, linux-kernel@vger.kernel.org, alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, devel@acpica.org, mchehab@kernel.org, robert.moore@intel.com, erik.schmauss@intel.com
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDk6MTk6MDNBTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiBPbiB0aGUgb3RoZXIgc2lkZSwgeW91IGxvc2UgcmVhZGFiaWxpdHkgYXMgc29vbiBhcyB5b3Ug
Z2V0IGEgZmV3IG1vcmUKPiBoYW5kbGVycyBhbmQgdGhlIGZ1bmN0aW9uIGJlY29tZXMgdG9vIGxv
bmcuCgpObyB5b3UgZG9uJ3QgLSB5b3Ugc3BsaXQgaXQgcHJvcGVybHkuCgo+IEFuZCBtb3JlIGlt
cG9ydGFudGx5LCB5b3UgbG9zZSBnZW5lcmFsaXR5OiBpdCdzIG5vdCBvYnZpb3VzIHRoYXQKPiB0
aGVyZSdzIGdoZXNfZWRhY19yZXBvcnRfbWVtX2Vycm9yKCkgd2hpY2ggdG9vIHdpZGUgYSBjb250
ZXh0LgoKSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgdGhhdCBtZWFucy4K
