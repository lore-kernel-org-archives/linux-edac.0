Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] x86/mce: new centaur CPUs support MCE broadcasting
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180404111822.GA16437@pd.tnic>
Date: Wed, 4 Apr 2018 13:18:22 +0200
To: David Wang <DavidWang@zhaoxin.com>
Cc: "tony.luck@intel.com" <tony.luck@intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bruce Chang (VAS)" <BruceChang@via-alliance.com>, "Cooper Yan(BJ-RD)" <CooperYan@zhaoxin.com>, "Qiyuan Wang(BJ-RD)" <QiyuanWang@zhaoxin.com>, Benjamin Pan <BenjaminPan@viatech.com>, Luke Lin <LukeLin@viacpu.com>, "Tim Guo(BJ-RD)" <TimGuo@zhaoxin.com>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMDI6MzQ6NTJBTSArMDAwMCwgRGF2aWQgV2FuZyB3cm90
ZToKPiBUaG9zZSBhcmUgbmV3IHByb2Nlc3NvcnMgYW5kIG1haW4gdXNhZ2Ugb2YgQ2VudGF1ckhh
dWxzIENQVXMgaW4gcmVjZW50Cj4geWVhcnMgaXMgZm9yIGxpbWl0ZWQgYW5kL29yIGVtYmVkZGVk
IGluc3RlYWQgb2YgZGlzdHJpYnV0aW9uIG1hcmtldHMuCj4gU28gdGhlcmUgaXMgbm8gcGxhbiBv
ciByZXNvdXJjZSB0byBjcmVhdGUgc3VjaCBkb2N1bWVudCBmb3IgcHVibGljCj4gYWNjZXNzLiBJ
cyBwdWJsaWMgc3BlYyBtYW5kYXRvcnkgZm9yIGNvZGUgY2hlY2staW4/IFdlIGNhbiBwcm92aWRl
Cj4gcGxhdGZvcm1zIGZvciB2ZXJpZmljYXRpb24gaW5zdGVhZC4KCk5haCwgbm90IG5lZWRlZC4g
QXMgbG9uZyBhcyB0aGUgY29kZSBwYXRocyBkb24ndCBicmVhayBhbnl0aGluZyBlbHNlIGFuZAph
cyBsb25nIGFzIHdlIGNhbiBDQyB5b3UgdG8gZml4IGJ1Z3MgcGVvcGxlIHJlcG9ydCwgd2UncmUg
Z29vZC4gOi0pCgpCdHcsIHBsZWFzZSBkbyBub3QgdG9wLXBvc3Qgb24gYSBwdWJsaWMgTUwuCgpU
aHguCg==
