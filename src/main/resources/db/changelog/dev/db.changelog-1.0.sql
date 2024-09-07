-- CREATE SCHEMA IF NOT EXISTS uaa AUTHORIZATION uaa_app_user;

-- org/springframework/security/oauth2/server/authorization/oauth2-authorization-schema.sql
CREATE TABLE IF NOT EXISTS oauth2_authorization (
    id varchar(100) NOT NULL,
    registered_client_id varchar(100) NOT NULL,
    principal_name varchar(200) NOT NULL,
    authorization_grant_type varchar(100) NOT NULL,
    attributes varchar(4000) DEFAULT NULL,
    state varchar(500) DEFAULT NULL,
    authorization_code_value bytea DEFAULT NULL,
    authorization_code_issued_at timestamp DEFAULT NULL,
    authorization_code_expires_at timestamp DEFAULT NULL,
    authorization_code_metadata varchar(2000) DEFAULT NULL,
    access_token_value bytea DEFAULT NULL,
    access_token_issued_at timestamp DEFAULT NULL,
    access_token_expires_at timestamp DEFAULT NULL,
    access_token_metadata varchar(2000) DEFAULT NULL,
    access_token_type varchar(100) DEFAULT NULL,
    access_token_scopes varchar(1000) DEFAULT NULL,
    oidc_id_token_value bytea DEFAULT NULL,
    oidc_id_token_issued_at timestamp DEFAULT NULL,
    oidc_id_token_expires_at timestamp DEFAULT NULL,
    oidc_id_token_metadata varchar(2000) DEFAULT NULL,
    refresh_token_value bytea DEFAULT NULL,
    refresh_token_issued_at timestamp DEFAULT NULL,
    refresh_token_expires_at timestamp DEFAULT NULL,
    refresh_token_metadata varchar(2000) DEFAULT NULL,
    PRIMARY KEY (id)
);

-- org/springframework/security/oauth2/server/authorization/oauth2-authorization-consent-schema.sql
CREATE TABLE IF NOT EXISTS oauth2_authorization_consent (
    registered_client_id varchar(100) NOT NULL,
    principal_name varchar(200) NOT NULL,
    authorities varchar(1000) NOT NULL,
    PRIMARY KEY (registered_client_id, principal_name)
);

-- org/springframework/security/oauth2/server/authorization/client/oauth2-registered-client-schema.sql
CREATE TABLE IF NOT EXISTS oauth2_registered_client (
    id varchar(100) NOT NULL,
    client_id varchar(100) NOT NULL,
    client_id_issued_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    client_secret varchar(200) DEFAULT NULL,
    client_secret_expires_at timestamp DEFAULT NULL,
    client_name varchar(200) NOT NULL,
    client_authentication_methods varchar(1000) NOT NULL,
    authorization_grant_types varchar(1000) NOT NULL,
    redirect_uris varchar(1000) DEFAULT NULL,
    scopes varchar(1000) NOT NULL,
    client_settings varchar(2000) NOT NULL,
    token_settings varchar(2000) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS "user" (
	id bigserial NOT NULL,
	username varchar(64) NOT NULL,
	"password" varchar(200) NULL,
	authorities varchar NOT NULL,
	firstname varchar(32) NOT NULL,
	lastname varchar(32) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (username)
);



-- simpleapp: client-secret: 123456
INSERT INTO oauth2_registered_client (id, client_id, client_id_issued_at, client_secret, client_secret_expires_at, client_name, client_authentication_methods, authorization_grant_types, redirect_uris, scopes, client_settings, token_settings)
SELECT 'f5945b94-f28e-4469-a104-99c218d87cc0', 'simpleapp', '2021-08-31 15:45:26.082', '{bcrypt}$2a$10$U4MV9KXKVJxpN8Xf/2PcL.S6ZLa7eBZC/tYB3OspUJx8WJ8LKwrTm', null, 'Simple Applicaiton', 'client_secret_post', 'refresh_token,authorization_code', 'http://127.0.0.1:8010/login/oauth2/code/simpleapp,https://oidcdebugger.com/debug', 'openid,cart', '{"@class":"java.util.HashMap","settings.client.require-authorization-consent":false,"settings.client.require-proof-key":false}', '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",300.000000000],"settings.token.refresh-token-time-to-live":["java.time.Duration",3600.000000000]}'
WHERE
    NOT EXISTS (
        SELECT 1 FROM oauth2_registered_client WHERE client_id = 'simpleapp'
    );



INSERT INTO "user" (username, "password", authorities, firstname, lastname)
SELECT 'brown.hare@company.com', '{bcrypt}$2a$10$QRAQ.OGYvRWBMn3vvbTxFu7VXWx6lEuXmhPurzsIBz4kKQUvR36sC', 'ROLE_user,ROLE_admin', 'Brown', 'Hare'
WHERE
    NOT EXISTS (
        SELECT 1 FROM "user" WHERE username = 'hare@company.com'
    );

INSERT INTO "user" (username, "password", authorities, firstname, lastname)
SELECT 'yellow.quack@company.com', '{noop}password', 'ROLE_user', 'Yellow', 'Quack'
WHERE
    NOT EXISTS (
        SELECT 1 FROM "user" WHERE username = 'yellow@company.com'
    );

-- bussiness tables
