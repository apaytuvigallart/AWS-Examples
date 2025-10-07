# Documentation
[AWS CLI sns](https://docs.aws.amazon.com/cli/latest/reference/sns/)

# Differences between FIFO and Standard SNS Topics
| | Standard | FIFO |
|-| -------- | ---- |
| Throughput | High | Lower compared to Standard |
| Delivery | At least once (possibility of duplicates) | Exactly once (no duplicates) |
| Ordering | No ordering guaranteed | Messages are delivered in the order they are sent within a message group |
| Use-Case | Where the volume of messages is high and exact ordering or delivery isn't critical, such as alerts or notifications | Where the order and exact delivery are crucial, such as banking transactions or ordered data processing |
| Message Grouping | N/A | Supports message grouping, allowing multiple ordered streams within the same topic |
