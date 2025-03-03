
# Jenkins Pipeline

## How to run

- Install [Docker Compose](https://docs.docker.com/compose/install/), for Linux it's best to [use the plugin](https://docs.docker.com/compose/install/linux/#install-the-plugin-manually)
- Run `docker compose up`. You can uncomment the line `image: daniel...` to pull the Jenkins image instead of downloading it. 

Docker Compose should run the following containers, to configure them correctly for the purposes of this assignment please do the following:

### Jenkins: 
- Open http://localhost:8080 
- Locate the admin password in your terminal near "Please use the following password to proceed to installation" or inside the container at `/var/jenkins_home/secrets/initialAdminPassword`
- Install the following plugins when prompted: Pipeline, Pipeline: Github Groovy Libraries, Pipeline Graph View, Git plugin
- Apply the following labels to the build-in runner to enable parallel jobs [here](http://localhost:8080/manage/computer/(built-in)/) with: `linux64 win64 macos`
- Create a Job, select the Pipeline type and provide the Pipeline script from SCM's Repository URL https://github.com/spokerman12/companyTasks and Script Path `01_jenkins/Jenkinsfile`
- Run `docker exec jenkins sh -c 'aws s3 mb s3://default/ --region eu-west-1 --endpoint-url http://$LOCALSTACK_URL --no-sign-request'` to create an S3 bucket.
- Read the Jenkinsfile for more on pipeline steps and comments on improvements

### Vault:
- Available (in development mode) on http://localhost:8200.

### Vault-Loader:
- Loads sample secret into the Vault.

### Localstack:
- Allows creating mock AWS resources.

## Reasoning for the solution

The assignment required configuring many services, which is a challenge for development settings. The solution aims to provide a "dev-first" approach, allowing the user to easily run the pipeline locally and leverage the templates to any repo.

There are many points to improve, in particular Jenkins' connection to Vault. There are network and authentication considerations, and providing a "ready" Jenkins instance is something that helps but can easily take up too much time.

I opted to use the least amount of plugins possible, since it's important to aim to "scale-down" when projects start growing; still, it would be better to understand how often the Jenkins instance needs upgrades, backups and such. Other places for improvement are in how variables are provided to the different stages of the project (variables used for testing are often not the same than those used for deployments).

It's missing the Selenium Grid step. I've used Selenium before in my current and previous positions.

## Guide for further development

As it is, Jenkins is very flexible in its capabilities, but relying on it too much can mean trouble if there's a need to migrate workflows. That being said, if this were to be improved, a good set of upcoming tasks would be:

- Decide how much to parametrize the Jenkinsfile: How complex should each step be? Does it make sense to upload reports all the time? Would it be better to sum the whole pipeline in one separate Python script or to allow Jenkins to handle the logic?
- Secure the connection between Vault and other services. 
- Remove tokens from VCS.
- All `To-Do` comments in the Jenkinsfile.
- Determine if a "ready" Jenkins build makes sense for this project.
- Reduce the size of the Jenkins image.
- Improve the command aliases inside the image
- Fix the Localstack setup so it creates the bucket when booting the container.

