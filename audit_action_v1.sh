report_format=JSON;
current_date_epoch=`date +%s%3N`
current_date=`date -d @$(  echo "($current_date_epoch + 500) / 1000" | bc)`
time_range_ms=86400000
previous_date_epoch=`expr $current_date_epoch - $time_range_ms`
previous_date=` date -d @$(  echo "($previous_date_epoch + 500) / 1000" | bc)`
echo "Audit start time in ms epoch:HR is ---  $previous_date_epoch:$previous_date"
echo "Audit end time in ms epoch:HR is --- $current_date_epoch:$current_date"
#Audit for Grant Privilege
# Using flag --noproxy to bypass http proxy and -o for saving output to file
/usr/bin/curl  --noproxy '*' -k -u jay.kumar:Password@123 "https://<nav_server>:7187/api/v9/audits/?query=command%3D%3DGRANT_PRIVILEGE&startTime=
previous_date_epoch&endTime=$current_date_epoch&offset=0&format=$report_format&attachment=false" -o audit_grant_`date +%F`.out
#Audits for Revoke Privilege
/usr/bin/curl --noproxy '*' -k -u jay.kumar:Password@123 "https://<nav_server>:7187/api/v9/audits/?query=command%3D%3DREVOKE_PRIVILEGE&startTime=
previous_date_epoch&endTime=$current_date_epoch&offset=0&format=$report_format&attachment=false" -o audit_revoke_`date +%F`.out

# Audit for Hue Logins
/usr/bin/curl --noproxy '*' -k -u jay.kumar:Password@123 "https://<nav_server>:7187/api/v9/audits/?query=command%3D%3DUSER_LOGIN&startTime=$previ
us_date_epoch&endTime=$current_date_epoch&offset=0&format=$report_format&attachment=false" -o  audit_hue_logins_`date +%F`.out
#Audit for new HDFS directory creation
/usr/bin/curl --noproxy '*' -k -u jay.kumar:Password@123 "https://<nav_server>:7187/api/v9/audits/?query=command%3D%3Dmkdirs&startTime=$previous_
ate_epoch&endTime=$current_date_epoch&offset=0&format=$report_format&attachment=false" -o  audit_hdfs_mkdirs_`date +%F`.out
## With Limit option
#/usr/bin/curl -k -u jay.kumar:India@123 "https://br1paprhdd11.passporthealth.com:7187/api/v9/audits/?query=command%3D%3DGRANT_PRIVILEGE&startTime=$previous_date
epoch&endTime=$current_date_epoch&limit=1&offset=0&format=JSON&attachment=false"

