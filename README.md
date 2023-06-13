<h1 align="center">
  <img src="Static/radhe.png" alt="Radhe" width="250px">
  <br>
</h1>

𝗥𝗮𝗱𝗵𝗲 is a tool that automatically enumerates subdomains, checks if they are live, and finds "Unauth cache Purge" issues.

# Features

𝗥𝗮𝗱𝗵𝗲 is a tool that automatically enumerates subdomains, checks if they are live, and finds "Unauth cache Purge" issues. It has different modules that can be used for different tasks.

The following are the modules available in 𝗥𝗮𝗱𝗵𝗲:

- Subdomain Enumeration: This module enumerates all the subdomains of a given domain. It uses a variety of techniques to enumerate subdomains, including DNS brute force, passive DNS, and WHOIS lookups.

- Liveness Check: This module checks if a given subdomain is live. It does this by trying to access the subdomain using a variety of methods, including HTTP, HTTPS, and Tools like Puredns, Httpx.

- Unauth Cache Purge: This module finds "Unauth cache Purge" issues. These are issues where a subdomain can be purged from a cache without authorization. This can be a security issue, as it can allow an attacker to delete sensitive data from a cache.

Radhe is a powerful tool that can be used to find security vulnerabilities in a website. It is easy to use and can be run on any platform.

# Available On :

- 𝙇𝙄𝙉𝙐𝙓

- 𝙏𝙀𝙍𝙈𝙐𝙓

- 𝙒𝙄𝙉𝘿𝙊𝙒𝙎

# Radhe Installation

```
git clone https://github.com/R4HUL-INDIAN/Radhe/

cd Radhe

chmod +x Radhe.sh 

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


Radhe is made with 🖤 by R4HUL-INDIAN.
