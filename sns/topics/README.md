# Commands

## Create Standard SNS Topic
```sh
aws sns create-topic --name my-topic
```

## Create FIFO SNS Topic
Note that in order to create a FIFO SNS Topic, we must specify `.fifo` as part of the name.
```sh
aws sns create-topic --name my-topic.fifo --attributes FifoTopic=true
```
