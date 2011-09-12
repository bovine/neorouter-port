# New ports collection makefile for:	neorouter-client
# Date created:				2011-08-17
# Whom:					Jeff Lawson <jeff@bovine.net>
#
# $FreeBSD$
#

PORTNAME=	neorouter-client
PORTVERSION=	1.5.1.2820
CATEGORIES=	security
MASTER_SITES=	http://download.neorouter.com/Downloads/NRFree/Update_${PORTVERSION}/FreeBSD/
DISTNAME=	nrclient-${PORTVERSION}-free-freebsd-${ARCH}
EXTRACT_SUFX=	.tgz

MAINTAINER=	jeff@bovine.net
COMMENT=	Fast, secure, simple VPN software with NAT-traversal

WRKSRC=		${WRKDIR}/nrclient

ONLY_FOR_ARCHS=	i386 amd64
NO_BUILD=	yes

SUB_FILES=	pkg-message
PLIST_FILES=	bin/nrservice bin/nrclientcmd
PORTDOCS=	nrclient.README
USE_RC_SUBR=	nrservice

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nrservice ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nrclientcmd ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
. for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/ZebraNetworkSystems/NeoRouter/${doc} \
		${DOCSDIR}
. endfor
.endif

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
