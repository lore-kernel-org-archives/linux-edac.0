Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [15/15] usb: make device_type const
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20170822125517.GA27604@kuha.fi.intel.com>
Date: Tue, 22 Aug 2017 15:55:17 +0300
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gU2F0LCBBdWcgMTksIDIwMTcgYXQgMDE6NTI6MjZQTSArMDUzMCwgQmh1bWlrYSBHb3lhbCB3
cm90ZToKPiBNYWtlIHRoaXMgY29uc3QgYXMgaXQgaXMgb25seSBzdG9yZWQgaW4gdGhlIHR5cGUg
ZmllbGQgb2YgYSBkZXZpY2UKPiBzdHJ1Y3R1cmUsIHdoaWNoIGlzIGNvbnN0Lgo+IERvbmUgdXNp
bmcgQ29jY2luZWxsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCaHVtaWthIEdveWFsIDxiaHVtaXJr
c0BnbWFpbC5jb20+CgpBY2tlZC1ieTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNA
bGludXguaW50ZWwuY29tPgoKPiAtLS0KPiAgZHJpdmVycy91c2IvY29tbW9uL3VscGkuYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NvbW1vbi91bHBpLmMgYi9kcml2ZXJzL3VzYi9jb21t
b24vdWxwaS5jCj4gaW5kZXggOTMwZThmMy4uNGFhNTE5NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3VzYi9jb21tb24vdWxwaS5jCj4gKysrIGIvZHJpdmVycy91c2IvY29tbW9uL3VscGkuYwo+IEBA
IC0xMzUsNyArMTM1LDcgQEAgc3RhdGljIHZvaWQgdWxwaV9kZXZfcmVsZWFzZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4gIAlrZnJlZSh0b191bHBpX2RldihkZXYpKTsKPiAgfQo+ICAKPiAtc3RhdGlj
IHN0cnVjdCBkZXZpY2VfdHlwZSB1bHBpX2Rldl90eXBlID0gewo+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRldmljZV90eXBlIHVscGlfZGV2X3R5cGUgPSB7Cj4gIAkubmFtZSA9ICJ1bHBpX2Rldmlj
ZSIsCj4gIAkuZ3JvdXBzID0gdWxwaV9kZXZfYXR0cl9ncm91cHMsCj4gIAkucmVsZWFzZSA9IHVs
cGlfZGV2X3JlbGVhc2UsCgpUaGFua3MsCg==
