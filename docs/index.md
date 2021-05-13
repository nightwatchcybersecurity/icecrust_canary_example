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

# Verification results
<table>
    <tr>
        <th>Project<br/>Name</th>
        <th>Verified?</th>
        <th>Recently<br/>Changed?</th>
        <th>Additional<br/>Details</th>
        <th>Last<br/>Checked</th>
    </tr>

    {% assign sorted_data = site.data.output | sort %}
    {% for item in sorted_data %}
    <tr>
            <td><a href="{{ item[1]['url'] }}">{{ item[1]['name'] }}</a></td>
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
                {% if item[1]['previous_version_matched'] == false %}
                    <span style="color: red">&#x2713;</span>
                {% endif %}
            </td>
            <td>
                <a href="/data/input/{{ item[0] }}.json">config</a>
                 / 
                <a href="/data/output/{{ item[0] }}.json">output</a> 
                 / 
                <a href="/data/output_data/{{ item[0] }}.txt">file</a> 
            </td>
            <td>{{ item[1]['timestamp'] | date: '%Y-%m-%d %H:%M:%S %z' }}</td>
        </tr>
    {% endfor %}
</table>

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
