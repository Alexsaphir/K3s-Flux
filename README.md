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

## II - Configure cluster nodes

### 1- Preparations

Edit `provision/ansible/inventory/inventory.yml` with the information of your nodes.
In `controls` add your control node and in `workers` add the nodes that should only be worker.

For each host, create a file named `{{ HOSTNAME }}.sops.yml` and add the `ansible_become_pass`.

<details>
<summary> Example </summary>

````yaml
# provision/ansible/inventory/host_vars/{{ HOSTNAME }}.sops.yml

ansible_become_pass: the_super_secret_password
````
</details>


Encrypt the file using `sops`.

```shell
sops --encrypt --in-place provision/ansible/inventory/host_vars/cube-control.sops.yml
```

To  get a list of all your nodes and status you can use the followings.
```shell
task ansible:list
task ansible:ping
```

You can now prepare the nodes.
```shell
task ansible:prepare
```

### 2 - Deploy

You can now deploy K3s.

```shell
task ansible:install
```
