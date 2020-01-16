#!/bin/bash
#Script for clearing nginx cache
#proxy_cache_key "$scheme://$host$request_uri";
proxy_cache_path=/var/nginx/cache
cache_host="https://static.example.com"
#usage function
usage(){
	echo "Usage: $0 url"
        echo "example: https://static.example.com/scripts/js/bundle-13f.js"
	echo "$0 scripts/js/bundle-13f.js"
	exit 1
}
cd $proxy_cache_path
[[ $# -eq 0 ]] && usage
cache_path=$(echo -n $cache_host/$1 |md5sum | awk '{print cache_path"/"substr($1,length($1),1)"/"substr($1,length($1)-2,2)"/"$1}' cache_path=${proxy_cache_path})
rm -f $cache_path
