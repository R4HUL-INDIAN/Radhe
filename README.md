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

This will Run Radhe Tool.

```
bash Radhe.sh 
or 
./Radhe.sh
```

<h1 align="left">
<img width="365" alt="notify-subfinder" src="https://user-images.githubusercontent.com/8293321/130240854-e3031bc6-ecc8-47f8-9654-4c58e09cc622.png">
</h1>

### Example Uses

Following command will enumerate subdomains using [SubFinder](https://github.com/projectdiscovery/subfinder) and probe alive URLs using [httpx](https://github.com/projectdiscovery/httpx), runs [Nuclei](https://github.com/projectdiscovery/nuclei) templates and send the nuclei results as a notifications to configured provider/s.


```sh
subfinder -d intigriti.com | httpx | nuclei -tags exposure -o output.txt; notify -bulk -data output.txt
```

# Warning

𝙏𝙝𝙞𝙨 𝙩𝙤𝙤𝙡 𝙞𝙨 𝙤𝙣𝙡𝙮 𝙛𝙤𝙧 𝙚𝙙𝙪𝙘𝙖𝙩𝙞𝙤𝙣𝙖𝙡 𝙥𝙪𝙧𝙥𝙤𝙨𝙚. 𝙄𝙛 𝙮𝙤𝙪 𝙪𝙨𝙚 𝙩𝙝𝙞𝙨 𝙩𝙤𝙤𝙡 𝙛𝙤𝙧 𝙤𝙩𝙝𝙚𝙧 𝙥𝙪𝙧𝙥𝙤𝙨𝙚𝙨 𝙚𝙭𝙘𝙚𝙥𝙩 𝙚𝙙𝙪𝙘𝙖𝙩𝙞𝙤𝙣 𝙬𝙚 𝙬𝙞𝙡𝙡 𝙣𝙤𝙩 𝙗𝙚 𝙧𝙚𝙨𝙥𝙤𝙣𝙨𝙞𝙗𝙡𝙚 𝙞𝙣 𝙨𝙪𝙘𝙝 𝙘𝙖𝙨𝙚𝙨.


𝙍𝙖𝙙𝙝𝙚 𝙞𝙨 𝙢𝙖𝙙𝙚 𝙬𝙞𝙩𝙝 🖤 𝙗𝙮 𝙍4𝙃𝙐𝙇-𝙄𝙉𝘿𝙄𝘼𝙉.
