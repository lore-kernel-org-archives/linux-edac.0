Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,2/3] acpi: apei: Rename ghes_severity() to ghes_cper_severity()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180511153947.GC12705@pd.tnic>
Date: Fri, 11 May 2018 17:39:47 +0200
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDQ6MzM6NTFQTSAtMDUwMCwgQWxleGFuZHJ1IEdhZ25p
dWMgd3JvdGU6Cj4gZ2hlc19zZXZlcml0eSgpIGlzIGEgbWlzbm9tZXIgaW4gdGhpcyBjYXNlLCBh
cyBpdCBpbXBsaWVzIHRoZSBzZXZlcml0eQo+IG9mIHRoZSBlbnRpcmUgR0hFUyBzdHJ1Y3R1cmUu
IEluc3RlYWQsIGl0IG1hcHMgb25lIENQRVIgdmFsdWUgdG8gYQo+IG1vbm90b25pY2FsbHkgaW5j
cmVhc2luZyBudW1iZXIuCgouLi4gYXMgb3Bwb3NlZCB0byBDUEVSIHNldmVyaXR5IHdoaWNoIGlz
IHNvbWV0aGluZyBlbHNlIG9yIHdoYXQgaXMgdGhpcwpmb3JtdWxhdGlvbiB0cnlpbmcgdG8gZXhw
cmVzcz8K
