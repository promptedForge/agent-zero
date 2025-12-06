# Dockerfile for Railway deployment
# Use the pre-built base image for Agent Zero
FROM agent0ai/agent-zero-base:latest

# Set BRANCH to "main" for Railway deployment
ARG BRANCH=main
ENV BRANCH=$BRANCH

# Copy filesystem files to root
COPY ./docker/run/fs/ /

# Copy current development files to git
COPY ./ /git/agent-zero

# Pre installation steps
RUN bash /ins/pre_install.sh $BRANCH

# Install Agent Zero
RUN bash /ins/install_A0.sh $BRANCH

# Install additional software
RUN bash /ins/install_additional.sh $BRANCH

# Cleanup repo and install A0 without caching
ARG CACHE_DATE=none
RUN echo "cache buster $CACHE_DATE" && bash /ins/install_A02.sh $BRANCH

# Post installation steps
RUN bash /ins/post_install.sh $BRANCH

# Expose port - Railway will set PORT env variable
EXPOSE 80

# Make scripts executable
RUN chmod +x /exe/initialize.sh /exe/run_A0.sh /exe/run_searxng.sh /exe/run_tunnel_api.sh

# Initialize runtime and switch to supervisord
CMD ["/exe/initialize.sh", "$BRANCH"]
