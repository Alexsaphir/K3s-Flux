# K3s cluster with Flux

## 1 - Setup workstation tools

Begin by installing `brew`, then [go-task](https://taskfile.dev).

```shell
brew install go-task/tap/go-task
```

Then install all dependencies

```shell
task tools:install
```

## 2 - Setup `Pre-Commit`

Enable Pre-Commit

```shell
task precommit:init
```

Update Pre-Commit

```shell
task precommit:update
```
