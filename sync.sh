#!/usr/bin/env bash
rsync -a -e "ssh -p 2201" --exclude=cmake-build-debug /Users/lionon/Documents/AutoDP/examples/src/main/scala/main/scala john@127.0.0.1:/home/john/AutoDP/examples/src/main/scala/main/
rsync -a -e "ssh -p 2201" --exclude=cmake-build-debug /Users/lionon/Documents/AutoDP/core/src/main/scala/edu/hku/cs/dp john@127.0.0.1:/home/john/AutoDP/core/src/main/scala/edu/hku/cs/
rsync -a -e "ssh -p 2201" --exclude=cmake-build-debug /Users/lionon/Documents/AutoDP/run_example.sh john@127.0.0.1:/home/john/AutoDP/