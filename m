Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [02/13] arm64: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-3-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:14 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Will Deacon <will.deacon@arm.com>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogQ2F0YWxpbiBNYXJp
bmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KQ2M6IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNv
bkBhcm0uY29tPgotLS0KIGFyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYyB8IDUgKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vz
cy5jCmluZGV4IDZiN2RjZjQzMTBhYy4uNDRiZWQ0MzgxNGUyIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5jCkBA
IC0zNSw3ICszNSw2IEBACiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51
eC9yZWJvb3QuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KLSNpbmNsdWRlIDxsaW51
eC9rYWxsc3ltcy5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KICNpbmNsdWRlIDxsaW51eC9j
cHUuaD4KICNpbmNsdWRlIDxsaW51eC9lbGZjb3JlLmg+CkBAIC0yMjEsOCArMjIwLDggQEAgdm9p
ZCBfX3Nob3dfcmVncyhzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAogCXNob3dfcmVnc19wcmludF9p
bmZvKEtFUk5fREVGQVVMVCk7CiAJcHJpbnRfcHN0YXRlKHJlZ3MpOwotCXByaW50X3N5bWJvbCgi
cGMgOiAlc1xuIiwgcmVncy0+cGMpOwotCXByaW50X3N5bWJvbCgibHIgOiAlc1xuIiwgbHIpOwor
CXByaW50aygicGMgOiAlcFNcbiIsICh2b2lkICopcmVncy0+cGMpOworCXByaW50aygibHIgOiAl
cFNcbiIsICh2b2lkICopbHIpOwogCXByaW50aygic3AgOiAlMDE2bGx4XG4iLCBzcCk7CiAKIAlp
ID0gdG9wX3JlZzsK
