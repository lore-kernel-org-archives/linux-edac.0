Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA642EEBE;
	Mon,  3 Aug 2026 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781375; cv=none; b=jIbG53Bpqp2hv2L4B5XysmW7hs4OA2/tAVm7MVtlf6/cf7JMxvIFyqeC980hTMPAv2ShbznWCfoOa2OsEZUjBI6eDEcJ1LINvBfexs/3FnbGgXez0wHk1x7XRuFydx/1ZTN01lDYeUepqKMpu3TtmdL490Y3GZNZ85YbSQhfqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781375; c=relaxed/simple;
	bh=Wh9S0/bY72qGcindqSYmUhxulOOzqrStJ3CLCuSWbQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r9Bg500w4adf0ksSZlcfQiWF05QgtfW4mEkanou1U5Y+rqYBWB9b9utwjuqIy6fMinh/fb7yQ8TCgiXIeBrUlG92j8AADcB1nbOZ8kM5HRAiVowqXGMBWC4+jfs71U5vXS/vGRWrTXpjiospWcroA78N3yBFDFVz+CGOCQ0lrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jWWIZ5Z6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jWWIZ5Z6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8CC78408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785781373; bh=PKbX1zDB9N/0/iybsnyUV6qq/3RUDOfn13GSpXP0odk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jWWIZ5Z6HJ2igiuSqIWK0Yicza1VecsURPRC+gneMVFUzPdg0b7St60p9yJ2tAPSM
	 xNE43N3bdwDkVCGl+z/0Y4tqdVurNLWBL/wwgPyDmiPQLKnBCAJCnNQbIFEWdDlmeq
	 52JtSLjDnA2da/gWkGVAN+1MLDrCXMzVkvVkL8ZoVrYfBScjmLVp4lSjCo8l21M6yL
	 SQz488YU9MGU+4/Ax0h+UNJHlPAScpfeEmube2fP6pACWI56xA/O0Y9d1fzQ14BYQ8
	 7vaW29WmjLDgvliROm288b6vLb3w1bnBJxATUnix3UabinGJjrnw+qOcls+osZaAHi
	 dNaJNqkLmJ8EQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8CC78408D2;
	Mon,  3 Aug 2026 18:22:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?B?5bKz56eJ5Z2k?= <yuebingkun@kylinos.cn>, mchehab@kernel.org,
 tony.luck@intel.com
Cc: rdunlap@infradead.org, shiju.jose@huawei.com,
 jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
 linux-doc@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?B?5bKz?=
 =?utf-8?B?56eJ5Z2k?=
 <yuebingkun@kylinos.cn>
Subject: Re: [PATCH v2 0/3] Documentation: fix a few typo and wording issues
In-Reply-To: <20260728041213.52820-1-yuebingkun@kylinos.cn>
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
Date: Mon, 03 Aug 2026 12:22:52 -0600
Message-ID: <87jyq7ysg3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=E5=B2=B3=E7=A7=89=E5=9D=A4 <yuebingkun@kylinos.cn> writes:

> Hi,
>
> This series fixes a few small documentation issues (spelling/wording)
> across Documentation/ files. Each patch targets a single subsystem's
> docs so the respective maintainers can pick them up independently.
> These changes are limited to spelling and wording corrections and do
> not change behavior.
>
> I am a newcomer to the Linux community, and I am eager to contribute
> and learn through small, helpful fixes like this one.
>
> Changes in v2:
> - Split the original single combined patch into per-subsystem patches,
>   per Randy Dunlap's feedback on v1.
> - Moved the "newcomer" note out of the individual commit messages; it
>   now lives only in this cover letter.
> - Collected Acked-by from Randy Dunlap <rdunlap@infradead.org>. The
>   content per-file is unchanged from v1, so the Ack is carried forward
>   on each patch.
>
> =E5=B2=B3=E7=A7=89=E5=9D=A4 (3):
>   Documentation: fix "should be use" grammar in ABI README
>   Documentation: fix "readng" typo in EDAC memory-repair ABI doc
>   Documentation: fix "thare are" typo in V4L subdev routing doc
>
>  Documentation/ABI/README                                        | 2 +-
>  Documentation/ABI/testing/sysfs-edac-memory-repair              | 2 +-
>  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

The first and third problems have already been fixed by others; I have
applied the EDAC fix.

Thanks,

jon
