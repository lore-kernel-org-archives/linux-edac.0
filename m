Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,2/3] acpi: apei: Rename ghes_severity() to ghes_cper_severity()
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Message-Id: <56d445b2-ace3-6ee2-9699-f2a684518de9@gmail.com>
Date: Fri, 11 May 2018 10:45:49 -0500
To: Borislav Petkov <bp@alien8.de>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gMDUvMTEvMjAxOCAxMDozOSBBTSwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+IE9uIE1vbiwg
QXByIDMwLCAyMDE4IGF0IDA0OjMzOjUxUE0gLTA1MDAsIEFsZXhhbmRydSBHYWduaXVjIHdyb3Rl
Ogo+PiBnaGVzX3NldmVyaXR5KCkgaXMgYSBtaXNub21lciBpbiB0aGlzIGNhc2UsIGFzIGl0IGlt
cGxpZXMgdGhlIHNldmVyaXR5Cj4+IG9mIHRoZSBlbnRpcmUgR0hFUyBzdHJ1Y3R1cmUuIEluc3Rl
YWQsIGl0IG1hcHMgb25lIENQRVIgdmFsdWUgdG8gYQo+PiBtb25vdG9uaWNhbGx5IGluY3JlYXNp
bmcgbnVtYmVyLgo+IAo+IC4uLiBhcyBvcHBvc2VkIHRvIENQRVIgc2V2ZXJpdHkgd2hpY2ggaXMg
c29tZXRoaW5nIGVsc2Ugb3Igd2hhdCBpcyB0aGlzCj4gZm9ybXVsYXRpb24gdHJ5aW5nIHRvIGV4
cHJlc3M/Cj4gCgpDUEVSIG1hZG5lc3MgZ29lcyBsaWtlIHRoaXM6CgkwIC0gUmVjb3ZlcmFibGUK
CTEgLSBGYXRhbAoJMiAtIENvcnJlY3RlZAoJMyAtIE5vbmUKCkFzIHlvdSBjYW4gc2VlLCB0aGUg
bnVtYmVyaW5nIHdhcyBjcmVhdGVkIGJ5IGNyYWNrbW9ua2V5cy4gR0hFU18qIGlzIGFuCmludGVy
bmFsIGVudW0gdGhhdCBnb2VzIHVwIGluIG9yZGVyIG9mIHNldmVyaXR5LCBhcyB5b3UnZCBleHBl
Y3QuCgpJZiB5b3UncmUgY29uZnVzZWQsIHlvdSdyZSBub3QgYWxvbmUuIEkndmUgc2VlbiBzZXZl
cmFsIGNvbW1pdCBtZXNzYWdlcwp0aGF0IGdldCB0aGlzIHRlcm1pbm9sb2d5IHdyb25nLgoKQWxl
eAotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vi
c2NyaWJlIGxpbnV4LWVkYWMiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9A
dmdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5l
bC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
