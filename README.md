# Radhe

𝗥𝗮𝗱𝗵𝗲 is a tool that automatically enumerates subdomains, checks if they are live, and finds "Unauth cache Purge" issues.

# Features

𝗥𝗮𝗱𝗵𝗲 is a tool that automatically enumerates subdomains, checks if they are live, and finds "Unauth cache Purge" issues. It has different modules that can be used for different tasks.

The following are the modules available in 𝗥𝗮𝗱𝗵𝗲:

- Subdomain Enumeration: This module enumerates all the subdomains of a given domain. It uses a variety of techniques to enumerate subdomains, including DNS brute force, passive DNS, and WHOIS lookups.

- Liveness Check: This module checks if a given subdomain is live. It does this by trying to access the subdomain using a variety of methods, including HTTP, HTTPS, and Tools like Puredns, Httpx.

- Unauth Cache Purge: This module finds "Unauth cache Purge" issues. These are issues where a subdomain can be purged from a cache without authorization. This can be a security issue, as it can allow an attacker to delete sensitive data from a cache

Radhe is a powerful tool that can be used to find security vulnerabilities in a website. It is easy to use and can be run on any platform.


# Usage

```sh
notify -h
```

This will display help for the tool. Here are all the switches it supports.

| Flag                    | Description                                        | Example                               |
|-------------------------|----------------------------------------------------|---------------------------------------|
| `-bulk`                 | enable bulk processing                             | `notify -bulk`                        |
| `-char-limit`           | max character limit per message (default 4000)     | `notify -cl 2000`                     |
| `-config`               | notify configuration file                          | `notify -config config.yaml`          |
| `-data`                 | input file to send for notify                      | `notify -i test.txt`                  |
| `-delay`                | delay in seconds between each notification         | `notify -d 2`                         |
| `-id`                   | id to send the notification to (optional)          | `notify -id recon,scans`              |
| `-msg-format`           | add custom formatting to message                   | `notify -mf Hey {{data}}`             |
| `-no-color`             | disable colors in output                           | `notify -nc`                          |
| `-provider-config`      | provider config path                               | `notify -pc provider.yaml`            |
| `-provider`             | provider to send the notification to (optional)    | `notify -p slack,telegram`            |
| `-proxy`                | http proxy to use with notify                      | `notify -proxy http://127.0.0.1:8080` |
| `-rate-limit`           | maximum number of HTTP requests to send per second | `notify -rl 1`                        |
| `-silent`               | enable silent mode                                 | `notify -silent`                      |
| `-verbose`              | enable verbose mode                                | `notify -verbose`                     |
| `-version`              | display version                                    | `notify -version`                     |
| `-update`               | updates to latest version                          | `notify -update`                      |
| `-disable-update-check` | disables automatic update check                    | `notify -duc`                         |

# Notify Installation

```sh
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
```


# Running Notify

Notify supports piping output of any tool or output file and send it to configured provider/s (e.g, discord, slack channel) as notification.

### Send notification using piped(stdin) output

```sh
subfinder -d hackerone.com | notify
```

<h1 align="left">
<img width="365" alt="notify-subfinder" src="https://user-images.githubusercontent.com/8293321/130240854-e3031bc6-ecc8-47f8-9654-4c58e09cc622.png">
</h1>

### Send notification using output file


```sh
subfinder -d hackerone.com -o h1.txt; notify -data h1.txt
```

### Send notification using output file in bulk mode


```sh
subfinder -d hackerone.com -o h1.txt; notify -data h1.txt -bulk
```

### Send notification using output file to specific provider's


```sh
subfinder -d hackerone.com -o h1.txt; notify -data h1.txt -bulk -provider discord,slack
```

### Send notification using output file to specific ID's


```sh
subfinder -d hackerone.com -o h1.txt; notify -data h1.txt -bulk -id recon,vulns,scan
```

### Example Uses

Following command will enumerate subdomains using [SubFinder](https://github.com/projectdiscovery/subfinder) and probe alive URLs using [httpx](https://github.com/projectdiscovery/httpx), runs [Nuclei](https://github.com/projectdiscovery/nuclei) templates and send the nuclei results as a notifications to configured provider/s.


```sh
subfinder -d intigriti.com | httpx | nuclei -tags exposure -o output.txt; notify -bulk -data output.txt
```


### Provider Config


The tool tries to use the default provider config (`$HOME/.config/notify/provider-config.yaml`), it can also be specified via CLI by using **provider-config** flag.

To run the tool with custom provider config, just use the following command.

```sh
notify -provider-config providers.yaml
```

### Notify Config

Notify flags can be configured at default config (`$HOME/.config/notify/config.yaml`) or custom config can be also provided using `config` flag.

## Notes
- As default notify sends notification line by line
- Use `-bulk` to send notification as entire message/s (messages might be chunked)

## References

- [Creating Slack webhook](https://slack.com/intl/en-it/help/articles/115005265063-Incoming-webhooks-for-Slack)
- [Creating Discord webhook](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks)
- [Creating Telegram bot](https://core.telegram.org/bots#3-how-do-i-create-a-bot)
- [Creating Pushover Token](https://github.com/containrrr/shoutrrr/blob/main/docs/services/pushover.md)

Notify is made with 🖤 by the [projectdiscovery](https://projectdiscovery.io) team.
