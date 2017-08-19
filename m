Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [03/15,media] i2c: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-4-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:14 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGlzIGNvbnN0IGFzIGl0IGlzIG9ubHkgc3RvcmVkIGluIHRoZSB0eXBlIGZpZWxkIG9m
IGEgZGV2aWNlCnN0cnVjdHVyZSwgd2hpY2ggaXMgY29uc3QuCkRvbmUgdXNpbmcgQ29jY2luZWxs
ZS4KClNpZ25lZC1vZmYtYnk6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL21lZGlhL2kyYy9zb2NfY2FtZXJhL210OXQwMzEuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvaTJjL3NvY19jYW1lcmEvbXQ5dDAzMS5jIGIvZHJpdmVycy9tZWRpYS9pMmMvc29j
X2NhbWVyYS9tdDl0MDMxLmMKaW5kZXggNzE0ZmIzNS4uNDgwMmQzMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tZWRpYS9pMmMvc29jX2NhbWVyYS9tdDl0MDMxLmMKKysrIGIvZHJpdmVycy9tZWRpYS9p
MmMvc29jX2NhbWVyYS9tdDl0MDMxLmMKQEAgLTU5Miw3ICs1OTIsNyBAQCBzdGF0aWMgaW50IG10
OXQwMzFfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCS5ydW50aW1lX3Jlc3Vt
ZQkJPSBtdDl0MDMxX3J1bnRpbWVfcmVzdW1lLAogfTsKIAotc3RhdGljIHN0cnVjdCBkZXZpY2Vf
dHlwZSBtdDl0MDMxX2Rldl90eXBlID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlw
ZSBtdDl0MDMxX2Rldl90eXBlID0gewogCS5uYW1lCT0gIk1UOVQwMzEiLAogCS5wbQk9ICZtdDl0
MDMxX2Rldl9wbV9vcHMsCiB9Owo=
