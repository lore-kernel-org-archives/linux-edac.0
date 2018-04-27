Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86, mce: Fix stack out-of-bounds write in mce-inject.c:flags_read()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180427165939.GG15229@pd.tnic>
Date: Fri, 27 Apr 2018 18:59:39 +0200
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, linux-edac@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBBcHIgMjcsIDIwMTggYXQgMDk6Mzc6MDhBTSAtMDcwMCwgTHVjaywgVG9ueSB3cm90
ZToKPiBFYWNoIG9mIHRoZSBzdHJpbmdzIHRoYXQgd2Ugd2FudCB0byBwdXQgaW50byB0aGUgYnVm
W01BWF9GTEFHX09QVF9TSVpFXQo+IGluIGZsYWdzX3JlYWQoKSBpcyB0d28gY2hhcmFjdGVycy4g
QnV0IHRoZSBzcHJpbnRmKCkgYWRkcyBhIHRyYWlsaW5nIG5ld2xpbmUKPiBhbmQgd2lsbCBhZGQg
YSB0ZXJtaW5hdGluZyBOVUwgYnl0ZS4gU28gTUFYX0ZMQUdfT1BUX1NJWkUgbmVlZHMgdG8gYmUg
NC4KCi4uLiBhbmQgSSBkdW1wZWQgdGhlIG4gaGVyZToKCgluID0gc3ByaW50ZihidWYsICIlc1xu
IiwgZmxhZ3Nfb3B0aW9uc1tpbmpfdHlwZV0pCgphbmQgaXQgd2FzIDMgYnV0IHNwcmludGYoKSBj
YWxscyB2c25wcmludGYoKSBhbmQgKnRoYXQqIGRvZXMgcmV0dXJuOgoKIiAqIFRoZSByZXR1cm4g
dmFsdWUgaXMgdGhlIG51bWJlciBvZiBjaGFyYWN0ZXJzIHdoaWNoIHdvdWxkCiAqIGJlIGdlbmVy
YXRlZCBmb3IgdGhlIGdpdmVuIGlucHV0LCBleGNsdWRpbmcgdGhlIHRyYWlsaW5nCiAqICdcMCcs
IGFzIHBlciBJU08gQzk5LiIKClNvIEknbGwgZXh0ZW5kIHRoZSBjb21taXQgbWVzc2FnZSB3aXRo
IHRoYXQgYW5kIGFwcGx5IGl0LgoKVGhhbmtzLgo=
