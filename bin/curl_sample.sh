#!/bin/sh

curl -D -X POST -H "Accept: application/vnd.ydp.eu.bingel-v1.0+json" -H "Content-Type: application/vnd.ydp.eu.bingel-v1.0+json" http://localhost/edugine.app.bingel/web/app_dev.php/accounts -d '{"guid" : "1", "login":"2", "password":"3"}'


