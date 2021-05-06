---
title: Table test
---
<link rel="stylesheet" href="/css/custom.css">

# Verification results
<table>
    <tr>
        <th>Project Name</th>
        <th>File</th>
        <th>Mode</th>
        <th>Results</th>
        <th>JSON</th>
        <th>Timestamp</th>
    </tr>

    {% for item in site.data.canary_output %}
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
                <a href="https://github.com/nightwatchcybersecurity/icecrust_canary_example/tree/develop/docs/_data/canary_input/{{ item[0] }}.json">config</a>
                 / 
                <a href="https://github.com/nightwatchcybersecurity/icecrust_canary_example/tree/develop/docs/_data/canary_output/{{ item[0] }}.json">output</a> 
            </td>
            <td>{{ item[1]['timestamp'] | date: '%Y-%m-%d %H:%M' }}</td>
        </tr>
    {% endfor %}
</table>
<br/>

# Legend
- **Project Name:** name and link of the project/tool being checked
- **File:** link to the file being verified
- **Mode:** mode defining how verification is done (see icecrust docs for more information)
- **Results:** whether verification was succesful or not (hover over to see more details)
- **JSON:** links to the icecrust configuration file and most recent output results
- **Timestamp:** when verification was done

# Additional information
**Last updated:** {{ site.time }}
