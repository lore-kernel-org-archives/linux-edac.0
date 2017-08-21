Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: ACPICA: Check whether ACPI is disabled before getting a table
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170821132054.mwhdxkcka4ocp6h5@pd.tnic>
Date: Mon, 21 Aug 2017 15:20:54 +0200
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Toshi Kani <toshi.kani@hpe.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "open list:EDAC-CORE" <linux-edac@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

Qm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgoKLi4uIGFuZCBzYXZlIHVzIHRoZSBzcGxyaW5r
aW5nIG9mIHRoaXMgdGVzdCBhcm91bmQgaW4gdGhlIGNhbGxlcnMuCgpObyBmdW5jdGlvbmFsaXR5
IGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEJvcmlzbGF2IFBldGtvdiA8YnBAc3VzZS5kZT4KLS0t
CiBkcml2ZXJzL2FjcGkvYWNwaWNhL3RieGZhY2UuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2FjcGljYS90YnhmYWNl
LmMgYi9kcml2ZXJzL2FjcGkvYWNwaWNhL3RieGZhY2UuYwppbmRleCAwMTBiMWM0M2RmOTIuLjg4
MWIwZDViMjgzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9hY3BpL2FjcGljYS90YnhmYWNlLmMKKysr
IGIvZHJpdmVycy9hY3BpL2FjcGljYS90YnhmYWNlLmMKQEAgLTIyNiw2ICsyMjYsOSBAQCBhY3Bp
X2dldF90YWJsZV9oZWFkZXIoY2hhciAqc2lnbmF0dXJlLAogCXUzMiBqOwogCXN0cnVjdCBhY3Bp
X3RhYmxlX2hlYWRlciAqaGVhZGVyOwogCisJaWYgKGFjcGlfZGlzYWJsZWQpCisJCXJldHVybiAo
QUVfRVJST1IpOworCiAJLyogUGFyYW1ldGVyIHZhbGlkYXRpb24gKi8KIAogCWlmICghc2lnbmF0
dXJlIHx8ICFvdXRfdGFibGVfaGVhZGVyKSB7Cg==
