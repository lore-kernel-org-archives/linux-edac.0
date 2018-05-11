Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,3/3] acpi: apei: Do not panic() on PCIe errors reported through GHES
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180511174112.GI12705@pd.tnic>
Date: Fri, 11 May 2018 19:41:12 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgMTI6MDE6NTJQTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuIHdpdGggdW5oYW5kbGVkIEFFUiBlcnJvcnMgZXZv
bHZpbmcgaW50byBNQ0Uncy4KPiBUaGF0J3MgZXh0cmVtZWx5IHJhcmUsIGJ1dCB3aGVuIGl0IGhh
cHBlbnMgeW91IHN0aWxsIHBhbmljIGR1ZSB0byB0aGUKPiBNQ0UuCgpJIGRvbid0IGxpa2UgbGVh
dmluZyBob2xlcyBpbiB0aGUgaGFuZGxpbmcgb2YgUENJZSBlcnJvcnMuIFlvdSBuZWVkIHRvCmhh
bmRsZSBvbmx5IHRob3NlIGVycm9ycyB3aGljaCBhcmUgY2F1c2VkIGJ5IGhvdC1yZW1vdmFsIGFu
ZCBub3QgYWZmZWN0Cm90aGVyIGVycm9yIHR5cGVzLiBPciBkbyBhIGNvbXByZWhlbnNpdmUgUENJ
ZSBlcnJvcnMgaGFuZGxpbmcgb2YgYWxsCmVycm9ycyBpbiB0aGUgQUVSIGRyaXZlci4K
