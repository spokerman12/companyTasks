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

What's likely is that there are different 2 or more kinds of buckets that share configurations. Depending on the use and the amount of buckets we can allow ourselves to create (as mentioned, I prefer scaling down), there would be enough parametrizations in this repo to accomodate them. As an example result, the intention is to end up with classified buckets:

frontend-dev-jsmith: The bucket for frontend apps in development to be used by J. Smith
frontend-public-jsmith: The bucket for public frontend apps to be used by J. Smith
frontend-pro: The bucket for frontend apps

Maybe even using and thoroughly maintaining a TF_VARS file can be sufficient. Another factor is how many people will be in charge of creating buckets and the frequency. Although it is possible to create and delete buckets on demand, quickly-changing infrastructure can bring unnecesary complexities (state discrepancies in the case of interruptions).