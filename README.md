# Radhe

𝗥𝗮𝗱𝗵𝗲 is a tool that automatically enumerates subdomains, checks if they are live, and finds "Unauth cache Purge" issues.

# Features

𝗥𝗮𝗱𝗵𝗲 is a tool that automatically enumerates subdomains, checks if they are live, and finds "Unauth cache Purge" issues. It has different modules that can be used for different tasks.

The following are the modules available in 𝗥𝗮𝗱𝗵𝗲:

- Subdomain Enumeration: This module enumerates all the subdomains of a given domain. It uses a variety of techniques to enumerate subdomains, including DNS brute force, passive DNS, and WHOIS lookups.

- Liveness Check: This module checks if a given subdomain is live. It does this by trying to access the subdomain using a variety of methods, including HTTP, HTTPS, and FTP.

- Unauth Cache Purge: This module finds "Unauth cache Purge" issues. These are issues where a subdomain can be purged from a cache without authorization. This can be a security issue, as it can allow an attacker to delete sensitive data from a cache.
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

### Provider Config

The default provider config file can be created at `$HOME/.config/notify/provider-config.yaml` and can have the following contents:

```yaml
slack:
  - id: "slack"
    slack_channel: "recon"
    slack_username: "test"
    slack_format: "{{data}}"
    slack_webhook_url: "https://hooks.slack.com/services/XXXXXX"

  - id: "vulns"
    slack_channel: "vulns"
    slack_username: "test"
    slack_format: "{{data}}"
    slack_webhook_url: "https://hooks.slack.com/services/XXXXXX"

discord:
  - id: "crawl"
    discord_channel: "crawl"
    discord_username: "test"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/XXXXXXXX"

  - id: "subs"
    discord_channel: "subs"
    discord_username: "test"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/XXXXXXXX"

telegram:
  - id: "tel"
    telegram_api_key: "XXXXXXXXXXXX"
    telegram_chat_id: "XXXXXXXX"
    telegram_format: "{{data}}"
    telegram_parsemode: "Markdown" # None/Markdown/MarkdownV2/HTML (https://core.telegram.org/bots/api#formatting-options)

pushover:
  - id: "push"
    pushover_user_key: "XXXX"
    pushover_api_token: "YYYY"
    pushover_format: "{{data}}"
    pushover_devices:
      - "iphone"

smtp:
  - id: email
    smtp_server: mail.example.com
    smtp_username: test@example.com
    smtp_password: password
    from_address: from@email.com
    smtp_cc:
      - to@email.com
    smtp_format: "{{data}}"
    subject: "Email subject"
    smtp_html: false
    smtp_disable_starttls: false

googlechat:
  - id: "gc"
    key: "XXXXXXXX"
    token: "XXXXXX"
    space: "XXXXXX"
    google_chat_format: "{{data}}"

teams:
  - id: "recon"
    teams_webhook_url: "https://<domain>.webhook.office.com/webhookb2/xx@xx/IncomingWebhook/xx"
    teams_format: "{{data}}"

custom:
  - id: webhook
    custom_webhook_url: http://host/api/webhook
    custom_method: GET
    custom_format: '{{data}}'
    custom_headers:
      Content-Type: application/json
      X-Api-Key: XXXXX
      
custom:
  - id: webhookJson
    custom_webhook_url: http://host/api/webhook
    custom_method: GET
    custom_format: '{"text":{{dataJsonString}} }'
    custom_headers:
      Content-Type: application/json
      X-Api-Key: XXXXX

custom:
  - id: webhook
    custom_webhook_url: http://host/api/webhook
    custom_method: GET
    custom_sprig: '{"text":"{{ .url }}"}'
    custom_headers:
      Content-Type: application/json
      X-Api-Key: XXXXX
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
