apt-get install lynx > /dev/null
url=$(lynx -dump -listonly 'http://www.mscs.dal.ca/~selinger/md5collision/downloads/' | grep -P 'evil' | cut -d' ' -f5 | sort -nr | head -n 1)

if [[ $1 == 'ver' ]]; then
	date -d "$(curl --head $url 2>/dev/null | grep 'Last' | cut -d':' -f2-)" "+%Y%m%d"
	exit
else
	curl -L $url | tar xvz
	cd evilize-*
	make -j $(nproc)
	cd ..
	rm -rf ./evilize-*/*.o
	find ./evilize-*/* | xargs -I xxx mv xxx ./
	rm -rf ./evilize-*
fi