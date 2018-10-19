Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,1/5] EDAC, skx_edac: Fix function calling order in skx_exit()
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Message-Id: <1539938681-24068-1-git-send-email-qiuxu.zhuo@intel.com>
Date: Fri, 19 Oct 2018 16:44:41 +0800
To: bp@alien8.de
Cc: tony.luck@intel.com, rafael.j.wysocki@intel.com, mchehab@osg.samsung.com, arozansk@redhat.com, linux-edac@vger.kernel.org, linux-acpi@vger.kernel.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>
List-ID: <edac.vger.kernel.org>

VGhlIG9yZGVyIG9mIGZ1bmN0aW9uIGNhbGxpbmcgaW4gc2t4X2V4aXQoKSBpcyBub3QgdGhlIHJl
dmVyc2VkCm9yZGVyIGluIHNreF9pbml0KCkuIEZpeCBpdCBieSBtb3Zpbmcgc2t4X3JlbW92ZSgp
IHRvIHRoZSBsYXN0LgoKU2lnbmVkLW9mZi1ieTogUWl1eHUgWmh1byA8cWl1eHUuemh1b0BpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9lZGFjL3NreF9lZGFjLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Vk
YWMvc2t4X2VkYWMuYyBiL2RyaXZlcnMvZWRhYy9za3hfZWRhYy5jCmluZGV4IGRkMjA5ZTBkZDlh
Yi4uZDI2NGU5MzM2OTVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2VkYWMvc2t4X2VkYWMuYworKysg
Yi9kcml2ZXJzL2VkYWMvc2t4X2VkYWMuYwpAQCAtMTE3NSw4ICsxMTc1LDggQEAgc3RhdGljIHZv
aWQgX19leGl0IHNreF9leGl0KHZvaWQpCiB7CiAJZWRhY19kYmcoMiwgIlxuIik7CiAJbWNlX3Vu
cmVnaXN0ZXJfZGVjb2RlX2NoYWluKCZza3hfbWNlX2RlYyk7Ci0Jc2t4X3JlbW92ZSgpOwogCXRl
YXJkb3duX3NreF9kZWJ1ZygpOworCXNreF9yZW1vdmUoKTsKIH0KIAogbW9kdWxlX2luaXQoc2t4
X2luaXQpOwo=
