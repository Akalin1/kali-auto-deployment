#!/bin/bash
BP_CACERT='/tmp/bp_cacert.der'
Java_path='/usr/lib/jvm/java-21-openjdk-amd64/bin/java'
bp_jar='/usr/share/burpsuite/burpsuite.jar'

/bin/bash -c "timeout 20s $Java_path -Djava.awt.headless=true -jar $bp_jar &" 2>/dev/null
/usr/bin/sleep 5
until /usr/bin/nc -z -v -w10 localhost 8080; do
  echo "Waiting for Burp Suite to start..."
  /usr/bin/sleep 5
done

/usr/bin/curl -s http://localhost:8080/cert -o "$BP_CACERT"
if [[ -s "$BP_CACERT" ]];then
  echo "Download Success!"
  exit
else
  echo "Download Failed!"
  exit 1
fi
