Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] ghes_edac: add platform check to enable ghes_edac
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170724164400.GB18184@nazgul.tnic>
Date: Mon, 24 Jul 2017 18:44:00 +0200
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: "Kani, Toshimitsu" <toshi.kani@hpe.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBKdWwgMjQsIDIwMTcgYXQgMDE6MDQ6MTNQTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IElmIHRoZSBLZXJuZWwgZm9yY2UgdGhvc2UgdXNlcnMgdG8gdXNlIGdo
ZXNfZWRhYyBieSBkZWZhdWx0LAo+IHRoZXkgdGhleSB3b24ndCBzZWUgdGhlIGVycm9yIGNvdW50
cyBhbnltb3JlLCBidXQsIGluc3RlYWQsCj4gaGFyZHdhcmUgcmVwb3J0cyB0aGF0IHRoZSBtZW1v
cmllcyBuZWVkIHRvIGJlIHJlcGxhY2VkLgoKVGhpcyBpcyBleGFjdGx5IHdoeSBJJ20gdHJ5aW5n
IHRvIGxvYWQgZ2hlc19lZGFjIG9ubHkgb24gdGhvc2UgcGxhdGZvcm1zCndoaWNoIHdvdWxkIHJl
YWxseSB3YW50IGl0LgoKPiBTbywgdGhlIHJpZ2h0IHNvbHV0aW9uIHdvdWxkIGJlIHRvIGtlZXAg
aGFyZHdhcmUgZmlyc3QsIGJ1dAo+IHByb3ZpZGluZyBhIG1vZHByb2JlIHBhcmFtZXRlciB0byBs
ZXQgdGhlbSBzd2l0Y2ggdG8gc29mdHdhcmUKPiBmaXJzdC4KClRoYXQncyBleGFjdGx5IHRoZSBp
c3N1ZTogaWYgd2UgbWFrZSBpdCBzcGVjLWNvbmZvcm0gYW5kIGFkaGVyZSB0byBGRgpzZXR0aW5n
LCB0aGVuIGl0J2xsIGJlIGNsZWFuLiBCVVQoISksIHdlIHdpbGwgZm9yY2UgZ2hlc19lZGFjIG9u
IHRob3NlCnBsYXRmb3JtcyB3aGljaCBwb3RlbnRpYWxseSBhcmUgdXNpbmcgdGhlIHBsYXRmb3Jt
LXNwZWNpZmljIGRyaXZlcnMKdW50aWwgbm93LiBOb3QgZ29vZC4KCklmIHdlIGRvIHRoZSB3aGl0
ZWxpc3RpbmcsIHRoZW4gd2UncmUgc3R1Y2sgd2l0aCBtYWludGFpbmluZyBhIHl1Y2t5CndoaXRl
bGlzdCBhbmQgaGF2ZSB0byBrZWVwIHVwZGF0aW5nIGdoZXNfZWRhYyB3aXRoIGl0LgoKU28gd2Un
cmUgYmFzaWNhbGx5IGJldHdlZW4gYSByb2NrIGFuZCBhIGhhcmQgcGxhY2UuCgpJZiBJIGhhZCB0
byBjaG9vc2UgKnJpZ2h0KiAqbm93KiwgSSdkIHByb2JhYmx5IGxlYW4gc2xpZ2h0bHkgdG93YXJk
cyB0aGUKd2hpdGVsaXN0IGFzIGl0IHdvbid0IGJyZWFrIGV4aXN0aW5nIHVzZXJzLgoKQSBiaWcg
Z3J1bXBmeS1ncnVtYmx5IGhtbW0uIDotXAo=
