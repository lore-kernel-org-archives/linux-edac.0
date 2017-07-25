Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,5/8] seq_buf: Export seq_buf_printf() to modules
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170725154601.27427-6-bp@alien8.de>
Date: Tue, 25 Jul 2017 17:45:58 +0200
To: linux-edac <linux-edac@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>, Yazen Ghannam <Yazen.Ghannam@amd.com>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

RnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgoKV2lsbCBiZSB1c2VkIGluIGEgbW9k
dWxlIGluIGEgbGF0ZXIgcGF0Y2guCgpTaWduZWQtb2ZmLWJ5OiBCb3Jpc2xhdiBQZXRrb3YgPGJw
QHN1c2UuZGU+CkNjOiBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4KLS0tCiBs
aWIvc2VxX2J1Zi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9saWIvc2VxX2J1Zi5jIGIvbGliL3NlcV9idWYuYwppbmRleCBjYjE4NDY5ZTFmNDku
LmI1MjE3Y2YxODI0ZCAxMDA2NDQKLS0tIGEvbGliL3NlcV9idWYuYworKysgYi9saWIvc2VxX2J1
Zi5jCkBAIC05MCw2ICs5MCw3IEBAIGludCBzZXFfYnVmX3ByaW50ZihzdHJ1Y3Qgc2VxX2J1ZiAq
cywgY29uc3QgY2hhciAqZm10LCAuLi4pCiAKIAlyZXR1cm4gcmV0OwogfQorRVhQT1JUX1NZTUJP
TF9HUEwoc2VxX2J1Zl9wcmludGYpOwogCiAjaWZkZWYgQ09ORklHX0JJTkFSWV9QUklOVEYKIC8q
Kgo=
