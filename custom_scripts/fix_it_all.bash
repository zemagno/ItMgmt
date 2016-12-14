#!/bin/bash
redis-cli flushall
rake ts:stop
sleep 2
pkill searchd
rm -rf db/sphinx
rm -rf tmp
rm config/development.sphinx.conf
rake assets:precompile
rake ts:clear_rt
rake ts:clear
rake ts:configure
rake ts:regenerate