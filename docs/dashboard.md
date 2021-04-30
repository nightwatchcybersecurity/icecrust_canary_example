---
title: Table test
---
<link rel="stylesheet" href="/css/custom.css">

Last updated: {{ site.time }}

<h1>Verification results</h1>
<table>
    <tr>
        <th>Name</th>
        <th>File</th>
        <th>Verification Mode</th>
        <th>Verified</th>
        <th>Details</th>
        <th>Timestamp</th>
    </tr>

    {% for row in site.data.current_results %}
        <tr>
            <td><a href="{{ row['url'] }}">{{ row['name'] }}</a></td>
            <td><a href="{{ row['filename_url'] }}">Link</a></td>
            <td>{{ row['verification_mode'] }}</td>
            {% if row['verified'] == true %}
                <td><span style="color: green">&#x2713;</span></td>
                <td/>
            {% else %}
                <td><span style="color: red">&#x2717;</span></td>
                <td class="tooltip">
                    Hover to view            
                    <span class="tooltiptext">
                        {{ row['output'] }}
                    </span>
                </td>
            {% endif %}
            <td>{{ row['timestamp'] | date: '%Y-%m-%d %H:%M' }}</td>
        </tr>
    {% endfor %}
</table>
<br/>


<h1>Projects recently updated</h1>
<table>
    <tr>
        <th>Name</th>
        <th>File</th>
        <th>Verification Mode</th>
        <th>Current status</th>
        <th>Previous status</th>
    </tr>

    {% for row in site.data.current_results %}
        {% for previous_row in site.data.previous_results %}
            {% if row['name'] == previous_row['name'] and row['verified'] != previous_row['verified'] %}
                <tr>
                    <td><a href="{{ row['url'] }}">{{ row['name'] }}</a></td>
                    <td><a href="{{ row['filename_url'] }}">Link</a></td>
                    <td>{{ row['verification_mode'] }}</td>
                    {% if row['verified'] == true %}
                        <td><span style="color: green">&#x2713;</span></td>
                    {% else %}
                        <td><span style="color: red">&#x2717;</span></td>
                    {% endif %}
                    {% if previous_row['verified'] == true %}
                        <td><span style="color: green">&#x2713;</span></td>
                    {% else %}
                        <td><span style="color: red">&#x2717;</span></td>
                    {% endif %}
                </tr>
                {% break %}
            {% endif %}
        {% endfor %}
    {% endfor %}
</table>
<br/>

<h1>Projects added</h1>
<table>
    <tr>
        <th>Name</th>
        <th>File</th>
        <th>Verification Mode</th>
    </tr>

    {% for current_row in site.data.current_results %}
        {% assign found_name = false %}
        {% for previous_row in site.data.previous_results %}
            {% if previous_row['name'] == current_row['name'] %}
                {% assign found_name = true %}
                {% break %}
            {% endif %}
        {% endfor %}

        {% if found_name == false %}
        <tr>
            <td><a href="{{ current_row['url'] }}">{{ current_row['name'] }}</a></td>
            <td><a href="{{ current_row['filename_url'] }}">Link</a></td>
            <td>{{ current_row['verification_mode'] }}</td>
        </tr>
        {% endif %}
    {% endfor %}
</table>
<br/>

<h1>Projects removed</h1>
<table>
    <tr>
        <th>Name</th>
        <th>File</th>
        <th>Verification Mode</th>
    </tr>

    {% for previous_row in site.data.previous_results %}
        {% assign found_name = false %}
        {% for current_row in site.data.current_results %}
            {% if current_row['name'] == previous_row['name'] %}
                {% assign found_name = true %}
                {% break %}
            {% endif %}
        {% endfor %}
        {% if found_name == false %}
        <tr>
            <td><a href="{{ previous_row['url'] }}">{{ previous_row['name'] }}</a></td>
            <td><a href="{{ previous_row['filename_url'] }}">Link</a></td>
            <td>{{ previous_row['verification_mode'] }}</td>
        </tr>
        {% endif %}
    {% endfor %}
</table>
<br/><br/>
