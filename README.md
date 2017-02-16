# Navigator_audit_API
REST API to call navigator audit endpoints against secured Cloudera cluster. Following link has more detail:

1) For API documentation go to Navigator_Metadata_Server_host:port/api-console/index.html. like : 
"https://br1paprhdd11.passporthealth.com:7187/api-console/index.htm".

2) Cloudera NAvigartor API : "https://www.cloudera.com/documentation/enterprise/5-3-x/topics/navigator_api.html"

3) http://cloudera.github.io/navigator/apidocs/v3/index.html

4) List of all possible operation which can be used for auditing :
   https://www.cloudera.com/documentation/enterprise/5-8-x/topics/cn_iu_audits.html#concept_tqp_q23_yr
   
5) Some common error scenarios :
 
  a)  curl -k -u jay.kumar:password@123  'https://<nav_server_host>:7187/api/v9/entities/?query=*&limit=1&offset=0'
     curl: (56) Received HTTP code 403 from proxy after CONNECT . 
     
     If you get this, it means proxy is enabled for the environment.
    In that case 2 ways to resolve :
    a1) use --noproxy '*' in your curl command. like -- 
  curl -k -u jay.kumar:password@123  'https://<nav_server_host>:7187/api/v9/entities/?query=*&limit=1&offset=0' --noproxy '*'
    a2) Disable proxy at session level by :
    
         export https_proxy='';
          export http_proxy='';


Usage of attached sample code leveraging Cloudera Navigator REST API :


1) Sample script to audit all the following events in the cluster in last 24 hrs(can be customized) :
   a) All GRANT and REVOKE statement issued from Sentry server
   b) All USER_LOGINS from HUE Server. Hue Server is ingtegrated with Entgerprise AD
   c) All new directories being created in HDFS. 
   
Note : As of CDH 5.8, For Audit REST APIs, "The only supported operator is ";" (Boolean AND). Boolean OR is not supported."

      
      
