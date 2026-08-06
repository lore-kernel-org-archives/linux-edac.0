Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4885B47DFA8;
	Thu,  6 Aug 2026 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032664; cv=none; b=CAsns+q3QQL35gfiF6/Ewi/c+rytYhnfwi7ApWTmXHKhZgU7/BJGKHHcf1oq6P/f/P5LbEMCw2nX3VvuC8vCHwqolgovkMvL6GotDwwHAqjfZ8p5VUmADSANzub09KJFo62tfs2Wf0JpgtpY0ElPVt0N9/gnaX3QZV6WsfZU6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032664; c=relaxed/simple;
	bh=7zuavJPnJ6Gdm78Ev/OmFi83neq+vHG2LS2ssQE//1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gmp3kaRZwLy3nBded0Rn3LFB4n98VCteZYEqgOHhgGNPAibonPuQynmaVSTKor0hjZQ+AaaxiV+1yEUCasxmMYgMZ2iiaPQKMV1B0safC28EsQVikmOD5ZpQFLADHz4r1puLU9hYPAB6mjK7Xv6KesOWC4er24a/K93dikr91IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfw3ooi1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfw3ooi1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699F91F00A3A;
	Thu,  6 Aug 2026 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786032662;
	bh=a9qbCpfjdZRZlXdcULtkcEeriReW0qgUdu6jK7lAb+4=;
	h=From:To:Cc:Subject:Date;
	b=gfw3ooi1iQZV7aPmdrLCAXH2FtIJvms8a1SmGrnh6ikw7m/w8e9JoiDocuweyjXWG
	 AmA8nNCYDe90ysJGpVgQ1YtPu8rAiFzrXW7jQJSSBBlY6ujqDmFkJjLDBPrf6dUtP5
	 hcQEhjgH8BemD7RAoOdb5Vxf4h2UmlY2kqz2R7a/TZUhlkiw/7+4wBAP75VUxgMxpm
	 lN3UbOCRx+TxVqDqjvhy2OIE9gFIA9UGY6iiT7M0f1uN0ZKXMwESjEp8RqUCkx0X5a
	 ZLTqnOieBzE7WWLvrIMIQgcJbWtDbm3yIPrnGKMLoGp/7aODeNUYe+NxGaPL/TRD+m
	 O+5oyNqrHdYYg==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] EDAC/altera: Guard against NULL of_node
Date: Thu,  6 Aug 2026 11:10:54 -0500
Message-ID: <20260806161055.1520446-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi EDAC maintainers,

I wanted to explain the reason why I think this patch doesn't need a
Fixes tag. The way the Altera EDAC is written there are many instances
of the driver referencing the of_node, which is why they are flagged in
many sashiko reviews.

This patch checks for those NULL of_node in the probe functions using
dev_of_node() so we don't have to guard the of_node in all the other
functions.

The reason we don't need the Fixes tag is because this system is
supposed to run with CONFIG_OF enabled. The system would fail way
before it gets to this driver if an of_node is not found. Thus I don't
see a need for a Fixes tag but the guard should be in place for
completeness.

Thanks,

Dinh Nguyen (1):
  EDAC/altera: Guard against NULL of_node pointer dereference

 drivers/edac/altera_edac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.42.0.411.g813d9a9188

