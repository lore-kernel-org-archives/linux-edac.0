Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,2/2] x86/MCE/AMD: Don't report L1 BTB MCA errors on some Family 17h models
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190327192940.GJ32571@zn.tnic>
Date: Wed, 27 Mar 2019 20:29:40 +0100
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bp@suse.de" <bp@suse.de>, "tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>, "rafal@milecki.pl" <rafal@milecki.pl>, "clemej@gmail.com" <clemej@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBNYXIgMjcsIDIwMTkgYXQgMDg6MTk6NTdQTSArMDEwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDUuMC54OiBjOTViMzIz
ZGNkMzU6IHg4Ni9NQ0UvQU1EOiBUdXJuIG9mZiBNQzRfTUlTQyB0aHJlc2hvbGRpbmcgb24gYWxs
IGZhbWlseSAweDE1IG1vZGVscwo+IAo+IFdoYXQgaXMgdGhpcyBzdXBwb3NlZCB0byB0ZWxsIHVz
PwoKVGhhdCdzIHN0YWJsZSBzcGVhayBmcm9tIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUt
a2VybmVsLXJ1bGVzLnJzdApmb3IgcGF0Y2ggcHJlcmVxdWlzaXRlczoKCiJBZGRpdGlvbmFsbHks
IHNvbWUgcGF0Y2hlcyBzdWJtaXR0ZWQgdmlhIDpyZWY6YG9wdGlvbl8xYCBtYXkgaGF2ZSBhZGRp
dGlvbmFsCnBhdGNoIHByZXJlcXVpc2l0ZXMgd2hpY2ggY2FuIGJlIGNoZXJyeS1waWNrZWQuIFRo
aXMgY2FuIGJlIHNwZWNpZmllZCBpbiB0aGUKZm9sbG93aW5nIGZvcm1hdCBpbiB0aGUgc2lnbi1v
ZmYgYXJlYToKCi4uIGNvZGUtYmxvY2s6OiBub25lCgogICAgIENjOiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIyAzLjMueDogYTFmODRhMzogc2NoZWQ6IENoZWNrIGZvciBpZGxlCiAgICAgQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDMuMy54OiAxYjk1MDhmOiBzY2hlZDogUmF0ZS1s
aW1pdCBuZXdpZGxlCiAgICAgQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDMuMy54OiBm
ZDIxMDczOiBzY2hlZDogRml4IGFmZmluaXR5IGxvZ2ljCiAgICAgQ2M6IDxzdGFibGVAdmdlci5r
ZXJuZWwub3JnPiAjIDMuMy54CiAgICAgU2lnbmVkLW9mZi1ieTogSW5nbyBNb2xuYXIgPG1pbmdv
QGVsdGUuaHU+Igo=
