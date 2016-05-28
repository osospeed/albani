#!/usr/bin/env bash
# set -x
pthOrg=`pwd`

arrIgnore=(
	barf-project
	klee
	)

function githubCommit(){ git ls-remote $1 | grep -P 'HEAD$' | cut -f 1; }

cp ./ver.tsv /tmp/ver.tsv
cat /tmp/ver.tsv | while read i; do
	read prj cCommit url typ rst <<< "$i"
	[[ " ${arrIgnore[*]} " == *" $prj "* ]] && continue;	# ignore
	
	[[ $typ = 'git' ]] && lCommit=`githubCommit $url`
	[[ $typ = 'dyn' ]] && { chmod 777 ./build/$prj/mk.sh; lCommit=`./build/$prj/mk.sh ver`; }
	
	[[ -n $lCommit ]] && {
		[[ "$cCommit" != "$lCommit" ]] && {
			echo "______________________________________________[ $prj ]"
			# ...
			sed -i "/$prj\s/d" ./ver.tsv
			echo -e "$prj\t$lCommit\t$url\t$typ" >> ./ver.tsv; sort -o ./ver.tsv ./ver.tsv

			[[ $typ = 'git' ]] && git clone $url /tmp/$prj
			[[ $typ = 'dyn' ]] && mkdir /tmp/$prj
			
			touch /tmp/mmm
			cp -a ./build/$prj/mk.sh /tmp/$prj
			rm -rf ./build/$prj/*
			
			cd /tmp/$prj
			chmod 777 ./mk.sh; sudo bash -x ./mk.sh
			find ./* -type f -newer /tmp/mmm | xargs -I xxx cp -a --parents xxx $pthOrg/build/$prj
			cp -a /tmp/$prj/mk.sh $pthOrg/build/$prj/

			cd $pthOrg
			git add --all $pthOrg/build/$prj/*
			git add --all $pthOrg/ver.tsv
			git commit -m ${prj}"_`date '+%Y-%m-%d-%H:%M'`"
			git push origin
		}
	}
done
sed -i 's/\r$//' ./ver.tsv
