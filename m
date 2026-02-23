Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00BA37419D;
	Mon, 23 Feb 2026 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881429; cv=none; b=bs12NsrtoYXSxVl0PKWkaw/ASpN+5m1coc4PisF0zf0kQnQEcRrfvXq2sHYwe2yt4QBxrEYaz0+NNPMp7rhADVFHmUWvT5GTzf03DSyW9jnt51uRZ/wyD4jNDUL5ZvzKwmWHXWU+gwvhph2akAxTTrkKIwwQvk2J7AyppmENQBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881429; c=relaxed/simple;
	bh=6Z4Ymyzpd1Csbn4UtXS2PHnqH5lIkviU9wgVJQedY/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6YLDWKKUoYpSZzf68xyfcgfEfbLJGCmRBZ8iIx/6XMq5Gh03o5STYYQJDDov+9uLgpFewatAul2eLZUxFw+XSq5d4xiHyYnt+X4Iej/EKE89CBtyvXmfjswzTDX+B5twv6r/Ls924wh5LH1sKc6+mDCpj98cTWOVKDlp45iMmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=t4hqbQNK; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="t4hqbQNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1771881425;
	bh=6Z4Ymyzpd1Csbn4UtXS2PHnqH5lIkviU9wgVJQedY/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t4hqbQNKwrnOO44BV9XNiTr6fEKgChtf8xt9T0mzdkCw4TDyHIU5aFpWOGtRvRRFw
	 oIMeVjEDUwEYhJW9mleMYz9cFBryH/tsaaE7N3qf4u9uFNx8Tq0UcstSxF4Tzc+T3J
	 ZISG1/OGuHrBK3YuqZgt3oujr2upLl/oAo4ovKOc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 23 Feb 2026 22:16:30 +0100
Subject: [PATCH 3/7] EDAC/device: Drop unnecessary and dangerous tasks of
 attributes
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-sysfs-const-edac-v1-3-3ff0b87249e7@weissschuh.net>
References: <20260223-sysfs-const-edac-v1-0-3ff0b87249e7@weissschuh.net>
In-Reply-To: <20260223-sysfs-const-edac-v1-0-3ff0b87249e7@weissschuh.net>
To: Dinh Nguyen <dinguyen@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Johannes Thumshirn <morbidrsa@gmail.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771881425; l=1667;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6Z4Ymyzpd1Csbn4UtXS2PHnqH5lIkviU9wgVJQedY/U=;
 b=zAJqRG0cfET4+zsIrGgD/pqQe/inhse26caVaBbzV0UH3NNB0F55DEiFFRnTmN4f1JDeFNArB
 0bserL2LDF4Bs8YCOqK9H+JMiU1NhMAZlzBO1o/eIMMPoxb+yG8xozz
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

These casts assume that the 'struct attribute' is at the beginning of
'struct edac_dev_sysfs_block_attribute'. This is can silently break
if the field is moved, either manually or through struct randomization.

Use proper member syntax to get the field address and drop the casts.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/edac/edac_device_sysfs.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index 9cc466b78982..1e79f36a91fa 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -573,8 +573,7 @@ static void edac_device_delete_block(struct edac_device_ctl_info *edac_dev,
 		for (i = 0; i < block->nr_attribs; i++, sysfs_attrib++) {
 
 			/* remove each block_attrib file */
-			sysfs_remove_file(&block->kobj,
-				(struct attribute *) sysfs_attrib);
+			sysfs_remove_file(&block->kobj, &sysfs_attrib->attr);
 		}
 	}
 
@@ -734,7 +733,7 @@ static int edac_device_add_main_sysfs_attributes(
 		 */
 		while (sysfs_attrib->attr.name != NULL) {
 			err = sysfs_create_file(&edac_dev->kobj,
-				(struct attribute*) sysfs_attrib);
+				&sysfs_attrib->attr);
 			if (err)
 				goto err_out;
 
@@ -762,8 +761,7 @@ static void edac_device_remove_main_sysfs_attributes(
 	sysfs_attrib = edac_dev->sysfs_attributes;
 	if (sysfs_attrib) {
 		while (sysfs_attrib->attr.name != NULL) {
-			sysfs_remove_file(&edac_dev->kobj,
-					(struct attribute *) sysfs_attrib);
+			sysfs_remove_file(&edac_dev->kobj, &sysfs_attrib->attr);
 			sysfs_attrib++;
 		}
 	}

-- 
2.53.0

