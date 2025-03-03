# Github Self-Hosted Runners in AWS

Note:

I thought that the Jenkins task was more interesting and demanding than this one. I've developed many, many pipelines with matrixes, artifacts, compatibility builds and even new Github Actions from scratch, so please allow me to frame this as if it were a real project instead:

## Github Actions workflows

In the `.github` folder there's a sample Github action for this assignment. It's the simplest workflow file possible. 

Depending on the app, we'll add the needed actions and scripts to build, test and deploy it. I always try to use the least amount of plugins possible, aiming for decoupling, but also not being cumbersome. 

## Terraform code

Taking the company as an example, where there are about 50 to 100 deployable services, it's safe to assume that there are teams working on several groups of repos.

The main consideration is determining the workload for each deployment, then we'll be able to form new groups based on what the projects actually need. 

Having done that, we prioritize either speed or costs, or maybe make a hybrid plan depending on the time of the day or current activity load.

Any proposed solution has a minimal cost and in this stage it's the only time were we can really narrow it down. Then, everything tends to grow and become more expensive.

The Terraform code will contain:
- A single global module
- If needed, all the networking resources to host EC2 instances (VPC, SGs, NGW, EIPs)
- An Autoscaling Group
- Launch Templates according to the projects' computing needs
- Either ECS or EKS, creating clusters for the groupings that make most sense and have them be in Batch mode [so they are removed when done with the deployment.](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/autoscaling-with-self-hosted-runners#using-ephemeral-runners-for-autoscaling
)

## Documentation on how to deploy, configure, and manage the self-hosted runner solution.

The main point with runners is how they're distributed. Github allows for [Enterprise Runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners#adding-a-self-hosted-runner-to-an-organization) to deal with the workload for a whole organization, but it's better to further put them into [groups](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/managing-access-to-self-hosted-runners-using-groups).

It's also important to configure the images of the runners with the appropriate token. So we could create a **Github repo with Github Actions or equivalent** that updates the runner image if needed and registers new repositories or runner groups.

Configuration should be limited to IaC and the runner's repository.

To execute the runner, it's enough to build and run the image: `docker build . -t runner && docker run --rm -it runner`.

To add new runners to a repo, go to [https://github.com/user/reponame/settings/actions/runners](https://github.com/user/reponame/settings/actions/runners) and you can request the configuration script for your OS of choice.

## Key features, design choices, and benefits.

As stated, it's important to determine what each workload needs. This will allow us to:
- Keep prices down
- Reduce downtime because resources will be ready and less likely to be used in irrelevant jobs

The EKS/ECS approach also allows for better scalability and fault tolerance.

However this is all relative, since the actual project needs outweigh these approaches. It's possible that autoscaling is not needed at all and that a single EC2 instance can handle all the workload.
