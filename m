Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86: disable IRQs before changing CR4
From: Thomas Gleixner <tglx@linutronix.de>
Message-Id: <alpine.DEB.2.20.1711201249570.1734@nanos>
Date: Mon, 20 Nov 2017 12:55:25 +0100 (CET)
To: Nadav Amit <namit@vmware.com>
Cc: linux-edac@vger.kernel.org, kvm@vger.kernel.org, nadav.amit@gmail.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCAxNyBOb3YgMjAxNywgTmFkYXYgQW1pdCB3cm90ZToKCj4gQ1I0IGNoYW5nZXMgbmVl
ZCB0byBiZSBwZXJmb3JtZWQgd2hpbGUgSVJRcyBhcmUgZGlzYWJsZWQgaW4gb3JkZXIgdG8KPiB1
cGRhdGUgdGhlIENSNCBzaGFkb3cgYW5kIHRoZSBhY3R1YWwgcmVnaXN0ZXIgYXRvbWljYWxseS4g
QWN0dWFsbHksIHRoZXkKPiBhcmUgbmVlZGVkIHJlZ2FyZGxlc3Mgb2YgQ1I0IHNoYWRvd2luZywg
c2luY2UgQ1I0IGFyZSBwZXJmb3JtZWQgaW4gYQo+IHJlYWQtbW9kaWZ5LXdyaXRlIG1hbm5lci4K
CkkgaGF2ZSBhIGhhcmQgdGltZSB0byBmaWd1cmUgb3V0IHdoeSB0aGF0IFJNVyBwcm90ZWN0aW9u
cyBuZWVkcyB0byBiZQppbnRlcnJ1cHQgZGlzYWJsZS4gV2hpY2ggY2FsbCBzaXRlIGhhcHBlbnMg
dG8gYmUgaW4gaW50ZXJydXB0IGNvbnRleHQ/CgpJZiB0aGVyZSBpcyBub25lLCB0aGVuIHRoZSBw
cm9wZXIgcHJvdGVjdGlvbiBpcyBwcmVlbXB0aW9uIGRpc2FibGVkIHdoaWNoCmNhbiBiZSBkb25l
IHdpdGhvdXQgYWxsIHRoYXQgY2h1cm4uCgpUaGFua3MsCgoJdGdseAotLS0KVG8gdW5zdWJzY3Jp
YmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWVkYWMi
IGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1v
cmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWlu
Zm8uaHRtbAo=
