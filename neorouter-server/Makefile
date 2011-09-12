# New ports collection makefile for:	neorouter-server
# Date created:				2011-08-17
# Whom:					Jeff Lawson <jeff@bovine.net>
#
# $FreeBSD$
#

PORTNAME=	neorouter-server
PORTVERSION=	1.5.1.2820
CATEGORIES=	security
MASTER_SITES=	http://download.neorouter.com/Downloads/NRFree/Update_${PORTVERSION}/FreeBSD/
DISTNAME=	nrserver-${PORTVERSION}-free-freebsd-${ARCH}
EXTRACT_SUFX=	.tgz

MAINTAINER=	jeff@bovine.net
COMMENT=	Fast, secure, simple VPN software with NAT-traversal

WRKSRC=		${WRKDIR}/nrserver

ONLY_FOR_ARCHS=	i386 amd64
NO_BUILD=	yes

PLIST_FILES=	bin/nrserver etc/rc.d/nrserver \
		ZebraNetworkSystems/NeoRouter/openssl.cnf
PORTDOCS=	nrserver.README

NEOROUTERROOT=	${PREFIX}/ZebraNetworkSystems/NeoRouter/

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nrserver ${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/etc/rc.d/nrserver.sh \
		${PREFIX}/etc/rc.d/nrserver
	@${MKDIR} ${NEOROUTERROOT}
	${INSTALL_DATA} ${WRKSRC}/ZebraNetworkSystems/NeoRouter/openssl.cnf \
		${NEOROUTERROOT}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
. for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/ZebraNetworkSystems/NeoRouter/${doc} \
		${DOCSDIR}
. endfor
.endif

post-install:
	test -f ${NEOROUTERROOT}/server.crt \
	     || openssl req -new -newkey rsa:1024 -days 3650 -nodes -x509 \
		-keyout ${NEOROUTERROOT}/server.key \
		-out ${NEOROUTERROOT}/server.crt \
		-config ${NEOROUTERROOT}/openssl.cnf

.include <bsd.port.mk>
