# Zabbix alert nortification for Tocaro


* tocaro 
 -> kick from zabbix

 * tocaro.rb
 -> main script


 ## Tips

1. Put your zabbix alert scripts directory.
 ```bash:check at
 # grep "AlertScriptsPath" /etc/zabbix/zabbix_server.conf 
 ```
2. Change file ownership
 ```bash:check at
 # chown zabbix:zabbix /path/to/script/tocaro*
 ```

3. Setting zabbix
  4. Create media type
    * Create media type at zabbix web UI.
     [Administration] -> [Media types] -> [Create Media type]

    * Type any parameters.
     * Name: tocaro 
     * Type: Script 
     * Script name: tocaro  (**Name of bash script file in zabbix alert directory.**) 
     * Script parameters: 
        * param1 : tocaro webhook uri 
        * param2 : {ALERT.SUBJECT} 
        * param3 : {ALERT.MESSAGE} 
     * Enabled : check 

