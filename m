Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,07/11] x86, memory_failure: Introduce {set, clear}_mce_nospec()
From: "Luck, Tony" <tony.luck@intel.com>
Message-Id: <20180604170801.GA17234@agluck-desk>
Date: Mon, 4 Jun 2018 10:08:01 -0700
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-nvdimm@lists.01.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org, x86@kernel.org, hch@lst.de, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, jack@suse.cz
List-ID: <edac.vger.kernel.org>

T24gU2F0LCBKdW4gMDIsIDIwMTggYXQgMTA6MjM6MjBQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+ICtzdGF0aWMgaW5saW5lIGludCBzZXRfbWNlX25vc3BlYyh1bnNpZ25lZCBsb25nIHBm
bikKPiArewo+ICsJaW50IHJjOwo+ICsKPiArCXJjID0gc2V0X21lbW9yeV91YygodW5zaWduZWQg
bG9uZykgX192YShQRk5fUEhZUyhwZm4pKSwgMSk7CgpZb3Ugc2hvdWxkIHJlYWxseSBkbyB0aGUg
ZGVjb3lfYWRkciB0aGluZyBoZXJlIHRoYXQgSSBoYWQgaW4gbWNlX3VubWFwX2twZm4oKS4KUHV0
dGluZyB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIHRoZSBwYWdlIHlvdSBtdXN0bid0IGFjY2lkZW50
YWxseSBwcmVmZXRjaApmcm9tIGludG8gYSByZWdpc3RlciBpcyBhIHByZXR0eSBnb29kIHdheSB0
byBtYWtlIHN1cmUgdGhhdCB0aGUgcHJvY2Vzc29yCmRvZXMgZG8gYSBwcmVmZXRjaC4KCi1Ub255
Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJz
Y3JpYmUgbGludXgtZWRhYyIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2
Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVs
Lm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
