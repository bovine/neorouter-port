# New ports collection makefile for:	neorouter-client
# Date created:				2011-08-17
# Whom:					Jeff Lawson <jeff@bovine.net>
#
# $FreeBSD: ports/security/neorouter-client/Makefile,v $
#

PORTNAME=	neorouter-client
PORTVERSION=	1.5.1.2820
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://download.neorouter.com/Downloads/NRFree/Update_${PORTVERSION}/FreeBSD/
DISTNAME=	nrclient-${PORTVERSION}-free-freebsd-${ARCH}
EXTRACT_SUFX=	.tgz

MAINTAINER=	jeff@bovine.net
COMMENT=	Fast, secure, simple VPN software with NAT-traversal

WRKSRC=		${WRKDIR}/nrclient
DISTINFO_FILE=	${MASTERDIR}/distinfo.${ARCH}

ONLY_FOR_ARCHS=	i386 amd64
NO_BUILD=	yes

PLIST_FILES=	bin/nrservice bin/nrclientcmd bin/rmnrclient.sh etc/rc.d/nrservice
PORTDOCS=	nrclient.README

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nrservice ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nrclientcmd ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/rmnrclient.sh ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/etc/rc.d/nrservice.sh ${PREFIX}/etc/rc.d/nrservice
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/ZebraNetworkSystems/NeoRouter/ && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

post-install:
	@${ECHO} ""
	@${ECHO} "Add the following to /etc/rc.conf:"
	@${ECHO} '   nrservice_enable="YES"'
	@${ECHO} "Start nrclient with:"
	@${ECHO} "   ${prefix}/etc/rc.d/nrservice.sh start"
	@${ECHO} ""

.include <bsd.port.mk>
