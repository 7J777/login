# import_users.py
# This script automates the import of users.csv into the users table

import os
import subprocess

# Path to the SQL script
sql_script_path = '/data/src/import_users.sql'

# Command to execute the SQL script
command = f'psql -U your_username -d your_database -f {sql_script_path}'

# Execute the command
subprocess.run(command, shell=True)