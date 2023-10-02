**Fossil SCM - scgi - based on Alpine**

This is a simple Fossil SCM server (https://fossil-scm.org) which is run under SCGI protocol.
This mean that the container does not have any web server serving the Fossil page, instead you will need to have another web server such as Nginx to serve the Fossil instance.

**Features**:

- Using Alpine as based (small size).
- Running fossil using "fossil" UID in chroot.
- Have a working /dev/null .
- Have a working /dev/urandom .
- Using SCGI protocol (because I'm using Nginx as reverse proxy)
- Running using --repolist option, which should serve multiple \*.fossil repositories.

**Requirements**:

Set up your Nginx to serve the scgi instance of this docker: Please refer https://www.fossil-scm.org/home/doc/trunk/www/scgi.wiki

**Configurations**:

VOLUME: /opt/fossil

- You can mount this as persistent to store all your repositories. You will need to upload your \*.fossil files into this folder for fossil to serve it.

PORT: 9000

- You can change this in the Dockerfile if you need. You can also route to another port when running the docker.

**Usage**:

Run the docker image using you desired options. The simplest way using Docker CLI is:

    docker run -p 9000:9000 -v VOLUME_NAME:/opt/fossil alsemo/fossilscm:latest

Now check the container's log and you should see this:

    Listening for SCGI requests on TCP port 9000

This means the fossil server is running. Ensure that your Nginx has been configured accordingly. The first time you run this container, the fossil web will not be displayed. **DO NOT WORRY**, this is the default if there is no \_.fossil file available in /opt/fossil folder. Upload your \*.fossil file that you want to be served on the web into this docker's /opt/fossil folder and refresh your browser. It should work. No need to restart the Nginx nor the docker itself.

**Updates**:

02/10/2023:

- Removed fossil.sh. Now using only Dockerfile.
- No longer create a default.fossil file.

18/06/2023:

- Updated Alpine to 3.18 .
- Updated fossil SCM to version 2.21 .

09/12/2022:

- Updated fossil SCM to version 2.20 .
- --repolist serving folder is working now.

24/08/2021:

- Fixed "Error unable to write readonly database" issue.
- Updated Dockerfile.
- Build a new container.

2 years ago: Initial build.
