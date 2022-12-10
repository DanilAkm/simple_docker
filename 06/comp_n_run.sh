#!/bin/bash

spawn-fcgi -p 8080 -f ./fcgi_hello.out

nginx -g "daemon off;"