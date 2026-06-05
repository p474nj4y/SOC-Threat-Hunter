# 🛡️ SOC Threat Hunting Toolkit

A Bash-based SOC (Security Operations Center) Threat Hunting Toolkit designed to analyze Linux authentication logs and identify suspicious activities such as failed SSH logins, brute-force attacks, successful authentications, and privilege escalation events.

This project demonstrates core SOC Analyst skills including:

- Log Analysis
- Threat Hunting
- Detection Engineering
- Incident Investigation
- Linux Security Monitoring
- Report Generation
- Bash Scripting

---

# 📌 Features

✅ Failed SSH Login Analysis

✅ Successful SSH Login Tracking

✅ Brute Force Attack Detection

✅ Sudo Activity Monitoring

✅ Automated Investigation Report Generation

✅ Menu-Driven Interface

✅ Works with Custom Linux Authentication Log Files

---

# 📂 Project Structure

```text
SOC-Threat-Hunter/
│
├── threat_hunter.sh
├── log/
│   └── auth.log
│
├── reports/
│
├── screenshots/
│
└── README.md
```

---

# 🚀 How It Works

The toolkit analyzes Linux authentication logs and provides security insights through a simple interactive menu.

### Main Menu

```text
====================================
      SOC THREAT HUNTING TOOLKIT
====================================

1. Failed SSH Analysis
2. Successful SSH Logins
3. Brute Force Detection
4. Sudo Activity
5. Generate Report
6. Exit
```

---

# 🔍 Detection Modules

## 1️⃣ Failed SSH Analysis

Identifies all failed SSH login attempts and counts occurrences by source IP.

### Example Output

```text
===== FAILED SSH ATTEMPTS =====

12 203.0.113.10
3 198.51.100.25
```

### Use Case

Helps analysts identify:

- Password spraying
- Credential stuffing
- Brute-force attempts

---

## 2️⃣ Successful SSH Login Analysis

Displays successful SSH authentications and their originating IP addresses.

### Example Output

```text
===== SUCCESSFUL SSH LOGINS =====

ubuntu -> 192.168.1.5
analyst -> 192.168.1.20
john -> 192.168.1.45
```

### Use Case

Helps validate:

- Authorized access
- Suspicious logins
- New source locations

---

## 3️⃣ Brute Force Detection

Detects IP addresses exceeding a failed-login threshold.

### Example Output

```text
===== BRUTE FORCE DETECTION =====

[ALERT] 203.0.113.10 => 12 failed attempts
```

### Detection Logic

```bash
if failed_attempts > 10
    generate_alert
```

### Use Case

Useful for identifying:

- SSH brute-force attacks
- Automated attack tools
- Malicious scanners

---

## 4️⃣ Sudo Activity Monitoring

Displays commands executed with elevated privileges.

### Example Output

```text
===== SUDO ACTIVITY =====

ubuntu executed apt update
analyst executed systemctl restart apache2
pipo executed cat /etc/shadow
```

### Use Case

Useful during:

- Privilege Escalation Investigations
- Insider Threat Analysis
- Post-Compromise Investigations

---

## 5️⃣ Report Generation

Automatically creates timestamped investigation reports.

### Example

```text
reports/report_2026-06-05_18-30-22.txt
```

### Report Contents

- Failed SSH Attempts
- Successful Logins
- Brute Force Alerts
- Sudo Activity

---

# 🧪 Sample Log File

A sample Linux authentication log is provided:

```text
sample_logs/auth.log
```

This file contains:

- Successful SSH Logins
- Failed SSH Attempts
- Simulated Brute Force Attacks
- Sudo Events
- User Creation Activities

---

# ⚙️ Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/SOC-Threat-Hunter.git
```

Move into the project directory:

```bash
cd SOC-Threat-Hunter
```

Make the script executable:

```bash
chmod +x threat_hunter.sh
```

Run the toolkit:

```bash
./threat_hunter.sh
```

---

# 📋 Usage

When prompted, enter the path to your authentication log file.

Example:

```text
sample_logs/auth.log
```

or

```text
/var/log/auth.log
```

The toolkit will automatically begin analysis.

---

# 🛠 Technologies Used

- Bash
- grep
- awk
- sort
- uniq
- Linux Authentication Logs

---

# 🎯 Skills Demonstrated

This project demonstrates practical SOC Analyst skills including:

- Security Log Analysis
- Threat Hunting
- Detection Rule Development
- Linux Security Monitoring
- Incident Response
- Security Automation
- Bash Scripting

---

# 🔮 Future Improvements

- [ ] IOC Scanning Module
- [ ] Geo-IP Lookup
- [ ] Real-Time Log Monitoring
- [ ] JSON Report Generation
- [ ] MITRE ATT&CK Mapping
- [ ] Threat Severity Classification
- [ ] Suspicious User Creation Detection
- [ ] Reverse Shell Detection
- [ ] Email Alerting

---

# 📸 Screenshots

Add screenshots of:

- Main Menu
- Brute Force Detection
- Generated Reports
- SSH Analysis Results

Inside:

```text
screenshots/
```

---

# 👨‍💻 Author

**Pipo**

Cybersecurity Student | SOC Analyst Aspirant | Linux Security Enthusiast

---

# ⭐ Disclaimer

This project is intended for educational purposes and SOC skill development. Test only on systems and log files you are authorized to analyze.
