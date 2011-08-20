--- etc/rc.d/nrserver.sh	2011-08-20 16:34:58.000000000 -0500
+++ etc/rc.d/nrserver.sh	2011-08-20 16:36:29.000000000 -0500
@@ -22,7 +22,12 @@
 nrserver_start() 
 {
 	echo -n "Starting ${name} services: "
-	/usr/sbin/daemon -f -p $pidfile $DAEMON >/dev/null &
+	if [ -x /usr/sbin/daemon ]; then
+		/usr/sbin/daemon -f -p $pidfile $DAEMON >/dev/null &
+	else
+		$DAEMON >/dev/null &
+		echo $! >$pidfile
+	fi
 	if [ $? -eq 0 ]
 	then
 	    echo "SUCCESS"
