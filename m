Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644033093B5
	for <linux-edac@vger.kernel.org>; Tue, 16 Jun 2026 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589895; cv=none; b=dtezL/sBDLNz598l+7YWXZPkMbjOLVLCZtaxkrLyvgut2GT0NLdjyqY1wAPFyhi71QLauv2Os56ZxXb6aFseq/y2FMWCoOk084sWNHfAno1t8rvhH8zPYZLcJzeBAfZLognaxjl2d6YLZXIRb7/3YkaZTktj2wPkDVcQUltGfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589895; c=relaxed/simple;
	bh=2tRogA87nTkjEBF9CJm0EcAfWG+tvXeYNjxlsdFAMhU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a3RVSLNttjwgorKsg4h0DLDqD8XfgU7/q2inRQhNHJvd2JTVc8+2+NQR44KwYzrotE9reR97L6DqfU0FDyo5N6GtmWJfCj8xjWPcjVqxwyGPRQPZhD38WCbJBlmVGPlYnOYisEPUeHtIxCXOD1oE1DNbUVm4f0xz4X15FBiZQlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LZncsRv6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LZncsRv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781589893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hiuxrbvdEG9jWJF/RU+KZnfYB8XJJEL7kF11Msg9Mp0=;
	b=LZncsRv6/eg6rQKWdWPgH9n02/TfaV20i0TGt9jgTbRsjEiVPcSdtfOVt/U6LqSKEeavDF
	nK+r+CifbkHZnxmIh1/fJjLUjAj+KvLOQThMymxZ4GonWdEzDaQMnYWe6gGBnOlJSFrNma
	7jAuFPQ9uwDNXJSaMipoNesf3JS/18Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-i_W2kmlQN823ypLiX54P8w-1; Tue,
 16 Jun 2026 02:04:49 -0400
X-MC-Unique: i_W2kmlQN823ypLiX54P8w-1
X-Mimecast-MFC-AGG-ID: i_W2kmlQN823ypLiX54P8w_1781589888
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1B691954B3B;
	Tue, 16 Jun 2026 06:04:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F37D018004D4;
	Tue, 16 Jun 2026 06:04:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9C40F21E6A01; Tue, 16 Jun 2026 08:04:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Ani Sinha <anisinha@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Igor Mammedov <imammedo@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Blake <eblake@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,  Mauro
 Carvalho Chehab
 <mchehab+huawei@kernel.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Paolo
 Bonzini
 <pbonzini@redhat.com>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Gerd Hoffmann <kraxel@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
  linux-edac@vger.kernel.org,
  Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v3 03/16] qapi/docs: remove unused QAPIDoc subsection
 members
In-Reply-To: <CAFn=p-b1xj_+QeZkOLK+zpptm8vPPfNh-HFm6ihRUw4AUWSCTg@mail.gmail.com>
	(John Snow's message of "Mon, 15 Jun 2026 15:45:07 -0400")
References: <20260603032201.993015-1-jsnow@redhat.com>
	<20260603032201.993015-4-jsnow@redhat.com>
	<87pl1rx5br.fsf@pond.sub.org>
	<CAFn=p-b1xj_+QeZkOLK+zpptm8vPPfNh-HFm6ihRUw4AUWSCTg@mail.gmail.com>
Date: Tue, 16 Jun 2026 08:04:44 +0200
Message-ID: <875x3juikj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

John Snow <jsnow@redhat.com> writes:

> On Mon, Jun 15, 2026 at 10:10=E2=80=AFAM Markus Armbruster <armbru@redhat=
.com> wrote:
>>
>> Uh, "qapi/docs:"?  Shouldn't this be "qapi/parser:"?
>>
>
> Uh, sure. It's the parser of docs ... forgive me

I see.  qapi/docs makes me expect a QAPI documentation patch.  I go with
qapi/parser to avoid such confusion here and in later patches.

Aside: at some point, I tried separating the doc parser from the code
parser, so they can live in separate source files, but their
entanglement resisted successfully.

