Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.240.11.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521715;
	b=oBOJkfwcaLPpNNskrXJY1gqaTpKBM7N7SWfqx4LF/jJPMDb6q9cBynxQpE4FAJMfeaCA
	 QvRZgAhF+cKST/bHcHJlzEzO1nHpQoqpza6QujqVHLmLEoFfMeLvGppRkQ+U0vNL+p1lG
	 uTsBAO8uNaTM0VptsuLRQ0UqAJ9trTp3EW6sSbwMMnb291gympsprnRzofVpUNAaH9dUH
	 Mt1Pq97Ou4gxB1ZuSKOF5CPXRHjmcgmxukXyFLtXZEinkAz0BH5LpbjWXjig1PPRBYjpx
	 7DnXOVZtdABvnsQ8Rs4zJKPNaHDPz3Vmj8QtE/tegZj1lypPWDTfT6/PiBvgSs5qrPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521715;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=No9/JIXtRy979Z043SiqjeN22vYM1iefUiyNpdBFUIA=;
	b=FPZ5twQTPT/1vENKQdNMOIkFUxenqGarOLK+VE5HIefkeguQaM9rry2O2TGvr1McNOvG
	 qf16tUGEUxn2bP7eS8VCmxvW5qEC9kEF5aHj+duH8vno1loWN0WpHl0+ydSsxk9qMxxxq
	 kjnn8Y9ahfKI66e27KQsX9zWjpi7KMJKpLXtnC86f8sdG5TIOYJWeCo2/XGJtql3xLF6u
	 qfwpA1chlL/CFS0FxwRbdWi6VivBQYLMqiNzbH2T5RE2IEX9C9a+laKrPBrzfg1DKyfT8
	 aNRC/hL5p03gmOlTBSX2J0FEBKeeIE9HAhoQMXHFkEdHQeaqaGxEVkSR7X/JLmfFJPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ahmedabdelfattah.dev;
	spf=pass smtp.mailfrom=send.ahmedabdelfattah.dev;
	dkim=pass header.d=ahmedabdelfattah.dev header.i=@ahmedabdelfattah.dev header.a=rsa-sha256 header.s=resend header.b=XeGQB387;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=YvQPgaYY;
	arc=none smtp.remote-ip=54.240.11.34
Received: from a11-34.smtp-out.amazonses.com (a11-34.smtp-out.amazonses.com [54.240.11.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E56606A69B;
	Tue, 24 Nov 2026 12:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E56606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ahmedabdelfattah.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.ahmedabdelfattah.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ahmedabdelfattah.dev header.i=@ahmedabdelfattah.dev header.a=rsa-sha256 header.s=resend header.b=XeGQB387;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=YvQPgaYY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=ahmedabdelfattah.dev; t=1795521713;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=No9/JIXtRy979Z043SiqjeN22vYM1iefUiyNpdBFUIA=;
	b=XeGQB387QqyyotW4raLdH/NfhVJS1kwcx941g9S+lI1l2jKG4BgxbG2f6CVdL5Wq
	uobJocSKw47oB9by4OwaB4if4c9PD4vhSvKbbOUtmtrUS4BWS2Jp19+wAN/QGDVGLW/
	eEANaS0wYxl5QBTEXlV765U/XY+7v4KszXz/uFV8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1795521713;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=No9/JIXtRy979Z043SiqjeN22vYM1iefUiyNpdBFUIA=;
	b=YvQPgaYYTPn/f3sJVnAmWvnB2mIiUiuF5RbXCPhggLzvGiU576xAyDJ+Hbjne+kq
	fwHlRuzX9Op37YFRiXEcfqD7urkL43893+ltRbvT705edzvlZ6m0bo/8e5P3Y7FF98y
	6ZceJqtS47pGHNcvpj1Omm5J4ewB+kZy7QeirM1A=
In-Reply-To:
 <CY8PR12MB729072D1314C6AAAA367C82BD1442@CY8PR12MB7290.namprd12.prod.outlook.com>
References:
 <20261124-edac-mc-poll-msec-jiffies-v3-1-a377fda35aed@ahmedabdelfattah.dev>
 <CY8PR12MB729072D1314C6AAAA367C82BD1442@CY8PR12MB7290.namprd12.prod.outlook.com>
From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
To: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] EDAC/mc: Convert the poll period to jiffies when it
 is changed
Message-ID: <010001a20d6f15fd-e5ecc215-ea74-486d-89ae-59638abd8a2b-000000@email.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Tue, 24 Nov 2026 12:01:53 +0000
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
X-SES-Outgoing: 2026.11.24-54.240.11.34

On Tue, Nov 24, 2026 at 02:02:46AM +0000, Qiuxu (Leo) Zhuo wrote:
> How about using delay_jiffies instead of jiffies?
> This would avoid shadowing the global 'jiffies' and the associated W=2
> warning.
>
> The same applies to both the declarations and definitions.

Fine with me. It still says what unit the argument is in, and W=2 stays
quiet.

Boris, you asked for "jiffies" in the v1 review. Is delay_jiffies OK
with you? I will wait for your answer and send v4 with the name you
prefer.

> Otherwise, this looks good to me.
>
> Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>

Thanks for the review.

Ahmed
