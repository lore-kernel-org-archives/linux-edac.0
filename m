Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/5] x86: Convert some slow-path static_cpu_has() callers to boot_cpu_has()
From: Rik van Riel <riel@surriel.com>
Message-Id: <c95e80728f218e94e96875a598a3f78fcf15ac82.camel@surriel.com>
Date: Sat, 30 Mar 2019 08:47:20 -0400
To: Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Nadav Amit <nadav.amit@gmail.com>, Andy Lutomirski <luto@amacapital.net>, Peter Zijlstra <peterz@infradead.org>, Aubrey Li <aubrey.li@intel.com>, Dave Hansen <dave.hansen@intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Joerg Roedel <jroedel@suse.de>, Juergen Gross <jgross@suse.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, linux-edac@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, virtualization@lists.linux-foundation.org, x86@kernel.org
List-ID: <edac.vger.kernel.org>

T24gU2F0LCAyMDE5LTAzLTMwIGF0IDEyOjIwICswMTAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
Cj4gRnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgo+IAo+IFVzaW5nIHN0YXRpY19j
cHVfaGFzKCkgaXMgcG9pbnRsZXNzIG9uIHRob3NlIHBhdGhzLCBjb252ZXJ0IHRoZW0gdG8KPiB0
aGUKPiBib290X2NwdV9oYXMoKSB2YXJpYW50LgoKT2gsIG5pY2UuIFRoYXQgbmFtZSBtdWNoIGJl
dHRlciBjb252ZXlzIHdoYXQgaXQgZG9lcy4KClJldmlld2VkLWJ5OiBSaWsgdmFuIFJpZWwgPHJp
ZWxAc3VycmllbC5jb20+Cg==
