from urllib.parse import urlparse, parse_qs, urlunparse

# Read the URLs from ss.txt
with open('ssrf.txt', 'r') as file:
    urls = file.readlines()

# Modify and save the URLs to ssrfnew.txt
with open('ssrfnew.txt', 'w') as file:
    for index, url in enumerate(urls):
        parsed_url = urlparse(url.strip())
        query_params = parse_qs(parsed_url.query)

        modified_params = {}
        for key, values in query_params.items():
            modified_values = []
            for value in values:
                modified_value = value + '/' + str(index + 1)
                modified_values.append(modified_value)
            modified_params[key] = modified_values

        modified_query = '&'.join([f'{key}={value}' for key, values in modified_params.items() for value in values])
        modified_url = urlunparse(parsed_url._replace(query=modified_query))
        file.write(modified_url + '\n')
