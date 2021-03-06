# curl -u ""$RANCHER_USER":"$RANCHER_PASS"" \
# -X POST \
# -H 'Accept: application/json' \
# -H 'Content-Type: application/json' \
# -d '{
#   "inServiceStrategy":{"launchConfig": {"imageUuid":"docker:obdev/mail_seneca_flowz:master","kind": "container","labels":{"io.rancher.container.pull_image": "always","io.rancher.scheduler.affinity:host_label": "machine=cluster-flowz"},"ports": ["4000:4000/tcp"],"version": "4af80929-b28f-45cc-b175-8a99e0e68264 ","environment": {"smtphost": "smtp.gmail.com","smtpPort": "465","user": "obsoftcare@gmail.com","password": "Welcome123@"},"healthCheck": {"type": "instanceHealthCheck","healthyThreshold": 2,"initializingTimeout": 60000,"interval": 2000,"name": null,"port": 4000,"recreateOnQuorumStrategyConfig": {"type": "recreateOnQuorumStrategyConfig","quorum": 1},"reinitializingTimeout": 60000,"responseTimeout": 60000,"strategy": "recreateOnQuorum","unhealthyThreshold": 3},"networkMode": "managed"}},"toServiceStrategy":null}' \
# 'http://rancher.flowz.com:8080/v2-beta/projects/1a29/services/1s274?action=upgrade'
#
# curl -u ""$RANCHER_USER":"$RANCHER_PASS"" \
# -X POST \
# -H 'Accept: application/json' \
# -H 'Content-Type: application/json' \
# -d '{"inServiceStrategy":{"launchConfig": {"imageUuid":"docker:obdev/mail_email_services_flowz:master","kind": "container","labels":{"io.rancher.container.pull_image": "always","io.rancher.scheduler.affinity:host_label": "machine=cluster-flowz"},"ports": ["3003:3003/tcp"],"version": "0d2790b4-9eed-459c-aefe-bf520bdf8e94","environment": {"rdb": "virtualEMail","rhost": "'"$RDB_HOST"'","rport": "'"$RDB_PORT"'","rauth":"'"$RAUTH"'","cert":"'"$CERT"'","senecaurl": "api.flowz.com/sendmail","privatekey": "abcdefgabcdefg","awsaccesskey":"'"$AWSACCESSKEY"'","awsprivatekey":"'"$AWSPRIVATEKEY"'"},"healthCheck": {"type": "instanceHealthCheck","healthyThreshold": 2,"initializingTimeout": 60000,"interval": 2000,"name": null,"port": 3003,"recreateOnQuorumStrategyConfig": {"type": "recreateOnQuorumStrategyConfig","quorum": 1},"reinitializingTimeout": 60000,"responseTimeout": 60000,"strategy": "recreateOnQuorum","unhealthyThreshold": 3},"networkMode": "managed"}},"toServiceStrategy":null}' \
# 'http://rancher.flowz.com:8080/v2-beta/projects/1a29/services/1s288?action=upgrade'
#
# curl -u ""$RANCHER_USER":"$RANCHER_PASS"" \
# -X POST \
# -H 'Accept: application/json' \
# -H 'Content-Type: application/json' \
# -d '{
#   "inServiceStrategy":{"launchConfig": {"imageUuid":"docker:obdev/mail_backend_flowz:master","kind": "container","labels":{"io.rancher.container.pull_image": "always","io.rancher.scheduler.affinity:host_label": "machine=cluster-flowz"},"ports": ["3036:3036/tcp","4036:4036/tcp"],"version": "2ec02051-52c4-4518-890c-7af5712dd2e5","environment": {"rdb": "virtualEMail","rhost": "'"$RDB_HOST"'","rport": "'"$RDB_PORT"'","rauth":"'"$RAUTH"'","cert":"'"$CERT"'"},"healthCheck": {"type": "instanceHealthCheck","healthyThreshold": 2,"initializingTimeout": 60000,"interval": 2000,"name": null,"port": 3036,"recreateOnQuorumStrategyConfig": {"type": "recreateOnQuorumStrategyConfig","quorum": 1},"reinitializingTimeout": 60000,"responseTimeout": 60000,"strategy": "recreateOnQuorum","unhealthyThreshold": 3},"networkMode": "managed"}},"toServiceStrategy":null}' \
# 'http://rancher.flowz.com:8080/v2-beta/projects/1a29/services/1s281?action=upgrade'


# curl -u ""$RANCHER_USER":"$RANCHER_PASS"" \
# -X POST \
# -H 'Accept: application/json' \
# -H 'Content-Type: application/json' \
# -d '{
#      "inServiceStrategy":{"launchConfig": {"imageUuid":"docker:obdev/mail_frontend_flowz:master","kind": "container","labels":{"io.rancher.container.pull_image": "always","io.rancher.scheduler.affinity:host_label": "machine=vmail-front"},"ports": ["80:80/tcp","443:443/tcp"],"version": "f722e75d-59db-409e-8802-dcc517c3137b","healthCheck": {"type": "instanceHealthCheck","healthyThreshold": 2,"initializingTimeout": 60000,"interval": 2000,"name": null,"port": 80,"recreateOnQuorumStrategyConfig": {"type": "recreateOnQuorumStrategyConfig","quorum": 1},"reinitializingTimeout": 60000,"requestLine": "GET \"http://localhost\" \"HTTP/1.0\"","responseTimeout": 60000,"strategy": "recreateOnQuorum","unhealthyThreshold": 3},"networkMode": "managed"}},"toServiceStrategy":null}' \
# 'http://rancher.flowz.com:8080/v2-beta/projects/1a29/services/1s295?action=upgrade'


if [ "$TRAVIS_BRANCH" = "master" ]
then
    {
    echo "call $TRAVIS_BRANCH branch"
    ENV_ID=`curl -u ""$RANCHER_ACCESSKEY_MASTER":"$RANCHER_SECRETKEY_MASTER"" -X GET -H 'Accept: application/json' -H 'Content-Type: application/json' "$RANCHER_URL_MASTER/v2-beta/projects?name=Production" | jq '.data[].id' | tr -d '"'`
    echo $ENV_ID
    USERNAME="$DOCKER_USERNAME_FLOWZ";
    TAG="latest";
    SENECAURL="$SENECAURL_MASTER";
    FRONT_HOST="$FRONT_HOST_MASTER";
    RANCHER_ACCESSKEY="$RANCHER_ACCESSKEY_MASTER";
    RANCHER_SECRETKEY="$RANCHER_SECRETKEY_MASTER";
    RANCHER_URL="$RANCHER_URL_MASTER";
    
    SERVICE_NAME_SENECA="$SERVICE_NAME_SENECA_MASTER";
    SERVICE_NAME_MICRO="$SERVICE_NAME_MICRO_MASTER";
    SERVICE_NAME_BACKEND="$SERVICE_NAME_BACKEND_MASTER";
    SERVICE_NAME_FRONTEND="$SERVICE_NAME_FRONTEND_MASTER";
    
    BACKEND_HOST="$BACKEND_HOST_MASTER";
    
    STACK_SERVICE_NAME_FOR_FRONT="$STACK_SERVICE_NAME_FOR_FRONT_MASTER";
  }
elif [ "$TRAVIS_BRANCH" = "develop" ]
then
    {
      echo "call $TRAVIS_BRANCH branch"
      ENV_ID=`curl -u ""$RANCHER_ACCESSKEY_DEVELOP":"$RANCHER_SECRETKEY_DEVELOP"" -X GET -H 'Accept: application/json' -H 'Content-Type: application/json' "$RANCHER_URL_DEVELOP/v2-beta/projects?name=Develop" | jq '.data[].id' | tr -d '"'`
      echo $ENV_ID
      USERNAME="$DOCKER_USERNAME";
      TAG="dev";
      SENECAURL="$SENECAURL_DEVELOP";
      FRONT_HOST="$FRONT_HOST_DEVELOP";
      RANCHER_ACCESSKEY="$RANCHER_ACCESSKEY_DEVELOP";
      RANCHER_SECRETKEY="$RANCHER_SECRETKEY_DEVELOP";
      RANCHER_URL="$RANCHER_URL_DEVELOP";
      
      SERVICE_NAME_SENECA="$SERVICE_NAME_SENECA_DEVELOP";
      SERVICE_NAME_MICRO="$SERVICE_NAME_MICRO_DEVELOP";
      SERVICE_NAME_BACKEND="$SERVICE_NAME_BACKEND_DEVELOP";
      SERVICE_NAME_FRONTEND="$SERVICE_NAME_FRONTEND_DEVELOP";
      
      BACKEND_HOST="$BACKEND_HOST_DEVELOP";
      
      STACK_SERVICE_NAME_FOR_FRONT="$STACK_SERVICE_NAME_FOR_FRONT_DEVELOP";
  }
elif [ "$TRAVIS_BRANCH" = "staging" ]
then
    {
      echo "call $TRAVIS_BRANCH branch"
      ENV_ID=`curl -u ""$RANCHER_ACCESSKEY_STAGING":"$RANCHER_SECRETKEY_STAGING"" -X GET -H 'Accept: application/json' -H 'Content-Type: application/json' "$RANCHER_URL_STAGING/v2-beta/projects?name=Staging" | jq '.data[].id' | tr -d '"'`
      echo $ENV_ID
      USERNAME="$DOCKER_USERNAME";
      TAG="staging";
      SENECAURL="$SENECAURL_STAGING";
      FRONT_HOST="$FRONT_HOST_STAGING";
      RANCHER_ACCESSKEY="$RANCHER_ACCESSKEY_STAGING";
      RANCHER_SECRETKEY="$RANCHER_SECRETKEY_STAGING";
      RANCHER_URL="$RANCHER_URL_STAGING";
      
      SERVICE_NAME_SENECA="$SERVICE_NAME_SENECA_STAGING";
      SERVICE_NAME_MICRO="$SERVICE_NAME_MICRO_STAGING";
      SERVICE_NAME_BACKEND="$SERVICE_NAME_BACKEND_STAGING";
      SERVICE_NAME_FRONTEND="$SERVICE_NAME_FRONTEND_STAGING";
      
      BACKEND_HOST="$BACKEND_HOST_STAGING";
  
      STACK_SERVICE_NAME_FOR_FRONT="$STACK_SERVICE_NAME_FOR_FRONT_STAGING";
  }  
else
  {
      echo "call $TRAVIS_BRANCH branch"
      ENV_ID=`curl -u ""$RANCHER_ACCESSKEY_QA":"$RANCHER_SECRETKEY_QA"" -X GET -H 'Accept: application/json' -H 'Content-Type: application/json' "$RANCHER_URL_QA/v2-beta/projects?name=Develop" | jq '.data[].id' | tr -d '"'`
      echo $ENV_ID
      USERNAME="$DOCKER_USERNAME";
      TAG="qa";
      SENECAURL="$SENECAURL_QA";
      FRONT_HOST="$FRONT_HOST_QA";
      RANCHER_ACCESSKEY="$RANCHER_ACCESSKEY_QA";
      RANCHER_SECRETKEY="$RANCHER_SECRETKEY_QA";
      RANCHER_URL="$RANCHER_URL_QA";
      
      SERVICE_NAME_SENECA="$SERVICE_NAME_SENECA_QA";
      SERVICE_NAME_MICRO="$SERVICE_NAME_MICRO_QA";
      SERVICE_NAME_BACKEND="$SERVICE_NAME_BACKEND_QA";
      SERVICE_NAME_FRONTEND="$SERVICE_NAME_FRONTEND_QA";
      
      BACKEND_HOST="$BACKEND_HOST_QA";
      
      STACK_SERVICE_NAME_FOR_FRONT="$STACK_SERVICE_NAME_FOR_FRONT_QA";
  }
fi

SERVICE_ID_SENECA=`curl -u ""$RANCHER_ACCESSKEY":"$RANCHER_SECRETKEY"" -X GET -H 'Accept: application/json' -H 'Content-Type: application/json' "$RANCHER_URL/v2-beta/projects/$ENV_ID/services?name=$SERVICE_NAME_SENECA" | jq '.data[].id' | tr -d '"'`
echo $SERVICE_ID_SENECA

SERVICE_ID_MICRO=`curl -u ""$RANCHER_ACCESSKEY":"$RANCHER_SECRETKEY"" -X GET -H 'Accept: application/json' -H 'Content-Type: application/json' "$RANCHER_URL/v2-beta/projects/$ENV_ID/services?name=$SERVICE_NAME_MICRO" | jq '.data[].id' | tr -d '"'`
echo $SERVICE_ID_MICRO

SERVICE_ID_BACKEND=`curl -u ""$RANCHER_ACCESSKEY":"$RANCHER_SECRETKEY"" -X GET -H 'Accept: application/json' -H 'Content-Type: application/json' "$RANCHER_URL/v2-beta/projects/$ENV_ID/services?name=$SERVICE_NAME_BACKEND" | jq '.data[].id' | tr -d '"'`
echo $SERVICE_ID_BACKEND

SERVICE_ID_FRONTEND=`curl -u ""$RANCHER_ACCESSKEY":"$RANCHER_SECRETKEY"" -X GET -H 'Accept: application/json' -H 'Content-Type: application/json' "$RANCHER_URL/v2-beta/projects/$ENV_ID/services?name=$SERVICE_NAME_FRONTEND" | jq '.data[].id' | tr -d '"'`
echo $SERVICE_ID_FRONTEND

curl -u ""$RANCHER_ACCESSKEY":"$RANCHER_SECRETKEY"" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{
  "inServiceStrategy":{"launchConfig": {"imageUuid":"docker:'$USERNAME'/mail_seneca_flowz:'$TAG'","kind": "container","labels":{"io.rancher.container.pull_image": "always","io.rancher.scheduler.affinity:host_label": "'"$BACKEND_HOST"'"},"ports": ["4000:4000/tcp"],"environment": {"smtphost": "'"$SMTPHOST"'","smtpPort": "'"$SMTPPORT"'","user": "'"$USER"'","password": "'"$PASSWORD"'"},"healthCheck": {"type": "instanceHealthCheck","healthyThreshold": 2,"initializingTimeout": 60000,"interval": 2000,"name": null,"port": 4000,"recreateOnQuorumStrategyConfig": {"type": "recreateOnQuorumStrategyConfig","quorum": 1},"reinitializingTimeout": 60000,"responseTimeout": 60000,"strategy": "recreateOnQuorum","unhealthyThreshold": 3},"networkMode": "managed"}},"toServiceStrategy":null}' \
$RANCHER_URL/v2-beta/projects/$ENV_ID/services/$SERVICE_ID_SENECA?action=upgrade

curl -u ""$RANCHER_ACCESSKEY":"$RANCHER_SECRETKEY"" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{"inServiceStrategy":{"launchConfig": {"imageUuid":"docker:'$USERNAME'/mail_email_services_flowz:'$TAG'","kind": "container","labels":{"io.rancher.container.pull_image": "always","io.rancher.scheduler.affinity:host_label": "'"$BACKEND_HOST"'"},"ports": ["3003:3003/tcp"],"environment": {"rdb": "'"$RDB"'","rhost": "'"$RDB_HOST"'","rport": "'"$RDB_PORT"'","senecaurl": "'"$SENECAURL"'","privatekey": "'"$PRIVATEKEY"'","awsaccesskey":"'"$AWSACCESSKEY"'","awsprivatekey":"'"$AWSPRIVATEKEY"'"},"healthCheck": {"type": "instanceHealthCheck","healthyThreshold": 2,"initializingTimeout": 60000,"interval": 2000,"name": null,"port": 3003,"recreateOnQuorumStrategyConfig": {"type": "recreateOnQuorumStrategyConfig","quorum": 1},"reinitializingTimeout": 60000,"responseTimeout": 60000,"strategy": "recreateOnQuorum","unhealthyThreshold": 3},"networkMode": "managed"}},"toServiceStrategy":null}' \
$RANCHER_URL/v2-beta/projects/$ENV_ID/services/$SERVICE_ID_MICRO?action=upgrade

curl -u ""$RANCHER_ACCESSKEY":"$RANCHER_SECRETKEY"" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{
  "inServiceStrategy":{"launchConfig": {"imageUuid":"docker:'$USERNAME'/mail_backend_flowz:'$TAG'","kind": "container","labels":{"io.rancher.container.pull_image": "always","io.rancher.scheduler.affinity:host_label": "'"$BACKEND_HOST"'"},"ports": ["3036:3036/tcp","4036:4036/tcp"],"environment": {"rdb": "'"$RDB"'","rhost": "'"$RDB_HOST"'","rport": "'"$RDB_PORT"'"},"healthCheck": {"type": "instanceHealthCheck","healthyThreshold": 2,"initializingTimeout": 60000,"interval": 2000,"name": null,"port": 3036,"recreateOnQuorumStrategyConfig": {"type": "recreateOnQuorumStrategyConfig","quorum": 1},"reinitializingTimeout": 60000,"responseTimeout": 60000,"strategy": "recreateOnQuorum","unhealthyThreshold": 3},"networkMode": "managed"}},"toServiceStrategy":null}' \
$RANCHER_URL/v2-beta/projects/$ENV_ID/services/$SERVICE_ID_BACKEND?action=upgrade

curl -u ""$RANCHER_ACCESSKEY":"$RANCHER_SECRETKEY"" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d '{
     "inServiceStrategy":{"launchConfig": {"imageUuid":"docker:'$USERNAME'/mail_frontend_flowz:'$TAG'","kind": "container","labels":{"io.rancher.container.pull_image": "always","io.rancher.scheduler.affinity:host_label": "'"$FRONT_HOST"'","io.rancher.scheduler.affinity:container_label_soft_ne": "'"$STACK_SERVICE_NAME_FOR_FRONT"'"},"healthCheck": {"type": "instanceHealthCheck","healthyThreshold": 2,"initializingTimeout": 60000,"interval": 2000,"name": null,"port": 80,"recreateOnQuorumStrategyConfig": {"type": "recreateOnQuorumStrategyConfig","quorum": 1},"reinitializingTimeout": 60000,"requestLine": "GET \"http://localhost\" \"HTTP/1.0\"","responseTimeout": 60000,"strategy": "recreateOnQuorum","unhealthyThreshold": 3},"networkMode": "managed"}},"toServiceStrategy":null}' \
$RANCHER_URL/v2-beta/projects/$ENV_ID/services/$SERVICE_ID_FRONTEND?action=upgrade
