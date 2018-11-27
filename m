Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181127120920.GB26395@zn.tnic>
Date: Tue, 27 Nov 2018 13:09:20 +0100
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Yazen Ghannam <Yazen.Ghannam@amd.com>, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, John Clemens <clemej@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMTE6MTc6MDBBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBJ
dCBtYXkgaGFwcGVuIGFtZF90aHJlc2hvbGRfaW50ZXJydXB0KCkgZmlyZXMgYmVmb3JlIGJhbmtz
IGdldCBzZXR1cCBhcwo+IHBhcnQgb2YgdGhlIHRocmVzaG9sZF9pbml0X2RldmljZSgpIGNhbGwu
IFN1Y2ggYSBjYXNlIHJlcXVpcmVzIGEgcHJvcGVyCj4gY2hlY2sgdG8gYXZvaWQgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlLgoKWWVhaCwgYW5kIHRoaXMgY29kZSBpcyB3cm9uZyBhcyBoZWxsLiA6
LVwKCldlIHNob3VsZCBiZSBpbml0aWFsaXppbmcgdGhlIGJhbmtzIGFuZCAqdGhlbiogc2V0dXAg
dGhlIHRocmVzaG9sZGluZwppbnRlcnJ1cHQgdmVjdG9yLCB3aGVuIGFsbCBzZXR1cCBoYXMgc3Vj
Y2VlZGVkLCBub3QgYmVmb3JlLgoKTGVtbWUgdGhpbmsgYWJvdXQgaXQgYSBiaXQuCgpUaHggZm9y
IHRoZSByZXBvcnQuCg==
