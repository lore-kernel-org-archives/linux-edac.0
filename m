Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [05/15] mei: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-6-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:16 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGlzIGNvbnN0IGFzIGl0IGlzIG9ubHkgc3RvcmVkIGluIHRoZSB0eXBlIGZpZWxkIG9m
IGEgZGV2aWNlCnN0cnVjdHVyZSwgd2hpY2ggaXMgY29uc3QuCkRvbmUgdXNpbmcgQ29jY2luZWxs
ZS4KClNpZ25lZC1vZmYtYnk6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL21pc2MvbWVpL2J1cy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS9idXMu
YyBiL2RyaXZlcnMvbWlzYy9tZWkvYnVzLmMKaW5kZXggNDBjNzkwOC4uMWFjMTBjYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9taXNjL21laS9idXMuYworKysgYi9kcml2ZXJzL21pc2MvbWVpL2J1cy5j
CkBAIC04NDUsNyArODQ1LDcgQEAgc3RhdGljIHZvaWQgbWVpX2NsX2J1c19kZXZfcmVsZWFzZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAJa2ZyZWUoY2xkZXYpOwogfQogCi1zdGF0aWMgc3RydWN0IGRl
dmljZV90eXBlIG1laV9jbF9kZXZpY2VfdHlwZSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2
aWNlX3R5cGUgbWVpX2NsX2RldmljZV90eXBlID0gewogCS5yZWxlYXNlCT0gbWVpX2NsX2J1c19k
ZXZfcmVsZWFzZSwKIH07CiAK
