#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER"<<-EOSQL
	CREATE USER crowd PASSWORD 'changeme' SUPERUSER;
	CREATE DATABASE crowd WITH OWNER crowd ENCODING 'utf-8';
	GRANT ALL PRIVILEGES ON DATABASE crowd TO crowd;
	CREATE USER jira PASSWORD 'changeme' SUPERUSER;
	CREATE DATABASE jira WITH OWNER jira ENCODING 'utf-8' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
	GRANT ALL PRIVILEGES ON DATABASE jira TO jira;
	CREATE USER confluence PASSWORD 'changeme' SUPERUSER;
	CREATE DATABASE confluence WITH OWNER confluence ENCODING 'utf-8';
	GRANT ALL PRIVILEGES ON DATABASE confluence TO confluence;
	CREATE USER bitbucket PASSWORD 'changeme' SUPERUSER;
	CREATE DATABASE bitbucket WITH OWNER bitbucket ENCODING 'utf-8' CONNECTION LIMIT=-1;
	GRANT ALL PRIVILEGES ON DATABASE bitbucket TO bitbucket;
	CREATE USER bamboo PASSWORD 'changeme' SUPERUSER;
	CREATE DATABASE bamboo WITH OWNER bamboo ENCODING 'utf-8';
	GRANT ALL PRIVILEGES ON DATABASE bamboo TO bamboo;
EOSQL