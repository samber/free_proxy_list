
FROM debian:latest
MAINTAINER contact@samuel-berthe.fr

RUN apt-get update && apt-get install -y git

# Add crontab file in the cron directory
ADD hourly /etc/cron.d/hourly
ADD . /root/repo

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hourly

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log

RUN mkdir /root/.ssh
