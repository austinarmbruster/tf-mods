# Subnet Module

The subnet module allows a user to create public and private subnets that are appropriately routed.

In the end, one publicly available (internet gateway routed) subnet will be created for each availability zone specified within the VPC's CIDR block.  One privately available subnet will also be created along with a NAT gateway that allows the private subnet to reach the Internet.

## Inputs

The only required variable is the VPC Tag. The remainder of the inputs are used to shape the creation of the subnets.

### VPC Tag

The VPC Tag (`vpc-tag`) is needed to know the VPC in which the subnets should be placed.  The VPC is expected to have the tag with a value of `true` (`1`).

### AZs

The Availability Zones (`azs`) drive the number of subnets that are created.  One public and one private subnet is created in each availability zone.

### App Name

The application name (`app-name`) is used to help scope / namespace the subnets.  There may be multiple subnets created in a single VPC.  The app name will be applied to the names of each component to ensure that there are no conflicts if this module is used twice within a single VPC.

### Version

It is good practice to tag infrastructure with the version of the Terraform spec that was used to create the infrastructure.  The version (`version`) should be replaced by the git tag or git hash for the specification used to create the infrastructure.

### Subnet Bits

The subnets that are created will be based upon the CIDR block for the VPC.  The subnet bits (`subnet-bits`) are used to partition the VPC CIDR block.  For example, if the VPC CIDR had a netmask of `/16` and you wanted each subnet to have a netmask of `/18`, then you would set the `subnet-bits` to 2.

### Subnet Network Number Offset

The subnets will be created based upon the VPC CIDR block.  It could be that another subnet already exists within that VPC.  In that case, the first network may not be available.  For example, if the VPC CIDR is `10.1.0.0/16` and `10.1.0.0/20` is already taken, then an offset of one (1) would be required to create new subnets.  

NOTE:  The above example assumed that the default Subnet Bits of four (4) was applied.

### Tags

If you have additional tags that are desired on the subnets that are required, include those tags in the `tags` variable.  In addition to the tags specified by the user, the following tags will be created:

* version, with the `version` as the value
* the `app-name`, with the value of `true`
* `public` or `private` set to `true`