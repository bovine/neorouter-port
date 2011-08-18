# New ports collection makefile for:	neorouter-server
# Date created:				2011-08-17
# Whom:					Jeff Lawson <jeff@bovine.net>
#
# $FreeBSD: ports/security/neorouter-server/Makefile,v $
#

PORTNAME=	neorouter-server
PORTVERSION=	1.5.1.2820
PORTREVISION=   1

CATEGORIES=	security
MASTER_SITES=	http://download.neorouter.com/Downloads/NRFree/Update_${PORTVERSION}/FreeBSD/

DISTFILES=      nrserver-${PORTVERSION}-free-freebsd-${ARCH}.tgz
WRKSRC=         ${WRKDIR}/nrserver

DISTINFO_FILE=  ${MASTERDIR}/distinfo.${ARCH}

MAINTAINER=	jeff@bovine.net
COMMENT=	Fast, secure, simple VPN software with NAT-traversal

ONLY_FOR_ARCHS=	i386 amd64
NO_BUILD=       yes

PLIST_FILES=    bin/nrserver bin/rmnrserver.sh etc/rc.d/nrserver \
	ZebraNetworkSystems/NeoRouter/openssl.cnf
PORTDOCS=	nrserver.README

NEOROUTERROOT=	${PREFIX}/ZebraNetworkSystems/NeoRouter/


do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nrserver ${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/bin/rmnrserver.sh ${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/etc/rc.d/nrserver.sh ${PREFIX}/etc/rc.d/nrserver
	@${MKDIR} -p ${NEOROUTERROOT}
	${INSTALL_DATA} ${WRKSRC}/ZebraNetworkSystems/NeoRouter/openssl.cnf ${NEOROUTERROOT}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/ZebraNetworkSystems/NeoRouter && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif


post-install:
	test -f ${NEOROUTERROOT}/server.crt || openssl req -new -newkey rsa:1024 -days 3650 -nodes -x509 -keyout ${NEOROUTERROOT}/server.key -out ${NEOROUTERROOT}/server.crt -config ${NEOROUTERROOT}/openssl.cnf
	@${ECHO} ""
	@${ECHO} "Add the following to /etc/rc.conf:"
	@${ECHO} '   nrserver_enable="YES"'
	@${ECHO} "Start nrclient with:"
	@${ECHO} "   $(prefix)/etc/rc.d/nrserver.sh start"
	@${ECHO} ""



.include <bsd.port.mk>
