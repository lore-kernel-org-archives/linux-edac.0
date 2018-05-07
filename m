Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86: Convert mce timer to hrtimer
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-Id: <20180507090443.upr4gif6mcnwt357@linutronix.de>
Date: Mon, 7 May 2018 11:04:43 +0200
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-edac@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gMjAxOC0wNS0wNCAxMzoxNDo1OCBbKzAyMDBdLCBUbyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnIHdyb3RlOgo+IEZyb206IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRl
Pgo+IAo+IG1jZV90aW1lciBpcyBzdGFydGVkIGluIGF0b21pYyBjb250ZXh0cyBvZiBjcHUgYnJp
bmd1cC4gVGhpcyByZXN1bHRzCj4gaW4gbWlnaHRfc2xlZXAoKSB3YXJuaW5ncyBvbiBSVC4gQ29u
dmVydCBtY2VfdGltZXIgdG8gYSBocnRpbWVyIHRvCj4gYXZvaWQgdGhpcy4KCkFmdGVyIGFuIGFk
ZGl0aW9uYWwgcmV2aWV3IEkgZ290IHRvIHNheSB0aGF0IHRoaXMgcGF0Y2ggY2FuIGJlIGRyb3Bw
ZWQKYXMgaXQgaXMgbm8gbG9uZ2VyIHJlcXVpcmVkLgpTb3JyeSB0byBib3RoZXIgeW91IHdpdGgg
dGhpcy4KClNlYmFzdGlhbgotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQg
dGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWVkYWMiIGluCnRoZSBib2R5IG9mIGEgbWVzc2Fn
ZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0
dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
