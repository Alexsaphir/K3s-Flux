# K3s cluster with Flux

## I - Local configuration

### 1 - Setup workstation tools

Begin by installing `brew`, then [go-task](https://taskfile.dev).

```shell
brew install go-task/tap/go-task
```

Then install all dependencies

```shell
task tools:install
```

### 2 - Setup `Pre-Commit`

Enable Pre-Commit

```shell
task precommit:init
```

Update Pre-Commit

```shell
task precommit:update
```

### 3 - Setup `Age`

Set up an `Age` Private / Public Key

```shell
task age:init
```

### 4 - `.config.env`

Copy sample configuration file

```shell
cp -n .config.sample.env .config.env
```

Fetch Public Key and set `BOOTSTRAP_AGE_PUBLIC_KEY` with its value.

```shell
cat $SOPS_AGE_KEY_FILE | grep --perl-regexp --only-matching "# public key: \K.*"
```
