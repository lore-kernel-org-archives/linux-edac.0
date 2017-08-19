Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [08/15] PCI: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-9-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:19 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGlzIGNvbnN0IGFzIGl0IGlzIG9ubHkgc3RvcmVkIGluIHRoZSB0eXBlIGZpZWxkIG9m
IGEgZGV2aWNlCnN0cnVjdHVyZSwgd2hpY2ggaXMgY29uc3QuCkRvbmUgdXNpbmcgQ29jY2luZWxs
ZS4KClNpZ25lZC1vZmYtYnk6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL3BjaS9lbmRwb2ludC9wY2ktZXBmLWNvcmUuYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3BjaS9lbmRwb2ludC9wY2ktZXBmLWNvcmUuYyBiL2RyaXZlcnMvcGNpL2VuZHBvaW50L3Bj
aS1lcGYtY29yZS5jCmluZGV4IDY4NzdkNmEuLjlkMGRlMTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
cGNpL2VuZHBvaW50L3BjaS1lcGYtY29yZS5jCisrKyBiL2RyaXZlcnMvcGNpL2VuZHBvaW50L3Bj
aS1lcGYtY29yZS5jCkBAIC0yNyw3ICsyNyw3IEBACiAjaW5jbHVkZSA8bGludXgvcGNpLWVwLWNm
cy5oPgogCiBzdGF0aWMgc3RydWN0IGJ1c190eXBlIHBjaV9lcGZfYnVzX3R5cGU7Ci1zdGF0aWMg
c3RydWN0IGRldmljZV90eXBlIHBjaV9lcGZfdHlwZTsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2
aWNlX3R5cGUgcGNpX2VwZl90eXBlOwogCiAvKioKICAqIHBjaV9lcGZfbGlua3VwKCkgLSBOb3Rp
ZnkgdGhlIGZ1bmN0aW9uIGRyaXZlciB0aGF0IEVQQyBkZXZpY2UgaGFzCkBAIC0yNzUsNyArMjc1
LDcgQEAgc3RhdGljIHZvaWQgcGNpX2VwZl9kZXZfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJa2ZyZWUoZXBmKTsKIH0KIAotc3RhdGljIHN0cnVjdCBkZXZpY2VfdHlwZSBwY2lfZXBmX3R5
cGUgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGRldmljZV90eXBlIHBjaV9lcGZfdHlwZSA9IHsK
IAkucmVsZWFzZQk9IHBjaV9lcGZfZGV2X3JlbGVhc2UsCiB9OwogCg==
