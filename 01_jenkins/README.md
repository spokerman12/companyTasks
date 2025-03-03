
# Jenkins Pipeline

e key features, design choices, and benefits 


## How to run
https://docs.docker.com/compose/install/
https://docs.docker.com/compose/install/linux/#install-the-plugin-manually
- `docker compose up`
*You can uncomment the line*

Docker Compose should run the following containers

Jenkins: 
    - Available on http://localhost:8080 
    - Please use the following password to proceed to installation or /var/jenkins_home/secrets/initialAdminPassword
    - Create a Job, select Pipeline and provide the 
Vault:
Vault-Loader:
Localstack:

Documentation includes a README with usage instructions and explanations of
design choices.
● A guide on adapting this pipeline for similar services, including parameterization
options and best practices for customization

Doicker Compose Up
Ver password admin jenkins

def agents  = ['win64', 'linux64', 'macos']
