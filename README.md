# UPA

UPA is a big-data system that automatically infers a local sensitivity value for enforcing Individual Differential Privacy. 
Below shows a simple example demonstrating the functionalities of UPA.

## Core dependencies

`sudo apt-get insall openjdk-8-jdk maven`

## How to build UPA

UPA is built in the same way as Apache Spark 
Assuming that you have cloned this repo to your home directory ($HOME/UPA)
i.e., running:
```
cd $HOME/UPA
build/mvn -DskipTests -T 40 package
```

## Running an example

1.Generate a sample dataset:

`mkdir $HOME/test; python gen_data.py --wq simple --path $HOME/test/dataset.txt --s 100000`

This will create a sample dataset of 100000 records under `$HOME/test/dataset.txt`.

2.Parition the dataset:

`python indexing.py --wq index --path $HOME/test/dataset.txt`

This will partition the dataset (`$HOME/test/dataset.txt`) into two partitions, 
the partitioned dataset is located in `$HOME/test/dataset.txt.upa`.

3.Running an example: 

`./demo_attack.sh`

The outputs are stored in `output.txt`. Detailed descriptions about this attack can be found in the shell file.

## Run UPA in cluster mode

First start a master by running the following command on a master computer:

`./sbin/start-master.sh -h <ip address of master> -p <port to be used>`

Then start workers by running the following command on a worker computer:

`./sbin/start-slave.sh spark://<ip address of master>:<port to be used>`

Then running `./demo_attack.sh` on the master computer. Note that the input dataset has to be replicated on both master and workers. After finishing testing, stop the master and workers by running `./sbin/stop-master.sh` and `./sbin/stop-slave.sh` on master and worker computers respectively, to release their network resources.



