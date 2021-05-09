# icetrust
[![Run verification checks](https://github.com/nightwatchcybersecurity/icetrust_dashboard_example/actions/workflows/ci-scheduled.yml/badge.svg)](https://github.com/nightwatchcybersecurity/icetrust_dashboard_example/actions/workflows/ci-scheduled.yml)
[![Tests](https://github.com/nightwatchcybersecurity/icetrust_dashboard_example/actions/workflows/ci-test.yml/badge.svg)](https://github.com/nightwatchcybersecurity/icetrust_dashboard_example/actions/workflows/ci-test.yml)
![GitHub](https://img.shields.io/github/license/nightwatchcybersecurity/icetrust.svg)

# What is this?
This is an example dashboard that shows how to use
the ["icetrust"](https://github.com/nightwatchcybersecurity/icetrust)
tool for for verification of software downloads using checksums and/or
PGP. Development of this project 
was prompted by [the recent supply chain attack against codecov.io](https://about.codecov.io/security-update/).

## How this works?
A scheduled Github action runs "icetrust" on regular intervals to
download and verify projects. Those get committed back to Git,
and picked up by GitHub pages. These projects were selected
from the lists found in our ["dont_curl_and_bash" project](https://github.com/nightwatchcybersecurity/dont_curl_and_bash).

You can see the input/output files and Github actions here:
- [Input files](docs/data/input/)
- [Output files](docs/data/output/)
- [Actions](.github/workflows)

You can view this live at:
- [icetrust_dashboard.nightwatchcybersecurity.com](https://icetrust_dashboard.nightwatchcybersecurity.com)

There is also an uptime-like status page available here:
- [icetrust_uptime.nightwatchcybersecurity.com](https://icetrust_uptime.nightwatchcybersecurity.com)

## Reporting bugs and feature requests
Please use the GitHub issue tracker to report issues or suggest features:
- Repo: https://github.com/nightwatchcybersecurity/icetrust_dashboard_example.
- Via email to ***research /at/ nightwatchcybersecurity [dot] com***.

The "icetrust" source code can be found here:
- https://github.com/nightwatchcybersecurity/icetrust

## Wishlist
- TBD
