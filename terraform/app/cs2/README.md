# cs2

## Architecture
<img alt="Terraform" src="https://github.com/bgree13/dc-poc/blob/master/terraform/app/cs2/arch_diagram.png" width="600px">

## Requirements

- Install [Terraform]
- Install [GIT]
- Download [THIS REPO]

[Terraform]: https://www.terraform.io/downloads.html
[GIT]: https://git-scm.com/downloads
[THIS REPO]: https://github.com/bgree13/dc-poc.git

## Terraform Setup

### Authentication

Ensure you have your Azure credentials set correctly in your creds.tf (`subscription_id`, `tenant_id`, `client_id`, and `client_secret`).

## Getting Started

Follow the steps below to update the terraform infrastructure.


- Download the provider plugin:

```
terraform init
```

- Download module dependencies:

```
terraform get -update=true
```

- Test changes locally

```
terraform plan
```

- Make updates to infrastructure / app services on local computer

```
terraform apply
```
