Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792437134;
	b=wmLTipyH2GtHcWSPyw7KQLbSGKJey1MiZmid5PiRczV4gw4FuBq8A/ldGEy1sEMzZTqq
	 jcdAJRdDV6v/MLvbYUEEboTcrb4Hf/RdhE4YBtAOnjmcGbUC/AIntm4KhZd8jUPCSCwan
	 EqULE0Ug7r+Jyqe0V594bj6H3jC80ScXx0hi/+XlbzlMLeXOTBu64A9NA6b8kb8yXELOc
	 vcRnpEcK+VQ7Ri/ePiXYH1hmSR9QulDYntG2G7IGlmYuhbMqeCBVH7IzBUWVbiVqt80cn
	 wpreE8LEW4k1+VlezEIg428b0GRJ24J3zFHWxs2DHfV4PIhKAL8jdvw7EPjanntpXbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=brXSmDy6U/oRKvH40grJe8uDEK1S7rGaavMW9jk3fYA=;
	b=BN4u6oyy9v7XsQ8t+Zj9N3Sv0/wZB/tU58Q7nM2qlIt5qSm1tfuTdtcCoBhfCVSkjw+Y
	 JwHhcno3LmHgeuZGYn8RMa2qu2ezdEPcxVxPWYaOFjhYVDYL6RhiU030YICmb32tXhEj2
	 ceYJAUaWSzTUwyiG43ZmWYPtGUbhE09sjjGguta7Lfd2/Ha7plw/0ChuHd8v6XssZb8fI
	 +nwtBOayR0bCyZh8EOPQDXkd29IMSw3KOTMaeolhUYLCxklqx0jrk9NmNVylbaUq3NIBN
	 WXv0hpq1438rEkSkMhUAri9jN70MngZFTd72jVvCmZrydf2L76lxCG/q5gAE6N0gHQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="U/c9xgEk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF31606A321
	for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 19:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF31606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=U/c9xgEk
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so3765298a12.0
        for <linux-edac@vger.kernel.org>; Mon, 19 Oct 2026 12:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792437132; cv=none;
        d=google.com; s=arc-20260327;
        b=h2oNQK2GWzjZdIZb1LC92uM70n0m7bVZ7t+VLb2z8ileIMqHUPO7ZKWcjQQs58bi6Y
         jvJ8cuHr1v4B4wPPdAusjGSGwG4rhrSUkVft7R4rcdfiObpNbYj0NjIu5D60Zvbx4J8u
         wmlwOQxu25b9J9TqS747jLdwM/yMW6V0BoQ3rQY1ac73YHS3ycBrumpGj0933iZVnsiz
         qrbqyS5i/d+YPOqSzX3Q7qxoqoj7tQP1XCggT63x7s3D4/bfIXNU320nR3Tie6j4+8tU
         NcxIHDDxU4sMdMx0lBZH56yLK1Wb93cDY+n3KArnaaetUn6npg3449Ba0XA1ijoYlgvf
         lvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brXSmDy6U/oRKvH40grJe8uDEK1S7rGaavMW9jk3fYA=;
        fh=1m6lCP23YFCDvrvl10K7pDmj2IU546yPPnSL1C0gzSg=;
        b=LowJhupGm0thRz7r2lzSaaUHvv+GgUL6k7d2cHA5CNd4r2ETnBZ0mPUgu1LqWKxHFp
         4szyqqkuNZOLZiQoWZecnprOhkB74FuzRe69Cwu59YYxZDG+cWmLbAd9vlW2XNjA2Xhv
         kuA21AB0rBAeH9wdBnr/tKgKD/VI4NdU1ssj2WuX5SIo/tzE0EWFH+3SRQ1yqFrUdKXN
         DThLzyFkCjvy9N/BJrjCyTrdA9Mg+wgLDX71GsKan2iiDxpT0mDU7G+SIp3VCwyHvybH
         j32eM4keVwS6v+tVp8qaL0FWW5eiSlBCpDPRO99N6sfOoxB5uzfPd2Lh0EeQc8uJJyy0
         Rz6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792437132; x=1793041932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brXSmDy6U/oRKvH40grJe8uDEK1S7rGaavMW9jk3fYA=;
        b=U/c9xgEk3/Yk28zW/sfw2QYvml8TEfstWHoaPBquHhyY6UjwLmbpz7aQwVI8wYL8jx
         zgstEWorkWpU26FA+0IPmZV+xJOVpD+WfTIGCkjgN64xf9JJLpG9EFFFX3iZ2R7yaBsk
         7OiYgsYg7i24gbhDaiAETBXKZc5mnWw0Clct7eDsNODBQauPSNqEL6Q9FS/szQa+9KWN
         aHWyF7tdw7bVfvTicTuox6CL0URzzeJ6BuOpiwRXt5jOdcAtcNBvG1rAGVwC5E0w411Y
         UqqYwO97E9moWWPlsq+cQhGxFzQzfqxJYgiuHOm9wBR93rRwd/vd27CAVityd/i3Vg2n
         GJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437132; x=1793041932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brXSmDy6U/oRKvH40grJe8uDEK1S7rGaavMW9jk3fYA=;
        b=R8dXhvJp/+EwdZJCbbm7grtuz7oruvEvvwVATuPaymX40sjeXKqrqlh+iMMuMX5mQN
         Vz5YPhO6mGroXGMDBjnCbjZ+50JGrgsZGGfwLzn1eRrAbWfrzbusIaDJ2cGyhhWPiE8B
         73vJGP1hQDjKzJ9zqiir++aKury6eXuHInSXX0fA97ZLpO9LFA2qJe6JOUpPFfwdbBe/
         HbZivPkWBqXbG7PsO6VB0/mKdPsAgWQ1d0KJbQBp47+dlFUvigFMMFZNmch/fC/G9lgQ
         jDiNLzLjVaAtimVLH6U9v3rOpNAoL2of4kH0pAhQhY8Wk0AV9W6mEpymnivBCLc2T8x+
         vrkw==
X-Forwarded-Encrypted: i=1; AKwUvBwNMS9TaoxioArO5xqnZ4zjZ2rI7UTZkvglSBskdpIS8oUQODcCkZdIA/BEyPS3oRoo6K5fcGT6vEk5@vger.kernel.org
X-Gm-Message-State: AFq9FYL1HYvrDD2bE0UfqhKi5AydAd/vr6I7EkaadG4lH3Lx3WJJOkYn
	u/pt4pkDD1u+bhBQ4j5JEmYFIkLlWmsWPi9O8kFI/xM4AL6A5h6WxfGlvDGEfXCDyFSCppsoLqy
	NfznGDjzRE32EtEZUZXbiQDYESWE3PeILquclGtRMeQ==
X-Gm-Gg: AYBFou3ylWeuSyTpOZDb1k5jt78LVOzXD7plNDcEHYX7MVo7386Ind3buL/W5lCtbpN
	RJmV/dZZJw574oi+tAFmT7SBT5Osjli6p86Rzjr72tyLOeLxxNvRZlF8/mIIRBqOYU5RG5wek+Z
	Pi3lzIf/5FPAIsCBr42K93aBBZwyEc6PjEUev+rsBTAID2Zw32NK+d4YFjWZhXVQo6Ovhh7/MX9
	nfOejibgsYng3JDapK8+wJpgp7ukq8cc3fuir9yqnEjFW7BsBNCsQ83rHjMTiAQ7uXzJSRE62K1
	N9MvM43AejFcUnTotOPB/yc5eVwEt5KxuKpiAhe2NFP7KEHT8morvutno4HfmGtbgDjzFPCjplj
	QfIS/iiJWHb/MI3Ec+KJkKi3oKbjPEH491QmF6zMZW5EKG4P/Mtmx/PBfQ/nLPBLV7r+e1EmSkT
	OzrLi/H0vy5Q5D
X-Received: by 2002:a05:6402:a295:20b0:6b1:c6ad:ae3f with SMTP id
 4fb4d7f45d1cf-6b3a8199b12mr3606189a12.35.1792437131823; Mon, 19 Oct 2026
 12:12:11 -0700 (PDT)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019011446.834487-1-pasha.tatashin@soleen.com> <SJ1PR11MB608365E406C4DA7CB91858A4FC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB608365E406C4DA7CB91858A4FC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 19 Oct 2026 15:11:32 -0400
X-Gm-Features: AclHuK81i0D--1zvoLFLDSEjKdb8OtLyg3_R_Omdu6BLSuefBq3mveb_0VEz-04
Message-ID: <CA+CK2bAQr=Ak1u-Aiwbw=DZ22Nk8oRDqnC2AnRaez7nOyJj0-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] x86, sched, mm: Speed up CPU hotplug on large systems
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "kees@kernel.org" <kees@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, 
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "vschneid@redhat.com" <vschneid@redhat.com>, 
	"kprateek.nayak@amd.com" <kprateek.nayak@amd.com>, 
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>, "bp@alien8.de" <bp@alien8.de>, 
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, 
	"david@kernel.org" <david@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"seanjc@google.com" <seanjc@google.com>, "ljs@kernel.org" <ljs@kernel.org>, 
	"zhangguopeng@kylinos.cn" <zhangguopeng@kylinos.cn>, 
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"Gomes, Vinicius" <vinicius.gomes@intel.com>, "vbabka@kernel.org" <vbabka@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "surenb@google.com" <surenb@google.com>, 
	"hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, 
	"dmatlack@google.com" <dmatlack@google.com>, 
	"tim.c.chen@linux.intel.com" <tim.c.chen@linux.intel.com>, 
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>, "pratyush@kernel.org" <pratyush@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"gmonaco@redhat.com" <gmonaco@redhat.com>, "jgross@suse.com" <jgross@suse.com>, 
	"mgorman@suse.de" <mgorman@suse.de>, "Graf, Alexander" <graf@amazon.com>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "liam@infradead.org" <liam@infradead.org>, 
	"ridong.chen@linux.dev" <ridong.chen@linux.dev>, "blum@kernel.org" <blum@kernel.org>, 
	"longman@redhat.com" <longman@redhat.com>, "bsegall@google.com" <bsegall@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:22=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wr=
ote:
>
> > Benchmark workload (mean of 10 runs per step):
> >
> >  # echo 1 > /sys/kernel/rcu_expedited
> >  # for i in {1..N}; do echo 0 > /sys/devices/system/cpu/cpu$i/online; d=
one
>
> Side question. Have you had issues with this step failing on large system=
s with "smart" I/O
> devices that support many interrupt vectors?
>
> Some validation folks inside Intel had some tests that looped taking all =
CPUs offline and
> bringing them back. They complained starting around Sapphire Rapids this =
their test
> would get down to just CPU 0 and CPU 1 and fail to take CPU 1 offline bec=
ause there
> were too many interrupts to fit into just a single CPUs available vectors=
.
>
> It was a while ago, so maybe something changed in interrupt code to handl=
e this.

Hi Tony,

I didn't encounter that issue while collecting the benchmark data.

For the Live Update work I'm currently doing, I leave 8 CPUs on the
host to perform kexec while the AP CPUs are removed from the
scheduler. In the future, I plan to leave only one host CPU and have
the remaining CPUs manage the VMs in Caretaker mode.

Best,
Pasha

>
> -Tony
>
>
>
