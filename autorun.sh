#autorun.sh
#usage: nohup sh autorun.sh
/etc/init.d/polipo restart
sslocal -c /home/jackie/shadowsocks.json
fusuma

