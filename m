Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce: suspicious RCU usage in 4.13.4
From: "Luck, Tony" <tony.luck@intel.com>
Message-Id: <3908561D78D1C84285E8C5FCA982C28F770038E5@ORSMSX114.amr.corp.intel.com>
Date: Wed, 11 Oct 2017 21:34:22 +0000
To: Borislav Petkov <bp@alien8.de>, Andi Kleen <ak@linux.intel.com>
Cc: Jeremy Cline <jcline@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>
List-ID: <edac.vger.kernel.org>

PiBoZXJlJ3MgYSBzZWNvbmQgYXR0ZW1wdCBhdCBhIG1vcmUgcmlnb3JvdXMgc2ltcGxpZmljYXRp
b246IFJDVSBzdHVmZiBpcw0KPiBnb25lIGFuZCBvbmx5IGEgc2luZ2xlIGxvb3Agc2NhbnMgdGhy
b3VnaCB0aGUgZWxlbWVudHMuDQoNClRoZSBkZXZfbWNlX2xvZygpIGNoYW5nZXMgbG9vayBnb29k
IG5vdy4NCg0KWW91IGNhbiBhcHBseSB0aGUgYXhlIHRvIG1vcmUgYml0cyBvZiBtY2VfY2hyZGV2
X3JlYWQoKSB0aG91Z2guIExpa2UgdGhhdA0KDQoJd2hpbGUgKCFtLT5maW5pc2hlZCkgew0KDQp3
ZSBob2xkIHRoZSBtdXRleCwgdGhlIHdyaXRlciBvZiB0aGF0IGhvbGRzIHRoZSBtdXRleCAuLi4g
dGhlIHNwaW4gbG9vcCBpcyBnb2luZyB0byBhbHdheXMNCnRpbWUgb3V0LiAgDQoNCi1Ub255Cg==
