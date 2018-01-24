# Zabbix alert nortification for Tocaro


* tocaro 
 -> kick from zabbix
 * tocaro_zabbix.rb
 -> main script

 ## Tips

### 1. Put your zabbix alert scripts directory.
 ```bash:check at
 # grep "AlertScriptsPath" /etc/zabbix/zabbix_server.conf 
 ```
### 2. Change file ownership
 ```bash:check at
 # chown zabbix:zabbix /path/to/script/tocaro*
 ```

### 3. Setting zabbix
#### Create media type
* Create media type at zabbix web UI.  
 [Administration] -> [Media types] -> [Create Media type]  
```
Type any parameters.  
  Name: tocaro  
  Type: Script  
  Script name: tocaro  (**Name of bash script file in zabbix alert directory.**)  
  Script parameters:  
    param1 : {ALERT.SENDTO} 
    param2 : {ALERT.SUBJECT}  
    param3 : {ALERT.MESSAGE}  
  Enabled : check  
```

#### Setting user media
* Modify user media setting at zabbix web UI.  
[Administration] -> [Users] - {target user} -> [Media] -> [Add]

```
Type any must parameters.  
  type: tocaro
  send to: tocaro webhook URI(1)  
```
(1)https://hooks.tocaro.im/integrations/inbound_webhook/[param1]   


