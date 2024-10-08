-- liquibase formatted sql

-- changeset huynhlehoaibac:1725640863723-1
CREATE TABLE "oauth2_authorization" ("id" VARCHAR(100) NOT NULL, "registered_client_id" VARCHAR(100) NOT NULL, "principal_name" VARCHAR(200) NOT NULL, "authorization_grant_type" VARCHAR(100) NOT NULL, "attributes" VARCHAR(4000) DEFAULT 'NULL::character varying', "state" VARCHAR(500) DEFAULT 'NULL::character varying', "authorization_code_value" BYTEA, "authorization_code_issued_at" TIMESTAMP WITHOUT TIME ZONE, "authorization_code_expires_at" TIMESTAMP WITHOUT TIME ZONE, "authorization_code_metadata" VARCHAR(2000) DEFAULT 'NULL::character varying', "access_token_value" BYTEA, "access_token_issued_at" TIMESTAMP WITHOUT TIME ZONE, "access_token_expires_at" TIMESTAMP WITHOUT TIME ZONE, "access_token_metadata" VARCHAR(2000) DEFAULT 'NULL::character varying', "access_token_type" VARCHAR(100) DEFAULT 'NULL::character varying', "access_token_scopes" VARCHAR(1000) DEFAULT 'NULL::character varying', "oidc_id_token_value" BYTEA, "oidc_id_token_issued_at" TIMESTAMP WITHOUT TIME ZONE, "oidc_id_token_expires_at" TIMESTAMP WITHOUT TIME ZONE, "oidc_id_token_metadata" VARCHAR(2000) DEFAULT 'NULL::character varying', "refresh_token_value" BYTEA, "refresh_token_issued_at" TIMESTAMP WITHOUT TIME ZONE, "refresh_token_expires_at" TIMESTAMP WITHOUT TIME ZONE, "refresh_token_metadata" VARCHAR(2000) DEFAULT 'NULL::character varying', CONSTRAINT "oauth2_authorization_pkey" PRIMARY KEY ("id"));

-- changeset huynhlehoaibac:1725640863723-2
CREATE TABLE "oauth2_registered_client" ("id" VARCHAR(100) NOT NULL, "client_id" VARCHAR(100) NOT NULL, "client_id_issued_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW() NOT NULL, "client_secret" VARCHAR(200) DEFAULT 'NULL::character varying', "client_secret_expires_at" TIMESTAMP WITHOUT TIME ZONE, "client_name" VARCHAR(200) NOT NULL, "client_authentication_methods" VARCHAR(1000) NOT NULL, "authorization_grant_types" VARCHAR(1000) NOT NULL, "redirect_uris" VARCHAR(1000) DEFAULT 'NULL::character varying', "scopes" VARCHAR(1000) NOT NULL, "client_settings" VARCHAR(2000) NOT NULL, "token_settings" VARCHAR(2000) NOT NULL, CONSTRAINT "oauth2_registered_client_pkey" PRIMARY KEY ("id"));

-- changeset huynhlehoaibac:1725640863723-3
CREATE TABLE "user" ("id" BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 3) NOT NULL, "username" VARCHAR(64) NOT NULL, "password" VARCHAR(150), "authorities" VARCHAR NOT NULL, "firstname" VARCHAR(32) NOT NULL, "lastname" VARCHAR(32) NOT NULL, CONSTRAINT "user_pkey" PRIMARY KEY ("id"));

-- changeset huynhlehoaibac:1725640863723-4
ALTER TABLE "user" ADD CONSTRAINT "user_username_key" UNIQUE ("username");

-- changeset huynhlehoaibac:1725640863723-5
CREATE TABLE "oauth2_authorization_consent" ("registered_client_id" VARCHAR(100) NOT NULL, "principal_name" VARCHAR(200) NOT NULL, "authorities" VARCHAR(1000) NOT NULL, CONSTRAINT "oauth2_authorization_consent_pkey" PRIMARY KEY ("registered_client_id", "principal_name"));

