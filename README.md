# icetrust
[![Extra tests on main branch only](https://github.com/nightwatchcybersecurity/icetrust/actions/workflows/ci-main.yml/badge.svg)](https://github.com/nightwatchcybersecurity/icetrust/actions/workflows/ci-main.yml)
![GitHub](https://img.shields.io/github/license/nightwatchcybersecurity/icetrust.svg)

# What is this?
This is an example dashboard that shows how to use
the ["icetrust"](https://github.com/nightwatchcybersecurity/icetrust)
tool for for verification of software downloads using checksums and/or
PGP. Development of this project 
was prompted by [the recent supply chain attack against codecov.io](https://about.codecov.io/security-update/).

## How this works?
A scheduled Github action runs "icecrust" on regular intervals to
download and verify projects. Those get committed back to Git,
and picked up by GitHub pages. You can see the input/output files
and Github actions here:
- [Input files](docs/data/input/)
- [Output files](docs/data/output/)
- [Actions](.github/workflows)

You can view this live at:
***[icetrust_dashboard.nightwatchcybersecurity.com](https://icetrust_dashboard.nightwatchcybersecurity.com)***

## Reporting bugs and feature requests
Please use the GitHub issue tracker to report issues or suggest features:
https://github.com/nightwatchcybersecurity/icetrust_dashboard_example
You can also send emai to ***research /at/ nightwatchcybersecurity [dot] com***

The "icetrust" source code can be found here:
https://github.com/nightwatchcybersecurity/icetrust

## Wishlist
- TBD
