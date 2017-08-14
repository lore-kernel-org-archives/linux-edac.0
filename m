Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1502734083.2042.143.camel@hpe.com>
Date: Mon, 14 Aug 2017 18:17:47 +0000
To: "bp@alien8.de" <bp@alien8.de>
Cc: "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

VDI0Z1RXOXVMQ0F5TURFM0xUQTRMVEUwSUdGMElESXdPakExSUNzd01qQXdMQ0JDYjNKcGMyeGhk
aUJRWlhScmIzWWdkM0p2ZEdVNgpEUW8rSUU5dUlFMXZiaXdnUVhWbklERTBMQ0F5TURFM0lHRjBJ
REExT2pVeU9qSTFVRTBnS3pBd01EQXNJRXRoYm1rc0lGUnZjMmhwCmJXbDBjM1VnZDNKdmRHVTZE
UW8rSUQ0Z1dXVnpMQ0JpZFhRZ2RHaHBjeUJCUTBzZ2FYTWdaRzl1WlNCd1pYSWdZU0JIU0VWVElH
VnUKZEhKNUlHRnpJSGRsYkd3dURRbytJQTBLUGlCVGJ5QnBjeUIwYUdVZ1oyaGxjMTlsWkdGalgz
SmxjRzl5ZEY5dFpXMWZaWEp5YjNJbwpLU0JqWVd4c0xnMEtEUXBTYVdkb2RDd2daMmhsYzE5bFpH
RmpYM0psY0c5eWRGOXRaVzFmWlhKeWIzSW9LU0JuWlhSeklITmxjbWxoCmJHbDZaV1FnY0dWeUlH
RWdSMGhGVXlCbGJuUnllU3dOQ21KMWRDQnViM1FnWjJ4dlltRnNiSGt1RFFvTkNsUm9ZVzVyY3l3
TkNpMVUKYjNOb2FRMEsKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRo
ZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2Ug
dG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRw
Oi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
