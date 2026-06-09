Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7021540BCD3
	for <linux-edac@vger.kernel.org>; Tue,  9 Jun 2026 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012404; cv=none; b=bC4p1/fwawipruWlQy77fOngvYMmFZnZTKHJzI1SS079TwPsxyx8ktaE+5w129h1f/JEqr7biDu+kTbeXFGAQVgz7cYCESNjNiduQAtRWGTnCMj3mzuveweteqDKE5But8uXJssyjT2fhEScxJvAPHeA41aXT258hbvFkn3HJ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012404; c=relaxed/simple;
	bh=NNw1zROXl3YowKbvyDdLOHg0G6aDcHiUhFpo+AVwihA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d7qMzFeGdgQvWgUr8iTWU060Ebm9iNdHLTujturTD9qimHlycVY3GNdu9bvy51ShklENeqnxX3uZUknVr9y38K18GSBEIft3SGnstoouV0vWJo7OMzNxMPUFuHaEiZjKvHjkUzah00LabJu6NGnygmCrm80rg4gWgAQtNlKGpnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NSpB1B64; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NSpB1B64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781012402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/9U9z2QG2P5RE+MzIeRWzUhUZBEuA6mCl4iYKbOQUY=;
	b=NSpB1B642Gz8cft86zOE4OfnKi2XOEZaTlwANnoWwmXFbzWxUQn1dcSkjhH1XkkMaPWl6r
	85dV9k4E06IXHdkdxnxqgE6tUIB0LCpIkTgMlqTrCjKxoxVr/1K8TIfu6Yk8kF28THtR6v
	Uz052n2do5fw1m6xhTc0IO4gnWfFCRE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-100-2SyOoIXRMuOLG8bSiTJ3vQ-1; Tue,
 09 Jun 2026 09:39:58 -0400
X-MC-Unique: 2SyOoIXRMuOLG8bSiTJ3vQ-1
X-Mimecast-MFC-AGG-ID: 2SyOoIXRMuOLG8bSiTJ3vQ_1781012396
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 604EA1805C2C;
	Tue,  9 Jun 2026 13:39:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.28])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C1DB3652A;
	Tue,  9 Jun 2026 13:39:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2F3EF21E6A01; Tue, 09 Jun 2026 15:39:53 +0200 (CEST)
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
Subject: Re: [PATCH v3 12/16] qapi/docs: add "Intro" section parsing
In-Reply-To: <20260603032201.993015-13-jsnow@redhat.com> (John Snow's message
	of "Tue, 2 Jun 2026 23:21:57 -0400")
References: <20260603032201.993015-1-jsnow@redhat.com>
	<20260603032201.993015-13-jsnow@redhat.com>
Date: Tue, 09 Jun 2026 15:39:53 +0200
Message-ID: <874ijboms6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

John Snow <jsnow@redhat.com> writes:

> Add parsing for explicit Intro section syntax.
>
> A side effect of this patch is that we will (currently) always create
> an empty Intro section, similar to how we used to have an empty Plain
> section. The tests are adjusted accordingly, rendered document output
> does not change at all.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst   | 16 +++++++---------
>  scripts/qapi/parser.py         |  4 ++--
>  tests/qapi-schema/doc-good.out | 18 ++++++++++++++++++
>  3 files changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index 3a632b4a648..b1cc5b5f0db 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -984,11 +984,11 @@ definition it documents.
>  When documentation is required (see pragma_ 'doc-required'), every
>  definition must have documentation.
>  
> -Definition documentation starts with a line naming the definition,
> -followed by an optional overview, a description of each argument (for
> -commands and events), member (for structs and unions), branch (for
> -alternates), or value (for enums), a description of each feature (if
> -any), and finally optional tagged sections.
> +Definition documentation starts with a description naming the
> +definition with an optional indented overview, a description of each
> +argument (for commands and events), member (for structs and unions),
> +branch (for alternates), or value (for enums), a description of each
> +feature (if any), and finally optional tagged sections.
>  
>  Descriptions start with '\@name:'.  The description text must be
>  indented like this::

This works if we convert the entire schema in the same series.  I guess
that's the plan.  Is it?

> @@ -1093,8 +1093,7 @@ Examples of complete definition documentation::
>  
>   ##
>   # @BlockStats:
> - #
> - # Statistics of a virtual block device or a block backing device.
> + #     Statistics of a virtual block device or a block backing device.
>   #
>   # @device: If the stats are for a virtual block device, the name
>   #     corresponding to the virtual block device.
> @@ -1111,8 +1110,7 @@ Examples of complete definition documentation::
>  
>   ##
>   # @query-blockstats:
> - #
> - # Query the @BlockStats for all virtual block devices.
> + #     Query the @BlockStats for all virtual block devices.
>   #
>   # @query-nodes: If true, the command will query all the block nodes
>   #     ... explain, explain ...

[...]

