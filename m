Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] ghes_edac: add platform check to enable ghes_edac
From: Toshi Kani <toshi.kani@hpe.com>
Message-Id: <1500919377.2042.66.camel@hpe.com>
Date: Mon, 24 Jul 2017 18:12:18 +0000
To: "mchehab@s-opensource.com" <mchehab@s-opensource.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, "tony.luck@intel.com" <tony.luck@intel.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

VDI0Z1RXOXVMQ0F5TURFM0xUQTNMVEkwSUdGMElERTBPalUySUMwd016QXdMQ0JOWVhWeWJ5QkRZ
WEoyWVd4b2J5QkRhR1ZvWVdJZwpkM0p2ZEdVNkRRbytJRVZ0SUUxdmJpd2dNalFnU25Wc0lESXdN
VGNnTVRVNk5UWTZNamNnS3pBd01EQU5DaUE2RFFvK0lGUm9ZWFFuCmN5QndjbTlpWVdKc2VTQjBi
MjhnYkdGMFpTQm1iM0lnYldVZ1lYTWdTU0J5WldObGFYWmxaQ0JoSUc1bGR5QklVQ0J0WVdOb2FX
NWwKRFFvK0lIZGxJR0p2ZFdkb2RDQnFkWE4wSUd4aGMzUWdkMlZsYXl3Z1luVjBJR1p2Y2lCMGFH
VWdibVY0ZENCMGFXMWxJRWtnZDI5MQpiR1FnYm1WbFpDQjBidzBLUGlCblpYUWdZU0J1WlhjZ2FH
RnlaSGRoY21Vc0lIZG9ZWFFnZDI5MWJHUWdZbVVnZEdobElHNXZiaTFTClFWTWdaWEYxYVhaaGJH
VnVkQ0IwYncwS1BpQmhJRTFNSURNMU1DQkhPU0IwYjNkbGNpMXRiM1Z1ZEdWa0lHMWhZMmhwYm1V
Z2QybDAKYUNCMGQyOGdXR1Z2YmlCMk5DQkRVRlZ6SUdGdVpDQnBURTgvRFFvTkNsTjFZMmdnYzJW
eWRtVnljeUJoY21VZ1kyRnNiR1ZrSUNKSQpVRVVnUTJ4dmRXUnNhVzVsSWk0Z0lFSjFkQ0JKSUhS
b2FXNXJJSFJvWlhrZ1lYSmxJR0ZzYkEwS2NtRmpheTF0YjNWdWRHVmtMQ0J1CmIzUWdkRzkzWlhJ
dGJXOTFiblJsWkNCdFlXTm9hVzVsY3k0Z0lFaFFJRWx1WXk0Z0tIZG9hV05vSUdseklHNXZkeUJo
RFFwelpYQmgKY21GMFpTQmpiMjF3WVc1NUlHWnZjaUJqYjI1emRXMWxjaTF2Y21sbGJuUmxaQ0J3
Y205a2RXTjBjeWtnY0hKdlltRmliSGtnYUdGegpJSE4xWTJnTkNtMWhZMmhwYm1VdURRb05DbFJv
WVc1cmN5d05DaTFVYjNOb2FRMEsKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBz
ZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1l
c3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0
ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
