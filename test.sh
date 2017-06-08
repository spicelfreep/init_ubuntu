# this is a testfile
function sogou_install(){
	dpkg -l| grep sogou > /dev/null
	if [ $? -eq 0];then
		echo -e "\033[32m you have install sogou pinyin  \033[0m"
	else
		cd ~/Downloads
		echo -e "\033[32m install sogou pinyin \033[0m"
		wget -c "pinyin.sogou.com/linux/download.php?f=linux&bit=64" -O sogoupinyin_2.1.0.0086_amd64.deb
		sudo dpkg -i sogoupinyin_2.1.0.0086_amd64.deb
	fi
}
sogou_install
