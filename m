Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] ghes_edac: add platform check to enable ghes_edac
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Message-Id: <20170720151651.5e74aee7@vento.lan>
Date: Thu, 20 Jul 2017 15:16:51 -0300
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Kani, Toshimitsu" <toshi.kani@hpe.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

RW0gVGh1LCAyMCBKdWwgMjAxNyAxOTowNTowNCArMDIwMApCb3Jpc2xhdiBQZXRrb3YgPGJwQGFs
aWVuOC5kZT4gZXNjcmV2ZXU6Cgo+IE9uIFRodSwgSnVsIDIwLCAyMDE3IGF0IDA0OjU1OjU5UE0g
KzAwMDAsIEx1Y2ssIFRvbnkgd3JvdGU6Cj4gPiBBZGQgYSBtb2R1bGUgcGFyYW1ldGVyIHRvIHRo
b3NlIGVkYWMgZHJpdmVycyB0aGF0IGNhbiBvdmVycmlkZSB0aGUgY2hlY2sKPiA+IGFuZCBsZXQg
dGhlbSBsb2FkIGFueXdheS4gIEknbSBub3QgcGFyYW5vaWQsIEkganVzdCBhc3N1bWUgdGhhdCB0
aGVyZSBpcyBhIEJJT1MKPiA+IG91dCB0aGVyZSB0aGF0IHNldHMgdGhlIE9TQy9XSEVBIGJpdHMs
IGJ1dCBpc24ndCBnZW5lcmF0aW5nIHVzZWZ1bCBHSEVTIGxvZ3MuICAKPiAKPiBPciBhZGQgdGhh
dCBwYXJhbWV0ZXIgdG8gZWRhY19jb3JlLmtvIGFuZCBsZXQgaXQgY29udHJvbCB3aGljaCBFREFD
Cj4gZHJpdmVyIGdldHMgbG9hZGVkPyBTb21ldGhpbmcgbGlrZQo+IAo+IGVkYWM9aWdub3JlX2do
ZXMKPiAKPiBvciBzby4gQW5kIHRoZW4gdGhlIG90aGVyIEVEQUMgZHJpdmVycyBxdWVyeSBpdC4K
CldvcmtzIGZvciBtZS4KClRoYW5rcywKTWF1cm8KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9k
eSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9t
byBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
