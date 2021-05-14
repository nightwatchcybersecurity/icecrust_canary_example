---
title: Icetrust Example Dashboard
---
<link rel="stylesheet" href="/css/custom.css">

# About
This dashboard shows an example of how to use verify shell scripts
provided by well known projects in order to avoid supply chain attacks.
There is an alternative version that looks like a conventional 
website status page here: [icetrust_uptime.nightwatchcybersecurity.com](https://icetrust_uptime.nightwatchcybersecurity.com/)
These projects were selected from the lists found in our ["dont_curl_and_bash" project](https://github.com/nightwatchcybersecurity/dont_curl_and_bash).

# Twitter account
You can also see results here: [@icetrustmonitor](https://twitter.com/icetrustmonitor)

# Verification results - using checksums or PGP
{% include results_table.md content="verify" %}

# Verification results - comparing against another file
{% include results_table.md content="compare"  %}

# No verification - monitoring content changes only
{% include results_table.md content="monitor"  %}

# Legend
- **Project Name:** name and link of the project/tool being checked
- **Verified?:** whether verification was successful or not, hover over to view the output
- **Recently Changed?:** whether the file changed recently
- **Additional Details:** links to the icetrust configuration file, most recent output results and a copy 
  of the file that was checked
- **Timestamp:** when verification was done

# Additional information
This data is compiled by verifying the provided project files via the
icetrust project. The results are provided as JSON files. See
additional documentation here:
- [Canary mode](https://github.com/nightwatchcybersecurity/icetrust/blob/main/CANARY.md)
- [Icetrust project](https://github.com/nightwatchcybersecurity/icetrust) 

**Last updated:** {{ site.time }}
