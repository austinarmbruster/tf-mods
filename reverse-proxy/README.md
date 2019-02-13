# Simple Nginx / Reverse Proxy Example

This module will create an Autoscaling Group of simple Nginx instances.  The instances are placed in a private subnet.  The instances are accessible by the outside world via a Network Load Balancer that is in ia public subnet.

## Dependencies

This module expects that a VPC and collection of subnets already exist.  The VPC and subnets are discovered by tags.  The routing between the subnets is expected to exist as well.

## Inputs

The only required variable is the VPC Tag.  The remainder of the inputs are used to shape the creation of the remaining infrastructure.

### VPC Tag

The VPC Tag (`vpc-tag`) is needed to know the VPC in which the subnets should be placed.  The VPC is expected to have the tag with a value of `true` (`1`).

### App Name

The application name (`app-name`) is used to help scope / namespace the reverse proxy infrastructure.  There may be multiple installations of this module in a single VPC.  The app name will be applied to the names of each AWS component to ensure that there are no conflicts if this module is used twice within a single VPC. 

### Version

It is good practice to tag infrastructure with the version of the Terraform spec that was used to create the infrastructure.  The version (`version`) should be replaced by the git tag or git hash for the specification used to create the infrastructure.

### Reverse Proxy Service Port

The instance of Nginx will be provide users access to some form of content.  In this simple example, users can access the default landing page.  The port that Nginx uses to provide user content is used at several points in the configuration of the infrastructure, e.g. security groups and load balancer configuration.  The infrastructure will expect Nginx to run on the service port. (`reverse-proxy-service-port`).

### Reverse Proxy Health Check Port

The load balancer will run HTTP checks against the Nginx instance to ensure that it is functioning and ready to service users.  Due to mutual TLS configurations, Nginx may be configured to offer health checks on a port other than the primary service port.  The health check port (`reverse-proxy-health-check-port`) will only be accessible from the network load balancer's subnet and not generally available.

### Reverse Proxy Load Balancer Port

The load balancer may very well expose a different port than the instance, e.g. 443 vs. 8443.  The LB Port can be controlled by setting `reverse-proxy-lb-port`. 