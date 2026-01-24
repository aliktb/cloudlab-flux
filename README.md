# cloudlab-flux

Repo containing core FluxCD config for cloud-hosted Kubernetes clusters

## Bootstrap

Some env files are required for bootstrapping

### External Secrets Operator secret

We are using Scaleway as the provider for secrets. Unfortunately, Scaleway does
not offer IAM Roles for Service Accounts(IRSA) like AWS. So we need to provide
an access key pair with the ability to read secrets from our Scaleway project.
The simplest way to do this is to create the secret manually. This is done in
[bootstrap.sh](./utils/bootstrap.sh). However, we need to populate a `.env.scaleway`
with an access key pair from Scaleway with the ability to read secrets:

```bash
cp .env.scaleway.example .env.scaleway
```

Populate this gitignored env file with the access key pair and save it

### Install FluxCD

Configure a `.envrc` with the contents from [.envrc.sample](.envrc.sample) to
allow FluxCD to read/write to the GitHub repo

Next, run `task up` to bootstrap the cluster with FluxCD
