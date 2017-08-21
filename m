Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [06/15] mtd: make device_type const
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Message-Id: <20170821221223.0a44fe32@bbrezillon>
Date: Mon, 21 Aug 2017 22:12:23 +0200
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
List-ID: <edac.vger.kernel.org>

TGUgU2F0LCAxOSBBdWcgMjAxNyAxMzo1MjoxNyArMDUzMCwKQmh1bWlrYSBHb3lhbCA8Ymh1bWly
a3NAZ21haWwuY29tPiBhIMOpY3JpdCA6Cgo+IE1ha2UgdGhpcyBjb25zdCBhcyBpdCBpcyBvbmx5
IHN0b3JlZCBpbiB0aGUgdHlwZSBmaWVsZCBvZiBhIGRldmljZQo+IHN0cnVjdHVyZSwgd2hpY2gg
aXMgY29uc3QuCj4gRG9uZSB1c2luZyBDb2NjaW5lbGxlLgo+IAoKQXBwbGllZCB0byBsMi1tdGQv
bWFzdGVyLgoKVGhhbmtzLAoKQm9yaXMKCj4gU2lnbmVkLW9mZi1ieTogQmh1bWlrYSBHb3lhbCA8
Ymh1bWlya3NAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMK
PiBpbmRleCBmODcyYTk5Li5lN2VhODQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNv
cmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IEBAIC0zNDAsNyArMzQwLDcgQEAg
c3RhdGljIHNzaXplX3QgbXRkX2JidGJsb2Nrc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAg
fTsKPiAgQVRUUklCVVRFX0dST1VQUyhtdGQpOwo+ICAKPiAtc3RhdGljIHN0cnVjdCBkZXZpY2Vf
dHlwZSBtdGRfZGV2dHlwZSA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlwZSBt
dGRfZGV2dHlwZSA9IHsKPiAgCS5uYW1lCQk9ICJtdGQiLAo+ICAJLmdyb3VwcwkJPSBtdGRfZ3Jv
dXBzLAo+ICAJLnJlbGVhc2UJPSBtdGRfcmVsZWFzZSwKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20g
dGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUg
Ym9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9y
ZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
