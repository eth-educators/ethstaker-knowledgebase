# Security at scale

```
Skeleton Bullet Points
- Good inventory management hygene: No unknown servers on infra 
- MFA on servers
- Use SSH private keys instead of passwords
- Bastion/Jump Host for access to critical infra
- Firewall with deny all default and only open as required (e.g. no SSH/RDP accessible to the Internet, instead jump through a MFA enabled VPN first)
- Include info on IP based DDoS and how to mitigate it
- Engine API being filtered + auth for Engine API
- VLAN Segmentation
- OS hardening (this involves quite a few things, but https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-123.pdf provides quite a lot of details and there are playbooks that will do a lot of it)
- EDR, SIEM, NDR and when to use them?
```

Security is non-negotiable when you're running Ethereum validators at scale. This guide focuses on best practices specifically tailored for scaled Ethereum staking providers. The objective is to offer a comprehensive security framework that goes beyond typical measures used by solo stakers.

### Good Inventory Management Hygiene

#### What You Need to Know

Maintaining a precise inventory of all active servers is critical. Each unidentified machine is a potential security risk.

#### Best Practices

* Keep an updated inventory list, including the server type, purpose, and responsible team.
* Use automation tools to detect and report any unauthorized machines.

### MFA on Servers

#### What You Need to Know

Multi-Factor Authentication (MFA) adds an additional layer of security, reducing the risk of unauthorized access.

#### Best Practices

* Implement MFA for all administrative access.
* Use hardware-based authentication methods when possible.

### Use SSH Private Keys Instead of Passwords

#### What You Need to Know

SSH keys are more secure than passwords and should be used for secure shell access.

#### Best Practices

* Rotate keys regularly.
* Store keys securely in a key vault.

### Bastion/Jump Host for Access to Critical Infra

#### What You Need to Know

A Bastion or Jump Host serves as an intermediary between your local machine and critical infrastructure.

#### Best Practices

* This host should be highly secured, monitored, and only accessible via MFA.

### Firewall Configuration

#### What You Need to Know

Start with a 'deny all' default firewall rule and open only those ports necessary for operations.

#### Best Practices

* No direct SSH/RDP should be accessible from the internet.
* Access should be enabled through an MFA-enabled VPN.

### IP-based DDoS Mitigation

#### What You Need to Know

IP-based DDoS attacks can incapacitate your network.

#### Best Practices

* Utilize DDoS protection services.
* Regularly monitor network traffic for anomalies.

### Engine API Being Filtered + Auth for Engine API

#### What You Need to Know

Your Engine API is an attack surface that needs to be minimized.

#### Best Practices

* Filter access to the Engine API.
* Implement authentication mechanisms like API tokens.

### VLAN Segmentation

#### What You Need to Know

Using VLANs can effectively segregate different types of traffic and reduce the attack surface.

#### Best Practices

* Group related servers and services into VLANs.
* Limit inter-VLAN routing to only necessary services.

### OS Hardening

#### What You Need to Know

Hardening the Operating System can reduce the number of vulnerabilities.

#### Best Practices

* Follow guidelines like [NIST SP 800-123](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-123.pdf) for detailed steps.
* Use hardening playbooks that automate many of these processes.

### EDR, SIEM, NDR and When to Use Them

#### What You Need to Know

Endpoint Detection and Response (EDR), Security Information and Event Management (SIEM), and Network Detection and Response (NDR) are powerful tools for monitoring and responding to security events.

#### Best Practices

* EDR for endpoint level visibility.
* SIEM for comprehensive security event management and reporting.
* NDR for network level monitoring and response.



Security at scale is an ongoing commitment that involves continual assessment and evolution. By implementing these practices, scaled Ethereum staking providers can not only secure their own operations but also contribute to the overall security of the Ethereum network.
