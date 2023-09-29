# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utiliza semantic versioning for its tagging.
[semver.org](https://semver.org/)


The general format:

**MAJOR.MINOR.PATCH**, eg, 1.0.1

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes


## Install Terraform CLI

Considerations with the terraform CLI changes
The terraform CLI installation instructions have changed due to gpg keyring changes. So we needed refer to the lastesr install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/downloads)

### Considerations for Linux distribution

This project is built against Ubuntu.
Please consider checking your distribution needs. 

[How to check OS version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)


Example of OS checking information

```sh
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we decided to creare a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This allow us an easier to debug and execute manually Terraform CLI install.
- This will allow better portablity for other projects that need to install Terraform CLI.

####  Shebang Considerations

A Shebangs (prounced Sha-bang) tells the bash script what program that will interpret the script. eg. `#!/bin/env bash`

ChatGPC recpmmended this format for bash: `#!/usr/bin/env bash`

- for portability for different OS distributions.
- will search the user´s PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations

When executing the bash script we can use the `./` shorthand notiation to execute the bash script.

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yaml we need to poiny the script to a program to interpert it.
eg. `source ./bin/install_terraform_cli`


#### Linux Considerations

In order to make our bash scripts executable we need to change permission for the fix to be exetuable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

Alternatively :
```sh
chmod 744 ./bin/install_terraform_cli
```
https://en.wikipedia.org/wiki/Chmod

### GitHub Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not rerun if we restart an existing workspace 
https://www.gitpod.io/docs/configure/workspaces/workspace-lifecycle

#### Working Env Vars

We can list out all Enviroment Variables (Env Vars) usuing the env command

We can filter specific env vars using grep eg. `env | grep AWS``

Seting and Unseting Env Vars
In the terminal we can set using export HELLO= 'world' In the terminal we unset using unset HELLO We can set an env var temporarily when just runnung a command

HELLO='world' ./bin/print_message
Within a bash script we can set env without writing export eg.

#!/bin/env bash
HELLO='world'

echo $HELLO
Printing Env Vars
We can print env var using echo eg. echo $HELLO

Scoping of Env Vars
When you open up new bash terminals in VSCode it will not be aware of env avrs that you have set in another window.

If you want to Env Vars to persist across all future bas terminals that are open you need to set env vars in your bash profile. eg. .bash_profile

persisting Env Vars in Gitpod
We can persist env var into gitpod by storing them in Gitpod Secrets Storage.

gp env HELLO='world'
All future workspaces launched will set the env vars for all bash terminals opened in thoes workspaces.

You can also set vars in the .gitpod.yml but this can only contain non-senstibe env vars.

### AWS CLI Installtion

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](`./bin/install_aws_cli`)

[Getting Started Instal (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credential is configured correctly by runnung the following AWS CLI command

```sh
aws sts get-caller-identity
```
If it is succesfull you should see a json payload return that looks like this

```json
{
    "UserId": "AIDDREAGHYHOLI",
    "Account": "1234567891",
    "Arn": "arn:aws:iam::1234567891:user/terraform-begginer-bootca
}
```

We will need to generate AWS CLI credits from IAM User in order to user AWS CLI





