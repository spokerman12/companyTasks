1. Jenkins Pipeline

- Jenkins pipeline called "eburyTransferMoneyService." 
- This pipeline will serve as a template for future Jenkins
pipelines

- Ubuntu environment 
- Python 3.12.
- Fetch code from the GitHub repository.
- Execute unit tests using pytest and parallelize them across multiple agents.
- Run integration tests against a staging environment.
- Conduct E2E tests using Selenium Grid to simulate user interactions.

"Ebury-ci-executions" S3 bucket.
    ● upload test results (JUnit XML, code coverage reports)

● Implement security best practices, such as using HashiCorp Vault for secret
management.

Consider using a Jenkinsfile with declarative syntax and leverage Shared Libraries to
promote reusability.

Deliverable
● A Jenkinsfile defining the CI pipeline.
● Documentation includes a README with usage instructions and explanations of
design choices.
● A guide on adapting this pipeline for similar services, including parameterization
options and best practices for customization.
● Present your solution, highlighting the key features, design choices, and benefits.
You may present your solution in a GitHub repository.
Estimated Time: We expect this task to take approximately 2-3 hours to complete.