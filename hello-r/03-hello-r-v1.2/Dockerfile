FROM rocker/r-base:latest

# environmental variables 
ENV DIR_APP /app/

# make the main app directory 
RUN mkdir -p ${DIR_APP}
# specify (globally) the working directory
# - all paths in commands below are relative to this working directory
WORKDIR ${DIR_APP}

# install
RUN R -e "install.packages('docopt')" \
  && R -e "install.packages(c('magrittr', 'glue'))" 

# copy scripts from local path to Docker image
COPY hello.R ${DIR_APP}

# run script
RUN  chmod +x hello.R

ENTRYPOINT ["./hello.R"] 
