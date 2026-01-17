# Ethical Hacking Command Guide

This document provides a simple and detailed explanation of common commands and tools used for ethical hacking and security research, organized by the typical phases of a security assessment.

### Command Index

*   **Phase 1: Passive Reconnaissance (Information Gathering)**
    
    1.  [FINDING SUBDOMAINS](#1-finding-subdomains) (subfinder, amass)
    
    2.  [FETCHING HISTORICAL URLs](#2-fetching-historical-urls) (waybackurls)
    
    3.  [SEARCH ENGINE DORKING & RECONNAISSANCE](#3-search-engine-dorking--reconnaissance)

*   **Phase 2: Active Reconnaissance (Scanning & Enumeration)**
    
    4.  [PROBING & FINGERPRINTING](#4-probing--fingerprinting) (httpx, whatweb)
    
    5.  [DIRECTORY BRUTE-FORCING](#5-directory-brute-forcing) (gobuster, dirsearch, feroxbuster)
    
    6.  [COMBINING & DE-DUPLICATING URLs](#6-combining--de-duplicating-urls)
    
    7.  [VISUAL RECONNAISSANCE](#7-visual-reconnaissance) (EyeWitness, aquatone)
    
    8.  [CRAWLING FOR ENDPOINTS](#8-crawling-for-endpoints) (katana)
    
    9.  [FINDING SECRETS IN JAVASCRIPT FILES](#9-finding-secrets-in-javascript-files) (linkfinder, gf, SecretFinder)
    
    10. [NETWORK & SERVICE SCANNING](#10-network--service-scanning) (nmap)
    
    11. [ENDPOINT & PARAMETER DISCOVERY](#11-endpoint--parameter-discovery) (paramspider, arjun)
    
    12. [CMS DETECTION & SCANNING](#12-cms-detection--scanning) (CMSeeK, wpscan)

*   **Phase 3: Authentication & Parameter Brute-Force Testing**
    
    13. [AUTHENTICATION BRUTE-FORCE TESTING](#13-authentication-brute-force-testing) (hydra, medusa, patator)
    
    14. [PARAMETER VALUE BRUTE-FORCE & FUZZING](#14-parameter-value-brute-force--fuzzing) (wfuzz, ffuf)
    
    15. [FORM-BASED BRUTE-FORCE TESTING](#15-form-based-brute-force-testing) (burp suite, hydra)

*   **Phase 4: Vulnerability Analysis & Exploitation**
    
    16. [AUTOMATED VULNERABILITY SCANNING](#16-automated-vulnerability-scanning) (Nuclei, Nikto)
    
    17. [SQL INJECTION TESTING](#17-sql-injection-testing) (sqlmap)
    
    18. [CROSS-SITE SCRIPTING (XSS) TESTING](#18-cross-site-scripting-xss-testing) (XSStrike, Dalfox)
    
    19. [SPECIALIZED VULNERABILITY TESTING](#19-specialized-vulnerability-testing) (Fuxploider, AWSBucketDump, GitDumper)


---

### **Phase 1: Passive Reconnaissance (Information Gathering)**

This phase involves collecting information without directly sending any suspicious traffic to the target.

#### 1. FINDING SUBDOMAINS

*   **Technique Type:** Passive Reconnaissance
*   **Description:** The first step is to map all known assets of a target. Different tools query different public data sources, so it's best to combine them.
*   **Tools:** subfinder, amass
*   **The Workflow:**
    ```bash
    # Step 1: Use multiple tools to collect subdomains into one file
    subfinder -d target.com -o subs.txt
    amass enum -passive -d target.com >> subs.txt

    # Pro-Tip: Remove duplicates to create a clean list
    sort -u subs.txt -o unique_subs.txt
    ```
*   **Why It's Useful:** No single tool finds everything. By combining the results from subfinder and amass (in passive mode), you create a more comprehensive list of potential targets.

#### 2. FETCHING HISTORICAL URLs

*   **Technique Type:** Passive Reconnaissance
*   **Description:** Internet archives often store old URLs that are no longer linked on the active website, but might still be live and vulnerable.
*   **Tool:** waybackurls
*   **The Command:**
    ```bash
    waybackurls target.com > wayback.txt
    ```
*   **Why It's Useful:** An active crawler can only find what is currently linked. This tool finds what once existed by querying the Wayback Machine. This can reveal forgotten API endpoints, old admin panels, or pages with different, more vulnerable parameters.

#### 3. SEARCH ENGINE DORKING & RECONNAISSANCE

*   **Technique Type:** Passive Reconnaissance
*   **Description:** "Dorking" is the art of using advanced search operators to find specific information that is not intended to be public. This is a foundational passive reconnaissance technique.
*   **Common Dorking Commands:**
    *   **Finding Admin Panels:** `site:target.com inurl:admin`
    *   **Finding Login Pages:** `site:target.com inurl:login OR intitle:"login"`
    *   **Finding Backup Files:** `site:target.com ext:bak OR ext:backup`
    *   **Finding Specific File Types (e.g., config files):** `site:target.com ext:xml OR ext:conf OR ext:cnf OR ext:reg OR ext:inf OR ext:rdp OR ext:cfg OR ext:txt OR ext:ora OR ext:ini OR ext:env`
    *   **Finding Document Files:** `site:target.com filetype:pdf OR filetype:doc OR filetype:xls`
*   **Why It's Useful:** This is the ultimate passive technique for finding sensitive files and login pages without ever sending a single packet to the target's servers. Each search engine indexes the web differently, so checking multiple platforms can yield unique results.

---

### **Phase 2: Active Reconnaissance (Scanning & Enumeration)**

This phase involves direct interaction with the targets you discovered to map them in greater detail.

#### 4. PROBING & FINGERPRINTING

*   **Technique Type:** Active Reconnaissance
*   **Description:** After finding subdomains, you need to see which ones are live and what technologies they are running.
*   **Tools:** httpx, whatweb
*   **The Workflow:**
    ```bash
    # Step 1: Find live web servers from your subdomain list
    cat unique_subs.txt | httpx -ports 80,443,8080 -threads 200 > live_hosts.txt

    # Step 2: Get detailed info (status code, title, tech) for live hosts
    cat live_hosts.txt | httpx -sc -td -ip -title > enriched_hosts.txt
    ```
*   **Why It's Useful:** This workflow filters thousands of potential subdomains down to a small, manageable list of live web servers. Enriching the data with status codes and technology helps you prioritize which targets to investigate first. `whatweb` provides an in-depth analysis of a single target's technology stack.
*   **Pro-Tip: Filtering Enriched Results**
    *   `cat enriched_hosts.txt | grep "200"` will show all pages that returned a "200 OK" status, meaning they are working pages.
    *   `cat enriched_hosts.txt | grep "403"` will show all pages that are "Forbidden". This is often interesting because it means a page exists but you don't have permission, pointing to a potentially hidden or private area.

#### 5. DIRECTORY BRUTE-FORCING

*   **Technique Type:** Active Reconnaissance
*   **Description:** This technique, also known as content discovery, involves using a wordlist to guess common directory and file names on a web server. It's essential for finding hidden login pages, admin panels, or sensitive files that are not linked anywhere on the website.
*   **Tools:** gobuster, dirsearch, feroxbuster
*   **The Commands:**
    ```bash
    # Using gobuster
    gobuster dir -u http://example.com -w /usr/share/wordlists/<wordlistname.txt> -x php,html,txt -o gobuster_results.txt

    # Using dirsearch
    dirsearch -u http://example.com -w /usr/share/wordlists/<wordlistname.txt> -e php,html,txt -o dirsearch_results.txt

    # Using feroxbuster
    feroxbuster -u http://example.com -w /usr/share/wordlists/<wordlistname.txt> -x php,html,txt -o feroxbuster_results.txt
    ```
*   **Why It's Useful:** Essential for finding unlinked pages like admin panels, configuration files, and backups. The `-x` flag (or `-e` for dirsearch) is used to specify a list of file extensions to look for.
*   **Pro-Tip: Choosing a Wordlist:** On Kali Linux, excellent wordlists are located at `/usr/share/wordlists/`. You can also find many great wordlists on GitHub, such as those from the SecLists project.
*   **WARNING:** These tools are active and "noisy." They send a large number of requests to the target server, which may trigger security alerts or cause a Web Application Firewall (WAF) to block your IP address.

#### 6. COMBINING & DE-DUPLICATING URLs

*   **Technique Type:** Utility / Local
*   **Description:** After running multiple discovery tools, you'll have several results files. This command combines them into a single master list with no duplicate entries.
*   **The Command:**
    ```bash
    # Example with 2 files
    cat gobuster_results.txt dirsearch_results.txt | sort -u > all_urls.txt

    # Example with 3 files
    cat ffuf_results.txt gobuster_results.txt dirsearch_results.txt | sort -u > all_urls.txt
    ```
*   **Why It's Useful:** This is a fundamental data management technique. It allows you to combine the findings from different tools into a single, clean master list.

#### 7. VISUAL RECONNAISSANCE

*   **Technique Type:** Active Reconnaissance
*   **Description:** It's impossible to manually browse hundreds of websites. These tools take screenshots, allowing you to visually identify interesting pages.
*   **Tools:** EyeWitness, gowitness, aquatone
*   **The Commands:**
    ```bash
    # EyeWitness (Windows/Linux) - Detailed report with default credential checking
    python Python/EyeWitness.py -f live_hosts.txt --web -d eyewitness_report/ --no-prompt

    # gowitness (Windows/Linux) - Fast Go-based screenshot tool
    gowitness file -f live_hosts.txt -P gowitness_report/
    
    # gowitness single URL
    gowitness single https://target.com -P gowitness_report/

    # aquatone (Linux/WSL) - Quick overview report
    cat live_hosts.txt | aquatone -out aquatone_report/
    ```
*   **Platform Notes:**
    *   **EyeWitness:** Works on Windows (requires Chrome/Firefox and Selenium setup), Linux
    *   **gowitness:** Cross-platform (Windows/Linux/Mac), single binary, no dependencies
    *   **aquatone:** Primarily Linux/WSL, requires Go runtime
*   **Why It's Useful:** This saves a huge amount of time. By scrolling through screenshots, you can instantly identify login portals, old/forgotten applications, default installation pages, and error messages that leak information.

#### 8. CRAWLING FOR ENDPOINTS

*   **Technique Type:** Active Reconnaissance
*   **Description:** These tools "spider" websites to find all linked URLs, paths, and JavaScript files.
*   **Tool:** katana
*   **The Command:**
    ```bash
    katana -list live_hosts.txt -depth 3 -o all_endpoints.txt
    ```
*   **Why It's Useful:** `katana` automates the tedious process of clicking every link to map out a website, and it can uncover forgotten admin pages, old API versions, or test endpoints that are still live but not linked anywhere.

#### 9. FINDING SECRETS IN JAVASCRIPT FILES

*   **Technique Type:** Active Reconnaissance
*   **Description:** Modern web applications embed a huge amount of information in their JavaScript files, including API endpoints, links, and sometimes even sensitive information like API keys.
*   **Tools:** linkfinder, gf, SecretFinder
*   **The Workflow:**
    ```bash
    # Step 1: Filter your crawled endpoints to get a list of just JavaScript files.
    cat all_endpoints.txt | grep "\\.js$" > js_files.txt

    # Step 2: Extract endpoints from a list of JS files
    python3 linkfinder.py -i js_files.txt -o results.html

    # Step 3: Search for hardcoded API keys and other secrets
    cat js_files.txt | gf apikeys > secrets.txt
    python3 SecretFinder.py -i js_files.txt -o cli >> secrets.txt
    ```*   **Alternative: Scanning a Single File:**
    ```bash
    # Scan a single URL for endpoints
    python3 linkfinder.py -i https://target.com/script.js -o results.html

    # Scan a single URL for API keys
    curl -s https://target.com/script.js | gf apikeys
    ```
*   **Why It's Useful:** Developers frequently leave hardcoded API keys, sensitive endpoints, or comments in JavaScript files.

#### 10. NETWORK & SERVICE SCANNING

*   **Technique Type:** Active Reconnaissance
*   **Description:** This process checks all open "ports" on a server, not just the website, to find other services like databases or FTP.
*   **Tool:** nmap
*   **The Command:**
    ```bash
    # Scan for open ports and identify services
    nmap -p- -sV -sC -T4 [TARGET_IP]
    ```
*   **Why It's Useful:** A server may be running a secure website on port 443, but have an old, vulnerable FTP server on another port.

#### 11. ENDPOINT & PARAMETER DISCOVERY

*   **Technique Type:** Active Reconnaissance
*   **Description:** These tools discover the parameters that web application endpoints accept, including hidden ones.
*   **Tools:** paramspider, arjun
*   **The Commands:**
    ```bash
    # Discover visible parameters from a list of URLs
    paramspider -l all_endpoints.txt

    # Brute-force for hidden parameters on a specific endpoint
    arjun -u https://target.com/api/v1/user
    ```
*   **Why It's Useful:** Finding hidden and undocumented parameters can be a goldmine for bugs like privilege escalation or information leakage.

#### 12. CMS DETECTION & SCANNING

*   **Technique Type:** Active Reconnaissance
*   **Description:** Identifying and scanning a Content Management System (CMS) is a critical step.
*   **Tools:** CMSeeK, wpscan
*   **The Workflow:**
    ```bash
    # Step 1: Identify the CMS
    python3 cmseek.py -u https://target.com

    # Step 2: If WordPress is detected, run the specialized scanner
    wpscan --url https://target.com --enumerate vp,vt,u
    ```
*   **Why It's Useful:** `CMSeeK` tells you what kind of system you are up against. If it's WordPress, `wpscan` can then check for thousands of known vulnerabilities in its plugins, themes, and core files.

---

### **Phase 3: Authentication & Parameter Brute-Force Testing**

This phase involves testing discovered authentication mechanisms and parameters for weak credentials and exploitable values.

#### 13. AUTHENTICATION BRUTE-FORCE TESTING

*   **Technique Type:** Active Authentication Testing
*   **Description:** Systematically test login forms, SSH services, and authentication endpoints with common credentials and password lists to identify weak authentication mechanisms.
*   **Tools:** hydra, medusa, patator, crackmapexec
*   **The Commands:**
    ```bash
    # SSH brute-force attack
    hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://target.com

    # Web form brute-force (login page)
    hydra -l admin -P /usr/share/wordlists/common-passwords.txt target.com http-post-form "/login.php:username=^USER^&password=^PASS^:Invalid credentials"

    # HTTP Basic Auth brute-force
    hydra -l admin -P /usr/share/wordlists/common-passwords.txt target.com http-get /admin/

    # Multiple usernames with password list
    hydra -L /usr/share/wordlists/common-usernames.txt -P /usr/share/wordlists/rockyou.txt ssh://target.com

    # Alternative tool: medusa
    medusa -h target.com -u admin -P /usr/share/wordlists/common-passwords.txt -M ssh

    # FTP brute-force
    hydra -l ftp -P /usr/share/wordlists/common-passwords.txt ftp://target.com
    ```
*   **Advanced Techniques:**
    ```bash
    # Custom wordlist generation
    cewl -d 2 -m 5 https://target.com > custom-wordlist.txt

    # Brute-force with custom user agents and delays
    hydra -l admin -P passwords.txt -t 4 -w 30 -f target.com http-post-form "/login:user=^USER^&pass=^PASS^:Invalid"

    # Username enumeration before brute-force
    ./userenum.py -U /usr/share/wordlists/usernames.txt target.com

    # Database brute-force (MySQL)
    hydra -l root -P /usr/share/wordlists/common-passwords.txt mysql://target.com:3306
    ```
*   **Why It's Useful:** Many systems still use default or weak credentials. Brute-force attacks can reveal authentication bypasses, especially when combined with discovered usernames from reconnaissance phases.
*   **WARNING:** Brute-force attacks are very noisy and may trigger account lockouts or IP bans. Always use appropriate delays and respect rate limits during authorized testing.

#### 14. PARAMETER VALUE BRUTE-FORCE & FUZZING

*   **Technique Type:** Active Parameter Testing
*   **Description:** Test discovered parameters with various values to find hidden functionality, injection vulnerabilities, and logic bypasses.
*   **Tools:** wfuzz, ffuf, burp intruder, parameth
*   **The Commands:**
    ```bash
    # Basic parameter fuzzing with wfuzz
    wfuzz -c -z file,/usr/share/wordlists/common-params.txt --hc 404 "https://target.com/page.php?FUZZ=test"

    # Parameter value fuzzing for discovered parameters
    wfuzz -c -z file,/usr/share/wordlists/Fuzzing/special-chars.txt "https://target.com/api/loader.php?f=FUZZ"

    # Multiple parameter fuzzing
    wfuzz -c -z file,userlist.txt -z file,passlist.txt --hc 404 "https://target.com/login.php?user=FUZZ&pass=FUZ2Z"

    # Using ffuf for parameter discovery and fuzzing
    ffuf -w /usr/share/wordlists/common-params.txt -u "https://target.com/page.php?FUZZ=test" -fc 404

    # POST parameter fuzzing
    wfuzz -c -z file,payloads.txt -d "param=FUZZ" "https://target.com/api/endpoint"

    # Header fuzzing
    wfuzz -c -z file,headers.txt -H "FUZZ: test" "https://target.com/"
    ```
*   **Specialized Parameter Testing:**
    ```bash
    # SQL injection parameter testing
    wfuzz -c -z file,/usr/share/wordlists/Fuzzing/SQLi.txt "https://target.com/search.php?q=FUZZ"

    # XSS parameter testing
    wfuzz -c -z file,/usr/share/wordlists/Fuzzing/XSS.txt "https://target.com/comment.php?msg=FUZZ"

    # Local File Inclusion (LFI) testing
    wfuzz -c -z file,/usr/share/wordlists/Fuzzing/LFI.txt "https://target.com/include.php?file=FUZZ"

    # Directory traversal testing
    wfuzz -c -z file,/usr/share/wordlists/Fuzzing/directory-traversal.txt "https://target.com/download.php?path=FUZZ"

    # Business logic value testing
    wfuzz -c -z range,1-1000 "https://target.com/api/user.php?id=FUZZ"

    # Boolean parameter testing
    wfuzz -c -z list,true-false-1-0-yes-no "https://target.com/api/admin.php?debug=FUZZ"
    ```
*   **Why It's Useful:** Parameter fuzzing can reveal hidden functionality, bypass authentication, discover injection points, and uncover business logic flaws. It's especially powerful when combined with discovered parameters from Phase 2.

#### 15. FORM-BASED BRUTE-FORCE TESTING

*   **Technique Type:** Web Application Brute-Force
*   **Description:** Specialized testing for web application forms including login pages, password reset forms, and user registration.
*   **Tools:** burp suite, hydra, patator, authbrute
*   **The Workflow:**
    ```bash
    # Step 1: Identify form structure and anti-CSRF tokens
    curl -c cookies.txt -b cookies.txt "https://target.com/login" | grep -i csrf

    # Step 2: Automated form-based brute-force
    hydra -l admin -P /usr/share/wordlists/common-passwords.txt target.com http-post-form "/login.php:username=^USER^&password=^PASS^&csrf_token=^C^:S=dashboard:C=/login:F=Invalid"

    # Step 3: Multi-step authentication testing
    patator http_fuzz url="https://target.com/login" method=POST body="user=admin&pass=FILE0" 0=/usr/share/wordlists/passwords.txt -x ignore:fgrep="Invalid credentials"

    # Step 4: Session-based brute-force (maintaining sessions)
    hydra -l admin -P passwords.txt -f -V target.com http-post-form "/login:user=^USER^&pass=^PASS^:S=success:C=/login"
    ```
*   **Advanced Form Testing:**
    ```bash
    # Password reset brute-force
    wfuzz -c -z file,emails.txt -d "email=FUZZ" "https://target.com/reset-password" --hc 404

    # Registration form enumeration
    wfuzz -c -z file,usernames.txt -d "username=FUZZ&email=test@test.com&password=test123" "https://target.com/register" -c

    # Two-factor authentication bypass
    wfuzz -c -z range,000000-999999 -d "otp=FUZZ&username=admin" "https://target.com/verify-otp"

    # Captcha bypass testing
    wfuzz -c -z file,common-answers.txt -d "captcha=FUZZ&user=admin&pass=password" "https://target.com/login"
    ```
*   **Why It's Useful:** Form-based attacks can bypass client-side restrictions, test for account enumeration, and identify weak authentication flows. Modern web applications often have complex authentication mechanisms that require specialized testing.

---

### **Phase 4: Vulnerability Analysis & Exploitation**

This phase involves actively testing for specific flaws and attempting to exploit them.

#### 16. AUTOMATED VULNERABILITY SCANNING

*   **Technique Type:** Vulnerability Analysis (Active)
*   **Tools:** Nuclei, Nikto
*   **The Commands:**
    ```bash
    # Fast template-based scan for common misconfigurations
    nuclei -l live_hosts.txt -t http/exposures

    # Deep, noisy scan for a single host
    nikto -h https://target.com
    ```
*   **Why It's Useful:** `Nuclei` is the modern tool for quickly checking many hosts for thousands of known issues using community-based templates. `Nikto` is an older, very noisy tool that is excellent for an in-depth analysis on a single server to find dangerous files and outdated software.

#### 17. SQL INJECTION TESTING

*   **Technique Type:** Vulnerability Analysis (Active)
*   **Description:** `sqlmap` is the definitive tool for automatically finding and exploiting SQL injection flaws.
*   **Tool:** sqlmap
*   **The Commands:**
    ```bash
    # Test a specific URL you suspect is vulnerable
    sqlmap -u "https://target.com/products.php?id=1" --dbs --batch

    # Automatically find and test all forms on a page
    sqlmap -u https://target.com --forms --crawl=2 --batch
    ```

#### 18. CROSS-SITE SCRIPTING (XSS) TESTING

*   **Technique Type:** Vulnerability Analysis (Active)
*   **Description:** These tools automate the hunt for XSS vulnerabilities.
*   **Tools:** Dalfox, XSStrike
*   **The Workflow:**
    ```bash
    # 1. First, find all URLs with parameters using a Phase 2 tool
    paramspider -d target.com --output params.txt

    # 2. Feed that list directly into Dalfox for automated testing
    cat params.txt | dalfox pipe
    ```
*   **Why It's Useful:** This workflow is highly efficient. You use one tool to find hundreds of potential entry points (`paramspider`) and then pipe that list directly into a specialized scanner (`Dalfox`) to automatically test all of them.

#### 19. SPECIALIZED VULNERABILITY TESTING

*   **Technique Type:** Vulnerability Analysis (Active)
*   **Description:** These tools are purpose-built for high-impact vulnerability types.
    *   **File Uploads (Fuxploider):** `python3 fuxploider.py -u https://target.com/upload.php`
    *   **Exposed S3 Buckets (AWSBucketDump):** `python3 AWSBucketDump.py -l potential_bucket_names.txt -D`
    *   **Exposed Git Repositories (GitDumper):** `python3 GitDumper.py https://target.com/.git/ ./output-folder/`

