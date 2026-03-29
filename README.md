OSS Audit — Linux Kernel
Student Name: Abhinav Atul
Roll Number: 24BCE10716
Course: Open Source Software (OSS NGMC)
Software Audited: Linux Kernel
License: GNU GPL v2
Scripts
File	Purpose
script1_system_identity.sh	Displays kernel version, user, uptime, distro, and OS license
script2_package_inspector.sh	Checks if kernel is installed, shows version and philosophy notes
script3_disk_permission_auditor.sh	Audits key directories for permissions and disk usage
script4_log_analyzer.sh	Reads a log file, counts keyword matches, shows last 5 matches
script5_manifesto_generator.sh	Generates a personalised open-source philosophy statement
How to Run
Prerequisites
A Linux system (Ubuntu 22.04 or any Debian/Red Hat-based distro)
Bash shell (pre-installed on all Linux systems)
No additional dependencies required
Steps
# Clone the repository
git clone https://github.com/abhinav-atul/oss-audit-24BCE10716.git
cd oss-audit-24BCE10716

# Make scripts executable
chmod +x *.sh

# Run each script
./script1_system_identity.sh
./script2_package_inspector.sh
./script3_disk_permission_auditor.sh
./script4_log_analyzer.sh /var/log/kern.log error
./script5_manifesto_generator.sh
