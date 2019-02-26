# Simple Apache

This module will create an Autoscaling Group of simple Apache instances.  The instances are placed in a private subnet and in a Network Load Balancer.  Access to the instances is outside the scope of this module.  The related Reverse Proxy module should provide a basis for accessing the instance.

## Dependencies

This module expects that a VPC and collection of subnets already exist.  The VPC is discovered by a tag.  The subnet ids are provided as an input.  The related Subnet Lookup module can be used to find the subnet IDs.  The routing between the subnets is expected to exist as well.

## Inputs

The following inputs are required:

* VPC Tag
* Subnet IDs

The remainder of the inputs are used to shape the creation of the remaining infrastructure.

### VPC Tag

The VPC Tag (`vpc-tag`) is needed to know the VPC in which the servers should be placed.  The VPC is expected to have the tag with a value of `true` (`1`).

### Subnet IDs

The Apache instances will be placed in AWS subnets provided in `subnet-ids`.  The expectation is that these subnets are not publicly accessible.  The Apache instances will be made accessible to the outside world via a load balancer.

### App Name

The application name (`app-name`) is used to help scope / namespace the HTTP server infrastructure.  There may be multiple installations of this module in a single VPC.  The app name will be applied to the names of each AWS component to ensure that there are no conflicts if this module is used twice within a single VPC.

### Version

It is good practice to tag infrastructure with the version of the Terraform spec that was used to create the infrastructure.  The version (`version`) should be replaced by the git tag or git hash for the specification used to create the infrastructure.

### Simple HTTP Server Service Port

The instance of Apache will be provide users access to some form of content.  In this simple example, users can access the default landing page.  The port that Apache uses to provide user content is used at several points in the configuration of the infrastructure, e.g. security groups and load balancer configuration.  The infrastructure will expect Apache to run on the service port. (`simple-http-server-service-port`).

### Simple HTTP Server Health Check Port

The load balancer will run HTTP checks against the Apache instance to ensure that it is functioning and ready to service users.  Due to mutual TLS configurations, Apache may be configured to offer health checks on a port other than the primary service port.  The health check port (`simple-http-server-health-check-port`) will only be accessible from the network load balancer's subnet and not generally available.

### HTTP Load Balancer Port

The load balancer may very well expose a different port than the instance, e.g. 443 vs. 8443.  The LB Port can be controlled by setting `simple-http-server-lb-port`.