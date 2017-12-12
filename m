Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [00/13] replace print_symbol() with printk()-s
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171212024757.GC7798@jagdpanzerIV>
Date: Tue, 12 Dec 2017 11:47:57 +0900
To: Joe Perches <joe@perches.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gKDEyLzExLzE3IDA4OjI2KSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gTW9uLCAyMDE3LTEy
LTExIGF0IDIxOjUwICswOTAwLCBTZXJnZXkgU2Vub3poYXRza3kgd3JvdGU6Cj4gPiBwcmludF9z
eW1ib2wKPiAKPiBZYXkuCj4gCj4gSnVzdCBhYm91dCBleGFjdGx5IDUgeWVhcnMgZWFybGllci4u
Lgo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1hcm0ta2VybmVs
LzIwMTItRGVjZW1iZXIvMTM3MTIxLmh0bWwKCmluZGVlZCA6KQoKaG9wZWZ1bGx5IGl0IHdvbid0
IHRha2UgdXMgYW5vdGhlciA1IHllYXJzIHRvIGZpbmFsbHkKLS0tCgogaW5jbHVkZS9saW51eC9r
YWxsc3ltcy5oIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCgotLS0KCgktc3MKLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNl
bmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWVkYWMiIGluCnRoZSBib2R5IG9mIGEgbWVz
c2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQg
IGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgva2FsbHN5bXMuaCBiL2luY2x1ZGUvbGludXgva2FsbHN5bXMuaAppbmRl
eCA3Mjg4ZjljMzk1YjYuLjc5NGZkMzVjYWQ0YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9r
YWxsc3ltcy5oCisrKyBiL2luY2x1ZGUvbGludXgva2FsbHN5bXMuaApAQCAtMTc2LDcgKzE3Niw4
IEBAIHZvaWQgX19jaGVja19wcmludHN5bV9mb3JtYXQoY29uc3QgY2hhciAqZm10LCAuLi4pCiB7
CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBwcmludF9zeW1ib2woY29uc3QgY2hhciAqZm10LCB1
bnNpZ25lZCBsb25nIGFkZHIpCitzdGF0aWMgaW5saW5lIHZvaWQgX19kZXByZWNhdGVkIHByaW50
X3N5bWJvbChjb25zdCBjaGFyICpmbXQsCisJCQkJCSAgICAgdW5zaWduZWQgbG9uZyBhZGRyKQog
ewogCV9fY2hlY2tfcHJpbnRzeW1fZm9ybWF0KGZtdCwgIiIpOwogCV9fcHJpbnRfc3ltYm9sKGZt
dCwgKHVuc2lnbmVkIGxvbmcpCg==
