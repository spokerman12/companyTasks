# Self-Service

Note:

"A document detailing the technical implementation plan" can be provided if requested and upon further discussion.


## Setup

The setup can be very simple. 

- A Github repository with Terraform code like in this directory.
- Depending on the `terraform.workspace` we'll have a different list of buckets for each environment/AWS Account
- The Github Actions workflow will deploy this code upon PR review and approval.

## Development

Each bucket may require a different configuration. Any further development depends on how complex that configuration is.

The most complex would be if each user needs a special configuration, but that is unlikely.

Most likely there are 2 or more kinds of buckets that share configurations. Depending on the use and the max amount of buckets, there would be more parametrizations in this repo to accomodate them. As an example result, the intention is to end up with classified buckets similar to:

`frontend-dev-jsmith`: The bucket for frontend apps in development to be used by J. Smith.
`frontend-public-jsmith`: The bucket for public frontend apps to be used by J. Smith.
`backend-pro`: The bucket for backend apps in production.

The reason behind this is making the most out of DRY and our capacity to predict infrastructure changes.

Maybe using and thoroughly maintaining a TF_VARS file can be sufficient. Another factor is how many people will be in charge of creating buckets and the frequency. Although it is possible to create and delete buckets on demand, quickly-changing infrastructure can bring unnecesary complexities (state discrepancies in the case of interruptions).