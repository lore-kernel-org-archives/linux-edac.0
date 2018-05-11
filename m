Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,3/3] acpi: apei: Do not panic() on PCIe errors reported through GHES
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180511160253.GF12705@pd.tnic>
Date: Fri, 11 May 2018 18:02:53 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgMTA6NTQ6MDlBTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiBUaGF0IGJlaW5nIGNsYXJpZmllZCwgc2hvdWxkIEkgcmVwbGFjZSAiY3JhY2ttb25rZXkiIHdp
dGggImJyb2tlbiIgaW4KPiB0aGUgY29tbWl0IG1lc3NhZ2U/CgpLZWVwIHlvdXIgb3BpbmlvbiAq
b3V0c2lkZSogb2YgY29tbWl0IG1lc3NhZ2VzIC0gdGhlaXIgZ29hbCBpcyB0bwpleHBsYWluICp3
aHkqIHRoZSBjaGFuZ2UgaXMgYmVpbmcgbWFkZSBpbiBzdHJpY3RseSB0ZWNobmljYWwgbGFuZ3Vh
Z2Ugc28KdGhhdCB3aGVuIHNvbWVvbmUgbG9va3MgYXQgZ2l0IGhpc3RvcnksIHNvbWVvbmUgY2Fu
IGtub3cgKndoeSouCgo+IEJvcmlzbGF2LCBJIHNlbnNlIHNvbWUgY29uZnVzaW9uLiBBRVIgaXMg
bm90IGEgInJlcG9ydGluZyIgZHJpdmVyLiBJdAo+IGhhbmRsZXMgdGhlIGVycm9ycy4gWW91IGNh
bid0IGxlYXZlIHRoZXNlIGVycm9ycyB1bmhhbmRsZWQuIFRoZXkKPiBwcm9wYWdhdGUgdG8gdGhl
IHJvb3QgY29tcGxleCBhbmQgY2FuIGNhdXNlIGZhdGFsIE1DRXMgd2hlbiBub3QgaGFuZGxlZC4K
PiBUaGUgd2luZG93IHRvIGhhbmRsZSB0aGUgZXJyb3IgaXMgcHJldHR5IGxhcmdlLCBzbyBpdCdz
IG5vdCBhIGNvbmNlcm4KPiB3aGVuIHlvdSdyZSBoYW5kbGluZyBpdC4KCkkgdGhpbmsgKnlvdSog
ZGlkbid0IGdldCBpdDogSVNfRU5BQkxFRChDT05GSUdfQUNQSV9BUEVJX1BDSUVBRVIpIGlzIG5v
dAplbm91Z2ggb2YgYSBjaGVjayB0byBjb25maXJtIHRoYXQgdGhlcmUgYWN0dWFsbHkgKmlzKiBh
biBBRVIgZHJpdmVyIHRvCmhhbmRsZSB0aGUgZXJyb3JzLiBJZiB5b3UgcmVhbGx5IHdhbnQgdG8g
bWFrZSBzdXJlIHRoZSBkcml2ZXIgaXMgbG9hZGVkCmFuZCBmdW5jdGlvbmluZywgdGhlbiB5b3Ug
bmVlZCBhbiBleHBsaWNpdCByZWdpc3RlcmluZyBtZWNoYW5pc20gb3Igc29tZQpvdGhlciB3YXkg
b2YgY2hlY2tpbmcgaXQgcmVhbGx5IGlzIHRoZXJlIGFuZCBoYW5kbGluZyBlcnJvcnMuCg==
