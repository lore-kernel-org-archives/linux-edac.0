Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] ghes_edac: add platform check to enable ghes_edac
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Message-Id: <20170721104001.3cd2b884@vento.lan>
Date: Fri, 21 Jul 2017 10:40:01 -0300
To: Borislav Petkov <bp@alien8.de>
Cc: "Kani, Toshimitsu" <toshi.kani@hpe.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

RW0gRnJpLCAyMSBKdWwgMjAxNyAxNTozNDo0MSArMDIwMApCb3Jpc2xhdiBQZXRrb3YgPGJwQGFs
aWVuOC5kZT4gZXNjcmV2ZXU6Cgo+IE9uIFRodSwgSnVsIDIwLCAyMDE3IGF0IDA3OjUwOjAzUE0g
KzAwMDAsIEthbmksIFRvc2hpbWl0c3Ugd3JvdGU6Cj4gPiBHSEVTIC8gZmlybXdhcmUtZmlyc3Qg
c3RpbGwgcmVxdWlyZXMgT1MgcmVjb3ZlcnkgYWN0aW9uc8Kgd2hlbiBhbiBlcnJvcgo+ID4gY2Fu
bm90IGJlIGNvcnJlY3RlZCBieSB0aGUgcGxhdGZvcm0uICBUaGV5IGFyZSBoYW5kbGVkIGJ5IGdo
ZXNfcHJvYygpLAo+ID4gYW5kIGdoZXNfZWRhYyByZW1haW5zIGl0cyBlcnJvci1yZXBvcnRpbmcg
d3JhcHBlci4gCgpXaGF0IGhhcHBlbnMgd2hlbiB0aGUgZXJyb3IgY2FuIGJlIGNvcnJlY3RlZD8g
RG9lcyBpdCBzdGlsbCByZXBvcnQgaXQgdG8KdXNlcnNwYWNlLCBvciBqdXN0IHNpbGVudGx5IGhp
ZGUgdGhlIGVycm9yPwoKSWYgSSByZW1lbWJlciB3ZWxsIGFib3V0IGEgcGFzdCBkaXNjdXNzaW9u
IHdpdGggc29tZSB2ZW5kb3IsIEkgd2FzIHRvbGQKdGhhdCB0aGUgZmlybXdhcmUgY2FuIGhpZGUg
c29tZSBlcnJvcnMgZnJvbSBiZWluZyByZXBvcnRlZC4gSXMgaXQKc3RpbGwgdGhlIGNhc2U/CgoK
VGhhbmtzLApNYXVybwotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhl
IGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWVkYWMiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0
byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6
Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
