FROM ubuntu:24.04
# Create a folder
RUN mkdir actions-runner && cd actions-runner
# Download the latest runner package
RUN apt update && apt install -y curl libicu-dev
RUN curl -o actions-runner-linux-x64-2.322.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.322.0/actions-runner-linux-x64-2.322.0.tar.gz
# Optional: Validate the hash
# RUN echo "b13b784808359f31bc79b08a191f5f83757852957dd8fe3dbfcc38202ccf5768  actions-runner-linux-x64-2.322.0.tar.gz" | sha1sum 256 -c
# Extract the installer
RUN mkdir /home/runner
RUN tar xzf ./actions-runner-linux-x64-2.322.0.tar.gz -C /home/runner
ENV RUNNER_ALLOW_RUNASROOT="1"
# Configure
# Create the runner and start the configuration experience
# RUN ./config.sh --url https://github.com/spokerman12/companyTasks --token AIBYBZZGH2Z7HPIQYXMRIUTHYRKKQ --ephemeral
# RUN ./config.sh --url https://github.com/spokerman12/companyTasks --token AIBYBZZGH2Z7HPIQYXMRIUTHYRKKQ --agent default --work _work --runasservice
RUN /home/runner/config.sh --unattended --url https://github.com/spokerman12/companyTasks --token AIBYBZZGH2Z7HPIQYXMRIUTHYRKKQ --replace [--name default]
# # Last step, run it!
CMD /home/runner/run.sh