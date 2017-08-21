Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: ACPICA: Check whether ACPI is disabled before getting a table
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170821153415.54cwpytwfuq2bpec@pd.tnic>
Date: Mon, 21 Aug 2017 17:34:15 +0200
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Toshi Kani <toshi.kani@hpe.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "open list:EDAC-CORE" <linux-edac@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMjEsIDIwMTcgYXQgMDM6MzA6NDdQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gSXMgYWNwaV9kaXNhYmxlZCBhbiBBQ1BJQ0EgdmFyaWFibGU/CgpEb2Vzbid0
IGxvb2sgbGlrZSBpdDogaXQgaXMgZGVmaW5lZCBpbiBhcmNoL3g4Ni9rZXJuZWwvYWNwaS9ib290
LmMKCj4gSWYgbm90LCB0aGlzIGNhbm5vdCBnbyB1cHN0cmVhbS4gTm90IGEgYmlnIGRlYWwgSSBn
dWVzcywgYnV0IHNvbWV3aGF0Cj4geXVja3kuCgpVZmYsIHRoZXJlJ3MgdGhhdCAic3luYyIgb2Yg
a2VlcGluZyBBQ1BJQ0EgY29kZSBhbmQgaXRzIHZlcnNpb24gaW4gdGhlCmtlcm5lbCB0aGUgc2Ft
ZS4gWXVjay4KCk9oIHdlbGwuCg==
