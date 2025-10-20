# Commands

## Create secret
```sh
aws secretsmanager create-secret \
--name MyTestSecret \
--description "My test secret created with the CLI." \
--secret-string "my ultra secret"
```

## Describe secret
```sh
aws secretsmanager describe-secret \
--secret-id MyTestSecret
```

## Get secret value
```sh
aws secretsmanager get-secret-value \
--secret-id MyTestSecret
```

## Delete secret
```sh
aws secretsmanager delete-secret \
--secret-id MyTestSecret \
--recovery-window-in-days 7
```
