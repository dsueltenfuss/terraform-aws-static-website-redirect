# terraform-aws-static-website-redirect
A terraform module to configure a website redirect for your AWS accounts.

### Module Variables

`source_website`
- The URL of the website you are redirecting from

`destination_website`
- The URL of the website you are redirecting to

`route_53_zone`
- The name of the Route 53 zone in yoru AWS account to create the DNS entries in

`workspaces` (optional)
- A list of workspaces to create the resources for. If empty, it will create for all workspaces.

## Contributing

Contributions are welcome.
To contribute please read the [CONTRIBUTING](CONTRIBUTING.md) document.

All contributions are subject to the license and in no way imply compensation for contributions.
