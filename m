Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v9,1/6] edac: synopsys: Add error handling for NULL in probe()
From: Manish Narani <manish.narani@xilinx.com>
Message-Id: <1539581388-23963-2-git-send-email-manish.narani@xilinx.com>
Date: Mon, 15 Oct 2018 10:59:43 +0530
To: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, bp@alien8.de, mchehab@kernel.org, manish.narani@xilinx.com, amit.kucheria@linaro.org, sudeep.holla@arm.com, olof@lixom.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-ID: <edac.vger.kernel.org>

VGhlIGZ1bmN0aW9uIG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpIGNhbiByZXR1cm4gTlVMTCBp
biBjYXNlIG9mCmVycm9yLiBBZGQgZXJyb3IgaGFuZGxpbmcgZm9yIHRoZSBzYW1lIGluIHByb2Jl
KCkuCgpTaWduZWQtb2ZmLWJ5OiBNYW5pc2ggTmFyYW5pIDxtYW5pc2gubmFyYW5pQHhpbGlueC5j
b20+Ci0tLQogZHJpdmVycy9lZGFjL3N5bm9wc3lzX2VkYWMuYyB8IDMgKysrCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9lZGFjL3N5bm9wc3lz
X2VkYWMuYyBiL2RyaXZlcnMvZWRhYy9zeW5vcHN5c19lZGFjLmMKaW5kZXggMWMzNzk1ZC4uMDAw
NWVmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9lZGFjL3N5bm9wc3lzX2VkYWMuYworKysgYi9kcml2
ZXJzL2VkYWMvc3lub3BzeXNfZWRhYy5jCkBAIC00NzcsNiArNDc3LDkgQEAgc3RhdGljIGludCBt
Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VSUihi
YXNlYWRkcik7CiAKIAlwX2RhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRl
dik7CisJaWYgKCFwX2RhdGEpCisJCXJldHVybiAtRU5PREVWOworCiAJaWYgKCFwX2RhdGEtPmdl
dF9lY2Nfc3RhdGUoYmFzZWFkZHIpKSB7CiAJCWVkYWNfcHJpbnRrKEtFUk5fSU5GTywgRURBQ19N
QywgIkVDQyBub3QgZW5hYmxlZFxuIik7CiAJCXJldHVybiAtRU5YSU87Cg==
