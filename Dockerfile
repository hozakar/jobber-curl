FROM jobber:1.4.4-alpine3.11

# add curl
USER root
RUN apk add --no-cache curl

# copy job file
COPY config/.jobber /home/jobberuser/.jobber

# copy job content copier file
COPY config/startup.sh /home/jobberuser/startup.sh


# create log dir & files
RUN mkdir /home/jobberuser/log
RUN touch /home/jobberuser/log/jobber.log
RUN touch /home/jobberuser/log/runlog.log

# set owner
RUN chown -R jobberuser /home/jobberuser

# go back to jobberuser
USER jobberuser

ENTRYPOINT [ "/home/jobberuser/startup.sh" ]