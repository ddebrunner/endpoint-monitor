SERVER_AUTH=/var/run/secrets/streams-endpoint-monitor/server-auth

SECRET_HTACCESS=${SERVER_AUTH}/.htaccess
if [ -f "${SECRET_HTACCESS}" ]; then
    /bin/cp \
        /opt/app-root/src/nginx-optional-cfg/auth_basic.conf \
        /var/opt/streams-endpoint-monitor/authentication.basic.conf
fi

SIGNATURE_SECRET=${SERVER_AUTH}/signature-secret
if [ -f "${SIGNATURE_SECRET}" ]; then
    secret=`cat ${SIGNATURE_SECRET}
    echo 'set $signatureSecret ' "'${secret}'" ';' > /var/opt/streams-endpoint-monitor/authentication.signature-secret.conf
fi
