resource "nomad_variable" "unifi" {
  path = "nomad/jobs/unifi"
  items = {
    MONGO_DBNAME               = "unifi"
    MONGO_USER                 = var.mongo_user
    MONGO_PASS                 = var.mongo_password
    MONGO_INITDB_ROOT_USERNAME = var.mongo_initdb_root_username
    MONGO_INITDB_ROOT_PASSWORD = var.mongo_initdb_root_password
    MONGO_HOST                 = "mongo.service.consul"
    MONGO_PORT                 = "27017"
    MONGO_AUTHSOURCE           = "admin"
  }
}

resource "nomad_variable" "samba" {
  path = "nomad/jobs/samba"
  items = {
    SAMBA_SHARE    = var.samba_share
    SAMBA_UID      = var.samba_uid
    SAMBA_PASSWORD = var.samba_password
  }
}

resource "nomad_variable" "postgres" {
  path = "nomad/jobs/postgres"
  items = {
    POSTGRES_DB       = "postgres"
    POSTGRES_USER     = var.postgres_root_user
    POSTGRES_PASSWORD = var.postgres_root_password
    PGDATA            = "/var/lib/pgsql/data"
  }
}

resource "nomad_variable" "mongo" {
  path = "nomad/jobs/mongo"
  items = {
    MONGO_DBNAME               = "unifi"
    MONGO_USER                 = var.mongo_user
    MONGO_PASS                 = var.mongo_password
    MONGO_INITDB_ROOT_USERNAME = var.mongo_initdb_root_username
    MONGO_INITDB_ROOT_PASSWORD = var.mongo_initdb_root_password
    MONGO_AUTHSOURCE           = "admin"
  }
}

resource "nomad_variable" "grafana" {
  path = "nomad/jobs/grafana"
  items = {
    GF_PATHS_DATA              = "/var/lib/grafana"
    GF_SECURITY_ADMIN_USER     = var.grafana_email
    GF_SECURITY_ADMIN_PASSWORD = var.grafana_password
    GF_INSTALL_PLUGINS         = "grafana-piechart-panel"
  }
}

resource "nomad_variable" "auth" {
  path = "nomad/jobs/auth"
  items = {
    AUTH_HOST                      = "auth.${var.auth_domain}"
    COOKIE_DOMAIN                  = var.auth_domain
    INSECURE_COOKIE                = "true"
    LOG_LEVEL                      = "DEBUG"
    PROVIDERS_GOOGLE_CLIENT_ID     = var.auth_client_id
    PROVIDERS_GOOGLE_CLIENT_SECRET = var.auth_client_secret
    SECRET                         = var.auth_secret
    WHITELIST                      = var.auth_whitelist_email
  }
}

resource "nomad_variable" "influxdb" {
  path = "nomad/jobs/influxdb"
  items = {
    DOCKER_INFLUXDB_INIT_BUCKET   = "default"
    DOCKER_INFLUXDB_INIT_MODE     = "setup"
    DOCKER_INFLUXDB_INIT_ORG      = "home"
    DOCKER_INFLUXDB_INIT_PASSWORD = var.influxdb_password
    DOCKER_INFLUXDB_INIT_USERNAME = var.influxdb_user
  }
}

resource "nomad_variable" "graylog" {
  path = "nomad/jobs/graylog"
  items = {
    GRAYLOG_NODE_ID_FILE="/usr/share/graylog/data/config/node-id"
    GRAYLOG_HTTP_BIND_ADDRESS="0.0.0.0:9000"
    GRAYLOG_ELASTICSEARCH_HOSTS="http://opensearch:9200"
    GRAYLOG_MONGODB_URI="mongodb://mongodb:27017/graylog"
    GRAYLOG_REPORT_DISABLE_SANDBOX="true"
    GRAYLOG_PASSWORD_SECRET="somepasswordpepper"
      # Password: "admin"
    GRAYLOG_ROOT_PASSWORD_SHA2="8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918"
    GRAYLOG_HTTP_EXTERNAL_URI="http://127.0.0.1:9000/"
  }
}