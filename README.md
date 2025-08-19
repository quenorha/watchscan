# WATCHscan (WAGO Asset Tracking and Cybersecurity Health)


## Description
This tool is a pure shell script designed to perform an asset inventory of WAGO products on a network, aiming to verify if basic cybersecurity measures have been implemented. It will:

- **Scan the network** using NMAP.
- **Gather useful information** through web scraping techniques.
- **Scan relevant open ports** (FTP(S), HTTP(S), Modbus, WAGO Services ...)
- **Check if default credentials have been changed** for SSH and WBM.

Results will be displayed in a command-line interface and exported into a CSV file.

A docker version is available for ready-to-use alternative.


There are 4 modes : 

- **basic** : basic information gathering based on web scraping (using curl to gather available information on WBM or WDA when supported)
- **scan** : scan for most relevant open ports (result in CSV file)
- **auth** : check for default credential (SSH and WBM) for supported platform
- **full** : all of it 


## Dependencies

curl, jq, nmap, openssh-client


## Script usage

`watchscan -t target -m mode`

where :
- -t target : hostname, IP addresses or network : 192.168.1.0/24, 192.168.1.17, 192.168.1.1-254
- -m mode (described above)
			  
Example :
`watchscan -t 192.168.1.0/24 -m full`

## Docker usage

`docker run -ti --rm --network host -v /$(pwd)/reports:/app/reports quenorha/watchscan -t target -m mode`

where :
- -t target : hostname, IP addresses or network : 192.168.1.0/24, 192.168.1.17, 192.168.1.1-254
- -m mode (described above)
			  
Example :
`docker run -ti --rm --network host -v /$(pwd)/reports:/app/reports quenorha/watchscan -t 192.168.1.0/24 -m basic`


## Supported devices

| Device type      | Platform       | Support |
| :--------------- |:--------------- | :---------------|
| 750-342  | Ethernet Coupler G1 | Not tested, should work |
| 750-842  | Ethernet Controller G1 | Not tested, should work |
| 750-841 -871 -873 | Ethernet Controller G2 | Not tested, should work |
| 750-341  | Ethernet Coupler G1 | Not tested, should work |
| 750-849  | KNX IP Controller | Not tested, should work |
| 750-88X, -852  | Ethernet Controller G3 | Supported |
| 750-83X  | BACnet Controller | Not tested, should work |
| 750-89X, -862, -823  | Ethernet Controller G4 | Not tested, should work |
| 750-842  | Ethernet Controller G1 | Not tested, should work |
| 750-842  | Ethernet Controller G1 | Not tested, should work |
| 750-80XX  | Basic Controller 100 | Tested, no webscraping possible |
| 750-81XX  | PFC100 | Supported |
| 750-82XX  | PFC200 | Supported |
| 750-8302  | PFC300 | Supported |
| 751-9XXXX  | Compact Controller 100 | Supported |
| 751-8302/8000-002  | Edge Controller | Supported |
| 762-XX0X/8000-00X  | Touch Panel 600 | Supported |
| 762-34XX  | Web Panel 400 | Supported |
| 2789-9052  | PRO 2 communication module | Supported |
| 852-XXXX  | Managed switches | Not yet supported |



## Disclaimer

This tool is intended solely for legitimate and authorized use in conducting asset inventory and verifying cybersecurity measures on WAGO products within a network. Users are required to obtain proper authorization from network owners or administrators before use.

The developer of this program assumes no responsibility for any unauthorized use or any consequences arising from the improper application of this tool. By using this tool, you agree that you have the necessary permissions and you assume all liability associated with its use. Please ensure compliance with all applicable laws and regulations regarding network scanning and cybersecurity practices.

This tool is provided "as is" without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and non-infringement. In no event shall the developer be liable for any claim, damages, or other liability, whether in an action of contract, tort, or otherwise, arising from, out of, or in connection with the tool or the use or other dealings in the tool.
