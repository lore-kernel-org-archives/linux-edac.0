Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4/7] seq_buf: Export seq_buf_printf() to modules
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170825102411.8682-5-bp@alien8.de>
Date: Fri, 25 Aug 2017 12:24:08 +0200
To: linux-edac <linux-edac@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>, Yazen Ghannam <Yazen.Ghannam@amd.com>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

RnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgoKV2lsbCBiZSB1c2VkIGluIGEgbW9k
dWxlIGluIGEgbGF0ZXIgcGF0Y2guCgpTaWduZWQtb2ZmLWJ5OiBCb3Jpc2xhdiBQZXRrb3YgPGJw
QHN1c2UuZGU+CkFja2VkLWJ5OiBTdGV2ZW4gUm9zdGVkdCAoVk13YXJlKSA8cm9zdGVkdEBnb29k
bWlzLm9yZz4KLS0tCiBsaWIvc2VxX2J1Zi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9saWIvc2VxX2J1Zi5jIGIvbGliL3NlcV9idWYuYwppbmRl
eCBjYjE4NDY5ZTFmNDkuLmI1MjE3Y2YxODI0ZCAxMDA2NDQKLS0tIGEvbGliL3NlcV9idWYuYwor
KysgYi9saWIvc2VxX2J1Zi5jCkBAIC05MCw2ICs5MCw3IEBAIGludCBzZXFfYnVmX3ByaW50Zihz
dHJ1Y3Qgc2VxX2J1ZiAqcywgY29uc3QgY2hhciAqZm10LCAuLi4pCiAKIAlyZXR1cm4gcmV0Owog
fQorRVhQT1JUX1NZTUJPTF9HUEwoc2VxX2J1Zl9wcmludGYpOwogCiAjaWZkZWYgQ09ORklHX0JJ
TkFSWV9QUklOVEYKIC8qKgo=
