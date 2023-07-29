# Password expiry pending users in sevendays - Ansible playbook
Get password expiry pending(7 days remain) user in list of Red Hat servers as a email.

Note : Make the changes to csv file (excel.csv) to add server ip address and relevant server owner email. This can use with different pending days after doing changes in seconds in script and playbook content

This playbook can be use to get the users who has expiry date in 7days and send the email to server owner to acknowlege it.
This will help to maintain the compliance level and security breaches specially in critical datacenter environment
