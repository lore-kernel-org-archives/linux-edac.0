Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [02/15] drm: make device_type const
From: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <20170825133623.3jbkpvq5k62rabf5@phenom.ffwll.local>
Date: Fri, 25 Aug 2017 15:36:24 +0200
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gU2F0LCBBdWcgMTksIDIwMTcgYXQgMDE6NTI6MTNQTSArMDUzMCwgQmh1bWlrYSBHb3lhbCB3
cm90ZToKPiBNYWtlIHRoZXNlIGNvbnN0IGFzIHRoZXkgYXJlIG9ubHkgc3RvcmVkIGluIHRoZSB0
eXBlIGZpZWxkIG9mIGEgZGV2aWNlCj4gc3RydWN0dXJlLCB3aGljaCBpcyBjb25zdC4KPiBEb25l
IHVzaW5nIENvY2NpbmVsbGUuCgpJIGNhbid0IGFwcGx5IHRoaXMsIGl0J3MgbWlzc2luZyB5b3Vy
IHMtby1iIGxpbmUuIFlvdSBjYW4ganVzdCByZXBsYXkgd2l0aAp0aGF0LgoKVGhhbmtzLCBEYW5p
ZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyAgICAgIHwgMiArLQo+ICBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYyB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3lzZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwo+IGlu
ZGV4IDFjNWI1Y2UuLjg0ZTRlYmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9z
eXNmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCj4gQEAgLTM5LDcgKzM5
LDcgQEAKPiAgICogZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKCkuCj4gICAqLwo+ICAKPiAtc3Rh
dGljIHN0cnVjdCBkZXZpY2VfdHlwZSBkcm1fc3lzZnNfZGV2aWNlX21pbm9yID0gewo+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGRldmljZV90eXBlIGRybV9zeXNmc19kZXZpY2VfbWlub3IgPSB7Cj4g
IAkubmFtZSA9ICJkcm1fbWlub3IiCj4gIH07Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9tb2R1bGUuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5j
Cj4gaW5kZXggNjZmYzYzOS4uZTY2MDRlMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9tb2R1bGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5j
Cj4gQEAgLTM3LDcgKzM3LDcgQEAKPiAgc3RhdGljIERFQ0xBUkVfV0FJVF9RVUVVRV9IRUFEKGV4
aXRfcSk7Cj4gIHN0YXRpYyBhdG9taWNfdCBkZXZpY2VfcmVsZWFzZWQ7Cj4gIAo+IC1zdGF0aWMg
c3RydWN0IGRldmljZV90eXBlIHR0bV9kcm1fY2xhc3NfdHlwZSA9IHsKPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZpY2VfdHlwZSB0dG1fZHJtX2NsYXNzX3R5cGUgPSB7Cj4gIAkubmFtZSA9ICJ0
dG0iLAo+ICAJLyoqCj4gIAkgKiBBZGQgcG0gb3BzIGhlcmUuCj4gLS0gCj4gMS45LjEKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
