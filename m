Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/5] x86: Convert some slow-path static_cpu_has() callers to boot_cpu_has()
From: Juergen Gross <jgross@suse.com>
Message-Id: <9b1c18da-d337-7c9d-52fe-854375eb8d55@suse.com>
Date: Sat, 30 Mar 2019 13:50:48 +0100
To: Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Nadav Amit <nadav.amit@gmail.com>, Andy Lutomirski <luto@amacapital.net>, Peter Zijlstra <peterz@infradead.org>, Aubrey Li <aubrey.li@intel.com>, Dave Hansen <dave.hansen@intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Joerg Roedel <jroedel@suse.de>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, linux-edac@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Rik van Riel <riel@surriel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, virtualization@lists.linux-foundation.org, x86@kernel.org
List-ID: <edac.vger.kernel.org>

T24gMzAvMDMvMjAxOSAxMjoyMCwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+IEZyb206IEJvcmlz
bGF2IFBldGtvdiA8YnBAc3VzZS5kZT4KPiAKPiBVc2luZyBzdGF0aWNfY3B1X2hhcygpIGlzIHBv
aW50bGVzcyBvbiB0aG9zZSBwYXRocywgY29udmVydCB0aGVtIHRvIHRoZQo+IGJvb3RfY3B1X2hh
cygpIHZhcmlhbnQuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+IAo+IFJlcG9ydGVkLWJ5
OiBOYWRhdiBBbWl0IDxuYWRhdi5hbWl0QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCb3Jp
c2xhdiBQZXRrb3YgPGJwQHN1c2UuZGU+CgpGb3IgdGhlIHBhcmF2aXJ0IHBhcnQ6IFJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgo=
