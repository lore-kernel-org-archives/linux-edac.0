Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,2/3] acpi: apei: Rename ghes_severity() to ghes_cper_severity()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180511161933.GG12705@pd.tnic>
Date: Fri, 11 May 2018 18:19:33 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgMTE6MTI6MjRBTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiBCZWNhdXNlIHRoZSBHSEVTIHN0cnVjdHVyZSB1c2VzIENQRVIgdmFsdWVzLCBidXQgYWxsIHRo
ZSBjb2RlIGlzIHdyaXR0ZW4KPiB0byB1c2UgR0hFU19TRVZfIHZhbHVlcy4gR0hFU19TRVZfIGlz
IGEgbWFkZSB1cCBlbnVtLCBzcGVjaWZpY2FsbHkgZm9yCj4gbGludXguCgpBZ2Fpbiwgd2hhdCBk
b2VzIHRoYXQgZXZlbiBtYXR0ZXI/CgpUaGV5J3JlIGRlZmluZXMgaW4gYm90aCBjYXNlcy4gVGhl
ICphY3R1YWwqIHZhbHVlIG1lYW5zIHNoaXQuCgpBaCwgSSBzZWUgaXQ6CgoJLi4uCgkJc2VjX3Nl
diA9IGdoZXNfc2VjX3BjaWVfc2V2ZXJpdHkoZ2RhdGEpOwoKCXdvcnN0X3NldiA9IG1heCh3b3Jz
dF9zZXYsIHNlY19zZXYpOwoKClllYWgsIG5vLCB5b3UgY2FuJ3QgZG8gdGhhdC4gTm8gYXBwbGVz
IGFuZCBvcmFuZ2VzIGNvbXBhcmlzb25zLgo=
