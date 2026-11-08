Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128075;
	b=l852Ci5iBQSF6FqLIf0PP2inp6ZKUml6DcsrDT4SYn34z84UAtMXYUpHrpLeRgiW5HMX
	 16qk27M1w+CAPL7H1IeBDiVx33rkPBlN2YjbiLa/bafaE5PQxhs2WSQpWhsTV2WF9nMaC
	 3lkkmOg+VMSr3UhKHlxpub1qRhgkiNdtcnXDi8atad6O3soWebFWemjNQgPSD8eFZJW7/
	 aEzbGUxMJ+hC/fTeahPkbY0TovGJirznwVd52ER3DXphf5BF3Wyv6wUm9Szzurtu8tXVp
	 4Og/ufXHNCdjWv2Lg/iwY0kxjwIgY9x7Yekf2Nb9oZH1lzIAroa1yBI5bAFtFnehjuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128075;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=emAvy/kX/TjT3XGP5DxuZXiiW4DHPqQScNtLSEVzPiE=;
	b=LQ88HxF/zjn70f0hJ5UXMcg9p8uUzRLeVSIgy2nkvv987yGLG9bmjPK+y3E0UNCiDYot
	 z0+2+mEylP55M9H+NeN8tMFpEuhV7WaWXfdPVb/bJFjf9GSqKHQDHwBBW26YiskRdbBio
	 ms402L5bO6uOTkd8G7m2bIk24Z/OP8eSxAs+g4ou1QjFDajc52rOzeb8mNM17GpRiKqTl
	 NkizLj3mA5bGA4zijD/GHhjrmCe+oULrQ7DlMFWLA8oFIcN0f8ch+lROjG/XYqLOewvlo
	 j5JbNTXIKsjuzb52MFj5Zjc4y2X32jfnn/alZVmEIoCXAKsjiUpK/dCdbjBwst+TDNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QohK5BcM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BDC606A334
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QohK5BcM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177151F008BE;
	Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=emAvy/kX/TjT3XGP5DxuZXiiW4DHPqQScNtLSEVzPiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QohK5BcMi8EL9UJvuk2fa86xYKX7wfoRXuiiukk1/adOjfhNV1H348MHP2SrS1OR9
	 cq92vUgGaiRHOKPc8nbX4wJC7SXG8Mk1wbPkmJg2/I56zLQJX0snT4LDnjk8dWJSny
	 U6c+obfx1ZckdtCCYoNTgUVXXiUFiDGFQ7LuHgVtvk0Ih/1grvIResYO3gGDQhE6sK
	 vGC1eUnk3Tu/cZvbG0s+nFphNwNrK0bZsxOVRFOyLellIlHzB31xqOVPxoRkoc943t
	 q/LHTcPaXms5H8IAUa1TurRJ7WXXdQi/9wtzP5BoTgGoa9684QTELw+/IA/HmP4F4x
	 lbfls1GdsO8EQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Uje-1ttM;
	Sun, 08 Nov 2026 09:54:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH 11/13] scripts/ghes_inject: print help if no command specified
Date: Sun,  8 Nov 2026 09:54:24 +0100
Message-ID: <828f9cd2216a95d553222bf3563df0496fc0308d.1794127710.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794127710.git.mchehab+huawei@kernel.org>
References: <cover.1794127710.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The first positional argument (command) is mandatory. If not
specified, instead of a simple error message, show help as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/ghes_inject.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/ghes_inject.py b/scripts/ghes_inject.py
index 63a8b28002e7..dd2b34a64f15 100755
--- a/scripts/ghes_inject.py
+++ b/scripts/ghes_inject.py
@@ -52,6 +52,9 @@ def main():
         if not args.func(args):
             sys.exit(1)
     else:
+        print("Error: no command specified\n", file=sys.stderr)
+        parser.print_help(file=sys.stderr)
+        print(file=sys.stderr)
         sys.exit(f"Please specify a valid command for {sys.argv[0]}")
 
 if __name__ == "__main__":
-- 
2.56.0

