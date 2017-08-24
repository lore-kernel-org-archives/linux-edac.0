Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [08/15] PCI: make device_type const
From: Bjorn Helgaas <helgaas@kernel.org>
Message-Id: <20170824162612.GE31858@bhelgaas-glaptop.roam.corp.google.com>
Date: Thu, 24 Aug 2017 11:26:12 -0500
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gU2F0LCBBdWcgMTksIDIwMTcgYXQgMDE6NTI6MTlQTSArMDUzMCwgQmh1bWlrYSBHb3lhbCB3
cm90ZToKPiBNYWtlIHRoaXMgY29uc3QgYXMgaXQgaXMgb25seSBzdG9yZWQgaW4gdGhlIHR5cGUg
ZmllbGQgb2YgYSBkZXZpY2UKPiBzdHJ1Y3R1cmUsIHdoaWNoIGlzIGNvbnN0Lgo+IERvbmUgdXNp
bmcgQ29jY2luZWxsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCaHVtaWthIEdveWFsIDxiaHVtaXJr
c0BnbWFpbC5jb20+CgpBcHBsaWVkIHRvIHBjaS9taXNjIGZvciB2NC4xNCwgdGhhbmtzIQoKPiAt
LS0KPiAgZHJpdmVycy9wY2kvZW5kcG9pbnQvcGNpLWVwZi1jb3JlLmMgfCA0ICsrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wY2kvZW5kcG9pbnQvcGNpLWVwZi1jb3JlLmMgYi9kcml2ZXJzL3BjaS9l
bmRwb2ludC9wY2ktZXBmLWNvcmUuYwo+IGluZGV4IDY4NzdkNmEuLjlkMGRlMTIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9wY2kvZW5kcG9pbnQvcGNpLWVwZi1jb3JlLmMKPiArKysgYi9kcml2ZXJz
L3BjaS9lbmRwb2ludC9wY2ktZXBmLWNvcmUuYwo+IEBAIC0yNyw3ICsyNyw3IEBACj4gICNpbmNs
dWRlIDxsaW51eC9wY2ktZXAtY2ZzLmg+Cj4gIAo+ICBzdGF0aWMgc3RydWN0IGJ1c190eXBlIHBj
aV9lcGZfYnVzX3R5cGU7Cj4gLXN0YXRpYyBzdHJ1Y3QgZGV2aWNlX3R5cGUgcGNpX2VwZl90eXBl
Owo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldmljZV90eXBlIHBjaV9lcGZfdHlwZTsKPiAgCj4g
IC8qKgo+ICAgKiBwY2lfZXBmX2xpbmt1cCgpIC0gTm90aWZ5IHRoZSBmdW5jdGlvbiBkcml2ZXIg
dGhhdCBFUEMgZGV2aWNlIGhhcwo+IEBAIC0yNzUsNyArMjc1LDcgQEAgc3RhdGljIHZvaWQgcGNp
X2VwZl9kZXZfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlrZnJlZShlcGYpOwo+ICB9
Cj4gIAo+IC1zdGF0aWMgc3RydWN0IGRldmljZV90eXBlIHBjaV9lcGZfdHlwZSA9IHsKPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlwZSBwY2lfZXBmX3R5cGUgPSB7Cj4gIAkucmVsZWFz
ZQk9IHBjaV9lcGZfZGV2X3JlbGVhc2UsCj4gIH07Cj4gIAo+IC0tIAo+IDEuOS4xCj4KLS0tClRv
IHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBs
aW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2Vy
bmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21h
am9yZG9tby1pbmZvLmh0bWwK
