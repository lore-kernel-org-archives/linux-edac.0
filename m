Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/4] drivers: soc: Add broadcast base for Last Level Cache Controller (LLCC)
From: Evan Green <evgreen@chromium.org>
Message-Id: <CAE=gft64sF7APE490guRHo7PS9XsFkPn9-ZKcMB4_wPE5FXONQ@mail.gmail.com>
Date: Thu, 23 Aug 2018 16:01:36 -0700
To: vnkgutta@codeaurora.org
Cc: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgNTowOCBQTSBWZW5rYXRhIE5hcmVuZHJhIEt1bWFyIEd1
dHRhCjx2bmtndXR0YUBjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIGJvcmFk
Y2FzdCBiYXNlIGlzIHNldCB0byBlbmQgb2YgdGhlIExMQ0MgYmFua3MsIHdoaWNoIG1heQoKcy9i
b3JhZGNhc3QvYnJvYWRjYXN0LwoKPiBub3QgYmUgY29ycmVjdCBhbHdheXMuIEFzIHRoZSBudW1i
ZXIgb2YgYmFua3MgbWF5IHZhcnkgZm9yIGVhY2ggY2hpcHNldAo+IGFuZCB0aGUgYnJvYWRjYXN0
IGJhc2UgY291bGQgYmUgYXQgYSBkaWZmZXJlbnQgYWRkcmVzcyBhcyB3ZWxsLiBUaGlzIGluZm8K
PiBkZXBlbmRzIG9uIHRoZSBjaGlwc2V0LCBzbyBnZXQgdGhlIGJyb2FkY2FzdCBiYXNlIGluZm8g
ZnJvbSB0aGUgZGV2aWNlCj4gdHJlZSAoRFQpLiBBZGQgYnJvYWRjYXN0IGJhc2UgaW4gTExDQyBk
cml2ZXIgYW5kIHVzZSB0aGlzIGZvciBicm9hZGNhc3QKPiB3cml0ZXMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBWZW5rYXRhIE5hcmVuZHJhIEt1bWFyIEd1dHRhIDx2bmtndXR0YUBjb2RlYXVyb3JhLm9y
Zz4KPiAtLS0KPiAgZHJpdmVycy9zb2MvcWNvbS9sbGNjLXNsaWNlLmMgICAgICB8IDU1ICsrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvc29jL3Fj
b20vbGxjYy1xY29tLmggfCAgNCArLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25z
KCspLCAyNCBkZWxldGlvbnMoLSkKPgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2Z3JlZW5A
Y2hyb21pdW0ub3JnPgo=
