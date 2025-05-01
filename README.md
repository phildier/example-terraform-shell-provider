# Example terraform shell provider

This is a companion repository for the blog post [Using the Terraform Shell Provider](https://)

## Using This Repository

1. Clone the repository
1. Copy .env.dist to .env (or .envrc if you use [direnv](https://direnv.net/))
1. Run docker compose to start localstack
   ```
   docker compose up -d
   ```

You should now be ready to run the examples.

## Shell Example

This example shows how to use bash scripts as a simple way to implement
unsupported functionality in terraform while maintaining the benefits of
terraform's dependency graph, etc.

1. Running the shell example
   ```
   cd examples/shell
   terraform init
   terraform plan -out=plan.out
   terraform apply
   ```
