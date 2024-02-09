import sys
import os
import requests

controller_hostname = os.getenv("AVIATRIX_CONTROLLER_DNS_NAME")
cid = os.getenv("CID")
account_name = os.getenv("AVIATRIX_ACCOUNT_NAME")
old_password = os.getenv("AVIATRIX_OLD_PASSWORD")
new_password = os.getenv("AVIATRIX_NEW_PASSWORD")
email = os.getenv("AVIATRIX_EMAIL")


def change_password():
    url = f"https://{controller_hostname}/v1/api"
    payload = {
        "action": "edit_account_user",
        "CID": cid,
        "username": account_name,
        "password": f'{old_password}',
        "what": "password",
        "email": email,
        "old_password": f'{old_password}',
        "new_password": f'{new_password}',
    }
    response = requests.post(url=url, data=payload)
    print(response.status_code)
    print(response.json())
    if response.json()["return"] is True:
        print("Successfully updated Admin Password")
        return
    else:
        print(f"Failed to update password for {account_name}")
        sys.exit(1)


change_password()
