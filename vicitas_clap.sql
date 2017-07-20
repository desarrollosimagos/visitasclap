--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.14
-- Dumped by pg_dump version 9.4.6
-- Started on 2016-07-25 09:59:22 PYT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11647)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 1593298)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- TOC entry 163 (class 1259 OID 1593301)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 163
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 164 (class 1259 OID 1593303)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 165 (class 1259 OID 1593306)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 166 (class 1259 OID 1593308)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- TOC entry 167 (class 1259 OID 1593311)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 168 (class 1259 OID 1593313)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- TOC entry 169 (class 1259 OID 1593316)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 1593319)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 170
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 171 (class 1259 OID 1593321)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 172 (class 1259 OID 1593323)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 173 (class 1259 OID 1593326)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 174 (class 1259 OID 1593328)
-- Name: dependencias_dependencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dependencias_dependencia (
    id integer NOT NULL,
    nom_dependencia character varying(125) NOT NULL,
    siglas character varying(15) NOT NULL,
    correo character varying(100),
    dependencia_activa boolean NOT NULL,
    fecha_create timestamp with time zone NOT NULL,
    fecha_update timestamp with time zone,
    institucion_id integer NOT NULL,
    user_create_id integer,
    user_update_id integer
);


--
-- TOC entry 175 (class 1259 OID 1593331)
-- Name: dependencias_dependencia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dependencias_dependencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 175
-- Name: dependencias_dependencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE dependencias_dependencia_id_seq OWNED BY dependencias_dependencia.id;


--
-- TOC entry 176 (class 1259 OID 1593333)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- TOC entry 177 (class 1259 OID 1593340)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 177
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 178 (class 1259 OID 1593342)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- TOC entry 179 (class 1259 OID 1593345)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 179
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 180 (class 1259 OID 1593347)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 1593353)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 182 (class 1259 OID 1593355)
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 1593361)
-- Name: estados_estado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE estados_estado (
    id integer NOT NULL,
    cod_estado integer,
    estado character varying(50) NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 1593364)
-- Name: estados_estado_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estados_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 184
-- Name: estados_estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE estados_estado_id_seq OWNED BY estados_estado.id;


--
-- TOC entry 185 (class 1259 OID 1593366)
-- Name: grupo_etareo_grupo_etareo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grupo_etareo_grupo_etareo (
    id integer NOT NULL,
    descripcion character varying(20),
    desde character varying(2),
    hasta character varying(2),
    fecha_create timestamp with time zone NOT NULL,
    fecha_update timestamp with time zone,
    user_create_id integer,
    user_update_id integer
);


--
-- TOC entry 186 (class 1259 OID 1593369)
-- Name: grupo_etareo_grupo_etareo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grupo_etareo_grupo_etareo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 186
-- Name: grupo_etareo_grupo_etareo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grupo_etareo_grupo_etareo_id_seq OWNED BY grupo_etareo_grupo_etareo.id;


--
-- TOC entry 187 (class 1259 OID 1593371)
-- Name: instituciones_institucion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE instituciones_institucion (
    id integer NOT NULL,
    nom_institucion character varying(100) NOT NULL,
    siglas character varying(15) NOT NULL,
    telefono character varying(11) NOT NULL,
    correo character varying(100),
    municipio integer,
    parroquia integer,
    direccion character varying(200) NOT NULL,
    institucion_activa boolean NOT NULL,
    fecha_create timestamp with time zone NOT NULL,
    fecha_update timestamp with time zone,
    estado_id integer,
    user_create_id integer,
    user_update_id integer
);


--
-- TOC entry 188 (class 1259 OID 1593374)
-- Name: instituciones_institucion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE instituciones_institucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 188
-- Name: instituciones_institucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE instituciones_institucion_id_seq OWNED BY instituciones_institucion.id;


--
-- TOC entry 189 (class 1259 OID 1593376)
-- Name: login_perfilesusuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE login_perfilesusuario (
    id integer NOT NULL,
    tlf character varying(15) NOT NULL,
    user_accion character varying(15),
    user_id integer NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 1593379)
-- Name: login_perfilesusuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE login_perfilesusuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 190
-- Name: login_perfilesusuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE login_perfilesusuario_id_seq OWNED BY login_perfilesusuario.id;


--
-- TOC entry 191 (class 1259 OID 1593381)
-- Name: motivo_motivos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE motivo_motivos (
    id integer NOT NULL,
    motivo character varying(60) NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 1593384)
-- Name: motivo_motivos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE motivo_motivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 192
-- Name: motivo_motivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE motivo_motivos_id_seq OWNED BY motivo_motivos.id;


--
-- TOC entry 193 (class 1259 OID 1593386)
-- Name: municipios_municipio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE municipios_municipio (
    id integer NOT NULL,
    cod_municipio integer,
    municipio character varying(50),
    estado_id integer
);


--
-- TOC entry 194 (class 1259 OID 1593389)
-- Name: municipios_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE municipios_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 194
-- Name: municipios_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE municipios_municipio_id_seq OWNED BY municipios_municipio.id;


--
-- TOC entry 195 (class 1259 OID 1593391)
-- Name: ocupacion_ocupaciones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ocupacion_ocupaciones (
    id integer NOT NULL,
    ocupacion character varying(120) NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 1593394)
-- Name: ocupacion_ocupaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ocupacion_ocupaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 196
-- Name: ocupacion_ocupaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ocupacion_ocupaciones_id_seq OWNED BY ocupacion_ocupaciones.id;


--
-- TOC entry 197 (class 1259 OID 1593396)
-- Name: organizacion_social_organizaciones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizacion_social_organizaciones (
    id integer NOT NULL,
    organizacion character varying(60) NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 1593399)
-- Name: organizacion_social_organizaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizacion_social_organizaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 198
-- Name: organizacion_social_organizaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizacion_social_organizaciones_id_seq OWNED BY organizacion_social_organizaciones.id;


--
-- TOC entry 199 (class 1259 OID 1593401)
-- Name: parroquias_parroquia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parroquias_parroquia (
    id integer NOT NULL,
    parroquia character varying(50) NOT NULL,
    cod_parroquia integer,
    municipio integer,
    estado_id integer
);


--
-- TOC entry 200 (class 1259 OID 1593404)
-- Name: parroquias_parroquia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parroquias_parroquia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 200
-- Name: parroquias_parroquia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE parroquias_parroquia_id_seq OWNED BY parroquias_parroquia.id;


--
-- TOC entry 201 (class 1259 OID 1593406)
-- Name: sector_laboral_sectorlaboral; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sector_laboral_sectorlaboral (
    id integer NOT NULL,
    sector character varying(60) NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 1593409)
-- Name: sector_laboral_sectorlaboral_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sector_laboral_sectorlaboral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 202
-- Name: sector_laboral_sectorlaboral_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sector_laboral_sectorlaboral_id_seq OWNED BY sector_laboral_sectorlaboral.id;


--
-- TOC entry 203 (class 1259 OID 1593411)
-- Name: solicitud_registros; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE solicitud_registros (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    fecha_sal timestamp with time zone,
    fecha_ent timestamp with time zone,
    cedula integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    sexo character varying(1) NOT NULL,
    edad integer NOT NULL,
    telefono character varying(11) NOT NULL,
    twitter character varying(80),
    parroquia integer NOT NULL,
    municipio integer NOT NULL,
    direcc_es text,
    descripcion text,
    status character varying(2) NOT NULL,
    codigo_centro integer,
    nombre_centro character varying(150),
    departamento_id integer NOT NULL,
    estado_id integer,
    institucion_id integer NOT NULL,
    motivo_id integer NOT NULL,
    ocupacion_id integer NOT NULL,
    organizacion_id integer NOT NULL,
    sector_lab_id integer NOT NULL,
    tipo_edu_id integer NOT NULL,
    user_create_id integer
);


--
-- TOC entry 204 (class 1259 OID 1593417)
-- Name: solicitud_registros_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE solicitud_registros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 204
-- Name: solicitud_registros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE solicitud_registros_id_seq OWNED BY solicitud_registros.id;


--
-- TOC entry 205 (class 1259 OID 1593419)
-- Name: tipo_educacion_tipoeducacion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_educacion_tipoeducacion (
    id integer NOT NULL,
    tipo character varying(60) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1593422)
-- Name: tipo_educacion_tipoeducacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_educacion_tipoeducacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 206
-- Name: tipo_educacion_tipoeducacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_educacion_tipoeducacion_id_seq OWNED BY tipo_educacion_tipoeducacion.id;


--
-- TOC entry 207 (class 1259 OID 1593424)
-- Name: trabajadores_trabajadores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trabajadores_trabajadores (
    id integer NOT NULL,
    institucion_id integer NOT NULL,
    trabajador_id integer NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 1593427)
-- Name: trabajadores_trabajadores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trabajadores_trabajadores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 208
-- Name: trabajadores_trabajadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trabajadores_trabajadores_id_seq OWNED BY trabajadores_trabajadores.id;


--
-- TOC entry 1893 (class 2604 OID 1593429)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 1593430)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 1593431)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1896 (class 2604 OID 1593432)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1897 (class 2604 OID 1593433)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1898 (class 2604 OID 1593434)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1899 (class 2604 OID 1593435)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY dependencias_dependencia ALTER COLUMN id SET DEFAULT nextval('dependencias_dependencia_id_seq'::regclass);


--
-- TOC entry 1900 (class 2604 OID 1593436)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1902 (class 2604 OID 1593437)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1903 (class 2604 OID 1593438)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 1593439)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY estados_estado ALTER COLUMN id SET DEFAULT nextval('estados_estado_id_seq'::regclass);


--
-- TOC entry 1905 (class 2604 OID 1593440)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_etareo_grupo_etareo ALTER COLUMN id SET DEFAULT nextval('grupo_etareo_grupo_etareo_id_seq'::regclass);


--
-- TOC entry 1906 (class 2604 OID 1593441)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY instituciones_institucion ALTER COLUMN id SET DEFAULT nextval('instituciones_institucion_id_seq'::regclass);


--
-- TOC entry 1907 (class 2604 OID 1593442)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY login_perfilesusuario ALTER COLUMN id SET DEFAULT nextval('login_perfilesusuario_id_seq'::regclass);


--
-- TOC entry 1908 (class 2604 OID 1593443)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY motivo_motivos ALTER COLUMN id SET DEFAULT nextval('motivo_motivos_id_seq'::regclass);


--
-- TOC entry 1909 (class 2604 OID 1593444)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY municipios_municipio ALTER COLUMN id SET DEFAULT nextval('municipios_municipio_id_seq'::regclass);


--
-- TOC entry 1910 (class 2604 OID 1593445)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ocupacion_ocupaciones ALTER COLUMN id SET DEFAULT nextval('ocupacion_ocupaciones_id_seq'::regclass);


--
-- TOC entry 1911 (class 2604 OID 1593446)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacion_social_organizaciones ALTER COLUMN id SET DEFAULT nextval('organizacion_social_organizaciones_id_seq'::regclass);


--
-- TOC entry 1912 (class 2604 OID 1593447)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY parroquias_parroquia ALTER COLUMN id SET DEFAULT nextval('parroquias_parroquia_id_seq'::regclass);


--
-- TOC entry 1913 (class 2604 OID 1593448)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sector_laboral_sectorlaboral ALTER COLUMN id SET DEFAULT nextval('sector_laboral_sectorlaboral_id_seq'::regclass);


--
-- TOC entry 1914 (class 2604 OID 1593449)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros ALTER COLUMN id SET DEFAULT nextval('solicitud_registros_id_seq'::regclass);


--
-- TOC entry 1915 (class 2604 OID 1593450)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_educacion_tipoeducacion ALTER COLUMN id SET DEFAULT nextval('tipo_educacion_tipoeducacion_id_seq'::regclass);


--
-- TOC entry 1916 (class 2604 OID 1593451)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trabajadores_trabajadores ALTER COLUMN id SET DEFAULT nextval('trabajadores_trabajadores_id_seq'::regclass);


--
-- TOC entry 2162 (class 0 OID 1593298)
-- Dependencies: 162
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_group (id, name) VALUES (1, 'Administrador');
INSERT INTO auth_group (id, name) VALUES (2, 'Atencion');
INSERT INTO auth_group (id, name) VALUES (3, 'Configuraciones');


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 163
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 3, true);


--
-- TOC entry 2164 (class 0 OID 1593303)
-- Dependencies: 164
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2166 (class 0 OID 1593308)
-- Dependencies: 166
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add perfiles usuario', 7, 'add_perfilesusuario');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change perfiles usuario', 7, 'change_perfilesusuario');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete perfiles usuario', 7, 'delete_perfilesusuario');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add estado', 8, 'add_estado');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change estado', 8, 'change_estado');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete estado', 8, 'delete_estado');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add municipio', 9, 'add_municipio');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change municipio', 9, 'change_municipio');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete municipio', 9, 'delete_municipio');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add parroquia', 10, 'add_parroquia');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change parroquia', 10, 'change_parroquia');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete parroquia', 10, 'delete_parroquia');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add tipo educacion', 11, 'add_tipoeducacion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change tipo educacion', 11, 'change_tipoeducacion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete tipo educacion', 11, 'delete_tipoeducacion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add institucion', 12, 'add_institucion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change institucion', 12, 'change_institucion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete institucion', 12, 'delete_institucion');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add dependencia', 13, 'add_dependencia');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change dependencia', 13, 'change_dependencia');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete dependencia', 13, 'delete_dependencia');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add sector laboral', 14, 'add_sectorlaboral');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change sector laboral', 14, 'change_sectorlaboral');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete sector laboral', 14, 'delete_sectorlaboral');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add motivos', 15, 'add_motivos');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change motivos', 15, 'change_motivos');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete motivos', 15, 'delete_motivos');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add ocupaciones', 16, 'add_ocupaciones');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change ocupaciones', 16, 'change_ocupaciones');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete ocupaciones', 16, 'delete_ocupaciones');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add organizaciones', 17, 'add_organizaciones');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change organizaciones', 17, 'change_organizaciones');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete organizaciones', 17, 'delete_organizaciones');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can add grupo_ etareo', 18, 'add_grupo_etareo');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can change grupo_ etareo', 18, 'change_grupo_etareo');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can delete grupo_ etareo', 18, 'delete_grupo_etareo');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can add trabajadores', 19, 'add_trabajadores');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can change trabajadores', 19, 'change_trabajadores');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can delete trabajadores', 19, 'delete_trabajadores');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can add registros', 20, 'add_registros');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can change registros', 20, 'change_registros');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can delete registros', 20, 'delete_registros');


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 60, true);


--
-- TOC entry 2168 (class 0 OID 1593313)
-- Dependencies: 168
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$15000$6vwq2MQj221Y$fhw99EiHg6xBYoM7rPeJvTIxpsoGPiJBTNwtE6FP78Q=', '2016-07-25 09:26:28.747051-04', true, 'administrador', 'ADMIN', 'PRUEBA', '19123456', false, true, '2015-05-22 12:54:43.001975-04:30');
INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$15000$EC0xQ7E77Bhq$jTuHATaaVrJQe+yCXYBe7PLeixNFLu6c0u2VXr8uZz8=', '2016-07-25 09:53:12.609675-04', true, 'basico', 'JUAN', 'PRUEBA', '19112593', true, true, '2015-05-22 12:54:43.001975-04:30');


--
-- TOC entry 2169 (class 0 OID 1593316)
-- Dependencies: 169
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (4, 2, 2);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (5, 2, 3);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (6, 1, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (7, 1, 2);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (8, 1, 3);


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 170
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 8, true);


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- TOC entry 2172 (class 0 OID 1593323)
-- Dependencies: 172
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2174 (class 0 OID 1593328)
-- Dependencies: 174
-- Data for Name: dependencias_dependencia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 175
-- Name: dependencias_dependencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dependencias_dependencia_id_seq', 1, false);


--
-- TOC entry 2176 (class 0 OID 1593333)
-- Dependencies: 176
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2016-07-24 21:34:33.180477-04', '1', 'Administrador', 1, '', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2016-07-24 21:34:42.432495-04', '2', 'Atencion', 1, '', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2016-07-24 21:34:49.442786-04', '3', 'Configuraciones', 1, '', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2016-07-24 21:35:04.69046-04', '1', 'administrador', 2, 'Modifica groups.', 4, 1);


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 177
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 4, true);


--
-- TOC entry 2178 (class 0 OID 1593342)
-- Dependencies: 178
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_content_type (id, name, app_label, model) VALUES (1, 'log entry', 'admin', 'logentry');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (2, 'permission', 'auth', 'permission');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (3, 'group', 'auth', 'group');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (4, 'user', 'auth', 'user');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (5, 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (6, 'session', 'sessions', 'session');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (7, 'perfiles usuario', 'login', 'perfilesusuario');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (8, 'estado', 'estados', 'estado');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (9, 'municipio', 'municipios', 'municipio');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (10, 'parroquia', 'parroquias', 'parroquia');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (11, 'tipo educacion', 'tipo_educacion', 'tipoeducacion');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (12, 'institucion', 'instituciones', 'institucion');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (13, 'dependencia', 'dependencias', 'dependencia');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (14, 'sector laboral', 'sector_laboral', 'sectorlaboral');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (15, 'motivos', 'motivo', 'motivos');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (16, 'ocupaciones', 'ocupacion', 'ocupaciones');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (17, 'organizaciones', 'organizacion_social', 'organizaciones');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (18, 'grupo_ etareo', 'grupo_etareo', 'grupo_etareo');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (19, 'trabajadores', 'trabajadores', 'trabajadores');
INSERT INTO django_content_type (id, name, app_label, model) VALUES (20, 'registros', 'solicitud', 'registros');


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 179
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- TOC entry 2180 (class 0 OID 1593347)
-- Dependencies: 180
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2016-07-24 21:32:58.853415-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2016-07-24 21:32:59.54466-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2016-07-24 21:32:59.714147-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'estados', '0001_initial', '2016-07-24 21:32:59.830793-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'instituciones', '0001_initial', '2016-07-24 21:33:00.030668-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'dependencias', '0001_initial', '2016-07-24 21:33:00.282341-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'grupo_etareo', '0001_initial', '2016-07-24 21:33:00.437607-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'login', '0001_initial', '2016-07-24 21:33:00.551044-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'motivo', '0001_initial', '2016-07-24 21:33:00.610683-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'municipios', '0001_initial', '2016-07-24 21:33:00.745434-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'ocupacion', '0001_initial', '2016-07-24 21:33:00.812961-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'organizacion_social', '0001_initial', '2016-07-24 21:33:00.888494-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'parroquias', '0001_initial', '2016-07-24 21:33:01.035888-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'sector_laboral', '0001_initial', '2016-07-24 21:33:01.09621-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'sessions', '0001_initial', '2016-07-24 21:33:01.301268-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'tipo_educacion', '0001_initial', '2016-07-24 21:33:01.367969-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'solicitud', '0001_initial', '2016-07-24 21:33:01.822135-04');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'trabajadores', '0001_initial', '2016-07-24 21:33:01.969572-04');


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 18, true);


--
-- TOC entry 2182 (class 0 OID 1593355)
-- Dependencies: 182
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('a0g8nwxfkxirmzqvaeibzxo51icb6a9p', 'MDJkNTZiYWZhYWQ2MzExOTA4NWRmYTFhMGEwNTFlNjYxODU0MDUwNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3MmVlMzJjYjgyOTJmY2M2MjlhOTFmZTJkNzJlNmI3ZTk5YjdjNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2016-08-07 21:41:20.320792-04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('dv323t7z5jljb9o8gmnt687dpx1leqi3', 'ZDQyOWQ1N2IwOGY5OTRjYjM5NGZlYmRkOGU0NWY2OGYzZTQxZDljNTp7fQ==', '2016-08-08 09:26:52.906666-04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('bug7jjq21w8gup3887hriqzcomp1b1wn', 'ZDQyOWQ1N2IwOGY5OTRjYjM5NGZlYmRkOGU0NWY2OGYzZTQxZDljNTp7fQ==', '2016-08-08 09:29:11.572451-04');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('1n9qepssmehp234gta11fkyyp734o3lg', 'ZDQyOWQ1N2IwOGY5OTRjYjM5NGZlYmRkOGU0NWY2OGYzZTQxZDljNTp7fQ==', '2016-08-08 09:55:44.939115-04');


--
-- TOC entry 2183 (class 0 OID 1593361)
-- Dependencies: 183
-- Data for Name: estados_estado; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO estados_estado (id, cod_estado, estado) VALUES (1, 1, 'DISTRITO CAPITAL');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (2, 2, 'AMAZONAS');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (3, 3, 'ANZOATEGUI');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (4, 4, 'APURE');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (5, 5, 'ARAGUA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (6, 6, 'BARINAS');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (7, 7, 'BOLIVAR');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (8, 8, 'CARABOBO');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (9, 9, 'COJEDES');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (10, 10, 'DELTA AMACURO');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (11, 11, 'FALCON');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (12, 12, 'GUARICO');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (13, 13, 'LARA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (14, 14, 'MERIDA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (15, 15, 'MIRANDA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (16, 16, 'MONAGAS');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (17, 17, 'NUEVA ESPARTA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (18, 18, 'PORTUGUESA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (19, 19, 'SUCRE');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (20, 20, 'TACHIRA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (21, 21, 'TRUJILLO');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (22, 22, 'YARACUY');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (23, 23, 'ZULIA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (24, 24, 'VARGAS');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (25, 25, 'TERRITORIO INSULAR FRANCISCO DE MIRANDA');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (26, 26, 'OTRAS DEPENDECIAS FEDERALES');
INSERT INTO estados_estado (id, cod_estado, estado) VALUES (27, 27, 'REGISTRO DE NORMALIZACIÓN (ESTADO)');


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 184
-- Name: estados_estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('estados_estado_id_seq', 27, true);


--
-- TOC entry 2185 (class 0 OID 1593366)
-- Dependencies: 185
-- Data for Name: grupo_etareo_grupo_etareo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 186
-- Name: grupo_etareo_grupo_etareo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('grupo_etareo_grupo_etareo_id_seq', 1, false);


--
-- TOC entry 2187 (class 0 OID 1593371)
-- Dependencies: 187
-- Data for Name: instituciones_institucion; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO instituciones_institucion (id, nom_institucion, siglas, telefono, correo, municipio, parroquia, direccion, institucion_activa, fecha_create, fecha_update, estado_id, user_create_id, user_update_id) VALUES (1, 'INSITUCION', 'INS', '02035431481', 'prueba@gmail.com', 50300, 50305, 'NA
				', true, '2016-07-24 21:37:38.312119-04', '2016-07-24 21:37:38.312165-04', 5, 1, NULL);


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 188
-- Name: instituciones_institucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('instituciones_institucion_id_seq', 1, true);


--
-- TOC entry 2189 (class 0 OID 1593376)
-- Dependencies: 189
-- Data for Name: login_perfilesusuario; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 190
-- Name: login_perfilesusuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('login_perfilesusuario_id_seq', 1, false);


--
-- TOC entry 2191 (class 0 OID 1593381)
-- Dependencies: 191
-- Data for Name: motivo_motivos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 192
-- Name: motivo_motivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('motivo_motivos_id_seq', 1, false);


--
-- TOC entry 2193 (class 0 OID 1593386)
-- Dependencies: 193
-- Data for Name: municipios_municipio; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (1, 10100, 'LIBERTADOR', 1);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (2, 20100, 'AUTÓNOMO ALTO ORINOCO', 2);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (3, 20200, 'AUTÓNOMO ATABAPO', 2);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (4, 20300, 'AUTÓNOMO ATURES', 2);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (5, 20400, 'AUTONOMO AUTANA', 2);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (6, 20500, 'AUTÓNOMO MAROA', 2);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (7, 20600, 'AUTÓNOMO MANAPIARE', 2);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (8, 20700, 'AUTÓNOMO RÍO NEGRO', 2);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (9, 30100, 'ANACO', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (10, 30200, 'ARAGUA', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (11, 30300, 'FERNANDO DE PEÑALVER', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (12, 30400, 'FRANCISCO DEL CARMEN CARVAJAL', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (13, 30500, 'FRANCISCO DE MIRANDA', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (14, 30600, 'GUANTA', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (15, 30700, 'INDEPENDENCIA', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (16, 30800, 'JUAN ANTONIO SOTILLO', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (17, 30900, 'JUAN MANUEL CAJIGAL', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (18, 31000, 'JOSÉ GREGORIO MONAGAS', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (19, 31100, 'LIBERTAD', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (20, 31200, 'MANUEL EZEQUIEL BRUZUAL', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (21, 31300, 'PEDRO MARÍA FREITES', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (22, 31400, 'PÍRITU', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (23, 31500, 'SAN JOSÉ DE GUANIPA', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (24, 31600, 'SAN JUAN DE CAPISTRANO', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (25, 31700, 'SANTA ANA', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (26, 31800, 'SIMÓN BOLÍVAR', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (27, 31900, 'SIMÓN RODRÍGUEZ', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (28, 32000, 'SIR ARTHUR MC GREGOR', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (29, 32100, 'TURÍSTICO DIEGO BAUTISTA URBANEJA', 3);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (30, 40100, 'ACHAGUAS', 4);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (31, 40200, 'BIRUACA', 4);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (32, 40300, 'MUÑOZ', 4);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (33, 40400, 'PÁEZ', 4);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (34, 40500, 'PEDRO CAMEJO', 4);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (35, 40600, 'RÓMULO GALLEGOS', 4);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (36, 40700, 'SAN FERNANDO', 4);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (37, 50100, 'BOLÍVAR', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (38, 50200, 'CAMATAGUA', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (39, 50300, 'GIRARDOT', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (40, 50400, 'JOSÉ ÁNGEL LAMAS', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (41, 50500, 'JOSÉ FÉLIX RIBAS', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (42, 50600, 'JOSÉ RAFAEL REVENGA', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (43, 50700, 'LIBERTADOR', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (44, 50800, 'MARIO BRICEÑO IRAGORRY', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (45, 50900, 'SAN CASIMIRO', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (46, 51000, 'SAN SEBASTIÁN', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (47, 51100, 'SANTIAGO MARIÑO', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (48, 51200, 'SANTOS MICHELENA', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (49, 51300, 'SUCRE', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (50, 51400, 'TOVAR', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (51, 51500, 'URDANETA', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (52, 51600, 'ZAMORA', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (53, 51700, 'FRANCISCO LINARES ALCANTARA', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (54, 51800, 'OCUMARE DE LA COSTA DE ORO', 5);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (55, 60100, 'ALBERTO ARVELO TORREALBA', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (56, 60200, 'ANTONIO JOSÉ DE SUCRE', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (57, 60300, 'ARISMENDI', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (58, 60400, 'BARINAS', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (59, 60500, 'BOLÍVAR', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (60, 60600, 'CRUZ PAREDES', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (61, 60700, 'EZEQUIEL ZAMORA', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (62, 60800, 'OBISPOS', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (63, 60900, 'PEDRAZA', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (64, 61000, 'ROJAS', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (65, 61100, 'SOSA', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (66, 61200, 'ANDRÉS ELOY BLANCO', 6);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (67, 70100, 'CARONÍ', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (68, 70200, 'CEDEÑO', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (69, 70300, 'EL CALLAO', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (70, 70400, 'GRAN SABANA', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (71, 70500, 'HERES', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (72, 70600, 'PIAR', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (73, 70700, 'RAÚL LEONI', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (74, 70800, 'ROSCIO', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (75, 70900, 'SIFONTES', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (76, 71000, 'SUCRE', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (77, 71100, 'PADRE PEDRO CHIEN', 7);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (78, 80100, 'BEJUMA', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (79, 80200, 'CARLOS ARVELO', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (80, 80300, 'DIEGO IBARRA', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (81, 80400, 'GUACARA', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (82, 80500, 'JUAN JOSÉ MORA', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (83, 80600, 'LIBERTADOR', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (84, 80700, 'LOS GUAYOS', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (85, 80800, 'MIRANDA', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (86, 80900, 'MONTALBÁN', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (87, 81000, 'NAGUANAGUA', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (88, 81100, 'PUERTO CABELLO', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (89, 81200, 'SAN DIEGO', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (90, 81300, 'SAN JOAQUÍN', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (91, 81400, 'VALENCIA', 8);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (92, 90100, 'ANZOÁTEGUI', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (93, 90200, 'FALCÓN', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (94, 90300, 'GIRARDOT', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (95, 90400, 'LIMA BLANCO', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (96, 90500, 'PAO DE SAN JUAN BAUTISTA', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (97, 90600, 'RICAURTE', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (98, 90700, 'RÓMULO GALLEGOS', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (99, 90800, 'SAN CARLOS', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (100, 90900, 'TINACO', 9);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (101, 100100, 'ANTONIO DÍAZ', 10);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (102, 100200, 'CASACOIMA', 10);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (103, 100300, 'PEDERNALES', 10);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (104, 100400, 'TUCUPITA', 10);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (105, 110100, 'ACOSTA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (106, 110200, 'BOLÍVAR', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (107, 110300, 'BUCHIVACOA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (108, 110400, 'CACIQUE MANAURE', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (109, 110500, 'CARIRUBANA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (110, 110600, 'COLINA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (111, 110700, 'DABAJURO', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (112, 110800, 'DEMOCRACIA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (113, 110900, 'FALCÓN', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (114, 111000, 'FEDERACIÓN', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (115, 111100, 'JACURA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (116, 111200, 'LOS TAQUES', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (117, 111300, 'MAUROA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (118, 111400, 'MIRANDA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (119, 111500, 'MONSEÑOR ITURRIZA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (120, 111600, 'PALMASOLA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (121, 111700, 'PETIT', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (122, 111800, 'PIRITU', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (123, 111900, 'SAN FRANCISCO', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (124, 112000, 'SILVA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (125, 112100, 'SUCRE', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (126, 112200, 'TOCOPERO', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (127, 112300, 'UNIÓN', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (128, 112400, 'URUMACO', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (129, 112500, 'ZAMORA', 11);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (130, 120100, 'CAMAGUAN', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (131, 120200, 'CHAGUARAMAS', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (132, 120300, 'EL SOCORRO', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (133, 120400, 'SAN GERÓNIMO DE GUAYABAL', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (134, 120500, 'LEONARDO INFANTE', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (135, 120600, 'LAS MERCEDES', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (136, 120700, 'JULIÁN MELLADO', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (137, 120800, 'FRANCISCO DE MIRANDA', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (138, 120900, 'JOSÉ TADEO MONAGAS', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (139, 121000, 'ORTIZ', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (140, 121100, 'JOSÉ FÉLIX RIBAS', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (141, 121200, 'JUAN GERMAN ROSCIO', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (142, 121300, 'SAN JOSÉ DE GUARIBE', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (143, 121400, 'SANTA MARÍA DE IPIRE', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (144, 121500, 'PEDRO ZARAZA', 12);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (145, 130100, 'ANDRÉS ELOY BLANCO', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (146, 130200, 'CRESPO', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (147, 130300, 'IRIBARREN', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (148, 130400, 'JIMÉNEZ', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (149, 130500, 'MORÓN', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (150, 130600, 'PALAVECINO', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (151, 130700, 'SIMÓN PLANAS', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (152, 130800, 'TORRES', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (153, 130900, 'URDANETA', 13);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (154, 140100, 'ALBERTO ADRIANI', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (155, 140200, 'ANDRÉS BELLO', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (156, 140300, 'ANTONIO PINTO SALINAS', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (157, 140400, 'ARICAGUA', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (158, 140500, 'ARZOBISPO CHACÓN', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (159, 140600, 'CAMPO ELÍAS', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (160, 140700, 'CARACCIOLO PARRA OLMEDO', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (161, 140800, 'CARDENAL QUINTERO', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (162, 140900, 'GUARAQUE', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (163, 141000, 'JULIO CESAR SALAS', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (164, 141100, 'JUSTO BRICEÑO', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (165, 141200, 'LIBERTADOR', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (166, 141300, 'MIRANDA', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (167, 141400, 'OBISPO RAMOS DE LORA', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (168, 141500, 'PADRE NOGUERA', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (169, 141600, 'PUEBLO LLANO', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (170, 141700, 'RANGEL', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (171, 141800, 'RIVAS DÁVILA', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (172, 141900, 'SANTOS MARQUINA', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (173, 142000, 'SUCRE', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (174, 142100, 'TOVAR', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (175, 142200, 'TULIO FEBRES CORDERO', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (176, 142300, 'ZEA', 14);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (177, 150100, 'ACEVEDO', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (178, 150200, 'ANDRÉS BELLO', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (179, 150300, 'BARUTA', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (180, 150400, 'BRION', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (181, 150500, 'BUROZ', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (182, 150600, 'CARRIZAL', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (183, 150700, 'CHACAO', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (184, 150800, 'CRISTÓBAL ROJAS', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (185, 150900, 'EL HATILLO', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (186, 151000, 'GUAICAIPURO', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (187, 151100, 'INDEPENDENCIA', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (188, 151200, 'LANDER', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (189, 151300, 'LOS SALÍAS', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (190, 151400, 'PÁEZ', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (191, 151500, 'PAZ CASTILLO', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (192, 151600, 'PEDRO GUAL', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (193, 151700, 'PLAZA', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (194, 151800, 'SIMÓN BOLÍVAR', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (195, 151900, 'SUCRE', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (196, 152000, 'URDANETA', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (197, 152100, 'ZAMORA', 15);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (198, 160100, 'ACOSTA', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (199, 160200, 'AGUASAY', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (200, 160300, 'BOLÍVAR', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (201, 160400, 'CARIPE', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (202, 160500, 'CEDEÑO', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (203, 160600, 'EZEQUIEL ZAMORA', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (204, 160700, 'LIBERTADOR', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (205, 160800, 'MATURÍN', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (206, 160900, 'PIAR', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (207, 161000, 'PUNCERES', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (208, 161100, 'SANTA BÁRBARA', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (209, 161200, 'SOTILLO', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (210, 161300, 'URACOA', 16);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (211, 170100, 'ANTOLON DEL CAMPO', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (212, 170200, 'ARISMENDI', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (213, 170300, 'DÍAZ', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (214, 170400, 'GARCÍA', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (215, 170500, 'GÓMEZ', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (216, 170600, 'MANEIRO', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (217, 170700, 'MARCANO', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (218, 170800, 'MARIÑO', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (219, 170900, 'PENÍNSULA DE MACANAO', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (220, 171000, 'TUBORES', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (221, 171100, 'VILLALBA', 17);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (222, 180100, 'AGUA BLANCA', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (223, 180200, 'ARAURE', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (224, 180300, 'ESTELLER', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (225, 180400, 'GUANARE', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (226, 180500, 'GUANARITO', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (227, 180600, 'MONSEÑOR JOSÉ VICENTE DE UNDA', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (228, 180700, 'OSPINO', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (229, 180800, 'PÁEZ', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (230, 180900, 'PAPELON', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (231, 181000, 'SAN GENARO DE BOCONOITO', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (232, 181100, 'SAN RAFAEL DE ONOTO', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (233, 181200, 'SANTA ROSALÍA', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (234, 181300, 'SUCRE', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (235, 181400, 'TURÍN', 18);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (236, 190100, 'ANDRÉS ELOY BLANCO', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (237, 190200, 'ANDRÉS MATA', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (238, 190300, 'ARISMENDI', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (239, 190400, 'BENÍTEZ', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (240, 190500, 'BERMÚDEZ', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (241, 190600, 'BOLÍVAR', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (242, 190700, 'CAJIGAL', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (243, 190800, 'CRUZ SALMERÓN ACOSTA', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (244, 190900, 'LIBERTADOR', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (245, 191000, 'MARIÑO', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (246, 191100, 'MEJÍAS', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (247, 191200, 'MONTES', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (248, 191300, 'RIBERO', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (249, 191400, 'SUCRE', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (250, 191500, 'VALDEZ', 19);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (251, 200100, 'ANDRÉS BELLO', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (252, 200200, 'ANTONIO RÓMULO COSTA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (253, 200300, 'AYACUCHO', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (254, 200400, 'BOLÍVAR', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (255, 200500, 'CÁRDENAS', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (256, 200600, 'CÓRDOBA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (257, 200700, 'FERNÁNDEZ FEO', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (258, 200800, 'FRANCISCO DE MIRANDA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (259, 200900, 'GARCÍA DE HEVIA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (260, 201000, 'GUASIMOS', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (261, 201100, 'INDEPENDENCIA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (262, 201200, 'JÁUREGUI', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (263, 201300, 'JOSÉ MARÍA VARGAS', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (264, 201400, 'JUNÍN', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (265, 201500, 'LIBERTAD', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (266, 201600, 'LIBERTADOR', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (267, 201700, 'LOBATERA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (268, 201800, 'MICHELENA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (269, 201900, 'PANAMERICANO', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (270, 202000, 'PEDRO MARÍA UREÑA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (271, 202100, 'RAFAEL URDANETA', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (272, 202200, 'SAMUEL DARÍO MALDONADO', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (273, 202300, 'SAN CRISTÓBAL', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (274, 202400, 'SEBORUCO', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (275, 202500, 'SIMÓN RODRÍGUEZ', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (276, 202600, 'SUCRE', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (277, 202700, 'TORBES', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (278, 202800, 'URIBANTE', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (279, 202900, 'SAN JUDAS TADEO', 20);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (280, 210100, 'ANDRÉS BELLO', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (281, 210200, 'BOCONO', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (282, 210300, 'BOLÍVAR', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (283, 210400, 'CANDELARIA', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (284, 210500, 'CARACHE', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (285, 210600, 'ESCUQUE', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (286, 210700, 'JOSÉ FELIPE MÁRQUEZ CARRIZALES', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (287, 210800, 'JUAN VICENTE CAMPO ELÍAS', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (288, 210900, 'LA CEIBA', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (289, 211000, 'MIRANDA', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (290, 211100, 'MONTE CARMELO', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (291, 211200, 'MOTATAN', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (292, 211300, 'PAMPAN', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (293, 211400, 'PAMPANITO', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (294, 211500, 'RAFAEL RANGEL', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (295, 211600, 'SAN RAFAEL DE CARVAJAL', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (296, 211700, 'SUCRE', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (297, 211800, 'TRUJILLO', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (298, 211900, 'URDANETA', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (299, 212000, 'VALERA', 21);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (300, 220100, 'ARÍSTIDES BASTIDAS', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (301, 220200, 'BOLÍVAR', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (302, 220300, 'BRUZUAL', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (303, 220400, 'COCOROTE', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (304, 220500, 'INDEPENDENCIA', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (305, 220600, 'JOSÉ ANTONIO PÁEZ', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (306, 220700, 'LA TRINIDAD', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (307, 220800, 'MANUEL MONGE', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (308, 220900, 'NIRGUA', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (309, 221000, 'PEÑA', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (310, 221100, 'SAN FELIPE', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (311, 221200, 'SUCRE', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (312, 221300, 'URACHICHE', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (313, 221400, 'VEROES', 22);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (314, 230100, 'ALMIRANTE PADILLA', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (315, 230200, 'BARALT', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (316, 230300, 'CABIMAS', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (317, 230400, 'CATATUMBO', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (318, 230500, 'COLON', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (319, 230600, 'FRANCISCO JAVIER PULGAR', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (320, 230700, 'JESÚS ENRIQUE LOSSADA', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (321, 230800, 'JESÚS MARÍA SEMPRON', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (322, 230900, 'LA CAÑADA DE URDANETA', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (323, 231000, 'LAGUNILLAS', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (324, 231100, 'MACHIQUES DE PERIJÁ', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (325, 231200, 'MARA', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (326, 231300, 'MARACAIBO', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (327, 231400, 'MIRANDA', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (328, 231500, 'PÁEZ', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (329, 231600, 'ROSARIO DE PERIJÁ', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (330, 231700, 'SAN FRANCISCO', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (331, 231800, 'SANTA RITA', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (332, 231900, 'SIMÓN BOLÍVAR', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (333, 232000, 'SUCRE', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (334, 232100, 'VALMORE RODRÍGUEZ', 23);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (335, 240100, 'VARGAS', 24);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (336, 250100, 'ARCHIPIÉLAGO LOS ROQUES', 25);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (337, 250200, 'ARCHIPIÉLAGO LAS AVES', 25);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (338, 250300, 'ARCHIPIÉLAGO LA ORCHILA', 25);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (339, 260100, 'OTRAS DEPENDENCIAS FEDERALES (M)', 26);
INSERT INTO municipios_municipio (id, cod_municipio, municipio, estado_id) VALUES (340, 270100, 'REGISTRO DE NORMALIZACIÓN (MUNICIPIO)', 27);


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 194
-- Name: municipios_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('municipios_municipio_id_seq', 340, true);


--
-- TOC entry 2195 (class 0 OID 1593391)
-- Dependencies: 195
-- Data for Name: ocupacion_ocupaciones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (1, 'ACTOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (2, 'ADMINISTRADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (3, 'AGENTE DE SEGURIDAD');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (4, 'AGENTE VIAJERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (5, 'AGRICULTOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (6, 'ALBANIL');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (7, 'ALGUACIL');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (8, 'AMA DE CASA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (9, 'AMA DE LLAVES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (10, 'ANALISTA DE OFICINA ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (11, 'ANIMADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (12, 'ANTICUARIO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (13, 'ANTROPOLOGIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (14, 'ARBITRO DEPORTIVO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (15, 'ARCHIVISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (16, 'ARCHIVOLOGIA Y BIBLIOTECOLOGIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (17, 'ARQUITECTURA AERONAUTICA Y CIENCIAS NAUTICAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (18, 'ARQUITECTURA Y URBANISMO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (19, 'ARTESANO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (20, 'ARTES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (21, 'ARTES Y MUSICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (22, 'ARTISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (23, 'ARTISTA DE CIRCO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (24, 'ASCENSORISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (25, 'ASEADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (26, 'ASERRADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (27, 'ASESOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (28, 'ASISTENTE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (29, 'AZAFATA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (30, 'BAILARIN');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (31, 'BARBERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (32, 'BARMAN');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (33, 'BIBLIOTECARIOS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (34, 'BIOANALISIS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (35, 'BIOLOGIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (36, 'BIOLOGIA MARINA Y CIENCIAS APLIC. AL MAR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (37, 'BOMBERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (38, 'BUZO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (39, 'CADDY');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (40, 'CAJERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (41, 'CALETERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (42, 'CAMARERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (43, 'CAMAROGRAFO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (44, 'CAMBISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (45, 'CAMILLERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (46, 'CANTANTE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (47, 'CANTINERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (48, 'CARPINTERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (49, 'CARTERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (50, 'CARTOGRAFO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (51, 'CATADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (52, 'CAUCHERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (53, 'CAZADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (54, 'CERRAJERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (55, 'CIENCIAS ADMINISTRATIVAS GERENCIALES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (56, 'CIENCIAS ADMINISTRAT Y FINANCIER FISCAL');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (57, 'CIENCIAS BASICAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (58, 'CIENCIAS DEL AGRO Y DEL MAR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (59, 'CIENCIAS DE LA SALUD');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (60, 'CIENCIAS FISCALES Y FINANCIERAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (61, 'CIENCIAS MECANICAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (62, 'CIENCIAS NAVALES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (63, 'CIENCIAS POLICIALES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (64, 'CIENCIAS SOCIALES Y SIMILARES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (65, 'CIENCIAS Y ARTES MILITARES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (66, 'COBRADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (67, 'COCINERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (68, 'COMERCIANTE DE CHATARRA Y METALES ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (69, 'COMERCIANTE INDEPENDIEN (BUHONERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (70, 'COMPOSITOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (71, 'COMPUTISTA ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (72, 'COMUNICACION SOCIAL');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (73, 'CONDUCTOR (CHOFER');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (74, 'CONSERJE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (75, 'CONSTRUCCION Y DISENO DE OBRAS CIVILES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (76, 'CONSTRUCTOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (77, 'CONTABLE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (78, 'CONTADURIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (79, 'CONTRATISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (80, 'COREOGRAFO ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (81, 'CORREDOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (82, 'CORREDOR DE SEGUROS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (83, 'COSMETOLOGO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (84, 'COSTURERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (85, 'CREATIVO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (86, 'CRISTALERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (87, 'CUIDADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (88, 'DECORADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (89, 'DEPORTISTA (ATLETA)');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (90, 'DERECHO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (91, 'DESEMPLEADO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (92, 'DETECTIVE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (93, 'DIBUJANTE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (94, 'DIRECTOR ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (95, 'DISCJOCKEY');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (96, 'DISENADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (97, 'DOCENTE (PROFESOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (98, 'EBANISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (99, 'ECONOMIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (100, 'EDUCACION AGROPECUARIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (101, 'EDUCACION EN CASTELLANO Y LITERATURA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (102, 'EDUCACION EN CIENCIAS BASICAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (103, 'EDUCACION EN CIENCIAS SOCIALES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (104, 'EDUCACION ESPECIAL');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (105, 'EDUCACION FISICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (106, 'EDUCACION PEDAGOGICA Y PREESCOLAR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (107, 'EDUCACION TECNICA INDUSTRIA Y COMERCIAL');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (108, 'EDUCACION Y PEDAGOGIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (109, 'ELECTRICISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (110, 'EMPLEADO DE OFICINA O NEGOCIO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (111, 'ENCUESTADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (112, 'ENFERMERIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (113, 'ENFERMERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (114, 'ENTRENADOR DEPORTIVO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (115, 'ESCENOGRAFO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (116, 'ESCRITOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (117, 'ESCULTOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (118, 'ESOTERICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (119, 'ESTADISTICA Y CIENCIAS ACTUARIALES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (120, 'ESTILISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (121, 'ESTUDIANTE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (122, 'ESTUDIOS INTERNACIONALES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (123, 'ESTUDIOS POLITICOS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (124, 'EXPLORACION Y EXPLOTACION DE MINAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (125, 'EXPLOSIVISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (126, 'FARMACIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (127, 'FILOSOFIA Y TEOLOGIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (128, 'FISCAL DE TRANSITO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (129, 'FISICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (130, 'FLORISTERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (131, 'FOTOGRAFO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (132, 'FUMIGADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (133, 'FUNCIONARIO EXTRANJERO (EMBAJADA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (134, 'FUNCIONARIO PUBLICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (135, 'FUNCIONARIO PUBLICO DE ELECCION POPULAR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (136, 'GEOGRAFIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (137, 'GERENTE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (138, 'GESTOR ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (139, 'GRANITERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (140, 'GUARDAPARQUES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (141, 'GUIA TURISTICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (142, 'HERRERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (143, 'HISTORIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (144, 'IDIOMAS MODERNOS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (145, 'INFORMATICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (146, 'ING. AGRONOMICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (147, 'ING. DE SISTEMAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (148, 'INGENIERIA CIVIL Y SIMILARES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (149, 'INGENIERIA DE ALIMENTOS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (150, 'INGENIERIA MECANICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (151, 'INGENIERIA PETROLERA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (152, 'INGENIERIA QUIMICA E INDUSTRIALES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (153, 'ING. EN RECURSOS NATURALES RENOVABLES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (154, 'ING. GEOLOGICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (155, 'INSPECTOR DE SINIESTRO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (156, 'INSTRUCTOR (DE MANEJO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (157, 'INTERPRETE ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (158, 'JARDINERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (159, 'JEFE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (160, 'JINETE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (161, 'JOYERO ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (162, 'JUBILADO ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (163, 'LABORATORISTA (TECNICO)');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (164, 'LAVANDERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (165, 'LENADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (166, 'LETRAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (167, 'LICORERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (168, 'LIMOSNERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (169, 'LIMPIABOTAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (170, 'LOCUTOR DE RADIO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (171, 'LOQUERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (172, 'LOTERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (173, 'MALETERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (174, 'MANICURISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (175, 'MAQUINISTA DE AVION');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (176, 'MASAJISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (177, 'MATEMATICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (178, 'MAYORDOMO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (179, 'MECANICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (180, 'MECANOGRAFO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (181, 'MEDICINA VETERINARIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (182, 'MEDICINA Y PSIQUIATRIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (183, 'MENSAJERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (184, 'MERCADOTECNIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (185, 'MESONERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (186, 'MILITAR ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (187, 'MINERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (188, 'MODELO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (189, 'MOTORIZADO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (190, 'MUSICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (191, 'NUTRICION Y DIETETICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (192, 'OBRERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (193, 'ODONTOLOGIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (194, 'OFICINISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (195, 'OPERADOR DE EQUIPOS Y MAQUINAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (196, 'PANADERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (197, 'PARAMEDICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (198, 'PARQUERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (199, 'PASANTE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (200, 'PEDICURISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (201, 'PELUQUERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (202, 'PERITO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (203, 'PESCADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (204, 'PILOTO DE AVION');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (205, 'PINTOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (206, 'PLOMERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (207, 'POLICIA ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (208, 'POLITICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (209, 'PORTERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (210, 'PREPARADOR DE PAPEL');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (211, 'PRESIDENTE (EMPRESA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (212, 'PRESTAMISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (213, 'PRODUCTOR (TEATRO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (214, 'PSICOLOGIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (215, 'PUBLICISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (216, 'QUIMICA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (217, 'RECEPCIONISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (218, 'RECREADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (219, 'RECTOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (220, 'RELACIONES INDUSTRIALES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (221, 'RELOJERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (222, 'SACERDOTE');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (223, 'SALVAVIDAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (224, 'SASTRE ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (225, 'SECRETARIA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (226, 'SINDICALISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (227, 'SOLDADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (228, 'SUBASTADOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (229, 'SUPERVISOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (230, 'TABAQUERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (231, 'TALLADOR ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (232, 'TAPICERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (233, 'TAQUIGRAFO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (234, 'TECNICO DE EQUIPOS ELECTRICOS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (235, 'TECNICO DE LAS CIENCIAS MEDICAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (236, 'TECNICO DE MINAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (237, 'TECNICO DE SONIDO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (238, 'TECNICO EN CIENCIAS BIOLOGICAS Y AGRONOM');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (239, 'TECNICO EN CIENCIAS FISICAS Y QUIMICAS');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (240, 'TECNICO MECANICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (241, 'TELEFONISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (242, 'TELEGRAFISTA');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (243, 'TINTORERO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (244, 'TIPOGRAFO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (245, 'TOPOGRAFO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (246, 'TRABAJADOR SEXUAL');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (247, 'TRADUCTOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (248, 'TURISMO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (249, 'VENDEDOR DE BIENES RAICES');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (250, 'VENDEDOR');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (251, 'VISITADOR MEDICO');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (252, 'ZAPATERO ');
INSERT INTO ocupacion_ocupaciones (id, ocupacion) VALUES (253, 'ZOOTECNIA');


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 196
-- Name: ocupacion_ocupaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ocupacion_ocupaciones_id_seq', 253, true);


--
-- TOC entry 2197 (class 0 OID 1593396)
-- Dependencies: 197
-- Data for Name: organizacion_social_organizaciones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (1, 'CONSEJO COMUNAL');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (2, 'ASOCIACIÓN DE VECINOS');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (3, 'CONDOMINIO');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (4, 'ORGANIZACIONES COMUNITARIAS DE VIVIENDA (OCV)');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (5, 'UNIDADES DE BATALLA ENDÓGENA (UBE)');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (6, 'COOPERATIVAS O MICROEMPRESAS');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (7, 'CLUB DE ABUELOS');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (8, 'CLUBES DEPORTIVOS O CULTURALES');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (9, 'GRUPOS AMBIENTALISTAS');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (10, 'MESAS TÉCNICAS (AGUA Y/O ELECTRICIDAD)');
INSERT INTO organizacion_social_organizaciones (id, organizacion) VALUES (11, 'COMITÉ (TIERRA URBANA Y/O SALUD)');


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 198
-- Name: organizacion_social_organizaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('organizacion_social_organizaciones_id_seq', 11, true);


--
-- TOC entry 2199 (class 0 OID 1593401)
-- Dependencies: 199
-- Data for Name: parroquias_parroquia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1, 'ALTAGRACIA', 10101, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (2, 'ANTÍMANO', 10102, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (3, 'CANDELARIA', 10103, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (4, 'CARICUAO', 10104, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (5, 'CATEDRAL', 10105, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (6, 'COCHE', 10106, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (7, 'EL JUNQUITO', 10107, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (8, 'EL PARAÍSO', 10108, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (9, 'EL RECREO', 10109, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (10, 'EL VALLE', 10110, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (11, 'LA PASTORA', 10111, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (12, 'LA VEGA', 10112, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (13, 'MACARAO', 10113, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (14, 'SAN AGUSTÍN', 10114, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (15, 'SAN BERNARDINO', 10115, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (16, 'SAN JOSÉ', 10116, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (17, 'SAN JUAN', 10117, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (18, 'SAN PEDRO', 10118, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (19, 'SANTA ROSALÍA', 10119, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (20, 'SANTA TERESA', 10120, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (21, 'SUCRE', 10121, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (22, '23 DE ENERO', 10122, 10100, 1);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (23, 'HUACHAMACARE', 20101, 20100, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (24, 'MARAWAKA', 20102, 20100, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (25, 'MAVACA', 20103, 20100, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (26, 'SIERRA PARIMA', 20104, 20100, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (27, 'UCATA', 20201, 20200, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (28, 'YAPACANA', 20202, 20200, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (29, 'CANAME', 20203, 20200, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (30, 'FERNANDO GIRÓN TOVAR', 20301, 20300, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (31, 'LUIS ALBERTO GÓMEZ', 20302, 20300, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (32, 'PARHUEÑA', 20303, 20300, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (33, 'PLATANILLA', 20304, 20300, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (34, 'SAMARIAPO', 20401, 20400, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (35, 'SIPAPO', 20402, 20400, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (36, 'MUNDUAPO', 20403, 20400, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (37, 'GUAYAPO', 20404, 20400, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (38, 'VICTORINO', 20501, 20500, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (39, 'COMUNIDAD', 20502, 20500, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (40, 'ALTO VENTUARI', 20601, 20600, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (41, 'MEDIO VENTUARI', 20602, 20600, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (42, 'BAJO VENTUARI', 20603, 20600, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (43, 'SOLANO', 20701, 20700, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (44, 'CASIQUIARE', 20702, 20700, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (45, 'COCUY', 20703, 20700, 2);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (46, 'CAPITAL ANACO', 30101, 30100, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (47, 'SAN JOAQUÍN', 30102, 30100, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (48, 'CAPITAL ARAGUA', 30201, 30200, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (49, 'CACHIPO', 30202, 30200, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (50, 'CAPITAL FERNANDO DE PEÑALVER', 30301, 30300, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (51, 'SAN MIGUEL', 30302, 30300, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (52, 'SUCRE', 30303, 30300, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (53, 'CAPITAL FRANCISCO DEL CARMEN CARVAJAL', 30401, 30400, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (54, 'SANTA BÁRBARA', 30402, 30400, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (55, 'CAPITAL FRANCISCO DE MIRANDA', 30501, 30500, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (56, 'ATAPIRIRE', 30502, 30500, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (57, 'BOCA DEL PAO', 30503, 30500, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (58, 'EL PAO', 30504, 30500, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (59, 'MÁCURA', 30505, 30500, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (60, 'CAPITAL GUANTA', 30601, 30600, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (61, 'CHORRERÓN', 30602, 30600, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (62, 'CAPITAL INDEPENDENCIA', 30701, 30700, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (63, 'MAMO', 30702, 30700, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (64, 'CAPITAL PUERTO LA CRUZ', 30801, 30800, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (65, 'POZUELOS', 30802, 30800, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (66, 'CAPITAL JUAN MANUEL CAJIGAL', 30901, 30900, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (67, 'SAN PABLO', 30902, 30900, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (68, 'CAPITAL JOSÉ GREGORIO MONAGAS', 31001, 31000, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (69, 'PIAR', 31002, 31000, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (70, 'SAN DIEGO DE CABRUTICA', 31003, 31000, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (71, 'SANTA CLARA', 31004, 31000, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (72, 'UVERITO', 31005, 31000, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (73, 'ZUATA', 31006, 31000, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (74, 'CAPITAL LIBERTAD', 31101, 31100, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (75, 'EL CARITO', 31102, 31100, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (76, 'SANTA INÉS', 31103, 31100, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (77, 'CAPITAL MANUEL EZEQUIEL BRUZUAL', 31201, 31200, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (78, 'GUANAPE', 31202, 31200, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (79, 'SABANA DE UCHIRE', 31203, 31200, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (80, 'CAPITAL PEDRO MARÍA FREITES', 31301, 31300, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (81, 'LIBERTADOR', 31302, 31300, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (82, 'SANTA ROSA', 31303, 31300, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (83, 'URICA', 31304, 31300, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (84, 'CAPITAL PÍRITU', 31401, 31400, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (85, 'SAN FRANCISCO', 31402, 31400, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (86, 'CM SAN JOSÉ DE GUANIPA', 31501, 31500, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (87, 'CAPITAL SAN JUAN DE CAPISTRANO', 31601, 31600, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (88, 'BOCA DE CHÁVEZ', 31602, 31600, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (89, 'CAPITAL SANTA ANA', 31701, 31700, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (90, 'PUEBLO NUEVO', 31702, 31700, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (91, 'EL CARMEN', 31801, 31800, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (92, 'SAN CRISTÓBAL', 31802, 31800, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (93, 'BERGANTÍN', 31803, 31800, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (94, 'CAIGUA', 31804, 31800, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (95, 'EL PILAR', 31805, 31800, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (96, 'NARICUAL', 31806, 31800, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (97, 'EDMUNDO BARRIOS', 31901, 31900, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (98, 'MIGUEL OTERO SILVA', 31902, 31900, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (99, 'CAPITAL SIR ARTHUR MC GREGOR', 32001, 32000, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (100, 'TOMAS ALFARO CALATRAVA', 32002, 32000, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (101, 'CAPITAL DIEGO BAUTISTA URBANEJA', 32101, 32100, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (102, 'EL MORRO', 32102, 32100, 3);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (103, 'URBANA ACHAGUAS', 40101, 40100, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (104, 'APURITO', 40102, 40100, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (105, 'EL YAGUAL', 40103, 40100, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (106, 'GUACHARA', 40104, 40100, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (107, 'MUCURITAS', 40105, 40100, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (108, 'QUESERAS DEL MEDIO', 40106, 40100, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (109, 'URBANA BIRUACA', 40201, 40200, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (110, 'URBANA BRUZUAL', 40301, 40300, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (111, 'MANTECAL', 40302, 40300, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (112, 'QUINTERO', 40303, 40300, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (113, 'RINCÓN HONDO', 40304, 40300, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (114, 'SAN VICENTE', 40305, 40300, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (115, 'URBANA GUASDUALITO', 40401, 40400, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (116, 'ARISMENDI', 40402, 40400, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (117, 'EL AMPARO', 40403, 40400, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (118, 'SAN CAMILO', 40404, 40400, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (119, 'URDANETA', 40405, 40400, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (120, 'URBANA SAN JUAN DE PAYARA', 40501, 40500, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (121, 'CODAZZI', 40502, 40500, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (122, 'CUNAVICHE', 40503, 40500, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (123, 'URBANA ELORZA', 40601, 40600, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (124, 'LA TRINIDAD', 40602, 40600, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (125, 'URBANA SAN FERNANDO', 40701, 40700, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (126, 'EL RECREO', 40702, 40700, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (127, 'PEÑALVER', 40703, 40700, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (128, 'SAN RAFAEL DE ATAMAICA', 40704, 40700, 4);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (129, 'CM SAN MATEO', 50101, 50100, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (130, 'CAMATAGUA', 50201, 50200, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (131, 'CARMEN DE CURA', 50202, 50200, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (132, 'CHORONÍ', 50301, 50300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (133, 'ANDRÉS ELOY BLANCO', 50302, 50300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (134, 'JOAQUÍN CRESPO', 50303, 50300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (135, 'JOSÉ CASANOVA GODOY', 50304, 50300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (136, 'LAS DELICIAS', 50305, 50300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (137, 'LOS TACARIGUAS', 50306, 50300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (138, 'MADRE MARÍA DE SAN JOSÉ', 50307, 50300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (139, 'JOSÉ PEDRO OVALLES', 50308, 50300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (140, 'CM SANTA CRUZ', 50401, 50400, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (141, 'CASTOR NIENES RÍOS', 50501, 50500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (142, 'LA GUACAMAYA', 50502, 50500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (143, 'PAO DE ZÁRATE', 50503, 50500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (144, 'URBANA ZUATA', 50504, 50500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (145, 'JUAN VICENTE BOLÍVAR', 50505, 50500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (146, 'CM EL CONSEJO', 50601, 50600, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (147, 'LIBERTADOR', 50701, 50700, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (148, 'SAN MARTÍN DE PORRAS', 50702, 50700, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (149, 'CAÑA DE AZÚCAR', 50801, 50800, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (150, 'MARIO BRICEÑO IRAGORRY', 50802, 50800, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (151, 'GÜIRIPA', 50901, 50900, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (152, 'OLLAS DE CARAMACATE', 50902, 50900, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (153, 'VALLE MORÍN', 50903, 50900, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (154, 'SAN CASIMIRO', 50904, 50900, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (155, 'CM SAN SEBASTIÁN', 51101, 51000, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (156, 'ALFREDO PACHECO MIRANDA', 51101, 51100, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (157, 'ARÉVALO APONTE', 51102, 51100, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (158, 'CHUAO', 51103, 51100, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (159, 'SAMÁN DE GUERE', 51104, 51100, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (160, 'SANTIGO MARIÑO', 51105, 51100, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (161, 'TIARA', 51201, 51200, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (162, 'SANTOS MICHELENA', 51202, 51200, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (163, 'BELLA VISTA', 51301, 51300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (164, 'SUCRE', 51302, 51300, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (165, 'LA COLONIA TOVAR', 51401, 51400, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (166, 'LAS PEÑITAS', 51501, 51500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (167, 'SAN FRANCISCO DE CARA', 51502, 51500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (168, 'TAGUAY', 51503, 51500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (169, 'URDANETA', 51504, 51500, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (170, 'AUGUSTO MIJARES', 51601, 51600, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (171, 'SAN FRANCISCO DE ASÍS', 51602, 51600, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (172, 'VALLES DE TUCUNEMO', 51603, 51600, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (173, 'MAGDALENO', 51604, 51600, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (174, 'ZAMORA', 51605, 51600, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (175, 'MONSEÑOR FELICIANO GONZÁLEZ', 51701, 51700, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (176, 'FRANCISCO LINARES ALCÁNTARA', 51702, 51700, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (177, 'FRANCISCO DE MIRANDA', 51703, 51700, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (178, 'OCUMARE DE LA COSTA', 51801, 51800, 5);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (179, 'SABANETA', 60101, 60100, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (180, 'RODRÍGUEZ DOMÍNGUEZ', 60102, 60100, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (181, 'TICOPORO', 60201, 60200, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (182, 'ANDRÉS BELLO', 60202, 60200, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (183, 'NICOLÁS PULIDO', 60203, 60200, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (184, 'ARISMENDI', 60301, 60300, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (185, 'GUADARRAMA', 60302, 60300, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (186, 'LA UNIÓN', 60303, 60300, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (187, 'SAN ANTONIO', 60304, 60300, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (188, 'BARINAS', 60401, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (189, 'ALFREDO ARVELO LARRIVA', 60402, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (190, 'SAN SILVESTRE', 60403, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (191, 'SANTA INÉS', 60404, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (192, 'SANTA LUCÍA', 60405, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (193, 'TORUNOS', 60406, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (194, 'EL CARMEN', 60407, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (195, 'RÓMULO BETANCOURT', 60408, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (196, 'CORAZÓN DE JESÚS', 60409, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (197, 'RAMÓN IGNACIO MÉNDEZ', 60410, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (198, 'ALTO BARINAS', 60411, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (199, 'MANUEL PALACIO FAJARDO', 60412, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (200, 'JUAN ANTONIO RODRÍGUEZ DOMÍNGUEZ', 60413, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (201, 'DOMINGA ORTIZ DE PÁEZ', 60414, 60400, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (202, 'BARINITAS', 60501, 60500, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (203, 'ALTAMIRA', 60502, 60500, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (204, 'CALDERAS', 60503, 60500, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (205, 'BARRANCAS', 60601, 60600, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (206, 'EL SOCORRO', 60602, 60600, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (207, 'MASPARRITO', 60603, 60600, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (208, 'SANTA BÁRBARA', 60701, 60700, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (209, 'JOSÉ IGNACIO DEL PUMAR', 60702, 60700, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (210, 'PEDRO BRICEÑO MÉNDEZ', 60703, 60700, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (211, 'RAMÓN IGNACIO MÉNDEZ', 60704, 60700, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (212, 'OBISPOS', 60801, 60800, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (213, 'EL REAL', 60802, 60800, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (214, 'LA LUZ', 60803, 60800, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (215, 'LOS GUASIMITOS', 60804, 60800, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (216, 'CIUDAD BOLIVIA', 60901, 60900, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (217, 'IGNACIO BRICEÑO', 60902, 60900, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (218, 'JOSÉ FÉLIX RIBAS', 60903, 60900, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (219, 'PÁEZ', 60904, 60900, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (220, 'LIBERTAD', 61001, 61000, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (221, 'DOLORES', 61002, 61000, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (222, 'PALACIOS FAJARDO', 61003, 61000, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (223, 'SANTA ROSA', 61004, 61000, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (224, 'SIMÓN RODRÍGUEZ', 61005, 61000, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (225, 'CIUDAD DE NUTRIAS', 61101, 61100, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (226, 'EL REGALO', 61102, 61100, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (227, 'PUERTO DE NUTRIAS', 61103, 61100, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (228, 'SANTA CATALINA', 61104, 61100, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (229, 'SIMÓN BOLÍVAR', 61105, 61100, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (230, 'EL CANTÓN', 61201, 61200, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (231, 'SANTA CRUZ DE GUACAS', 61202, 61200, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (232, 'PUERTO VIVAS', 61203, 61200, 6);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (233, 'CACHAMAY', 70101, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (234, 'CHIRICA', 70102, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (235, 'DALLA COSTA', 70103, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (236, 'ONCE DE ABRIL', 70104, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (237, 'SIMÓN BOLÍVAR', 70105, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (238, 'UNARE', 70106, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (239, 'UNIVERSIDAD', 70107, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (240, 'VISTA AL SOL', 70108, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (241, 'POZO VERDE', 70109, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (242, 'YOCOIMA', 70110, 70100, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (243, 'SECCIÓN CAPITAL CEDEÑO', 70201, 70200, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (244, 'ALTAGRACIA', 70202, 70200, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (245, 'ASCENSIÓN FARRERAS', 70203, 70200, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (246, 'GUANIAMO', 70204, 70200, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (247, 'LA URBANA', 70205, 70200, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (248, 'PIJIGUAOS', 70206, 70200, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (249, 'SECCIÓN CAPITAL GRAN SABANA', 70401, 70400, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (250, 'IKABARÚ', 70402, 70400, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (251, 'AGUA SALADA', 70501, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (252, 'CATEDRAL', 70502, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (253, 'JOSÉ ANTONIO PÁEZ', 70503, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (254, 'LA SABANITA', 70504, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (255, 'MARHUANTA', 70505, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (256, 'VISTA HERMOSA', 70506, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (257, 'ORINOCO', 70507, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (258, 'PANAPANA', 70508, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (259, 'ZEA', 70509, 70500, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (260, 'SECCIÓN CAPITAL PIAR', 70601, 70600, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (261, 'ANDRÉS ELOY BLANCO', 70602, 70600, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (262, 'PEDRO COVA', 70603, 70600, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (263, 'SECCIÓN CAPITAL RAÚL LEONI', 70701, 70700, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (264, 'BARCELONETA', 70702, 70700, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (265, 'SAN FRANCISCO', 70703, 70700, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (266, 'SANTA BÁRBARA', 70704, 70700, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (267, 'SECCIÓN CAPITAL ROSCIO', 70801, 70800, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (268, 'SALOM', 70802, 70800, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (269, 'SECCIÓN CAPITAL SIFONTES', 70901, 70900, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (270, 'DALLA COSTA', 70902, 70900, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (271, 'SAN ISIDRO', 70903, 70900, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (272, 'SECCIÓN CAPITAL SUCRE', 71001, 71000, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (273, 'ARIPAO', 71002, 71000, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (274, 'GUARATARO', 71003, 71000, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (275, 'LAS MAJADAS', 71004, 71000, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (276, 'MOITACO', 71005, 71000, 7);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (277, 'URBANA BEJUMA', 80101, 80100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (278, 'NO URBANA CANOABO', 80102, 80100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (279, 'NO URBANA SIMÓN BOLÍVAR', 80103, 80100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (280, 'URBANA GUIGUE', 80201, 80200, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (281, 'NO URBANA BELÉN', 80202, 80200, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (282, 'NO URBANA TACARIGUA', 80203, 80200, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (283, 'URBANA AGUAS CALIENTES', 80301, 80300, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (284, 'URBANA MARIARA', 80302, 80300, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (285, 'URBANA CIUDAD ALIANZA', 80401, 80400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (286, 'URBANA GUACARA', 80402, 80400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (287, 'NO URBANA YAGUA', 80403, 80400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (288, 'URBANA MORÓN', 80501, 80500, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (289, 'NO URBANA URAMA', 80502, 80500, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (290, 'URBANA TOCUYITO', 80601, 80600, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (291, 'URBANA INDEPENDENCIA', 80602, 80600, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (292, 'URBANA LOS GUAYOS', 80701, 80700, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (293, 'URBANA MIRANDA', 80801, 80800, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (294, 'URBANA MONTALBÁN', 80901, 80900, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (295, 'URBANA NAGUANAGUA', 81001, 81000, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (296, 'URBANA BARTOLOMÉ SALOM', 81101, 81100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (297, 'URBANA DEMOCRACIA', 81102, 81100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (298, 'URBANA FRATERNIDAD', 81103, 81100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (299, 'URBANA GOAIGOAZA', 81104, 81100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (300, 'URBANA JUAN JOSÉ FLORES', 81105, 81100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (301, 'URBANA UNIÓN', 81106, 81100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (302, 'NO URBANA BORBURATA', 81107, 81100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (303, 'NO URBANA PATANEMO', 81108, 81100, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (304, 'URBANA SAN DIEGO', 81201, 81200, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (305, 'URBANA SAN JOAQUÍN', 81301, 81300, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (306, 'URBANA CANDELARIA', 81401, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (307, 'URBANA CATEDRAL', 81402, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (308, 'URBANA EL SOCORRO', 81403, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (309, 'URBANA MIGUEL PEÑA', 81404, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (310, 'URBANA RAFAEL URDANETA', 81405, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (311, 'URBANA SAN BLAS', 81406, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (312, 'URBANA SAN JOSÉ', 81407, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (313, 'URBANA SANTA ROSA', 81408, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (314, 'NO URBANA NEGRO PRIMERO', 81409, 81400, 8);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (315, 'COJEDES', 90101, 90100, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (316, 'JUAN DE MATA SUÁREZ', 90102, 90100, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (317, 'TINAQUILLO', 90201, 90200, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (318, 'EL BAÚL', 90301, 90300, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (319, 'SUCRE', 90302, 90300, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (320, 'MACAPO', 90401, 90400, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (321, 'LA AGUADITA', 90402, 90400, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (322, 'EL PAO', 90501, 90500, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (323, 'LIBERTAD DE COJEDES', 90601, 90600, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (324, 'EL AMPARO', 90602, 90600, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (325, 'RÓMULO GALLEGOS', 90701, 90700, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (326, 'SAN CARLOS DE AUSTRIA', 90801, 90800, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (327, 'JUAN ÁNGEL BRAVO', 90802, 90800, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (328, 'MANUEL MANRIQUE', 90803, 90800, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (329, 'GENERAL EN JEFE JOSÉ LAURENCIO SILVA', 90901, 90900, 9);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (330, 'CURIAPO', 100101, 100100, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (331, 'ALMIRANTE LUIS BRIÓN', 100102, 100100, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (332, 'FRANCISCO ANICETO LUGO', 100103, 100100, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (333, 'MANUEL RENAUD', 100104, 100100, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (334, 'PADRE BARRAL', 100105, 100100, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (335, 'SANTOS DE ABELGAS', 100106, 100100, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (336, 'IMATACA', 100201, 100200, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (337, 'CINCO DE JULIO', 100202, 100200, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (338, 'JUAN BAUTISTA ARISMENDI', 100203, 100200, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (339, 'MANUEL PIAR', 100204, 100200, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (340, 'RÓMULO GALLEGOS', 100205, 100200, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (341, 'PEDERNALES', 100301, 100300, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (342, 'LUIS BELTRÁN PRIETO FIGUEROA', 100302, 100300, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (343, 'SAN JOSÉ', 100401, 100400, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (344, 'JOSÉ VIDAL MARCANO', 100402, 100400, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (345, 'JUAN MILLÁN', 100403, 100400, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (346, 'LEONARDO RUÍZ PINEDA', 100404, 100400, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (347, 'MARISCAL ANTONIO JOSÉ DE SUCRE', 100405, 100400, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (348, 'MONSEÑOR ARGIMIRO GARCÍA', 100406, 100400, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (349, 'SAN RAFAEL', 100407, 100400, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (350, 'VIRGEN DEL VALLE', 100408, 100400, 10);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (351, 'SAN JUAN DE LOS CAYOS', 110101, 110100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (352, 'CAPADARE', 110102, 110100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (353, 'LA PASTORA', 110103, 110100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (354, 'LIBERTADOR', 110104, 110100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (355, 'SAN LUIS', 110201, 110200, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (356, 'ARACUA', 110202, 110200, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (357, 'LA PEÑA', 110203, 110200, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (358, 'CAPATÁRIDA', 110301, 110300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (359, 'BARIRO', 110302, 110300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (360, 'BOROJÓ', 110303, 110300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (361, 'GUAJIRO', 110304, 110300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (362, 'SEQUE', 110305, 110300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (363, 'ZAZÁRIDA', 110306, 110300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (364, 'CM YARACAL', 110401, 110400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (365, 'CARIRUBANA', 110501, 110500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (366, 'NORTE', 110502, 110500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (367, 'PUNTA CARDÓN', 110503, 110500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (368, 'SANTA ANA', 110504, 110500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (369, 'LA VELA DE CORO', 110601, 110600, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (370, 'ACURIGUA', 110602, 110600, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (371, 'GUAIBACOA', 110603, 110600, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (372, 'LAS CALDERAS', 110604, 110600, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (373, 'MACORUCA', 110605, 110600, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (374, 'CM DABAJURO', 110701, 110700, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (375, 'PEDREGAL', 110801, 110800, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (376, 'AGUA CLARA', 110802, 110800, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (377, 'AVARIA', 110803, 110800, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (378, 'PIEDRA GRANDE', 110804, 110800, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (379, 'PURURECHE', 110805, 110800, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (380, 'PUEBLO NUEVO', 110901, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (381, 'ADÍCORA', 110902, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (382, 'BARAIVED', 110903, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (383, 'BUENA VISTA', 110904, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (384, 'JADACAQUIVA', 110905, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (385, 'MORUY', 110906, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (386, 'ADAURE', 110907, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (387, 'EL HATO', 110908, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (388, 'EL VÍNCULO', 110909, 110900, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (389, 'CHURUGUARA', 111001, 111000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (390, 'AGUA LARGA', 111002, 111000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (391, 'EL PAUJÍ', 111003, 111000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (392, 'INDEPENDENCIA', 111004, 111000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (393, 'MAPARARÁ', 111005, 111000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (394, 'JACURA', 111101, 111000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (395, 'AGUA LINDA', 111102, 111000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (396, 'ARAURIMA', 111103, 111000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (397, 'AGUA LINDA', 111101, 111100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (398, 'ARAURIMA', 111102, 111100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (399, 'JACURA', 111103, 111100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (400, 'LOS TAQUES', 111201, 111200, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (401, 'JUDIBANA', 111202, 111200, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (402, 'MENE DE MAUROA', 111301, 111300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (403, 'CASIGUA', 111302, 111300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (404, 'SAN FÉLIX', 111303, 111300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (405, 'SAN ANTONIO', 111401, 111400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (406, 'SAN GABRIEL', 111402, 111400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (407, 'SANTA ANA', 111403, 111400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (408, 'GUZMÁN GUILLERMO', 111404, 111400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (409, 'MITARE', 111405, 111400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (410, 'RÍO SECO', 111406, 111400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (411, 'SABANETA', 111407, 111400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (412, 'CHICHIRIVICHE', 111501, 111500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (413, 'BOCA DE TOCUYO', 111502, 111500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (414, 'TOCUYO DE LA COSTA', 111503, 111500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (415, 'CABURÉ', 111701, 111700, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (416, 'COLINA', 111702, 111700, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (417, 'CURIMAGUA', 111703, 111700, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (418, 'PÍRITU', 111801, 111800, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (419, 'SAN JOSÉ DE LA COSTA', 111802, 111800, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (420, 'TUCACAS', 112001, 112000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (421, 'BOCA DE AROA', 112002, 112000, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (422, 'SUCRE', 112101, 112100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (423, 'PECAYA', 112102, 112100, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (424, 'SANTA CRUZ DE BUCARAL', 112301, 112300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (425, 'EL CHARAL', 112302, 112300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (426, 'LAS VEGAS DEL TUY', 112303, 112300, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (427, 'URUMACO', 112401, 112400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (428, 'BRUZUAL', 112402, 112400, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (429, 'PUERTO CUMAREBO', 112501, 112500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (430, 'LA CIÁNAGA', 112502, 112500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (431, 'LA SOLEDAD', 112503, 112500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (432, 'PUEBLO CUMAREBO', 112504, 112500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (433, 'ZAZÁRIDA', 112505, 112500, 11);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (434, 'CAPITAL CAMAGUÁN', 120101, 120100, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (435, 'PUERTO MIRANDA', 120102, 120100, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (436, 'UVERITO', 120103, 120100, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (437, 'CHAGUARAMAS', 120201, 120200, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (438, 'EL SOCORRO', 120301, 120300, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (439, 'CAPITAL SAN GERÓNIMO DE GUAYABAL', 120401, 120400, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (440, 'CAZORLA', 120402, 120400, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (441, 'CAPITAL VALLE DE LA PASCUA', 120501, 120500, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (442, 'ESPINO', 120502, 120500, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (443, 'CAPITAL LAS MERCEDES', 120601, 120600, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (444, 'CABRUTA', 120602, 120600, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (445, 'SANTA RITA DE MANAPIRE', 120603, 120600, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (446, 'CAPITAL EL SOMBRERO', 120701, 120700, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (447, 'SOSA', 120702, 120700, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (448, 'CAPITAL CALABOZO', 120801, 120800, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (449, 'EL CALVARIO', 120802, 120800, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (450, 'EL RASTRO', 120803, 120800, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (451, 'GUARDATINAJAS', 120804, 120800, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (452, 'SAGRARIO', 141213, 141200, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (453, 'CAPITAL ALTAGRACIA DE ORITUCO', 120901, 120900, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (454, 'LEZAMA', 120902, 120900, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (455, 'LIBERTAD DE ORITUCO', 120903, 120900, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (456, 'PASO REAL DE MACAIRA', 120904, 120900, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (457, 'SAN FRANCISCO DE MACAIRA', 120905, 120900, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (458, 'SAN RAFAEL DE ORITUCO', 120906, 120900, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (459, 'SOUBLETTE', 120907, 120900, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (460, 'CAPITAL ORTIZ', 121001, 121000, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (461, 'SAN FRANCISCO DE TIZNADO', 121002, 121000, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (462, 'SAN JOSÉ DE TIZNADO', 121003, 121000, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (463, 'SAN LORENZO DE TIZNADO', 121004, 121000, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (464, 'CAPITAL TUCUPIDO', 121101, 121100, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (465, 'SAN RAFAEL DE LAYA', 121102, 121100, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (466, 'CAPITAL SAN JUAN DE LOS MORROS', 121201, 121200, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (467, 'CANTAGALLO', 121202, 121200, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (468, 'PARAPARA', 121203, 121200, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (469, 'SAN JOSÉ DE GUARIBE', 121301, 121300, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (470, 'CAPITAL SANTA MARÍA DE IPIRE', 121401, 121400, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (471, 'ALTAMIRA', 121402, 121400, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (472, 'CAPITAL ZARAZA', 121501, 121500, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (473, 'SAN JOSÉ DE UNARE', 121502, 121500, 12);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (474, 'PAO TAMAYO', 130101, 130100, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (475, 'QUEBRADA HONDA DE GUACHE', 130102, 130100, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (476, 'YACAMBÚ', 130103, 130100, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (477, 'FRÉITEZ', 130201, 130200, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (478, 'JOSÉ MARÍA BLANCO', 130202, 130200, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (479, 'CATEDRAL', 130301, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (480, 'CONCEPCIÓN', 130302, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (481, 'EL CUJÍ', 130303, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (482, 'JUAN DE VILLEGAS', 130304, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (483, 'SANTA ROSA', 130305, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (484, 'TAMACA', 130306, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (485, 'UNIÓN', 130307, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (486, 'AGUEDO FELIPE ALVARADO', 130308, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (487, 'BUENA VISTA', 130309, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (488, 'JUÁREZ', 130310, 130300, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (489, 'JUAN BAUTISTA RODRÍGUEZ', 130401, 130400, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (490, 'CUARA', 130402, 130400, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (491, 'DIEGO DE LOZADA', 130403, 130400, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (492, 'PARAÍSO DE SAN JOSÉ', 130404, 130400, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (493, 'SAN MIGUEL', 130405, 130400, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (494, 'TINTORERO', 130406, 130400, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (495, 'JOSÉ BERNARDO DORANTE', 130407, 130400, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (496, 'CORONEL MARIANO PERAZA', 130408, 130400, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (497, 'BOLÍVAR', 130501, 130500, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (498, 'ANZOÁTEGUI', 130502, 130500, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (499, 'GUÁRICO', 130503, 130500, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (500, 'HILARIO LUNA Y LUNA', 130504, 130500, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (501, 'HUMOCARO ALTO', 130505, 130500, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (502, 'HUMOCARO BAJO', 130506, 130500, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (503, 'LA CANDELARIA', 130507, 130500, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (504, 'MORÁN', 130508, 130500, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (505, 'CABUDARE', 130601, 130600, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (506, 'JOSÉ GREGORIO BASTIDAS', 130602, 130600, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (507, 'AGUA VIVA', 130603, 130600, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (508, 'SARARE', 130701, 130700, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (509, 'BURÍA', 130702, 130700, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (510, 'GUSTAVO VEGAS LEÓN', 130703, 130700, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (511, 'TRINIDAD SAMUEL', 130801, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (512, 'ANTONIO DÍAZ', 130802, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (513, 'CAMACARO', 130803, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (514, 'CASTAÑEDA', 130804, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (515, 'CECILIO ZUBILLAGA', 130805, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (516, 'CHIQUINQUIRÁ', 130806, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (517, 'EL BLANCO', 130807, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (518, 'ESPINOZA DE LOS MONTEROS', 130808, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (519, 'LARA', 130809, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (520, 'LAS MERCEDES', 130810, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (521, 'MANUEL MORILLO', 130811, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (522, 'MONTAÑA VERDE', 130812, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (523, 'MONTES DE OCA', 130813, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (524, 'TORRES', 130814, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (525, 'HERIBERTO ARROYO', 130815, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (526, 'REYES VARGAS', 130816, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (527, 'ALTAGRACIA', 130817, 130800, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (528, 'SIQUISIQUE', 130901, 130900, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (529, 'MOROTURO', 130902, 130900, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (530, 'SAN MIGUEL', 130903, 130900, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (531, 'XAGUAS', 130904, 130900, 13);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (532, 'PRESIDENTE BETANCOURT', 140101, 140100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (533, 'PRESIDENTE PÁEZ', 140102, 140100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (534, 'PRESIDENTE RÓMULO GALLEGOS', 140103, 140100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (535, 'GABRIEL PICÓN GONZÁLEZ', 140104, 140100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (536, 'HÉCTOR AMABLE MORA', 140105, 140100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (537, 'JOSÉ NUCETE SARDI', 140106, 140100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (538, 'PULIDO MÉNDEZ', 140107, 140100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (539, 'CAPITAL ANTONIO PINTO SALINAS', 140301, 140300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (540, 'MESA BOLÍVAR', 140302, 140300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (541, 'MESA DE LAS PALMAS', 140303, 140300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (542, 'CAPITAL ARICAGUA', 140401, 140400, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (543, 'SAN ANTONIO', 140402, 140400, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (544, 'CAPITAL ARZOBISPO CHACÓN', 140501, 140500, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (545, 'CAPURÍ', 140502, 140500, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (546, 'CHACANTÁ', 140503, 140500, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (547, 'EL MOLINO', 140504, 140500, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (548, 'GUAIMARAL', 140505, 140500, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (549, 'MUCUTUY', 140506, 140500, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (550, 'MUCUCHACHÍ', 140507, 140500, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (551, 'FERNÁNDEZ PEÑA', 140601, 140600, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (552, 'MATRIZ', 140602, 140600, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (553, 'MONTALBÁN', 140603, 140600, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (554, 'ACEQUIAS', 140604, 140600, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (555, 'JAJÍ', 140605, 140600, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (556, 'LA MESA', 140606, 140600, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (557, 'SAN JOSÉ DEL SUR', 140607, 140600, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (558, 'CAPITAL CARACCIOLO PARRA OLMEDO', 140701, 140700, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (559, 'FLORENCIO RAMÍREZ', 140702, 140700, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (560, 'CAPITAL CARDENAL QUINTERO', 140801, 140800, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (561, 'LAS PIEDRAS', 140802, 140800, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (562, 'CAPITAL GUARAQUE', 140901, 140900, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (563, 'MESA DE QUINTERO', 140902, 140900, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (564, 'RÍO NEGRO', 140903, 140900, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (565, 'CAPITAL JULIO CÉSAR SALAS', 141001, 141000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (566, 'PALMIRA', 141002, 141000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (567, 'CAPITAL JUSTO BRICEÑO', 141101, 141000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (568, 'SAN CRISTÓBAL DE TORONDOY', 141102, 141000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (569, 'ANTONIO SPINETTI DINI', 141201, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (570, 'ARIAS', 141202, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (571, 'CARACCIOLO PARRA PÉREZ', 141203, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (572, 'DOMINGO PEÑA', 141204, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (573, 'EL LLANO', 141205, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (574, 'GONZALO PICÓN FEBRES', 141206, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (575, 'JACINTO PLAZA', 141207, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (576, 'JUAN RODRÍGUEZ SUÁREZ', 141208, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (577, 'LASSO DE LA VEGA', 141209, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (578, 'MARIANO PICÓN SALAS', 141210, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (579, 'MILLA', 141211, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (580, 'OSUNA RODRÍGUEZ', 141212, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (581, 'EL MORRO', 141214, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (582, 'LOS NEVADOS', 141215, 141200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (583, 'CAPITAL MIRANDA', 141301, 141300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (584, 'ANDRÉS ELOY BLANCO', 141302, 141300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (585, 'LA VENTA', 141303, 141300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (586, 'PIÑANGO', 141304, 141300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (587, 'CAPITAL OBISPO RAMOS DE LORA', 141401, 141400, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (588, 'ELOY PAREDES', 141402, 141400, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (589, 'SAN RAFAEL DE ALCÁZAR', 141403, 141400, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (590, 'CAPITAL RANGEL', 141701, 141700, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (591, 'CACUTE', 141702, 141700, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (592, 'LA TOMA', 141703, 141700, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (593, 'MUCURUBÍ', 141704, 141700, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (594, 'SAN RAFAEL', 141705, 141700, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (595, 'CAPITAL RIVAS DÁVILA', 141801, 141800, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (596, 'GERÓNIMO MALDONADO', 141802, 141800, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (597, 'CAPITAL SUCRE', 142001, 142000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (598, 'CHIGUARÍ', 142002, 142000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (599, 'ESTÁNQUEZ', 142003, 142000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (600, 'LA TRAMPA', 142004, 142000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (601, 'PUEBLO NUEVO DEL SUR', 142005, 142000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (602, 'SAN JUAN', 142006, 142000, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (603, 'EL AMPARO', 142101, 142100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (604, 'EL LLANO', 142102, 142100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (605, 'SAN FRANCISCO', 142103, 142100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (606, 'TOVAR', 142104, 142100, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (607, 'CAPITAL TULIO FEBRES CORDERO', 142201, 142200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (608, 'INDEPENDENCIA', 142202, 142200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (609, 'MARÍA DE LA CONCEPCIÓN PALACIOS BLANCO', 142203, 142200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (610, 'SANTA APOLONIA', 142204, 142200, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (611, 'CAPITAL ZEA', 142301, 142300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (612, 'CAÑO EL TIGRE', 142302, 142300, 14);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (613, 'CAUCAGUA', 150101, 150100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (614, 'ARAGUITA', 150102, 150100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (615, 'ARÉVALO GONZÁLEZ', 150103, 150100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (616, 'CAPAYA', 150104, 150100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (617, 'EL CAFÉ', 150105, 150100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (618, 'MARIZAPA', 150106, 150100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (619, 'PANAQUIRE', 150107, 150100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (620, 'RIBAS', 150108, 150100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (621, 'SAN JOSÉ DE BARLOVENTO', 150201, 150200, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (622, 'CUMBO', 150202, 150200, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (623, 'BARUTA', 150301, 150300, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (624, 'EL CAFETAL', 150302, 150300, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (625, 'LAS MINAS DE BARUTA', 150303, 150300, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (626, 'HIGUEROTE', 150401, 150400, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (627, 'CURIEPE', 150402, 150400, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (628, 'TACARIGUA', 150403, 150400, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (629, 'MAMPORAL', 150501, 150500, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (630, 'CARRIZAL', 150601, 150500, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (631, 'CHACAO', 150701, 150700, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (632, 'CHARALLAVE', 150801, 150800, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (633, 'LAS BRISAS', 150802, 150800, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (634, 'EL HATILLO', 150901, 150900, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (635, 'LOS TEQUES', 151001, 151000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (636, 'ALTAGRACIA DE LA MONTAÑA', 151002, 151000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (637, 'CECILIO ACOSTA', 151003, 151000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (638, 'EL JARILLO', 151004, 151000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (639, 'PARACOTOS', 151005, 151000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (640, 'SAN PEDRO', 151006, 151000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (641, 'TÁCATA', 151007, 151000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (642, 'SANTA TERESA DEL TUY', 151101, 151100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (643, 'EL CARTANAL', 151102, 151100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (644, 'OCUMARE DEL TUY', 151201, 151200, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (645, 'LA DEMOCRACIA', 151202, 151200, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (646, 'SANTA BÁRBARA', 151203, 151200, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (647, 'SAN ANTONIO DE LOS ALTOS', 151301, 151300, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (648, 'RÍO CHICO', 151401, 151400, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (649, 'EL GUAPO', 151402, 151400, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (650, 'TACARIGUA DE LA LAGUNA', 151403, 151400, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (651, 'PÁPARO', 151404, 151400, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (652, 'SAN FERNANDO DEL GUAPO', 151405, 151400, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (653, 'SANTA LUCÍA', 151501, 151500, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (654, 'CÚPIRA', 151601, 151600, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (655, 'MACHURUCUTO', 151602, 151600, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (656, 'GUARENAS', 151701, 151700, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (657, 'SAN FRANCISCO DE YARE', 151801, 151800, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (658, 'SAN ANTONIO DE YARE', 151802, 151800, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (659, 'PETARE', 151901, 151900, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (660, 'CAUCAGUITA', 151902, 151900, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (661, 'FILA DE MARICHES', 151903, 151900, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (662, 'LA DOLORITA', 151904, 151900, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (663, 'LEONCIO MARTÍNEZ', 151905, 151900, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (664, 'CÚA', 152001, 152000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (665, 'NUEVA CÚA', 152002, 152000, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (666, 'GUATIRE', 152101, 152100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (667, 'BOLÍVAR', 152102, 152100, 15);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (668, 'CAPITAL ACOSTA', 160101, 160100, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (669, 'SAN FRANCISCO', 160102, 160100, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (670, 'CAPITAL CARIPE', 160401, 160400, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (671, 'EL GUÁCHARO', 160402, 160400, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (672, 'LA GUANOTA', 160403, 160400, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (673, 'SABANA DE PIEDRA', 160404, 160400, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (674, 'SAN AGUSTÍN', 160405, 160400, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (675, 'TERESÓN', 160406, 160400, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (676, 'CAPITAL CEDEÑO', 160501, 160500, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (677, 'AREO', 160502, 160500, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (678, 'SAN FÉLIX', 160503, 160500, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (679, 'VIENTO FRESCO', 160504, 160500, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (680, 'CAPITAL EZEQUIEL ZAMORA', 160601, 160600, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (681, 'EL TEJERO', 160602, 160600, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (682, 'CAPITAL LIBERTADOR', 160701, 160700, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (683, 'CHAGUARAMAS', 160702, 160700, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (684, 'LAS ALHUACAS', 160703, 160700, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (685, 'TABASCA', 160704, 160700, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (686, 'CAPITAL MATURÍN', 160801, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (687, 'ALTO DE LOS GODOS', 160802, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (688, 'BOQUERÓN', 160803, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (689, 'LAS COCUIZAS', 160804, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (690, 'SAN SIMÓN', 160805, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (691, 'SANTA CRUZ', 160806, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (692, 'EL COROZO', 160807, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (693, 'EL FURRIAL', 160808, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (694, 'JUSEPÍN', 160809, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (695, 'LA PICA', 160810, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (696, 'SAN VICENTE', 160811, 160800, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (697, 'CAPITAL PIAR', 160901, 160900, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (698, 'APARICIO', 160902, 160900, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (699, 'CHAGUARAMAL', 160903, 160900, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (700, 'EL PINTO', 160904, 160900, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (701, 'GUANAGUANA', 160905, 160900, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (702, 'LA TOSCANA', 160906, 160900, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (703, 'TAGUAYA', 160907, 160900, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (704, 'CAPITAL PUNCERES', 161001, 161000, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (705, 'CACHIPO', 161002, 161000, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (706, 'CM SANTA BÁRBARA', 161101, 161100, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (707, 'CAPITAL SOTILLO', 161201, 161200, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (708, 'LOS BARRANCOS DE FAJARDO', 161202, 161200, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (709, 'CM URACOA', 161301, 161300, 16);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (710, 'CM LA PLAZA DE PARAGUACHI', 170101, 170100, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (711, 'CM LA ASUNCIÓN', 170201, 170200, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (712, 'CAPITAL DÍAZ', 170301, 170300, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (713, 'ZABALA', 170302, 170300, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (714, 'CAPITAL GARCÍA', 170401, 170400, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (715, 'FRANCISCO FAJARDO', 170402, 170400, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (716, 'CAPITAL GÓMEZ', 170501, 170500, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (717, 'BOLÍVAR', 170502, 170500, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (718, 'GUEVARA', 170503, 170500, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (719, 'MATASIETE', 170504, 170500, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (720, 'SUCRE', 170505, 170500, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (721, 'CAPITAL MANEIRO', 170601, 170600, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (722, 'AGUIRRE', 170602, 170600, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (723, 'CAPITAL MARCANO', 170701, 170700, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (724, 'ADRIÁN', 170702, 170700, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (725, 'CM PORLAMAR', 170801, 170800, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (726, 'CAPITAL PENÍNSULA DE MACANAO', 170901, 170900, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (727, 'SAN FRANCISCO', 170902, 170900, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (728, 'CAPITAL TUBORES', 171001, 171000, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (729, 'LOS BARALES', 171002, 171000, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (730, 'CAPITAL VILLALBA', 171101, 171100, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (731, 'VICENTE FUENTES', 171102, 171100, 17);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (732, 'CM AGUA BLANCA', 180101, 180100, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (733, 'CAPITAL ARAURE', 180201, 180200, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (734, 'RÍO ACARIGUA', 180202, 180200, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (735, 'CAPITAL ESTELLER', 180301, 180300, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (736, 'UVERAL', 180302, 180300, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (737, 'CAPITAL GUANARE', 180401, 180400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (738, 'CÓRDOBA', 180402, 180400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (739, 'SAN JOSÉ DE LA MONTAÑA', 180403, 180400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (740, 'SAN JUAN DE GUANAGUANARE', 180404, 180400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (741, 'VIRGEN DE LA COROMOTO', 180405, 180400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (742, 'CAPITAL GUANARITO', 180501, 180500, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (743, 'TRINIDAD DE LA CAPILLA', 180502, 180500, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (744, 'DIVINA PASTORA', 180503, 180500, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (745, 'CAPITAL MONS. JOSÉ VICENTE DE UNDA', 180601, 180600, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (746, 'PEÑA BLANCA', 180602, 180600, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (747, 'CAPITAL OSPINO', 180701, 180700, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (748, 'APARICIÓN', 180702, 180700, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (749, 'LA ESTACIÓN', 180703, 180700, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (750, 'CAPITAL PÁEZ', 180801, 180800, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (751, 'PAYARA', 180802, 180800, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (752, 'PIMPINELA', 180803, 180800, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (753, 'RAMÓN PERAZA', 180804, 180800, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (754, 'CAPITAL PAPELÓN', 180901, 180900, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (755, 'CAÑO DELGADITO', 180902, 180900, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (756, 'CAPITAL SAN GENARO DE BOCONOITO', 181001, 181000, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (757, 'ANTOLÍN TOVAR', 181002, 181000, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (758, 'CAPITAL SAN RAFAEL DE ONOTO', 181101, 181100, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (759, 'SANTA FE', 181102, 181100, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (760, 'THERMO MORLÉS', 181103, 181100, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (761, 'CAPITAL SANTA ROSALÍA', 181201, 181200, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (762, 'FLORIDA', 181202, 181200, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (763, 'CAPITAL SUCRE', 181301, 181300, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (764, 'CONCEPCIÓN', 181302, 181300, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (765, 'SAN RAFAEL DE PALO ALZADO', 181303, 181300, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (766, 'UVENCIO ANTONIO VELÁSQUEZ', 181304, 181300, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (767, 'SAN JOSÉ DE SAGUAZ', 181305, 181300, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (768, 'VILLA ROSA', 181306, 181300, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (769, 'CAPITAL TURÍN', 181401, 181400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (770, 'CANELONES', 181402, 181400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (771, 'SANTA CRUZ', 181403, 181400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (772, 'SAN ISIDRO LABRADOR', 181404, 181400, 18);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (773, 'MARIÑO', 190101, 190100, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (774, 'RÓMULO GALLEGOS', 190102, 190100, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (775, 'SAN JOSÉ DE AEROCUAR', 190201, 190200, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (776, 'TAVERA ACOSTA', 190202, 190200, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (777, 'RÍO CARIBE', 190301, 190300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (778, 'ANTONIO JOSÉ DE SUCRE', 190302, 190300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (779, 'EL MORRO DE PUERTO SANTO', 190303, 190300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (780, 'PUERTO SANTO', 190304, 190300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (781, 'SAN JUAN DE LAS GALDONAS', 190305, 190300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (782, 'EL PILAR', 190401, 190400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (783, 'EL RINCÓN', 190402, 190400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (784, 'GENERAL FRANCISCO ANTONIO VÁSQUEZ', 190403, 190400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (785, 'GUARAINOS', 190404, 190400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (786, 'TUNAPUICITO', 190405, 190400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (787, 'UNIÓN', 190406, 190400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (788, 'BOLÍVAR', 190501, 190500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (789, 'MACARAPANA', 190502, 190500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (790, 'SANTA CATALINA', 190503, 190500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (791, 'SANTA ROSA', 190504, 190500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (792, 'SANTA TERESA', 190505, 190500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (793, 'CM MARIGUITAR', 190601, 190600, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (794, 'YAGUARAPARO', 190701, 190700, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (795, 'EL PAUJIL', 190702, 190700, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (796, 'LIBERTAD', 190703, 190700, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (797, 'ARAYA', 190801, 190800, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (798, 'CHACOPATA', 190802, 190800, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (799, 'MANICUARE', 190803, 190800, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (800, 'TUNAPUY', 190901, 190900, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (801, 'CAMPO ELÍAS', 190902, 190900, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (802, 'IRAPA', 191001, 191000, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (803, 'CAMPO CLARO', 191002, 191000, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (804, 'MARABAL', 191003, 191000, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (805, 'SAN ANTONIO DE IRAPA', 191004, 191000, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (806, 'SORO', 191005, 191000, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (807, 'CM SAN ANTONIO DEL GOLFO', 191101, 191100, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (808, 'CUMANACOA', 191201, 191200, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (809, 'ARENAS', 191202, 191200, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (810, 'ARICAGUA', 191203, 191200, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (811, 'COCOLLAR', 191204, 191200, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (812, 'SAN FERNANDO', 191205, 191200, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (813, 'SAN LORENZO', 191206, 191200, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (814, 'VILLA FRONTADO (MUELLE DE CARIACO)', 191301, 191300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (815, 'CATUARO', 191302, 191300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (816, 'RENDÓN', 191303, 191300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (817, 'SANTA CRUZ', 191304, 191300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (818, 'SANTA MARÍA', 191305, 191300, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (819, 'ALTAGRACIA', 191401, 191400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (820, 'AYACUCHO', 191402, 191400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (821, 'SANTA INÉS', 191403, 191400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (822, 'VALENTÍN VALIENTE', 191404, 191400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (823, 'SAN JUAN', 191405, 191400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (824, 'RAÚL LEONI', 191406, 191400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (825, 'GRAN MARISCAL', 191407, 191400, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (826, 'GUIRIA', 191501, 191500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (827, 'BIDEAU', 191502, 191500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (828, 'CRISTÓBAL COLÓN', 191503, 191500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (829, 'PUNTA DE PIEDRAS', 191504, 191500, 19);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (830, 'CM CORDERO', 200101, 200100, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (831, ' CM LAS MESAS', 200201, 200200, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (832, 'AYACUCHO', 200301, 200300, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (833, 'RIVAS BERTI', 200302, 200300, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (834, 'SAN PEDRO DEL RÍO', 200303, 200300, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (835, 'BOLÍVAR', 200401, 200400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (836, 'PALOTAL', 200402, 200400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (837, 'JUAN VICENTE GÓMEZ', 200403, 200400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (838, 'ISAÍAS MEDINA ANGARITA', 200404, 200400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (839, 'CÁRDENAS', 200501, 200500, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (840, 'AMENODORO RANGEL LAMÚS', 200502, 200500, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (841, 'LA FLORIDA', 200503, 200500, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (842, 'CM SANTA ANA DEL TÁCHIRA', 200601, 200600, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (843, 'FERNÁNDEZ FEO', 200701, 200700, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (844, 'ALBERTO ADRIANI', 200702, 200700, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (845, 'SANTO DOMINGO', 200703, 200700, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (846, 'CM SAN JOSÉ DE BOLÍVAR', 200801, 200800, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (847, 'GARCÍA DE HEVIA', 200901, 200900, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (848, 'BOCA DE GRITA', 200902, 200900, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (849, 'JOSÉ ANTONIO PÁEZ', 200903, 200900, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (850, 'CM PALMIRA', 201001, 201000, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (851, 'INDEPENDENCIA', 201101, 201100, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (852, 'JUAN GERMÁN ROSCIO', 201102, 201100, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (853, 'ROMÁN CÁRDENAS', 201103, 201100, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (854, 'JÁUREGUI', 201201, 201200, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (855, 'EMILIO CONSTANTINO GUERRERO', 201202, 201200, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (856, 'MONSEÑOR MIGUEL ANTONIO SALAS', 201203, 201200, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (857, 'CM EL COBRE', 201301, 201300, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (858, 'JUNÍN', 201401, 201400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (859, 'LA PETRÓLEA', 201402, 201400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (860, 'QUINIMARÍ', 201403, 201400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (861, 'BRAMÓN', 201404, 201400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (862, 'LIBERTAD', 201501, 201500, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (863, 'CIPRIANO CASTRO', 201502, 201500, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (864, 'MANUEL FELIPE RUGELES', 201503, 201500, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (865, 'LIBERTADOR', 201601, 201600, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (866, 'DON EMETERIO OCHOA', 201602, 201600, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (867, 'DORADAS', 201603, 201600, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (868, 'SAN JOAQUÍN DE NAVAY', 201604, 201600, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (869, 'LOBATERA', 201701, 201700, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (870, 'CONSTITUCIÓN', 201702, 201700, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (871, ' CM MICHELENA', 201801, 201800, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (872, 'PANAMERICANO', 201901, 201900, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (873, 'LA PALMITA', 201902, 201900, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (874, 'PEDRO MARÍA UREÑA', 202001, 202000, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (875, 'NUEVA ARCADIA', 202002, 202000, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (876, 'SAMUEL DARÍO MALDONADO', 202201, 202000, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (877, 'BOCONÓ', 202202, 202000, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (878, 'HERNÁNDEZ', 202203, 202000, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (879, 'CM DELICIAS', 202101, 202100, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (880, 'CM LA TENDIDA', 202201, 202200, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (881, 'BOCONÓ', 202202, 202200, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (882, 'HERNÁNDEZ', 202203, 202200, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (883, 'LA CONCORDIA', 202301, 202300, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (884, 'PEDRO MARÍA MORANTES', 202302, 202300, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (885, 'SAN JUAN BAUTISTA', 202303, 202300, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (886, 'SAN SEBASTIÁN', 202304, 202300, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (887, 'CM SEBORUCO', 202401, 202400, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (888, 'DR. FRANCISCO ROMERO LOBO', 202305, 202500, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (889, 'SUCRE', 202601, 202600, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (890, 'ELEAZAR LÓPEZ CONTRERAS', 202602, 202600, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (891, 'SAN PABLO', 202603, 202600, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (892, 'CM SAN JOSECITO', 202701, 202700, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (893, ' URIBANTE', 202801, 202800, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (894, 'CÁRDENAS', 202802, 202800, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (895, 'JUAN PABLO PEÑALOZA', 202803, 202800, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (896, 'POTOSÍ', 202804, 202800, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (897, 'CM UMUQUENA', 202901, 202900, 20);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (898, 'SANTA ISABEL', 210101, 210100, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (899, 'ARAGUANEY', 210102, 210100, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (900, 'EL JAGUITO', 210103, 210100, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (901, 'LA ESPERANZA', 210104, 210100, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (902, 'BOCONÓ', 210201, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (903, 'EL CARMEN', 210202, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (904, 'MOSQUEY', 210203, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (905, 'AYACUCHO', 210204, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (906, 'BURBUSAY', 210205, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (907, 'GENERAL RIVAS', 210206, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (908, 'GUARAMACAL', 210207, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (909, 'VEGA DE GUARAMACAL', 210208, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (910, 'MONSEÑOR JÁUREGUI', 210209, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (911, 'RAFAEL RANGEL', 210210, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (912, 'SAN MIGUEL', 210211, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (913, 'SAN JOSÉ', 210212, 210200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (914, 'SABANA GRANDE', 210301, 210300, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (915, 'CHEREGUE', 210302, 210300, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (916, 'GRANADOS', 210303, 210300, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (917, 'CHEJENDÉ', 210401, 210400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (918, 'ARNOLDO GABALDÓN', 210402, 210400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (919, 'BOLIVIA', 210403, 210400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (920, 'CARRILLO', 210404, 210400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (921, 'CEGARRA', 210405, 210400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (922, 'MANUEL SALVADOR ULLOA', 210406, 210400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (923, 'SAN JOSÉ', 210407, 210400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (924, 'CARACHE', 210501, 210500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (925, 'CUICAS', 210502, 210500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (926, 'LA CONCEPCIÓN', 210503, 210500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (927, 'PANAMERICANA', 210504, 210500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (928, 'SANTA CRUZ', 210505, 210500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (929, 'ESCUQUE', 210601, 210600, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (930, 'LA UNIÓN', 210602, 210600, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (931, 'SABANA LIBRE', 210603, 210600, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (932, 'SANTA RITA', 210604, 210600, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (933, 'EL SOCORRO', 210701, 210700, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (934, 'ANTONIO JOSÉ DE SUCRE', 210702, 210700, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (935, 'LOS CAPRICHOS', 210703, 210700, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (936, 'CAMPO ELÍAS', 210801, 210800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (937, 'ARNOLDO GABALDÓN', 210802, 210800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (938, 'SANTA APOLONIA', 210901, 210900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (939, 'EL PROGRESO', 210902, 210900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (940, 'LA CEIBA', 210903, 210900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (941, 'TRES DE FEBRERO', 210904, 210900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (942, 'EL DIVIDIVE', 211001, 211000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (943, 'AGUA SANTA', 211002, 211000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (944, 'AGUA CALIENTE', 211003, 211000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (945, 'EL CENIZO', 211004, 211000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (946, 'VALERITA', 211005, 211000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (947, 'MONTE CARMELO', 211101, 211100, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (948, 'BUENA VISTA', 211102, 211100, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (949, 'SANTA MARÍA DEL HORCÓN', 211103, 211100, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (950, 'MOTATÁN', 211201, 211200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (951, 'EL BAÑO', 211202, 211200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (952, 'JALISCO', 211203, 211200, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (953, 'PAMPÁN', 211301, 211300, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (954, 'FLOR DE PATRIA', 211302, 211300, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (955, 'LA PAZ', 211303, 211300, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (956, 'SANTA ANA', 211304, 211300, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (957, 'PAMPANITO', 211401, 211400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (958, 'LA CONCEPCIÓN', 211402, 211400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (959, 'PAMPANITO II', 211403, 211400, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (960, 'BETIJOQUE', 211501, 211500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (961, 'LA PUEBLITA', 211502, 211500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (962, 'LOS CEDROS', 211503, 211500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (963, 'JOSÉ GREGORIO HERNÁNDEZ', 211504, 211500, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (964, 'CARVAJAL', 211601, 211600, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (965, 'ANTONIO NICOLÁS BRICEÑO', 211602, 211600, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (966, 'CAMPO ALEGRE', 211603, 211600, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (967, 'JOSÉ LEONARDO SUÁREZ', 211604, 211600, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (968, 'SABANA DE MENDOZA', 211701, 211700, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (969, 'EL PARAÍ-SO', 211702, 211700, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (970, 'JUNÍN', 211703, 211700, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (971, 'VALMORE RODRÍGUEZ', 211704, 211700, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (972, 'ANDRÉS LINARES', 211801, 211800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (973, 'CHIQUINQUIRÁ', 211802, 211800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (974, 'CRISTÓBAL MENDOZA', 211803, 211800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (975, 'CRUZ CARRILLO', 211804, 211800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (976, 'MATRIZ', 211805, 211800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (977, 'MONSEÑOR CARRILLO', 211806, 211800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (978, 'TRES ESQUINAS', 211807, 211800, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (979, 'LA QUEBRADA', 211901, 211900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (980, 'CABIMBÚ', 211902, 211900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (981, 'JAJÍ', 211903, 211900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (982, 'LA MESA', 211904, 211900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (983, 'SANTIAGO', 211905, 211900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (984, 'TUÑAME', 211906, 211900, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (985, 'JUAN IGNACIO MONTILLA', 212001, 212000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (986, 'LA BEATRIZ', 212002, 212000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (987, 'MERCEDES DÍAZ', 212003, 212000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (988, 'SAN LUIS', 212004, 212000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (989, 'LA PUERTA', 212005, 212000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (990, 'MENDOZA', 212006, 212000, 21);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (991, 'CM SAN PABLO', 220101, 220100, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (992, 'CM AROA', 220201, 220200, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (993, 'CAPITAL BRUZUAL', 220301, 220300, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (994, 'CAMPO ELÍAS', 220302, 220300, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (995, 'CM COCOROTE', 220401, 220400, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (996, 'CM INDEPENDENCIA', 220501, 220500, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (997, 'CM SABANA DE PARRA', 220601, 220600, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (998, 'CM BORAURE', 220701, 220700, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (999, 'CM YUMARE', 220801, 220800, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1000, 'CAPITAL NIRGUA', 220901, 220900, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1001, 'SALOM', 220902, 220900, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1002, 'TEMERLA', 220903, 220900, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1003, 'CAPITAL PEÑA', 221001, 221000, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1004, 'SAN ANDRÉS', 221002, 221000, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1005, 'CAPITAL SAN FELIPE', 221101, 221100, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1006, 'ALBARICO', 221102, 221100, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1007, 'SAN JAVIER', 221103, 221100, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1008, 'CM GUAMA', 221201, 221200, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1009, 'CM URACHICHE', 221301, 221300, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1010, 'CAPITAL VEROES', 221401, 221400, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1011, 'EL GUAYABO', 221402, 221400, 22);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1012, 'ISLA DE TOAS', 230101, 230100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1013, 'MONAGAS', 230102, 230100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1014, 'GENERAL URDANETA', 230201, 230200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1015, 'LIBERTADOR', 230202, 230200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1016, 'MANUEL GUANIPA MATOS', 230203, 230200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1017, 'MARCELINO BRICEÑO', 230204, 230200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1018, 'PUEBLO NUEVO', 230205, 230200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1019, 'SAN TIMOTEO', 230206, 230200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1020, 'AMBROSIO', 230301, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1021, 'ARÍSTIDES CALVANI', 230302, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1022, 'CARMEN HERRERA', 230303, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1023, 'GERMAN RÍOS LINARES', 230304, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1024, 'JORGE HERNÁNDEZ', 230305, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1025, 'LA ROSA', 230306, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1026, 'PUNTA GORDA', 230307, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1027, 'RÓMULO BETANCOURT', 230308, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1028, 'SAN BENITO', 230309, 230300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1029, 'ENCONTRADOS', 230401, 230400, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1030, 'UDON PÉREZ', 230402, 230400, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1031, 'MORALITO', 230501, 230500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1032, 'SAN CARLOS DE ZULIA', 230502, 230500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1033, 'SANTA BÁRBARA', 230503, 230500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1034, 'SANTA CRUZ DEL ZULIA', 230504, 230500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1035, 'URIBARRI', 230505, 230500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1036, 'CARLOS QUEVEDO', 230601, 230600, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1037, 'FRANCISCO JAVIER PULGAR', 230602, 230600, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1038, 'SIMÓN RODRÍGUEZ', 230603, 230600, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1039, 'JOSÉ RAMÓN YÉPEZ', 230701, 230700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1040, 'LA CONCEPCIÓN', 230702, 230700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1041, 'MARIANO PARRA LEÓN', 230703, 230700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1042, 'SAN JOSÉ', 230704, 230700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1043, 'BARI', 230801, 230800, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1044, 'JESÚS MARÍA SEMPRÚN', 230802, 230800, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1045, 'ANDRÉS BELLO', 230901, 230900, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1046, 'CHIQUINQUIRÁ', 230902, 230900, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1047, 'CONCEPCIÓN', 230903, 230900, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1048, 'EL CARMELO', 230904, 230900, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1049, 'POTRERITOS', 230905, 230900, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1050, 'ALONSO DE OJEDA', 231001, 231000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1051, 'CAMPO LARA', 231002, 231000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1052, 'ELEAZAR LÓPEZ CONTRERAS', 231003, 231000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1053, 'LIBERTAD', 231004, 231000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1054, 'VENEZUELA', 231005, 231000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1055, 'LIBERTAD', 231101, 231100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1056, 'RÍO NEGRO', 231102, 231100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1057, 'SAN JOSÉ DE PERIJÁ', 231103, 231100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1058, 'BARTOLOMÉ DE LAS CASAS', 231104, 231100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1059, 'LA SIERRITA', 231201, 231200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1060, 'LAS PARCELAS', 231202, 231200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1061, 'LUIS DE VICENTE', 231203, 231200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1062, 'MONSEÑOR MARCOS SERGIO G', 231204, 231200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1063, 'RICAURTE', 231205, 231200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1064, 'SAN RAFAEL', 231206, 231200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1065, 'TAMARE', 231207, 231200, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1066, 'ANTONIO BORJAS ROMERO', 231301, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1067, 'BOLÍVAR', 231302, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1068, 'CACIQUE MARA', 231303, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1069, 'CECILIO ACOSTA', 231304, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1070, 'CHIQUINQUIRÁ', 231305, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1071, 'COQUIVACOA', 231306, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1072, 'CRISTO DE ARANZA', 231307, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1073, 'FRANCISCO EUGENIO B', 231308, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1074, 'IDELFONZO VÁSQUEZ', 231309, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1075, 'JUANA DE ÁVILA', 231310, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1076, 'LUIS HURTADO HIGUERA', 231311, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1077, 'MANUEL DANIGNO', 231312, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1078, 'OLEGARIO VILLALOBOS', 231313, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1079, 'RAÚL LEONI', 231314, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1080, 'SAN ISIDRO', 231315, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1081, 'SANTA LUCÍA', 231316, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1082, 'VENANCIO PULGAR', 231317, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1083, 'CARACCIOLO PARRA PÉREZ', 231318, 231300, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1084, 'SAN JOSÉ', 231405, 231400, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1085, 'SINAMAICA', 231501, 231500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1086, 'ALTA GUAJIRA', 231502, 231500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1087, 'ELÍAS SÁNCHEZ RUBIO', 231503, 231500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1088, 'GUAJIRA', 231504, 231500, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1089, 'EL ROSARIO', 231601, 231600, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1090, 'DONALDO GARCÍA', 231602, 231600, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1091, 'SIXTO ZAMBRANO', 231603, 231600, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1092, 'SAN FRANCISCO', 231701, 231700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1093, 'EL BAJO', 231702, 231700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1094, 'DOMITILA FLORES', 231703, 231700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1095, 'FRANCISCO OCHOA', 231704, 231700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1096, 'LOS CORTIJOS', 231705, 231700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1097, 'MARCIAL HERNÁNDEZ', 231706, 231700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1098, 'JOSÉ DOMINGO RUS', 231707, 231700, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1099, 'SANTA RITA', 231801, 231800, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1100, 'EL MENE', 231802, 231800, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1101, 'JOSÉ CENOVIO URRIBARRI', 231803, 231800, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1102, 'PEDRO LUCAS URRIBARRI', 231804, 231800, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1103, 'MANUEL MANRIQUE', 231901, 231900, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1104, 'RAFAEL MARÍA BARALT', 231902, 231900, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1105, 'RAFAEL URDANETA', 231903, 231900, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1106, 'BOBURES', 232001, 232000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1107, 'EL BATEY', 232002, 232000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1108, 'GIBRALTAR', 232003, 232000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1109, 'HERAS', 232004, 232000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1110, 'MONSEÑOR ARTURO CELESTINO ÁLVAREZ', 232005, 232000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1111, 'RÓMULO GALLEGOS', 232006, 232000, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1112, 'LA VICTORIA', 232101, 232100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1113, 'RAFAEL URDANETA', 232102, 232100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1114, 'RAÚL CUENCA', 232103, 232100, 23);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1115, 'CARABALLEDA', 240101, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1116, 'CARAYACA', 240102, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1117, 'CARUAO', 240103, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1118, 'CATIA LA MAR', 240104, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1119, 'EL JUNKO', 240105, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1120, 'LA GUAIRA', 240106, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1121, 'MACUTO', 240107, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1122, 'MAIQUETÍA', 240108, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1123, 'NAIGUATÁ', 240109, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1124, 'URIMARE', 240110, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1125, 'CARLOS SOUBLETTE', 240111, 240100, 24);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1126, 'LOS ROQUES', 250101, 250100, 25);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1127, 'LAS AVES', 250201, 250200, 25);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1128, 'LA ORCHILA', 250301, 250300, 25);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1129, 'OTRAS DEPENDENCIAS FEDERALES (P)', 260101, 260100, 26);
INSERT INTO parroquias_parroquia (id, parroquia, cod_parroquia, municipio, estado_id) VALUES (1130, 'REGISTRO DE NORMALIZACIÓN (PARROQUIA)', 270101, 270100, 27);


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 200
-- Name: parroquias_parroquia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parroquias_parroquia_id_seq', 1130, true);


--
-- TOC entry 2201 (class 0 OID 1593406)
-- Dependencies: 201
-- Data for Name: sector_laboral_sectorlaboral; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sector_laboral_sectorlaboral (id, sector) VALUES (1, 'PÚBLICO');
INSERT INTO sector_laboral_sectorlaboral (id, sector) VALUES (2, 'PRIVADO');
INSERT INTO sector_laboral_sectorlaboral (id, sector) VALUES (3, 'INDEPENDIENTE');


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 202
-- Name: sector_laboral_sectorlaboral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sector_laboral_sectorlaboral_id_seq', 3, true);


--
-- TOC entry 2203 (class 0 OID 1593411)
-- Dependencies: 203
-- Data for Name: solicitud_registros; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 204
-- Name: solicitud_registros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('solicitud_registros_id_seq', 1, false);


--
-- TOC entry 2205 (class 0 OID 1593419)
-- Dependencies: 205
-- Data for Name: tipo_educacion_tipoeducacion; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 206
-- Name: tipo_educacion_tipoeducacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipo_educacion_tipoeducacion_id_seq', 1, false);


--
-- TOC entry 2207 (class 0 OID 1593424)
-- Dependencies: 207
-- Data for Name: trabajadores_trabajadores; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO trabajadores_trabajadores (id, institucion_id, trabajador_id) VALUES (1, 1, 2);


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 208
-- Name: trabajadores_trabajadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('trabajadores_trabajadores_id_seq', 1, true);


--
-- TOC entry 1919 (class 2606 OID 1593453)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 1925 (class 2606 OID 1593455)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 1927 (class 2606 OID 1593457)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1921 (class 2606 OID 1593459)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 1930 (class 2606 OID 1593461)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 1932 (class 2606 OID 1593463)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 1941 (class 2606 OID 1593465)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 1943 (class 2606 OID 1593467)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 1934 (class 2606 OID 1593469)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1947 (class 2606 OID 1593471)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1949 (class 2606 OID 1593473)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 1937 (class 2606 OID 1593475)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 1954 (class 2606 OID 1593477)
-- Name: dependencias_dependencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dependencias_dependencia
    ADD CONSTRAINT dependencias_dependencia_pkey PRIMARY KEY (id);


--
-- TOC entry 1958 (class 2606 OID 1593479)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 1960 (class 2606 OID 1593481)
-- Name: django_content_type_app_label_3ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_3ec8c61c_uniq UNIQUE (app_label, model);


--
-- TOC entry 1962 (class 2606 OID 1593483)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1964 (class 2606 OID 1593485)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 1967 (class 2606 OID 1593487)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 1970 (class 2606 OID 1593489)
-- Name: estados_estado_cod_estado_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY estados_estado
    ADD CONSTRAINT estados_estado_cod_estado_key UNIQUE (cod_estado);


--
-- TOC entry 1973 (class 2606 OID 1593491)
-- Name: estados_estado_estado_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY estados_estado
    ADD CONSTRAINT estados_estado_estado_key UNIQUE (estado);


--
-- TOC entry 1975 (class 2606 OID 1593493)
-- Name: estados_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY estados_estado
    ADD CONSTRAINT estados_estado_pkey PRIMARY KEY (id);


--
-- TOC entry 1980 (class 2606 OID 1593495)
-- Name: grupo_etareo_grupo_etareo_descripcion_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grupo_etareo_grupo_etareo
    ADD CONSTRAINT grupo_etareo_grupo_etareo_descripcion_key UNIQUE (descripcion);


--
-- TOC entry 1982 (class 2606 OID 1593497)
-- Name: grupo_etareo_grupo_etareo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grupo_etareo_grupo_etareo
    ADD CONSTRAINT grupo_etareo_grupo_etareo_pkey PRIMARY KEY (id);


--
-- TOC entry 1988 (class 2606 OID 1593499)
-- Name: instituciones_institucion_nom_institucion_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY instituciones_institucion
    ADD CONSTRAINT instituciones_institucion_nom_institucion_key UNIQUE (nom_institucion);


--
-- TOC entry 1990 (class 2606 OID 1593501)
-- Name: instituciones_institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY instituciones_institucion
    ADD CONSTRAINT instituciones_institucion_pkey PRIMARY KEY (id);


--
-- TOC entry 1992 (class 2606 OID 1593503)
-- Name: login_perfilesusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY login_perfilesusuario
    ADD CONSTRAINT login_perfilesusuario_pkey PRIMARY KEY (id);


--
-- TOC entry 1994 (class 2606 OID 1593505)
-- Name: login_perfilesusuario_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY login_perfilesusuario
    ADD CONSTRAINT login_perfilesusuario_user_id_key UNIQUE (user_id);


--
-- TOC entry 1996 (class 2606 OID 1593507)
-- Name: motivo_motivos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY motivo_motivos
    ADD CONSTRAINT motivo_motivos_pkey PRIMARY KEY (id);


--
-- TOC entry 1999 (class 2606 OID 1593509)
-- Name: municipios_municipio_estado_id_1bb33a65_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY municipios_municipio
    ADD CONSTRAINT municipios_municipio_estado_id_1bb33a65_uniq UNIQUE (estado_id, cod_municipio, municipio);


--
-- TOC entry 2001 (class 2606 OID 1593511)
-- Name: municipios_municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY municipios_municipio
    ADD CONSTRAINT municipios_municipio_pkey PRIMARY KEY (id);


--
-- TOC entry 2003 (class 2606 OID 1593513)
-- Name: ocupacion_ocupaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ocupacion_ocupaciones
    ADD CONSTRAINT ocupacion_ocupaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2005 (class 2606 OID 1593515)
-- Name: organizacion_social_organizaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizacion_social_organizaciones
    ADD CONSTRAINT organizacion_social_organizaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2008 (class 2606 OID 1593517)
-- Name: parroquias_parroquia_estado_id_10f95705_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parroquias_parroquia
    ADD CONSTRAINT parroquias_parroquia_estado_id_10f95705_uniq UNIQUE (estado_id, municipio, parroquia);


--
-- TOC entry 2010 (class 2606 OID 1593519)
-- Name: parroquias_parroquia_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parroquias_parroquia
    ADD CONSTRAINT parroquias_parroquia_pkey PRIMARY KEY (id);


--
-- TOC entry 2012 (class 2606 OID 1593521)
-- Name: sector_laboral_sectorlaboral_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sector_laboral_sectorlaboral
    ADD CONSTRAINT sector_laboral_sectorlaboral_pkey PRIMARY KEY (id);


--
-- TOC entry 2023 (class 2606 OID 1593523)
-- Name: solicitud_registros_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solicitud_registros_pkey PRIMARY KEY (id);


--
-- TOC entry 2025 (class 2606 OID 1593525)
-- Name: tipo_educacion_tipoeducacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_educacion_tipoeducacion
    ADD CONSTRAINT tipo_educacion_tipoeducacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2029 (class 2606 OID 1593527)
-- Name: trabajadores_trabajadores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trabajadores_trabajadores
    ADD CONSTRAINT trabajadores_trabajadores_pkey PRIMARY KEY (id);


--
-- TOC entry 1917 (class 1259 OID 1593528)
-- Name: auth_group_name_331666e8_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_name_331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 1922 (class 1259 OID 1593529)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 1923 (class 1259 OID 1593530)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 1928 (class 1259 OID 1593531)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 1938 (class 1259 OID 1593532)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 1939 (class 1259 OID 1593533)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 1944 (class 1259 OID 1593534)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 1945 (class 1259 OID 1593535)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 1935 (class 1259 OID 1593536)
-- Name: auth_user_username_94b8aae_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_username_94b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 1950 (class 1259 OID 1593537)
-- Name: dependencias_dependencia_21f9472f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dependencias_dependencia_21f9472f ON dependencias_dependencia USING btree (user_create_id);


--
-- TOC entry 1951 (class 1259 OID 1593538)
-- Name: dependencias_dependencia_52e1b404; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dependencias_dependencia_52e1b404 ON dependencias_dependencia USING btree (institucion_id);


--
-- TOC entry 1952 (class 1259 OID 1593539)
-- Name: dependencias_dependencia_8c874724; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX dependencias_dependencia_8c874724 ON dependencias_dependencia USING btree (user_update_id);


--
-- TOC entry 1955 (class 1259 OID 1593540)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 1956 (class 1259 OID 1593541)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 1965 (class 1259 OID 1593542)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 1968 (class 1259 OID 1593543)
-- Name: django_session_session_key_630ca218_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_session_key_630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 1971 (class 1259 OID 1593544)
-- Name: estados_estado_estado_64fa374b_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX estados_estado_estado_64fa374b_like ON estados_estado USING btree (estado varchar_pattern_ops);


--
-- TOC entry 1976 (class 1259 OID 1593545)
-- Name: grupo_etareo_grupo_etareo_21f9472f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX grupo_etareo_grupo_etareo_21f9472f ON grupo_etareo_grupo_etareo USING btree (user_create_id);


--
-- TOC entry 1977 (class 1259 OID 1593546)
-- Name: grupo_etareo_grupo_etareo_8c874724; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX grupo_etareo_grupo_etareo_8c874724 ON grupo_etareo_grupo_etareo USING btree (user_update_id);


--
-- TOC entry 1978 (class 1259 OID 1593547)
-- Name: grupo_etareo_grupo_etareo_descripcion_692a3d1b_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX grupo_etareo_grupo_etareo_descripcion_692a3d1b_like ON grupo_etareo_grupo_etareo USING btree (descripcion varchar_pattern_ops);


--
-- TOC entry 1983 (class 1259 OID 1593548)
-- Name: instituciones_institucion_21f9472f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX instituciones_institucion_21f9472f ON instituciones_institucion USING btree (user_create_id);


--
-- TOC entry 1984 (class 1259 OID 1593549)
-- Name: instituciones_institucion_2c189993; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX instituciones_institucion_2c189993 ON instituciones_institucion USING btree (estado_id);


--
-- TOC entry 1985 (class 1259 OID 1593550)
-- Name: instituciones_institucion_8c874724; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX instituciones_institucion_8c874724 ON instituciones_institucion USING btree (user_update_id);


--
-- TOC entry 1986 (class 1259 OID 1593551)
-- Name: instituciones_institucion_nom_institucion_7b81e642_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX instituciones_institucion_nom_institucion_7b81e642_like ON instituciones_institucion USING btree (nom_institucion varchar_pattern_ops);


--
-- TOC entry 1997 (class 1259 OID 1593552)
-- Name: municipios_municipio_2c189993; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX municipios_municipio_2c189993 ON municipios_municipio USING btree (estado_id);


--
-- TOC entry 2006 (class 1259 OID 1593553)
-- Name: parroquias_parroquia_2c189993; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX parroquias_parroquia_2c189993 ON parroquias_parroquia USING btree (estado_id);


--
-- TOC entry 2013 (class 1259 OID 1593554)
-- Name: solicitud_registros_06db3160; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_06db3160 ON solicitud_registros USING btree (organizacion_id);


--
-- TOC entry 2014 (class 1259 OID 1593555)
-- Name: solicitud_registros_21f9472f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_21f9472f ON solicitud_registros USING btree (user_create_id);


--
-- TOC entry 2015 (class 1259 OID 1593556)
-- Name: solicitud_registros_2c189993; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_2c189993 ON solicitud_registros USING btree (estado_id);


--
-- TOC entry 2016 (class 1259 OID 1593557)
-- Name: solicitud_registros_35c95134; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_35c95134 ON solicitud_registros USING btree (tipo_edu_id);


--
-- TOC entry 2017 (class 1259 OID 1593558)
-- Name: solicitud_registros_52e1b404; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_52e1b404 ON solicitud_registros USING btree (institucion_id);


--
-- TOC entry 2018 (class 1259 OID 1593559)
-- Name: solicitud_registros_76b95354; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_76b95354 ON solicitud_registros USING btree (motivo_id);


--
-- TOC entry 2019 (class 1259 OID 1593560)
-- Name: solicitud_registros_77e25041; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_77e25041 ON solicitud_registros USING btree (sector_lab_id);


--
-- TOC entry 2020 (class 1259 OID 1593561)
-- Name: solicitud_registros_f4701cc2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_f4701cc2 ON solicitud_registros USING btree (ocupacion_id);


--
-- TOC entry 2021 (class 1259 OID 1593562)
-- Name: solicitud_registros_f5acfb16; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX solicitud_registros_f5acfb16 ON solicitud_registros USING btree (departamento_id);


--
-- TOC entry 2026 (class 1259 OID 1593563)
-- Name: trabajadores_trabajadores_12b1cd18; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX trabajadores_trabajadores_12b1cd18 ON trabajadores_trabajadores USING btree (trabajador_id);


--
-- TOC entry 2027 (class 1259 OID 1593564)
-- Name: trabajadores_trabajadores_52e1b404; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX trabajadores_trabajadores_52e1b404 ON trabajadores_trabajadores USING btree (institucion_id);


--
-- TOC entry 2050 (class 2606 OID 1593565)
-- Name: D53b8dfeb98e1ef99d9d359bbd928af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT "D53b8dfeb98e1ef99d9d359bbd928af7" FOREIGN KEY (organizacion_id) REFERENCES organizacion_social_organizaciones(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2030 (class 2606 OID 1593570)
-- Name: auth_group_permiss_permission_id_23962d04_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_23962d04_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2031 (class 2606 OID 1593575)
-- Name: auth_group_permissions_group_id_58c48ba9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_58c48ba9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2032 (class 2606 OID 1593580)
-- Name: auth_permiss_content_type_id_51277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_51277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2033 (class 2606 OID 1593585)
-- Name: auth_user_groups_group_id_30a071c9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_30a071c9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2034 (class 2606 OID 1593590)
-- Name: auth_user_groups_user_id_24702650_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_24702650_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2035 (class 2606 OID 1593595)
-- Name: auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2036 (class 2606 OID 1593600)
-- Name: auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2037 (class 2606 OID 1593605)
-- Name: dependen_institucion_id_8322098_fk_instituciones_institucion_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dependencias_dependencia
    ADD CONSTRAINT dependen_institucion_id_8322098_fk_instituciones_institucion_id FOREIGN KEY (institucion_id) REFERENCES instituciones_institucion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2038 (class 2606 OID 1593610)
-- Name: dependencias_dependenci_user_create_id_5701b99f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dependencias_dependencia
    ADD CONSTRAINT dependencias_dependenci_user_create_id_5701b99f_fk_auth_user_id FOREIGN KEY (user_create_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2039 (class 2606 OID 1593615)
-- Name: dependencias_dependencia_user_update_id_3670ad4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dependencias_dependencia
    ADD CONSTRAINT dependencias_dependencia_user_update_id_3670ad4_fk_auth_user_id FOREIGN KEY (user_update_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2040 (class 2606 OID 1593620)
-- Name: django_admin_content_type_id_5151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_5151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2041 (class 2606 OID 1593625)
-- Name: django_admin_log_user_id_1c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_1c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2042 (class 2606 OID 1593630)
-- Name: grupo_etareo_grupo_etar_user_create_id_16f4bf49_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_etareo_grupo_etareo
    ADD CONSTRAINT grupo_etareo_grupo_etar_user_create_id_16f4bf49_fk_auth_user_id FOREIGN KEY (user_create_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2043 (class 2606 OID 1593635)
-- Name: grupo_etareo_grupo_etar_user_update_id_656f2444_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_etareo_grupo_etareo
    ADD CONSTRAINT grupo_etareo_grupo_etar_user_update_id_656f2444_fk_auth_user_id FOREIGN KEY (user_update_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2044 (class 2606 OID 1593640)
-- Name: instituciones_i_estado_id_2ded4c46_fk_estados_estado_cod_estado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY instituciones_institucion
    ADD CONSTRAINT instituciones_i_estado_id_2ded4c46_fk_estados_estado_cod_estado FOREIGN KEY (estado_id) REFERENCES estados_estado(cod_estado) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2045 (class 2606 OID 1593645)
-- Name: instituciones_instituci_user_create_id_7f620695_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY instituciones_institucion
    ADD CONSTRAINT instituciones_instituci_user_create_id_7f620695_fk_auth_user_id FOREIGN KEY (user_create_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2046 (class 2606 OID 1593650)
-- Name: instituciones_instituci_user_update_id_3abfeb6a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY instituciones_institucion
    ADD CONSTRAINT instituciones_instituci_user_update_id_3abfeb6a_fk_auth_user_id FOREIGN KEY (user_update_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2047 (class 2606 OID 1593655)
-- Name: login_perfilesusuario_user_id_8e2e412_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY login_perfilesusuario
    ADD CONSTRAINT login_perfilesusuario_user_id_8e2e412_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2048 (class 2606 OID 1593660)
-- Name: municipios_muni_estado_id_77ac1852_fk_estados_estado_cod_estado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY municipios_municipio
    ADD CONSTRAINT municipios_muni_estado_id_77ac1852_fk_estados_estado_cod_estado FOREIGN KEY (estado_id) REFERENCES estados_estado(cod_estado) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2049 (class 2606 OID 1593665)
-- Name: parroquias_parr_estado_id_306d809c_fk_estados_estado_cod_estado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parroquias_parroquia
    ADD CONSTRAINT parroquias_parr_estado_id_306d809c_fk_estados_estado_cod_estado FOREIGN KEY (estado_id) REFERENCES estados_estado(cod_estado) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2051 (class 2606 OID 1593670)
-- Name: solici_sector_lab_id_568b8a8_fk_sector_laboral_sectorlaboral_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solici_sector_lab_id_568b8a8_fk_sector_laboral_sectorlaboral_id FOREIGN KEY (sector_lab_id) REFERENCES sector_laboral_sectorlaboral(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2052 (class 2606 OID 1593675)
-- Name: solicit_departamento_id_589cc04e_fk_dependencias_dependencia_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solicit_departamento_id_589cc04e_fk_dependencias_dependencia_id FOREIGN KEY (departamento_id) REFERENCES dependencias_dependencia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2053 (class 2606 OID 1593680)
-- Name: solicit_institucion_id_7dd061cc_fk_instituciones_institucion_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solicit_institucion_id_7dd061cc_fk_instituciones_institucion_id FOREIGN KEY (institucion_id) REFERENCES instituciones_institucion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2054 (class 2606 OID 1593685)
-- Name: solicit_tipo_edu_id_714a79d7_fk_tipo_educacion_tipoeducacion_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solicit_tipo_edu_id_714a79d7_fk_tipo_educacion_tipoeducacion_id FOREIGN KEY (tipo_edu_id) REFERENCES tipo_educacion_tipoeducacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2055 (class 2606 OID 1593690)
-- Name: solicitud_regi_ocupacion_id_1c567ec_fk_ocupacion_ocupaciones_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solicitud_regi_ocupacion_id_1c567ec_fk_ocupacion_ocupaciones_id FOREIGN KEY (ocupacion_id) REFERENCES ocupacion_ocupaciones(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2056 (class 2606 OID 1593695)
-- Name: solicitud_regis_estado_id_5437c534_fk_estados_estado_cod_estado; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solicitud_regis_estado_id_5437c534_fk_estados_estado_cod_estado FOREIGN KEY (estado_id) REFERENCES estados_estado(cod_estado) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2057 (class 2606 OID 1593700)
-- Name: solicitud_registros_motivo_id_5ae86a4a_fk_motivo_motivos_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solicitud_registros_motivo_id_5ae86a4a_fk_motivo_motivos_id FOREIGN KEY (motivo_id) REFERENCES motivo_motivos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2058 (class 2606 OID 1593705)
-- Name: solicitud_registros_user_create_id_1de62efd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solicitud_registros
    ADD CONSTRAINT solicitud_registros_user_create_id_1de62efd_fk_auth_user_id FOREIGN KEY (user_create_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2059 (class 2606 OID 1593710)
-- Name: trabaja_institucion_id_19afe504_fk_instituciones_institucion_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trabajadores_trabajadores
    ADD CONSTRAINT trabaja_institucion_id_19afe504_fk_instituciones_institucion_id FOREIGN KEY (institucion_id) REFERENCES instituciones_institucion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2060 (class 2606 OID 1593715)
-- Name: trabajadores_trabajadore_trabajador_id_542da774_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trabajadores_trabajadores
    ADD CONSTRAINT trabajadores_trabajadore_trabajador_id_542da774_fk_auth_user_id FOREIGN KEY (trabajador_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2016-07-25 09:59:23 PYT

--
-- PostgreSQL database dump complete
--

