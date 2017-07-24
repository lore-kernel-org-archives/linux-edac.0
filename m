Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] ghes_edac: add platform check to enable ghes_edac
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Message-Id: <20170724130402.0f05c0ba@vento.lan>
Date: Mon, 24 Jul 2017 13:04:13 -0300
To: Borislav Petkov <bp@alien8.de>
Cc: "Kani, Toshimitsu" <toshi.kani@hpe.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

RW0gTW9uLCAyNCBKdWwgMjAxNyAxNzozNzoxNiArMDIwMApCb3Jpc2xhdiBQZXRrb3YgPGJwQGFs
aWVuOC5kZT4gZXNjcmV2ZXU6Cgo+ID4gQ3VzdG9tZXJzIGRvIG5vdCBzZWUgZXJyb3IgY291bnRz
LsKgwqBJIGRvIG5vdCB0aGluayBpdCdzIGJvZ3VzLgoKPiA+IEkgYW0ganVzdCB0cnlpbmcgdG8g
ZW5hYmxlIE9TIGVycm9yIHJlcG9ydGluZyB3aXRoIGdoZXNfZWRhYy4gIAo+IAo+IEkga25vdywg
eW91IGRvbid0IGhhdmUgdG8gc3RhdGUgdGhlIG9idmlvdXMgY29uc3RhbnRseS4KClRoZSBwcm9i
bGVtIEkgc2VlIGlzIHRoYXQsIGN1cnJlbnRseSwgb24gdXNlcnMgdGhhdCBoYXZlIEVEQUMKYWxy
ZWFkeSBlbmFibGVkLCB0aGUgdXNlcnMgZ2V0cyB0aGUgZXJyb3JzIGRpcmVjdGx5IGZyb20gdGhl
CmhhcmR3YXJlLgoKSWYgdGhlIEtlcm5lbCBmb3JjZSB0aG9zZSB1c2VycyB0byB1c2UgZ2hlc19l
ZGFjIGJ5IGRlZmF1bHQsCnRoZXkgdGhleSB3b24ndCBzZWUgdGhlIGVycm9yIGNvdW50cyBhbnlt
b3JlLCBidXQsIGluc3RlYWQsCmhhcmR3YXJlIHJlcG9ydHMgdGhhdCB0aGUgbWVtb3JpZXMgbmVl
ZCB0byBiZSByZXBsYWNlZC4KCldlbGwsIGlmIHN1Y2ggdXNlcnMgYXJlIGhhbmRsaW5nIHRocmVz
aG9sZHMgdGhlbXNlbHZlcywgdGhleQp3b24ndCBzZWUgdGhvc2UgZXJyb3JzIGFueW1vcmUsIGFz
IHRoZSBlcnJvcnMgd2lsbCBiZSBtYXNrZWQuCgpUaGF0J3MgYSByZWdyZXNzaW9uLgoKU28sIHRo
ZSByaWdodCBzb2x1dGlvbiB3b3VsZCBiZSB0byBrZWVwIGhhcmR3YXJlIGZpcnN0LCBidXQKcHJv
dmlkaW5nIGEgbW9kcHJvYmUgcGFyYW1ldGVyIHRvIGxldCB0aGVtIHN3aXRjaCB0byBzb2Z0d2Fy
ZQpmaXJzdC4KClRoYW5rcywKTWF1cm8KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0
OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBh
IG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZv
IGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
