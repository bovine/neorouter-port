--- etc/rc.d/nrservice.sh	2011-08-20 13:04:58.000000000 -0500
+++ etc/rc.d/nrservice.sh	2011-08-20 15:51:35.000000000 -0500
@@ -21,7 +21,12 @@
 nrservice_start() 
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
