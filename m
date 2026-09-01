Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F1367B73
	for <linux-edac@vger.kernel.org>; Tue,  1 Sep 2026 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282127; cv=pass; b=P420/Rlw7NpdOFKhNjtq65rD3calXMUMbHyqsuGyloefwOHHe5dzidNJoiE//mNNbJ0I3FXsm5ep2PJ74P33gFrOCoDkxJzYwri1VE8y4EleWZ3BYdvBQP831QfWuSvulr7AfXcKkC8U0xjrB/uM8/4OaWIWKUM+iqJ8COXHP4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282127; c=relaxed/simple;
	bh=60T+l3AlwkUKJ6uA4fVa+g+7QEfq9adnME/zrJKlEjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtz5I7FKdP4c3YCAAp65Fpjq7nCz4C7YVCs8VAmnHLuLzs0o39woejPK5MxKCP6sQVWzooJosfEn2Rb7eRpTYgeqfZd28b2y/3xJrVPrKR5nxB6/BPY7umkBOAtacxzhaL2k9KIFZMAF2FcYdatUSGUhPU8WJXQGInL4rHK73CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LyNAS4TV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tpUFRAt0; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LyNAS4TV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tpUFRAt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788282124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60T+l3AlwkUKJ6uA4fVa+g+7QEfq9adnME/zrJKlEjU=;
	b=LyNAS4TVbM8FQIbw+1pn4iRY3IjwJZSOaxxctintn34IlRZ9W+aNW5KrgMCQ2tiUScRpEd
	J0VF1KvQDiRWixQYMdTpKAylzQyi4ZmUKPCFtoupZT+RK3pv0EJC3ZIRKoSE3Ut5e1bnYh
	Jfv27eUjkMvzyS/76K1FGkaLgb7VfvE=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-zuxNdg1DOImzK_VI27kvTA-1; Tue, 01 Sept 2026 13:02:02 -0400
X-MC-Unique: zuxNdg1DOImzK_VI27kvTA-1
X-Mimecast-MFC-AGG-ID: zuxNdg1DOImzK_VI27kvTA_1788282122
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c70f4b830so82612d50.1
        for <linux-edac@vger.kernel.org>; Tue, 01 Sep 2026 10:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788282122; cv=none;
        d=google.com; s=arc-20260327;
        b=geEH0Hy/yibLHf457ayL4ktFHNdr93hzJRG3bEDjhMELJQ9R99Vbbo4TAscsanqzKD
         STPCZv3jgGDx8nNvDae3rPf5G0bQdeq0TeU5WqdMFGFmhN+CNd68u+z+rc4EgPl8fytr
         UoTS/ZpRx4rPqudqkNHRor8jRn9fkDq+eRgBupadLevei84aPNXg9CSgACDTe0i73d+x
         jLy9SoHVd/zqk9N1NocVLBCrqkHN/sYURhvQ7trdfWrT6KCc+21ICVJbHnugK71RMgAE
         raqka2OrsJWjQuVee42des41VCurd/sK7XauUJf8ueiAR9mzQ0iCHZKY+KYq5fqhOxYC
         m8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=60T+l3AlwkUKJ6uA4fVa+g+7QEfq9adnME/zrJKlEjU=;
        fh=amv7/UVYVKq+7MoQIZykdI4FW0aI044whN0qrQc7DFA=;
        b=k58QcwkOgsb8TnxRrxChJdfVvshFYdj7OYNnQhGkfSPbObnPBxQARJtQrcdgMvNqrt
         bKgRPcNo9LqUB5FulL3qbHkMjtOSTQ4vyXOcJEaXC1tAGrTYadoaAOPcA4YpM0Hi1X/B
         zKfp6Xwps/PHS8gT32KURMzw375aPRzWZ2nZDvnOx6DfynDZbq+HaqAz6fTxMIXbx5M+
         pMKGK7fdIqT6XljIBH4vUktb1zgSuy2+nRcaNlR1hU52Wx1n1e6uFUGd8b+/fUzwSOxu
         7FwoynRhTGIh0BtMyNDSDus8M4/l2EBw7IjZy/2RGAluuY/aAy69W04Ib1GaCXSdfAbP
         GYjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788282122; x=1788886922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=60T+l3AlwkUKJ6uA4fVa+g+7QEfq9adnME/zrJKlEjU=;
        b=tpUFRAt0k8/C9JYFEAbxdndLK/yLVMQ+8IJHt7ZMu8zW8O1kAKCdKTtR+2Pq3kK+Kz
         sof5a1a+l/vpFrBxsHLjvUj768vWDD+loa5+T11OECCLdYOv3QBNLEC+/8KeBmyevOcm
         l97Q9OXA6coJrVvA12CUKXc7pmiA4B2wPmQDFK+XTzd9upB6QlXgInqMny+ZnrC7Dmx/
         xdzdrhCc77sxb64oaz+MFaGHUkirj/v26z4wrMeRxV3a0dc7RHLLpCK/wZF0FjHDstd6
         qjKl+dhyonOTFpQQXntPH4zoWYTo1X/Pwe0cDbR5Bk7+9jJHpATKYK6lAdA3XhAq4KrZ
         3Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282122; x=1788886922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60T+l3AlwkUKJ6uA4fVa+g+7QEfq9adnME/zrJKlEjU=;
        b=ChpgCG64HiTLCrgz9+JT4lQ1dbcxHf5R1Zes+jOquA83cq+pBsHgHeR8PIPy4vTWjC
         /fn/4rBnfhXBIk4Jw4cNJ3P91sOhxkFePnDIW0IfuI3FQv891afd9h6JJitnJRccM2Ho
         Bf4/GcLrvxOd06uFJaEe+/PQJd7CLm2+aP5ysJFNGlT2780TPTEaQcWimgEVA6QzkiY0
         9tQWo7yn8pkRiAh8pIQinz8zo+6CtxUGubzbL0qjxmgOySBuou5ZGIOoUqF6KPCdfS/V
         xkBxkcIfdoiVxthlOYuLXAC+fl9NBjeSghyHyPk1qcyc5Y3YkSTE85fdwa+l3uKz6E0U
         UE/w==
X-Forwarded-Encrypted: i=1; AKwUvBzUuOYkasQqy0ODVDNWlJET3Ly66fuasX+IF9qtsiUJRVtlVKrzLOsa+0R15gcf7s7/loTQmMIlKS6h@vger.kernel.org
X-Gm-Message-State: AFuF++ncwgpRgt5gpXrsYGJCNP+AsbpPmaQve5IKtCPNRCLTJhk01rIe
	ba7o6w28CrZB2BT+U4c1Zb9wOG+KFHyeEIMIcn4NnUuwnQXzIk1r0RF329f2ZQvh8V/yvqTrtUm
	XdmpZpVQbdUlhPIECn+p07pQJtGNMpZX0C2nPNoqO8nSoYFDWzAONIHBdjw6PewEzQA20zDqAX5
	EIbJGsbRs8f0o5tHAq0jCRjAPC5ReyedUXyfJdqQ==
X-Gm-Gg: AYBFou2nZqmt2Ocbz2dhrChaiQwMxrq7ReQD4uCudfM5KoewlJLJJPnDqDCJJbiwyLb
	cH7Ij7b4j929M8omfZTHusURpmikgIA4lRSVAPK9RgnBbiCFiWz61FoftE4u/roN2jbaGsNdnvq
	HJEF5HHGlTBL00ib0INHnHiP+bl21HOyV/4QeFF9NiRUaRzHb4YiIJaePcy1zOdbMuKG/yhO3Va
	yYjKCouuV1AkMNx
X-Received: by 2002:a05:690e:134b:b0:66e:5def:7fb with SMTP id 956f58d0204a3-66f873db286mr2861673d50.9.1788282122119;
        Tue, 01 Sep 2026 10:02:02 -0700 (PDT)
X-Received: by 2002:a05:690e:134b:b0:66e:5def:7fb with SMTP id
 956f58d0204a3-66f873db286mr2861611d50.9.1788282121503; Tue, 01 Sep 2026
 10:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831201945.287730-1-jsnow@redhat.com> <871pbd9qpy.fsf@pond.sub.org>
In-Reply-To: <871pbd9qpy.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 1 Sep 2026 13:01:49 -0400
X-Gm-Features: AcwNN1WwY9KhOHhEffsoAqUdDjHzsfzGhf3WCZkKFn57tI6T-m4ZzTC2sD0ecwY
Message-ID: <CAFn=p-YBpsxy-3tr0SZ0CBfXUYnb6eg6AxNWpwUQmsuY5ZuykA@mail.gmail.com>
Subject: Re: [PATCH v4 00/43] qapi: convert (very) trivial intro sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Lukas Straub <lukasstraub2@web.de>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, zhenwei pi <zhenwei.pi@linux.dev>, 
	Jonathan Cameron <jic23@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Jiri Pirko <jiri@resnulli.us>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	qemu-block@nongnu.org, Ani Sinha <anisinha@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, linux-cxl@vger.kernel.org, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Alex Williamson <alex@shazbot.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, linux-edac@vger.kernel.org, 
	Michael Tokarev <mjt@tls.msk.ru>, Fabiano Rosas <farosas@suse.de>, Zhao Liu <zhao1.liu@intel.com>, 
	"Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>, 
	Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-trivial@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 7:05=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> Series
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Thank you for your suffering :)

So, I think there's actually no real problem in checking in a partial
conversion as the infrastructure was coded specifically to allow it,
however you're the maintainer so I will follow your lead. I'm more
interested in moving forward than telling you how to do your job ;)

The series will eventually enforce strict ordering, so there is no
chance we will miss anything. If we send a PR now, we also don't have
to keep rebasing the partial series against master. If you don't want
to submit a PR, please create a branch I can track and submit patches
against, and please periodically rebase it against origin/master.

Thanks,
--js

