Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/4] edac: synps: Add platform specific structures for ddrc controller
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180818124537.GA24733@nazgul.tnic>
Date: Sat, 18 Aug 2018 14:45:37 +0200
To: Manish Narani <MNARANI@xilinx.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Michal Simek <michals@xilinx.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mdf@kernel.org" <mdf@kernel.org>, Edgar Iglesias <edgari@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Bharat Kumar Gogada <bharatku@xilinx.com>, "stefan.krsmanovic@aggios.com" <stefan.krsmanovic@aggios.com>, Srinivas Goud <sgoud@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gU2F0LCBBdWcgMTgsIDIwMTggYXQgMTA6MTE6NTRBTSArMDAwMCwgTWFuaXNoIE5hcmFuaSB3
cm90ZToKPiBQaW5nLgoKRmlyc3Qgb2YgYWxsLCBvbmUgcGluZyBpcyBlbm91Z2guIElmIHlvdXIg
cGF0Y2hzZXQgY29udGFpbmVkLCBzYXksIDMwCnBhdGNoZXMsIHdlcmUgeW91IHJlYWxseSBnb2lu
ZyB0byBzZW5kIGEgcGluZyBmb3IgZWFjaCBvbmUgb2YgdGhlbT8hPyE/IQoKU2Vjb25kbHksIHlv
dSBkbyBrbm93IHRoYXQgd2UgaGF2ZSBtZXJnZSB3aW5kb3cgcmlnaHQgbm93LCBkb24ndCB5b3U/
CgpBbmQgZHVyaW5nIHRoZSBtZXJnZSB3aW5kb3csIHBlb3BsZSBhcmUgYnVzeSB3aXRoIG1lcmdl
IHdpbmRvdyB0ZXN0aW5nCmFuZCBzZW5kaW5nIHN0dWZmIHdoaWNoIGlzIHJlYWR5LCB1cHN0cmVh
bSAtIG5vdCByZXZpZXdpbmcgbmV3IGNvZGUKd2hpY2ggaGFzIGFic29sdXRlbHkgbm8gY2hhbmNl
IG9mIGdvaW5nIGluIG5vdz8KCkplZXouCg==
