FROM apify/actor-node-chrome-xvfb

# Install x11vnc 
USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y x11vnc \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /src/*.deb

# Run everything after as non-privileged user.
USER myuser
WORKDIR /home/myuser

# Copy source code
COPY --chown=myuser:myuser start_xvfb_and_run_cmd.sh /home/myuser/

ENV DISPLAY=:99
ENV XVFB_WHD=1280x720x16
ENV APIFY_XVFB=1

# This starts xvfb frame buffer and then executes Dockerfile CMD, it also runs x11vnc
ENTRYPOINT [ "./start_xvfb_and_run_cmd.sh" ]

# Not using "npm start" to avoid unnecessary process, using CMD to enable simple overriding
CMD [ "node", "main.js" ]
