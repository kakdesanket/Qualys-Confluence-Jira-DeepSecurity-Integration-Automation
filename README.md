# Qualys-Confluence-Jira-DeepSecurity-Integration-Automation

This is an attempt to integrate Qualys, Deep Security with Confluence and JIRA to create automated Monitoring dashboard and JIRA remediating tickets.

For interaction with qualys and deep security standalone python script is used which will call API and fetch necessary information.

For integration with Confluence Powershell module is used to create interactive charts and graphs.

<h1>Python Interface</h1>
Script will fetch information from Qualys and Deep security Platform and store in the SQLite Format on local system. It take argements to pass username password and API key for getting necessary information
Usage : script.py -h 
 
-u : Qualys Username
-p : Qualys Password
-d : Deep Security API Token
Output : Script will call different API to fetch latest information from qualys and deep security.This information is processed , validated , cleaned and stored in SQLite format in calling directory

Python Prerequisites : 3.8 Version tested 
Librarires required :
    from __future__ import print_function
    import sqlite3
    from sqlite3 import Error
    import requests
    import pandas as pd
    import os
    import csv
    import time
    from tqdm import tqdm
    import sys, getopt
    import codecs
    import warnings
    import deepsecurity
    from deepsecurity.rest import ApiException
    from pprint import pprint
    import json
    import pyfiglet
    from openpyxl import Workbook
    from datetime import datetime

Modification before executing script 
1. Qualys Client/Region specific API URL
2. Report template ID : Read qualys documentation for generating report template
3. Confluence URL

<h1>Powershell Interface</h1>

Used for communication with Confluence and post data on regular basis.Interface will prompt for valid credential every time its executed.
Usage : script.ps1
Libraries required : 
    Import-Module ConfluencePS
    Import-Module PSSQLite

Modification before executing script 
1. Confluence URL
2. Database file path (for pulling information)
3. Page IDs at necessary location
