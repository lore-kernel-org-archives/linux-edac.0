Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,3/4] drivers: edac: Add EDAC driver support for QCOM SoCs
From: saiprakash.ranjan@codeaurora.org
Message-Id: <b35f111c-0464-dcee-c970-4821f741694b@codeaurora.org>
Date: Fri, 7 Sep 2018 10:32:01 +0530
To: vnkgutta@codeaurora.org
Cc: Borislav Petkov <bp@alien8.de>, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org
List-ID: <edac.vger.kernel.org>

T24gOS83LzIwMTggNDowMSBBTSwgdm5rZ3V0dGFAY29kZWF1cm9yYS5vcmcgd3JvdGU6Cj4gT24g
MjAxOC0wOS0wNiAwNTozOCwgU2FpIFByYWthc2ggUmFuamFuIHdyb3RlOgo+PiBPbiA5LzUvMjAx
OCA0OjUyIEFNLCBWZW5rYXRhIE5hcmVuZHJhIEt1bWFyIEd1dHRhIHdyb3RlOgo+Pj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHFjb21fbGxjY19lZGFjX21hdGNoX3RhYmxlW10g
PSB7Cj4+PiArwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAicWNvbSxsbGNjLWVkYWMiIH0sCj4+PiAr
wqDCoMKgIHsgfSwKPj4+ICt9Owo+Pj4gKwo+Pj4KPj4gSGkgVmVua2F0YSwKPj4KPj4gRGV2aWNl
dHJlZSBiaW5kaW5nIGZvciBsbGNjIGlzIHVwZGF0ZWQsIGJ1dCB3aGF0IGFib3V0IHRoaXMgY29t
cGF0aWJsZT8KPiAKPiBEb2VzIGl0IG5lZWQgZG9jdW1lbnRhdGlvbiB0b28/IEkgd2FzIG5vdCBz
dXJlIGlmIEkgc2hvdWxkIGFkZCAKPiBkb2N1bWVudGF0aW9uIGZvciB0aGlzIG9yIG5vdCEKPiAK
Ckl0IGRvZXMgbm90IHJlcXVpcmUgYSBzZXBhcmF0ZSBiaW5kaW5nLCB3aGF0IEkgbWVhbnQgd2Fz
IHRvIGFkZCB0aGlzIApjb21wYXRpYmxlIGluIHRoZSBsbGNjIGJpbmRpbmcgaXRzZWxmLCBtYXli
ZSBhcyBhIHN1Ym5vZGUgaWYgaXQgaXMgY29ycmVjdC4K
