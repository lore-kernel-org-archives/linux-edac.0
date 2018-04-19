Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,3/4] acpi: apei: Do not panic() when correctable errors are marked as fatal.
From: James Morse <james.morse@arm.com>
Message-Id: <e5e107e7-e18e-725a-8f9b-95e6f033ab45@arm.com>
Date: Thu, 19 Apr 2018 16:35:52 +0100
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, rjw@rjwysocki.net, lenb@kernel.org, tony.luck@intel.com, tbaicar@codeaurora.org, will.deacon@arm.com, shiju.jose@huawei.com, zjzhang@codeaurora.org, gengdongjiu@huawei.com, linux-kernel@vger.kernel.org, alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, devel@acpica.org, mchehab@kernel.org, robert.moore@intel.com, erik.schmauss@intel.com
List-ID: <edac.vger.kernel.org>

SGkgQWxleCwKCihJIGhhdmVuJ3QgcmVhZCB0aHJvdWdoIGFsbCB0aGlzIHlldCwganVzdCBvbiB0
aGlzIG9uZTopCgpPbiAwNC8xOS8yMDE4IDAzOjU3IFBNLCBBbGV4IEcuIHdyb3RlOgogPiBNYXli
ZSBpdCdzIGJldHRlciBtb3ZlIHRoZSBBRVIgaGFuZGxpbmcgdG8gTk1JL0lSUSBjb250ZXh0LCBz
aW5jZQogPiBnaGVzX2hhbmRsZV9hZXIoKSBpcyBvbmx5IHNjaGVkdWxpbmcgdGhlIHJlYWwgQUVS
IGFuZGxlciwgYW5kIGlzIGlycQogPiBzYWZlLiBJJ20gc2NyYXRjaGluZyBteSBoZWFkIGFib3V0
IHdoeSB3ZSdyZSBtZXNzaW5nIHdpdGggSVJRIHdvcmsgZnJvbQogPiBOTUkgY29udGV4dCwgaW5z
dGVhZCBvZiBqdXN0IHNjaGVkdWxpbmcgYSByZWd1bGFyIGhhbmRsZXIgdG8gdGFrZSBjYXJlCiA+
IG9mIHRoaW5ncy4KCldlIGNhbid0IHRvdWNoIHNjaGVkdWxlX3dvcmtfb24oKSBmcm9tIE5NSSBj
b250ZXh0IGFzIGl0IHRha2VzIHNwaW5sb2NrcyBhbmQKZGlzYWJsZXMgaW50ZXJydXB0cy4gKHNl
ZSBfX3F1ZXVlX3dvcmsoKSkgVGhlIE5NSSBtYXkgaGF2ZSBpbnRlcnJ1cHRlZCAKSVJRLWNvbnRl
eHQgY29kZQp0aGF0IHdhcyBhbHJlYWR5IGhvbGRpbmcgdGhlIHNhbWUgbG9ja3MuCgpJUlEtd29y
ayBiZWhhdmVzIGRpZmZlcmVudGx5LCBpdCB1c2VzIGFuIGxsaXN0IGZvciB0aGUgd29yayBhbmQg
YW4gYXJjaCAKY29kZSBob29rCnRvIHJhaXNlIGEgc2VsZi1JUEkuCgoKVGhhbmtzLAoKSmFtZXMK
LS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNj
cmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZn
ZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwu
b3JnL21ham9yZG9tby1pbmZvLmh0bWwK
