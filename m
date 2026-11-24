Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.240.11.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483198;
	b=qbotMUT/HJTXCDD8+V/DtoElqx6yxB2ljPyD9yMyeo4CAVoHOC4p0QawWuqk9DoC50cW
	 kItg+COQ4bD71NPvEM7HrcIddaf/nbOKJtW6cIVrDySbNgz5vOJjtnz3tZPgG4HQyf0rI
	 8YVIaEoGCpGZaG25kEXbOTpl1dxQIGIH+2M22mmc90DLmEPAu7B8vIWkVoEay9FD4kzq6
	 +OjSsyFKLz0V08sH9psnU4JjAAioJedJxn0qnp6WSXXQTVSsVWwcLSSNlsk2IN3aYEAt8
	 miwRZLCUdxqRuXUtETwVVVbAQLHCXzt24h+VDTXJdq7L07fpnA0es/yRhPapIUXId3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483198;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=nE76s1HPlg9zjsjwrBOCfaFaOj26gbeg8RCuBBoMPTY=;
	b=m/sFQWh40RoKUTNJv+jWqsmZ+fWh30Zn9KNmK4a3Bv2solsBUmQWVXeYZ2x4vaU5+6LA
	 aMF0CqAv4DV1MFuGfYyDJJCQ4vVXneoixFho5lNOpRqWrHUqkpQ+VY0Jjiqf7jNguZhlZ
	 5Q9lsqInCcl511Mnb4TZlqmFwYN3u73FaMjiAC9udbWyhmnmdmJGYSPayn9TAhPCZMhUC
	 JaHxKXEuLQ3YIvazAtV4uqH7YW2bfWxmmlEvyaIxVszSGmJSxBiXlkL3ML+WqA/Dr2neA
	 IyVdjldl1+jElNODBmBpjEXyDD7IprLqBOaNnLE0NuQJvaLyxFrFvILAfdm3b8DCkpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ahmedabdelfattah.dev;
	spf=pass smtp.mailfrom=send.ahmedabdelfattah.dev;
	dkim=pass header.d=ahmedabdelfattah.dev header.i=@ahmedabdelfattah.dev header.a=rsa-sha256 header.s=resend header.b=FSFs6ZGl;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=BmWeXSmf;
	arc=none smtp.remote-ip=54.240.11.146
Received: from a11-146.smtp-out.amazonses.com (a11-146.smtp-out.amazonses.com [54.240.11.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147BD606A31E;
	Tue, 24 Nov 2026 01:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147BD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ahmedabdelfattah.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.ahmedabdelfattah.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ahmedabdelfattah.dev header.i=@ahmedabdelfattah.dev header.a=rsa-sha256 header.s=resend header.b=FSFs6ZGl;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=BmWeXSmf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=ahmedabdelfattah.dev; t=1795483197;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=nE76s1HPlg9zjsjwrBOCfaFaOj26gbeg8RCuBBoMPTY=;
	b=FSFs6ZGl5hlc7ITA8pLhAw/GMQ+QIwp9RIKdoXqfzpxEULl2Cv/ihURhmWg0Wz0y
	fXsf2lOEVyb9kenlAC0ttG40wNsDEVx9LYFQ+F0aGEL7nxPmpQTJ3T0ZYa8h9UuMQ3m
	OkzWQMMKbaMTO0di2KzatQQLLwTGKZkYlJbwEuCM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1795483197;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=nE76s1HPlg9zjsjwrBOCfaFaOj26gbeg8RCuBBoMPTY=;
	b=BmWeXSmf46PcVPGoB1MsW4/2mQjPrMSO/8vJpWGTDqlnIFcy6fM1XSljOVQPtp8C
	Tr/4xyVqhM03FsFgT8zooOgNbVI7g9TdAo0rVtRc4EUaJGhvfFAq7Z/Hy+/uJKF9lc+
	ZNF5HIkK/niTmO3RwdKvnSZMdi974SvUwTYJxOV8=
In-Reply-To: <20261123185831.GBawSM1xcZErfS1dNH@fat_crate.local>
References:
 <20261123-edac-mc-poll-msec-jiffies-v2-1-0407cc52556d@ahmedabdelfattah.dev>
 <20261123185831.GBawSM1xcZErfS1dNH@fat_crate.local>
From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qzhuo@nvidia.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/mc: Convert the poll period to jiffies when it
 is changed
Message-ID: <010001a20b235dbd-1a963366-4523-49da-9364-2d046f2ffdf1-000000@email.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Tue, 24 Nov 2026 01:19:56 +0000
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.uCKvsN4fow5iTxhgdfCiLkD52dLS8e5zeZeNIHIyObThYgWj6io55JEpA9Lr59BibvMHOQwybONW0pi/CZ0koY1A1i17AG2yWEV8SeTaUDUkRN5zlcaoQEhviEafOoOqtPZhQs319GE3nsx7+JZeBdmAUyq6td6+kg0Qy2oXHvo=:1.us-east-1.pAEstvQcjyhQNKGKcgSlzI7SVR8ZSG5wSmKwiz/A8Dg=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.11.146

On Mon, Nov 23, 2026 at 10:58:31AM -0800, Borislav Petkov wrote:
> > Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>
>
> You cannot retain a Reviewed-by tag when you change a patch considerably.

Right my bad, sorry.
Qiuxu, sorry for putting your name on something you had not seen.

I will drop it in v3 and say so in the changelog.

> Before you submit more patches, I think you should go and read some of our
> documentation first:

I've just did.

Thanks,
Ahmed
