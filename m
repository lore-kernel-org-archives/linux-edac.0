Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,08/12] x86/memory_failure: Introduce {set, clear}_mce_nospec()
From: "Luck, Tony" <tony.luck@intel.com>
Message-Id: <20180607170214.GA21636@agluck-desk>
Date: Thu, 7 Jun 2018 10:02:14 -0700
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org, X86 ML <x86@kernel.org>, Christoph Hellwig <hch@lst.de>, Linux MM <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBKdW4gMDYsIDIwMTggYXQgMDk6NDI6MjhQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+ID4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+ID4gQ2M6
IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+ID4gQ2M6ICJILiBQZXRlciBBbnZpbiIg
PGhwYUB6eXRvci5jb20+Cj4gPiBDYzogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPgo+
IAo+IFRvbnksIHNhZmUgdG8gYXNzdW1lIHlvdSBhcmUgb2sgd2l0aCB0aGlzIHBhdGNoIG5vdyB0
aGF0IHRoZQo+IGRlY295X2FkZHIgYXBwcm9hY2ggaXMgYmFjaz8KPiAKClllcy4gcy9DYy9BY2tl
ZC1ieS8gZm9yIG15IGxpbmUgYWJvdmUuCgotVG9ueQotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0
aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWVkYWMiIGluCnRoZSBi
b2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jk
b21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
