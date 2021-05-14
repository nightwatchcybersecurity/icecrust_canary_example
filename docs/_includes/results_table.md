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

    {% for input_item in site.data.input %}
      {% if input_item[0] == item[0] %}
        {% assign input_data = input_item[1] %}
        {% break %}
      {% endif %}
    {% endfor %}

    {% assign process_item = false %}
    {% if include.content == 'verify' %}
      {% if item[1]['verification_mode'] == 'checksum' or item[1]['verification_mode'] == 'checksumfile' or
            item[1]['verification_mode'] == 'pgp' or item[1]['verification_mode'] == 'pgpchecksumfile'
      %}
        {% assign process_item = true %}
      {% endif %}
    {% endif %}

    {% if include.content == 'compare' and item[1]['verification_mode'] == 'compare_files' and
          input_data['filename_url'] != input_data['compare_files']['file2_url']
    %}
      {% assign process_item = true %}
    {% endif %}

    {% if include.content == 'monitor' and item[1]['verification_mode'] == 'compare_files' and
          input_data['filename_url'] == input_data['compare_files']['file2_url']
    %}
      {% assign process_item = true %}
    {% endif %}
    
    {% if process_item %}
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
                <a href="https://github.com/nightwatchcybersecurity/icetrust_dashboard_example/blame/main/docs/data/output_data/{{ item[0] }}.txt">file</a> 
            </td>
            <td>{{ item[1]['timestamp'] | date: '%Y-%m-%d %H:%M:%S %z' }}</td>
        </tr>
    {% endif %}
    {% endfor %}
</table>
