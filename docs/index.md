---
title: Icetrust Example Dashboard
---
<link rel="stylesheet" href="/css/custom.css">

# About
This dashboard shows an example of how to use verify shell scripts
provided by well known projects in order to avoid supply chain attacks.
There is an alternative version that looks like a conventional 
website status page here:
- [icetrust_uptime.nightwatchcybersecurity.com](https://icetrust_uptime.nightwatchcybersecurity.com/)

# Verification results
<table>
    <tr>
        <th>Project Name</th>
        <th>File</th>
        <th>Mode</th>
        <th>Results</th>
        <th>JSON</th>
        <th>Last Checked</th>
    </tr>

    {% assign sorted_data = site.data.output | sort %}
    {% for item in sorted_data %}
    <tr>
            <td><a href="{{ item[1]['url'] }}">{{ item[1]['name'] }}</a></td>
            <td><a href="{{ item[1]['filename_url'] }}">Link</a></td>
            <td>{{ item[1]['verification_mode'] }}</td>
            {% if item[1]['verified'] == true %}
                <td><span style="color: green">&#x2713;</span></td>
            {% else %}
                <td class="tooltip">
                    <span style="color: red">&#x2717;</span>
                    <span class="tooltiptext">
                        {{ item[1]['output'] }}
                    </span>
                </td>
            {% endif %}
            <td>
                <a href="/data/input/{{ item[0] }}.json">config</a>
                 / 
                <a href="/data/output/{{ item[0] }}.json">output</a> 
            </td>
            <td>{{ item[1]['timestamp'] | date: '%Y-%m-%d %H:%M:%S %z' }}</td>
        </tr>
    {% endfor %}
</table>

# Legend
- **Project Name:** name and link of the project/tool being checked
- **File:** link to the file being verified
- **Mode:** mode defining how verification is done (see icetrust docs for more information)
- **Results:** whether verification was successful or not (hover over to see more details)
- **JSON:** links to the icetrust configuration file and most recent output results
- **Timestamp:** when verification was done

# Additional information
This data is compiled by verifying the provided project files via the
icetrust project. The results are provided as JSON files. See
additional documentation here:
- [Canary mode](https://github.com/nightwatchcybersecurity/icetrust/blob/main/CANARY.md)
- [Icetrust project](https://github.com/nightwatchcybersecurity/icetrust) 

**Last updated:** {{ site.time }}
