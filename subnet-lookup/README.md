# Subnet Lookup Module

This module will find a collection of subnets that have a set of tags in the Virtual Private Cloud (VPC).

## Dependencies

This module expects that a VPC and collection of subnets already exist.  The VPC and subnets are discovered by tags.  The routing between the subnets is expected to exist as well.

## Inputs

### VPC Tag

The VPC Tag (`vpc-tag`) is needed to know the VPC in which the subnets should be placed.  The VPC is expected to have the tag with a value of `true` (`1`).

### Tags

The `tags` allows for finding a subset of subnets.  The following is an example of specifying the tags on the terraform command line:

```
-var 'tags={private=1, app=1}'
```

More examples of using map variables, can be found at [Terraform Input Variable Configuration](https://www.terraform.io/docs/configuration/variables.html).
