**Fossil SCM - scgi - based on Alpine**

This is a simple Fossil SCM server (https://fossil-scm.org) which is run under SCGI protocol.
This mean that the container does not have any web server serving the Fossil page, instead you will need to have another web server such as Nginx to serve the Fossil instance.



**Features**:

- Using Alpine as based (small size).
- Running fossil using "fossil" UID in chroot.
- Have a working (hopefully) /dev/null .
- Have a working (hopefully) /dev/urandom .
- Using SCGI protocol (because I'm using Nginx as reverse proxy)
- Running using --repolist option, which should serve multiple *.fossil repositories.



**Configurations**:

VOLUME: /opt/fossil
You can mount this as persistent to store all your repositories.

PORT: 9000
You can change this in the Dockerfile if you need.



**Requirements**:

Set up your Nginx to serve the scgi instance of this docker: Please refer https://www.fossil-scm.org/home/doc/trunk/www/scgi.wiki



**Usage**:

Run the docker image using you desired options.

By default, the build will:

- Create a "default.fossil" repo as your starting point.
- Create "admin" user with a randomized password which you need to see from the docker's log.

Then you will need to log in to the *default* fossil page with the **admin** account along with the password displayed on the container's log.
Change the **admin** password to your own.

Upload your *.fossil file that you want to be served on the web into this docker's /opt/fossil folder.



**Updates**:

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