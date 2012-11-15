Description
===========
This cookbook example demonstrates how to create a recipe which supports 
multiple virtual hosts on one instance using the Load Balancer with HaProxy ServerTemplate

Lets use a configuration that has Tomcat7 and a PHP app on one instance. 
Tomcat7 is installed using the Tomcat7 App Server Template and 
is running on port 8000 and the PHP App is running on port 8080.  

You want multiple instances running this Tomcat7 and PHP app configuration balanced
using the Load Balancer HAProxy Server Template.

This example has two recipes
vhost_example::default - Installs the new virtual host file and the php app
vhost_example:do_attach_lb - Attaches the virtual host to the load balancer and 
opens the firewall ports to allow the load balancer access to the virtual host.

Placement of Recipes
====================
Place the vhost_example::default (or your equivalent) recipe under the 
app:do_update_code.  Place the vhost_example::do_attach_lb (or your 
equivalent) recipe after lb::do_attach_request

Deployment Inputs
=================
lb/pools = /phpapp,default  

/phpapp  provides the LB backend path to the PHP app on the virtual host.  It is 
also the directory in the DocumentRoot which the PHP application lives.  In this 
example, the recipe uses /vhost_example

default provides the LB backend path to the tomcat server, and requests to it 
resolve to the ROOT tomcat app. 

lb/healthcheck = /path/to/file

No other inputs are needed


Other Changes
=============
It's best practice to use inputs for ports and directories.  However, in this example, 
I chose to hard code ports and directories and other logic to make the example easier to
understand.

You may not want the PHP App to resolve to a path on the virtual server.  In this 
case you way want to include a Apache rewrite rule on the virtual host. 

Notice
======
This server example is brought to you by RightScale Professional Services.



