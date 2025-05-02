FROM uselagoon/solr-8-drupal:latest

ARG SOLR_SEC

CMD solr-recreate drupal /solr-conf && solr-foreground

COPY lagoon/security.json /tmp/security_template.json
COPY lagoon/entry-point-setup-solr.sh /lagoon/entrypoints/98-env-setup-solr.sh

RUN cat /tmp/security_template.json | sed "s/%REPLACE%/$SOLR_SEC/" > /tmp/security_solr.json

# Example adding a second core
# COPY lagoon/drupal-4.2.7-solr-8.x-1/ /solr-conf2/conf
# CMD solr-recreate drupal /solr-conf && solr-recreate more-drupal /solr-conf2 && solr-foreground
