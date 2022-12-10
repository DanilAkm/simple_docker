#!/bin/bash

gcc fcgi_hello.c -lfcgi -o fcgi_hello.out

spawn-fcgi -p 8080 -f ./fcgi_hello.out

nginx -g "daemon off;"