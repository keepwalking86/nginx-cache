#!/bin/bash
#Script for clearing nginx cache files
#proxy_cache_key "$scheme://$host$request_uri";
proxy_cache_path=/var/nginx/cache
cache_host="https://static.example.com"
#usage function
usage(){
	echo "Usage: $0 uri"
        echo "example: https://static.example.com/scripts/js/bundle1.js"
	echo "$0 scripts/js/bundle1.js"
	exit 1
}
#store arguments in a array
args=("$@")
# get number of elements in the array
elements=${#args[@]}
#find and delete cache files
cd $proxy_cache_path
[[ $# -eq 0 ]] && usage
for (( i=0;i<$elements;i++)); do
    cache_path=$(echo -n $cache_host/${args[${i}]} |md5sum | awk '{print cache_path"/"substr($1,length($1),1)"/"substr($1,length($1)-2,2)"/"$1}' cache_path=${proxy_cache_path})
    echo $cache_path
    rm -f $cache_path
done
