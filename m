Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,2/2] x86/MCE/AMD: Don't report L1 BTB MCA errors on some Family 17h models
From: Thomas Gleixner <tglx@linutronix.de>
Message-Id: <alpine.DEB.2.21.1903272036350.1789@nanos.tec.linutronix.de>
Date: Wed, 27 Mar 2019 20:37:04 +0100 (CET)
To: Borislav Petkov <bp@alien8.de>
Cc: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bp@suse.de" <bp@suse.de>, "tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>, "rafal@milecki.pl" <rafal@milecki.pl>, "clemej@gmail.com" <clemej@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCAyNyBNYXIgMjAxOSwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgoKPiBPbiBXZWQsIE1h
ciAyNywgMjAxOSBhdCAwODoxOTo1N1BNICswMTAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4g
PiA+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA1LjAueDogYzk1YjMyM2RjZDM1OiB4
ODYvTUNFL0FNRDogVHVybiBvZmYgTUM0X01JU0MgdGhyZXNob2xkaW5nIG9uIGFsbCBmYW1pbHkg
MHgxNSBtb2RlbHMKPiA+IAo+ID4gV2hhdCBpcyB0aGlzIHN1cHBvc2VkIHRvIHRlbGwgdXM/Cj4g
Cj4gVGhhdCdzIHN0YWJsZSBzcGVhayBmcm9tIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUt
a2VybmVsLXJ1bGVzLnJzdAo+IGZvciBwYXRjaCBwcmVyZXF1aXNpdGVzOgo+IAo+ICJBZGRpdGlv
bmFsbHksIHNvbWUgcGF0Y2hlcyBzdWJtaXR0ZWQgdmlhIDpyZWY6YG9wdGlvbl8xYCBtYXkgaGF2
ZSBhZGRpdGlvbmFsCj4gcGF0Y2ggcHJlcmVxdWlzaXRlcyB3aGljaCBjYW4gYmUgY2hlcnJ5LXBp
Y2tlZC4gVGhpcyBjYW4gYmUgc3BlY2lmaWVkIGluIHRoZQo+IGZvbGxvd2luZyBmb3JtYXQgaW4g
dGhlIHNpZ24tb2ZmIGFyZWE6Cj4gCj4gLi4gY29kZS1ibG9jazo6IG5vbmUKPiAKPiAgICAgIENj
OiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyAzLjMueDogYTFmODRhMzogc2NoZWQ6IENoZWNr
IGZvciBpZGxlCj4gICAgICBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgMy4zLng6IDFi
OTUwOGY6IHNjaGVkOiBSYXRlLWxpbWl0IG5ld2lkbGUKPiAgICAgIENjOiA8c3RhYmxlQHZnZXIu
a2VybmVsLm9yZz4gIyAzLjMueDogZmQyMTA3Mzogc2NoZWQ6IEZpeCBhZmZpbml0eSBsb2dpYwo+
ICAgICAgQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDMuMy54Cj4gICAgICBTaWduZWQt
b2ZmLWJ5OiBJbmdvIE1vbG5hciA8bWluZ29AZWx0ZS5odT4iCgpDdXRlLiBXYXNuJ3QgYXdhcmUg
b2YgdGhhdC4KClRoYW5rcyBmb3IgdGhlIGVkdWNhdGlvbiEKCiAgICAgICB0Z2x4Cg==
