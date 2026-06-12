--
-- PostgreSQL database dump
--

\restrict lbdmX8x9vVAoxKXmHA0Zhtb4vewJ7kVenyFdwrDUNLAxSgZkKCP52gWvuTwu4sH

-- Dumped from database version 17.10 (98a80fa)
-- Dumped by pg_dump version 17.10

-- Started on 2026-06-12 12:38:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 248 (class 1259 OID 24609)
-- Name: archivos; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.archivos (
    id integer NOT NULL,
    ruta character varying(1000) NOT NULL,
    tipo character varying(100) NOT NULL,
    size integer NOT NULL,
    fecha timestamp with time zone,
    "tieneCopyright" boolean DEFAULT false NOT NULL,
    "rutaProtegida" character varying(1000),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "publicacionId" integer
);


ALTER TABLE public.archivos OWNER TO neondb_owner;

--
-- TOC entry 247 (class 1259 OID 24608)
-- Name: archivos_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.archivos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archivos_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 247
-- Name: archivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.archivos_id_seq OWNED BY public.archivos.id;


--
-- TOC entry 271 (class 1259 OID 74341)
-- Name: coleccion_publicacion; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.coleccion_publicacion (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "coleccionId" integer NOT NULL,
    "publicacionId" integer NOT NULL
);


ALTER TABLE public.coleccion_publicacion OWNER TO neondb_owner;

--
-- TOC entry 266 (class 1259 OID 49294)
-- Name: colecciones; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.colecciones (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer
);


ALTER TABLE public.colecciones OWNER TO neondb_owner;

--
-- TOC entry 265 (class 1259 OID 49293)
-- Name: colecciones_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.colecciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.colecciones_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 265
-- Name: colecciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.colecciones_id_seq OWNED BY public.colecciones.id;


--
-- TOC entry 250 (class 1259 OID 32769)
-- Name: comentarios; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.comentarios (
    id integer NOT NULL,
    contenido text NOT NULL,
    fecha timestamp with time zone,
    "estadoComentario" character varying(255) DEFAULT 'activo'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "publicacionId" integer
);


ALTER TABLE public.comentarios OWNER TO neondb_owner;

--
-- TOC entry 249 (class 1259 OID 32768)
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comentarios_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 249
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;


--
-- TOC entry 259 (class 1259 OID 40986)
-- Name: denuncias; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.denuncias (
    id integer NOT NULL,
    motivo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    estado character varying(255) DEFAULT 'pendiente'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "publicacionId" integer
);


ALTER TABLE public.denuncias OWNER TO neondb_owner;

--
-- TOC entry 261 (class 1259 OID 49153)
-- Name: denuncias_comentarios; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.denuncias_comentarios (
    id integer NOT NULL,
    motivo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    estado character varying(255) DEFAULT 'pendiente'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "comentarioId" integer
);


ALTER TABLE public.denuncias_comentarios OWNER TO neondb_owner;

--
-- TOC entry 260 (class 1259 OID 49152)
-- Name: denuncias_comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.denuncias_comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.denuncias_comentarios_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 260
-- Name: denuncias_comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.denuncias_comentarios_id_seq OWNED BY public.denuncias_comentarios.id;


--
-- TOC entry 258 (class 1259 OID 40985)
-- Name: denuncias_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.denuncias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.denuncias_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 258
-- Name: denuncias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.denuncias_id_seq OWNED BY public.denuncias.id;


--
-- TOC entry 256 (class 1259 OID 40962)
-- Name: etiquetas; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.etiquetas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.etiquetas OWNER TO neondb_owner;

--
-- TOC entry 255 (class 1259 OID 40961)
-- Name: etiquetas_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.etiquetas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.etiquetas_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 255
-- Name: etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.etiquetas_id_seq OWNED BY public.etiquetas.id;


--
-- TOC entry 268 (class 1259 OID 49308)
-- Name: intereses; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.intereses (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "publicacionId" integer,
    estado character varying(255) DEFAULT 'pendiente'::character varying NOT NULL,
    "usuarioInteresadoId" integer
);


ALTER TABLE public.intereses OWNER TO neondb_owner;

--
-- TOC entry 267 (class 1259 OID 49307)
-- Name: intereses_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.intereses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.intereses_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 267
-- Name: intereses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.intereses_id_seq OWNED BY public.intereses.id;


--
-- TOC entry 252 (class 1259 OID 32789)
-- Name: likes; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "usuarioId" integer NOT NULL,
    "publicacionId" integer NOT NULL,
    fecha timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.likes OWNER TO neondb_owner;

--
-- TOC entry 251 (class 1259 OID 32788)
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.likes_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 251
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- TOC entry 270 (class 1259 OID 49327)
-- Name: mensajes; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.mensajes (
    id integer NOT NULL,
    contenido text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "emisorId" integer,
    "receptorId" integer
);


ALTER TABLE public.mensajes OWNER TO neondb_owner;

--
-- TOC entry 269 (class 1259 OID 49326)
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.mensajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mensajes_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 269
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.mensajes_id_seq OWNED BY public.mensajes.id;


--
-- TOC entry 264 (class 1259 OID 49279)
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.notificaciones (
    id integer NOT NULL,
    mensaje character varying(255) NOT NULL,
    leida boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer
);


ALTER TABLE public.notificaciones OWNER TO neondb_owner;

--
-- TOC entry 263 (class 1259 OID 49278)
-- Name: notificaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.notificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificaciones_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 263
-- Name: notificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.notificaciones_id_seq OWNED BY public.notificaciones.id;


--
-- TOC entry 246 (class 1259 OID 24592)
-- Name: publicaciones; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.publicaciones (
    id integer NOT NULL,
    descripcion text NOT NULL,
    ubicacion character varying(255) DEFAULT ''::character varying,
    fecha timestamp with time zone,
    comentarios_habilitados boolean DEFAULT true NOT NULL,
    "estadoPublicacion" character varying(255) DEFAULT 'activa'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer
);


ALTER TABLE public.publicaciones OWNER TO neondb_owner;

--
-- TOC entry 245 (class 1259 OID 24591)
-- Name: publicaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.publicaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publicaciones_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 245
-- Name: publicaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.publicaciones_id_seq OWNED BY public.publicaciones.id;


--
-- TOC entry 257 (class 1259 OID 40970)
-- Name: publicacionetiqueta; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.publicacionetiqueta (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "publicacionId" integer NOT NULL,
    "etiquetaId" integer NOT NULL
);


ALTER TABLE public.publicacionetiqueta OWNER TO neondb_owner;

--
-- TOC entry 262 (class 1259 OID 49260)
-- Name: seguidores; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.seguidores (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "seguidorId" integer,
    "seguidoId" integer
);


ALTER TABLE public.seguidores OWNER TO neondb_owner;

--
-- TOC entry 244 (class 1259 OID 24577)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    dni integer NOT NULL,
    password character varying(255) NOT NULL,
    rol character varying(255) DEFAULT 'usuario'::character varying NOT NULL,
    estado character varying(255) DEFAULT 'activo'::character varying NOT NULL,
    fecha_registro timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.usuarios OWNER TO neondb_owner;

--
-- TOC entry 243 (class 1259 OID 24576)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 243
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 254 (class 1259 OID 32806)
-- Name: valoraciones; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.valoraciones (
    id integer NOT NULL,
    valor integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "archivoId" integer
);


ALTER TABLE public.valoraciones OWNER TO neondb_owner;

--
-- TOC entry 253 (class 1259 OID 32805)
-- Name: valoraciones_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.valoraciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.valoraciones_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 253
-- Name: valoraciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.valoraciones_id_seq OWNED BY public.valoraciones.id;


--
-- TOC entry 3333 (class 2604 OID 24612)
-- Name: archivos id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.archivos ALTER COLUMN id SET DEFAULT nextval('public.archivos_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 49297)
-- Name: colecciones id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.colecciones ALTER COLUMN id SET DEFAULT nextval('public.colecciones_id_seq'::regclass);


--
-- TOC entry 3335 (class 2604 OID 32772)
-- Name: comentarios id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 40989)
-- Name: denuncias id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias ALTER COLUMN id SET DEFAULT nextval('public.denuncias_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 49156)
-- Name: denuncias_comentarios id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias_comentarios ALTER COLUMN id SET DEFAULT nextval('public.denuncias_comentarios_id_seq'::regclass);


--
-- TOC entry 3339 (class 2604 OID 40965)
-- Name: etiquetas id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas ALTER COLUMN id SET DEFAULT nextval('public.etiquetas_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 49311)
-- Name: intereses id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.intereses ALTER COLUMN id SET DEFAULT nextval('public.intereses_id_seq'::regclass);


--
-- TOC entry 3337 (class 2604 OID 32792)
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 49330)
-- Name: mensajes id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.mensajes ALTER COLUMN id SET DEFAULT nextval('public.mensajes_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 49282)
-- Name: notificaciones id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id SET DEFAULT nextval('public.notificaciones_id_seq'::regclass);


--
-- TOC entry 3329 (class 2604 OID 24595)
-- Name: publicaciones id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicaciones ALTER COLUMN id SET DEFAULT nextval('public.publicaciones_id_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 24580)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3338 (class 2604 OID 32809)
-- Name: valoraciones id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones ALTER COLUMN id SET DEFAULT nextval('public.valoraciones_id_seq'::regclass);


--
-- TOC entry 3746 (class 0 OID 24609)
-- Dependencies: 248
-- Data for Name: archivos; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.archivos VALUES (1, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781131277/fotaza/dkaeyjb0so0fl2lkjitk.jpg', 'image/jpeg', 31715, '2026-06-10 22:41:17.983+00', false, NULL, '2026-06-10 22:41:17.983+00', '2026-06-10 22:41:17.983+00', 2, 2);
INSERT INTO public.archivos VALUES (2, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781134881/fotaza/rahc9sircct4qy52m4jy.jpg', 'image/jpeg', 7180, '2026-06-10 23:41:22.321+00', false, NULL, '2026-06-10 23:41:22.322+00', '2026-06-10 23:41:22.322+00', 2, 3);
INSERT INTO public.archivos VALUES (3, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781134882/fotaza/uwptnfo7lotssahe6hvy.jpg', 'image/jpeg', 5726, '2026-06-10 23:41:22.738+00', false, NULL, '2026-06-10 23:41:22.738+00', '2026-06-10 23:41:22.738+00', 2, 3);
INSERT INTO public.archivos VALUES (4, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781134924/fotaza/n1jizmnmqhvpkmdwhldi.jpg', 'image/jpeg', 5726, '2026-06-10 23:42:05.195+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781134924/fotaza/n1jizmnmqhvpkmdwhldi.jpg', '2026-06-10 23:42:05.195+00', '2026-06-10 23:42:05.195+00', 2, 4);
INSERT INTO public.archivos VALUES (5, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781135346/fotaza/runphtjixebbbmbevmue.jpg', 'image/jpeg', 7180, '2026-06-10 23:49:07.291+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781135346/fotaza/runphtjixebbbmbevmue.jpg', '2026-06-10 23:49:07.291+00', '2026-06-10 23:49:07.291+00', 2, 5);
INSERT INTO public.archivos VALUES (6, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781135347/fotaza/y7lfkcj84evkydmw9ghi.jpg', 'image/jpeg', 31715, '2026-06-10 23:49:07.961+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781135347/fotaza/y7lfkcj84evkydmw9ghi.jpg', '2026-06-10 23:49:07.961+00', '2026-06-10 23:49:07.961+00', 2, 5);
INSERT INTO public.archivos VALUES (7, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781135891/fotaza/h2yreaxwwfkqyta0l2dj.jpg', 'image/jpeg', 50286, '2026-06-10 23:58:12.301+00', false, NULL, '2026-06-10 23:58:12.302+00', '2026-06-10 23:58:12.302+00', 1, 6);
INSERT INTO public.archivos VALUES (8, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781135992/fotaza/d1knxcmusbyjcmpsbdwg.jpg', 'image/jpeg', 7537, '2026-06-10 23:59:52.505+00', false, NULL, '2026-06-10 23:59:52.505+00', '2026-06-10 23:59:52.505+00', 1, 7);
INSERT INTO public.archivos VALUES (9, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781135992/fotaza/ztprfpoz7vjb57e1gugq.jpg', 'image/jpeg', 13367, '2026-06-10 23:59:53.063+00', false, NULL, '2026-06-10 23:59:53.063+00', '2026-06-10 23:59:53.063+00', 1, 7);
INSERT INTO public.archivos VALUES (10, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136251/fotaza/skusj0kwoanbhpthpmum.jpg', 'image/jpeg', 5908, '2026-06-11 00:04:11.796+00', false, NULL, '2026-06-11 00:04:11.797+00', '2026-06-11 00:04:11.797+00', 3, 8);
INSERT INTO public.archivos VALUES (11, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136281/fotaza/k3l3xrhm0owthxfkpqbt.jpg', 'image/jpeg', 5852, '2026-06-11 00:04:41.863+00', false, NULL, '2026-06-11 00:04:41.863+00', '2026-06-11 00:04:41.863+00', 3, 9);
INSERT INTO public.archivos VALUES (12, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136309/fotaza/ec1cbhwg1epz3np78xlx.jpg', 'image/jpeg', 4427, '2026-06-11 00:05:09.931+00', false, NULL, '2026-06-11 00:05:09.931+00', '2026-06-11 00:05:09.931+00', 3, 10);
INSERT INTO public.archivos VALUES (13, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136332/fotaza/pwouxonlifxvacw000tf.jpg', 'image/jpeg', 5852, '2026-06-11 00:05:33.406+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136332/fotaza/pwouxonlifxvacw000tf.jpg', '2026-06-11 00:05:33.406+00', '2026-06-11 00:05:33.406+00', 3, 11);
INSERT INTO public.archivos VALUES (14, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136333/fotaza/n97kzwmpoxwjuyfcquqc.jpg', 'image/jpeg', 5908, '2026-06-11 00:05:33.894+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136333/fotaza/n97kzwmpoxwjuyfcquqc.jpg', '2026-06-11 00:05:33.894+00', '2026-06-11 00:05:33.894+00', 3, 11);
INSERT INTO public.archivos VALUES (15, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136333/fotaza/aklruk1fwx55mbxersrs.jpg', 'image/jpeg', 4427, '2026-06-11 00:05:34.349+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136333/fotaza/aklruk1fwx55mbxersrs.jpg', '2026-06-11 00:05:34.35+00', '2026-06-11 00:05:34.35+00', 3, 11);
INSERT INTO public.archivos VALUES (16, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136612/fotaza/ippvbnz1hltswze11nsq.jpg', 'image/jpeg', 6114, '2026-06-11 00:10:13.093+00', false, NULL, '2026-06-11 00:10:13.093+00', '2026-06-11 00:10:13.093+00', 4, 12);
INSERT INTO public.archivos VALUES (17, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136637/fotaza/w1qhcn7fgitbum8ibxaq.jpg', 'image/jpeg', 5846, '2026-06-11 00:10:37.866+00', false, NULL, '2026-06-11 00:10:37.866+00', '2026-06-11 00:10:37.866+00', 4, 13);
INSERT INTO public.archivos VALUES (18, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136665/fotaza/ogg3z7howm8xdpcjltf5.jpg', 'image/jpeg', 7817, '2026-06-11 00:11:06.132+00', false, NULL, '2026-06-11 00:11:06.133+00', '2026-06-11 00:11:06.133+00', 4, 14);
INSERT INTO public.archivos VALUES (19, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136691/fotaza/fvmfpq6zz7ccphtd5w5z.jpg', 'image/jpeg', 6114, '2026-06-11 00:11:31.553+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136691/fotaza/fvmfpq6zz7ccphtd5w5z.jpg', '2026-06-11 00:11:31.553+00', '2026-06-11 00:11:31.553+00', 4, 15);
INSERT INTO public.archivos VALUES (20, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136691/fotaza/qxhacardc85sgi9q9u7s.jpg', 'image/jpeg', 5846, '2026-06-11 00:11:32.059+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136691/fotaza/qxhacardc85sgi9q9u7s.jpg', '2026-06-11 00:11:32.059+00', '2026-06-11 00:11:32.059+00', 4, 15);
INSERT INTO public.archivos VALUES (21, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136692/fotaza/u0arifay9sloqs0xaud7.jpg', 'image/jpeg', 7817, '2026-06-11 00:11:32.561+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781136692/fotaza/u0arifay9sloqs0xaud7.jpg', '2026-06-11 00:11:32.561+00', '2026-06-11 00:11:32.561+00', 4, 15);
INSERT INTO public.archivos VALUES (22, 'https://res.cloudinary.com/dkqcomysb/video/upload/v1781137329/fotaza/zxyigm8su8ynvvormai5.mp4', 'video/mp4', 19508641, '2026-06-11 00:22:11.1+00', false, NULL, '2026-06-11 00:22:11.1+00', '2026-06-11 00:22:11.1+00', 5, 16);
INSERT INTO public.archivos VALUES (23, 'https://res.cloudinary.com/dkqcomysb/video/upload/v1781137666/fotaza/vpa6chv9hiaintvvd9f7.mp4', 'video/mp4', 19508641, '2026-06-11 00:27:48.363+00', true, NULL, '2026-06-11 00:27:48.363+00', '2026-06-11 00:27:48.363+00', 5, 17);
INSERT INTO public.archivos VALUES (24, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781206007/fotaza/ksstg1aqo1po4cut4sw2.jpg', 'image/jpeg', 2061717, '2026-06-11 19:26:48.391+00', false, NULL, '2026-06-11 19:26:48.391+00', '2026-06-11 19:26:48.391+00', 5, 18);
INSERT INTO public.archivos VALUES (25, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781206170/fotaza/psy4xqierbac3hpgnwru.jpg', 'image/jpeg', 19506711, '2026-06-11 19:29:31.11+00', true, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781206170/fotaza/psy4xqierbac3hpgnwru.jpg', '2026-06-11 19:29:31.111+00', '2026-06-11 19:29:31.111+00', 5, 19);
INSERT INTO public.archivos VALUES (26, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781215206/fotaza/ibmzyhzhh3dzj6mfocrf.jpg', 'image/jpeg', 2914101, '2026-06-11 22:00:07.792+00', false, NULL, '2026-06-11 22:00:07.793+00', '2026-06-11 22:00:07.793+00', 7, 20);
INSERT INTO public.archivos VALUES (27, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781215313/fotaza/fzaa38sbydvj7n517ax8.jpg', 'image/jpeg', 2536052, '2026-06-11 22:01:54.24+00', false, NULL, '2026-06-11 22:01:54.24+00', '2026-06-11 22:01:54.24+00', 7, 21);
INSERT INTO public.archivos VALUES (28, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781215573/fotaza/rlbt5v5heucftep1oeyf.jpg', 'image/jpeg', 3911625, '2026-06-11 22:06:14.423+00', false, NULL, '2026-06-11 22:06:14.424+00', '2026-06-11 22:06:14.424+00', 7, 22);
INSERT INTO public.archivos VALUES (29, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781215791/fotaza/zje0gmzh1ykdw0a7i2iy.jpg', 'image/jpeg', 3170730, '2026-06-11 22:09:52.324+00', false, NULL, '2026-06-11 22:09:52.324+00', '2026-06-11 22:09:52.324+00', 7, 23);
INSERT INTO public.archivos VALUES (30, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781228830/fotaza/hmpkgkebkrzr1pwjpoth.jpg', 'image/jpeg', 73866, '2026-06-12 01:47:10.561+00', false, NULL, '2026-06-12 01:47:10.561+00', '2026-06-12 01:47:10.561+00', 8, 24);
INSERT INTO public.archivos VALUES (31, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781228891/fotaza/gyxspil44hhz9an6xjtk.jpg', 'image/jpeg', 159480, '2026-06-12 01:48:12.828+00', false, NULL, '2026-06-12 01:48:12.828+00', '2026-06-12 01:48:12.828+00', 8, 25);
INSERT INTO public.archivos VALUES (32, 'https://res.cloudinary.com/dkqcomysb/image/upload/v1781228980/fotaza/sjc7nzfdjqax3zaqmyhp.jpg', 'image/jpeg', 85643, '2026-06-12 01:49:41.347+00', false, NULL, '2026-06-12 01:49:41.348+00', '2026-06-12 01:49:41.348+00', 8, 26);
INSERT INTO public.archivos VALUES (33, 'https://res.cloudinary.com/dkqcomysb/video/upload/v1781229138/fotaza/npzlsr7jjfgdhzemqt1m.mp4', 'video/mp4', 1863153, '2026-06-12 01:52:19.675+00', false, NULL, '2026-06-12 01:52:19.675+00', '2026-06-12 01:52:19.675+00', 8, 27);


--
-- TOC entry 3769 (class 0 OID 74341)
-- Dependencies: 271
-- Data for Name: coleccion_publicacion; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.coleccion_publicacion VALUES ('2026-06-11 00:42:29.771+00', '2026-06-11 00:42:29.771+00', 1, 3);
INSERT INTO public.coleccion_publicacion VALUES ('2026-06-11 19:44:44.335+00', '2026-06-11 19:44:44.335+00', 3, 7);


--
-- TOC entry 3764 (class 0 OID 49294)
-- Dependencies: 266
-- Data for Name: colecciones; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.colecciones VALUES (1, 'Autos', '2026-06-11 00:41:25.832+00', '2026-06-11 00:41:25.832+00', 3);
INSERT INTO public.colecciones VALUES (3, 'Flores', '2026-06-11 19:44:10.07+00', '2026-06-11 19:44:10.07+00', 5);


--
-- TOC entry 3748 (class 0 OID 32769)
-- Dependencies: 250
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.comentarios VALUES (1, 'que lindo perros!!', '2026-06-11 00:32:49.292+00', 'activo', '2026-06-11 00:32:49.292+00', '2026-06-11 00:32:49.292+00', 5, 14);
INSERT INTO public.comentarios VALUES (2, 'Bello!', '2026-06-11 00:34:44.778+00', 'activo', '2026-06-11 00:34:44.778+00', '2026-06-11 00:34:44.778+00', 5, 9);
INSERT INTO public.comentarios VALUES (3, 'Es un Pug?', '2026-06-11 19:31:10.953+00', 'activo', '2026-06-11 19:31:10.953+00', '2026-06-11 19:31:10.953+00', 5, 13);


--
-- TOC entry 3757 (class 0 OID 40986)
-- Dependencies: 259
-- Data for Name: denuncias; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.denuncias VALUES (1, 'spam', 'Publicacion Falsa', 'pendiente', '2026-06-11 20:22:14.909+00', '2026-06-11 20:22:14.909+00', 5, 13);
INSERT INTO public.denuncias VALUES (2, 'spam', 'Publicacion falsa', 'pendiente', '2026-06-11 20:23:07.568+00', '2026-06-11 20:23:07.568+00', 3, 13);
INSERT INTO public.denuncias VALUES (3, 'spam', 'publicacion falsa', 'pendiente', '2026-06-11 20:23:49.708+00', '2026-06-11 20:23:49.708+00', 2, 13);
INSERT INTO public.denuncias VALUES (4, 'informacion_falsa', 'Publicacion falsa', 'pendiente', '2026-06-11 20:29:14.25+00', '2026-06-11 20:29:14.25+00', 5, 9);
INSERT INTO public.denuncias VALUES (5, 'spam', 'Foto falsa', 'pendiente', '2026-06-11 20:29:55.988+00', '2026-06-11 20:29:55.988+00', 2, 9);
INSERT INTO public.denuncias VALUES (6, 'contenido_ofensivo', 'Foto falsa', 'pendiente', '2026-06-11 20:30:44.494+00', '2026-06-11 20:30:44.494+00', 4, 9);


--
-- TOC entry 3759 (class 0 OID 49153)
-- Dependencies: 261
-- Data for Name: denuncias_comentarios; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.denuncias_comentarios VALUES (1, 'comentario_inapropiado', 'Comentario denunciado por un usuario', 'pendiente', '2026-06-11 00:43:29.144+00', '2026-06-11 00:43:29.144+00', 3, 1);
INSERT INTO public.denuncias_comentarios VALUES (2, 'comentario_inapropiado', 'Comentario denunciado por un usuario', 'pendiente', '2026-06-11 20:20:36.102+00', '2026-06-11 20:20:36.102+00', 1, 1);


--
-- TOC entry 3754 (class 0 OID 40962)
-- Dependencies: 256
-- Data for Name: etiquetas; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.etiquetas VALUES (1, 'auto', '2026-06-10 22:41:17.997+00', '2026-06-10 22:41:17.997+00');
INSERT INTO public.etiquetas VALUES (2, 'flores', '2026-06-10 23:58:12.316+00', '2026-06-10 23:58:12.316+00');
INSERT INTO public.etiquetas VALUES (3, 'gatos', '2026-06-11 00:04:11.808+00', '2026-06-11 00:04:11.808+00');
INSERT INTO public.etiquetas VALUES (4, 'perros', '2026-06-11 00:10:13.102+00', '2026-06-11 00:10:13.102+00');
INSERT INTO public.etiquetas VALUES (5, 'playa', '2026-06-11 00:22:11.112+00', '2026-06-11 00:22:11.112+00');
INSERT INTO public.etiquetas VALUES (6, 'gimnasio', '2026-06-11 19:26:48.408+00', '2026-06-11 19:26:48.408+00');
INSERT INTO public.etiquetas VALUES (7, 'paisaje', '2026-06-11 22:00:07.805+00', '2026-06-11 22:00:07.805+00');
INSERT INTO public.etiquetas VALUES (8, 'naturaleza', '2026-06-11 22:06:14.435+00', '2026-06-11 22:06:14.435+00');


--
-- TOC entry 3766 (class 0 OID 49308)
-- Dependencies: 268
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.intereses VALUES (1, '2026-06-11 00:34:10.121+00', '2026-06-11 00:34:10.121+00', 9, 'pendiente', 5);
INSERT INTO public.intereses VALUES (2, '2026-06-11 19:34:48.742+00', '2026-06-11 19:34:48.742+00', 13, 'pendiente', 5);


--
-- TOC entry 3750 (class 0 OID 32789)
-- Dependencies: 252
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.likes VALUES (1, 5, 15, '2026-06-11 00:31:28.423+00', '2026-06-11 00:31:28.423+00', '2026-06-11 00:31:28.423+00');
INSERT INTO public.likes VALUES (2, 5, 14, '2026-06-11 00:31:43.291+00', '2026-06-11 00:31:43.291+00', '2026-06-11 00:31:43.291+00');
INSERT INTO public.likes VALUES (3, 1, 14, '2026-06-11 21:53:19.813+00', '2026-06-11 21:53:19.814+00', '2026-06-11 21:53:19.814+00');
INSERT INTO public.likes VALUES (4, 8, 14, '2026-06-12 01:55:34.396+00', '2026-06-12 01:55:34.396+00', '2026-06-12 01:55:34.396+00');
INSERT INTO public.likes VALUES (5, 8, 23, '2026-06-12 01:56:22.868+00', '2026-06-12 01:56:22.868+00', '2026-06-12 01:56:22.868+00');
INSERT INTO public.likes VALUES (6, 8, 13, '2026-06-12 01:56:57.448+00', '2026-06-12 01:56:57.448+00', '2026-06-12 01:56:57.448+00');


--
-- TOC entry 3768 (class 0 OID 49327)
-- Dependencies: 270
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.mensajes VALUES (1, 'Esta en adopción ', '2026-06-11 00:39:13.446+00', '2026-06-11 00:39:13.446+00', 3, 5);
INSERT INTO public.mensajes VALUES (2, 'En donde vivis?', '2026-06-11 00:39:51.461+00', '2026-06-11 00:39:51.461+00', 5, 3);
INSERT INTO public.mensajes VALUES (3, 'En San Luis', '2026-06-11 00:40:44.672+00', '2026-06-11 00:40:44.672+00', 3, 5);
INSERT INTO public.mensajes VALUES (4, 'Si, es un Pug', '2026-06-11 19:36:56.435+00', '2026-06-11 19:36:56.435+00', 4, 5);


--
-- TOC entry 3762 (class 0 OID 49279)
-- Dependencies: 264
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.notificaciones VALUES (1, 'Natalia comenzó a seguirte', false, '2026-06-11 00:33:27.162+00', '2026-06-11 00:33:27.162+00', 4);
INSERT INTO public.notificaciones VALUES (2, 'Natalia comenzó a seguirte', false, '2026-06-11 00:37:19.008+00', '2026-06-11 00:37:19.008+00', 3);
INSERT INTO public.notificaciones VALUES (3, 'Natalia comenzó a seguirte', false, '2026-06-11 19:48:03.18+00', '2026-06-11 19:48:03.18+00', 1);


--
-- TOC entry 3744 (class 0 OID 24592)
-- Dependencies: 246
-- Data for Name: publicaciones; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.publicaciones VALUES (1, 'Auto de Coleccion ', '', '2026-06-10 22:29:16.233+00', true, 'activa', '2026-06-10 22:29:16.234+00', '2026-06-10 22:29:16.234+00', 2);
INSERT INTO public.publicaciones VALUES (2, 'Auto de coleccion', '', '2026-06-10 22:41:17.169+00', true, 'activa', '2026-06-10 22:41:17.17+00', '2026-06-10 22:41:17.17+00', 2);
INSERT INTO public.publicaciones VALUES (3, 'Coleccion ', '', '2026-06-10 23:41:21.788+00', true, 'activa', '2026-06-10 23:41:21.789+00', '2026-06-10 23:41:21.789+00', 2);
INSERT INTO public.publicaciones VALUES (4, 'Auto rojo', '', '2026-06-10 23:42:04.651+00', true, 'activa', '2026-06-10 23:42:04.651+00', '2026-06-10 23:42:04.651+00', 2);
INSERT INTO public.publicaciones VALUES (5, 'NyV', '', '2026-06-10 23:49:06.678+00', true, 'activa', '2026-06-10 23:49:06.678+00', '2026-06-10 23:49:06.678+00', 2);
INSERT INTO public.publicaciones VALUES (6, 'Rosas Rojas', '', '2026-06-10 23:58:11.806+00', true, 'activa', '2026-06-10 23:58:11.806+00', '2026-06-10 23:58:11.806+00', 1);
INSERT INTO public.publicaciones VALUES (7, 'Flores Varias', '', '2026-06-10 23:59:51.926+00', true, 'activa', '2026-06-10 23:59:51.926+00', '2026-06-10 23:59:51.926+00', 1);
INSERT INTO public.publicaciones VALUES (8, 'Gato Gris', '', '2026-06-11 00:04:11.204+00', true, 'activa', '2026-06-11 00:04:11.204+00', '2026-06-11 00:04:11.204+00', 3);
INSERT INTO public.publicaciones VALUES (10, 'Gatos', '', '2026-06-11 00:05:09.34+00', true, 'activa', '2026-06-11 00:05:09.34+00', '2026-06-11 00:05:09.34+00', 3);
INSERT INTO public.publicaciones VALUES (11, 'Todos', '', '2026-06-11 00:05:32.85+00', true, 'activa', '2026-06-11 00:05:32.85+00', '2026-06-11 00:05:32.85+00', 3);
INSERT INTO public.publicaciones VALUES (12, 'Perro Marron', '', '2026-06-11 00:10:12.615+00', true, 'activa', '2026-06-11 00:10:12.615+00', '2026-06-11 00:10:12.615+00', 4);
INSERT INTO public.publicaciones VALUES (14, 'Perros ', '', '2026-06-11 00:11:05.576+00', true, 'activa', '2026-06-11 00:11:05.576+00', '2026-06-11 00:11:05.576+00', 4);
INSERT INTO public.publicaciones VALUES (15, 'Todos', '', '2026-06-11 00:11:31.077+00', true, 'activa', '2026-06-11 00:11:31.077+00', '2026-06-11 00:11:31.077+00', 4);
INSERT INTO public.publicaciones VALUES (16, 'Recuerdo de Brazil', '', '2026-06-11 00:22:08.959+00', true, 'activa', '2026-06-11 00:22:08.959+00', '2026-06-11 00:22:08.959+00', 5);
INSERT INTO public.publicaciones VALUES (17, 'Censurado', '', '2026-06-11 00:27:45.993+00', false, 'activa', '2026-06-11 00:27:45.994+00', '2026-06-11 00:32:58.899+00', 5);
INSERT INTO public.publicaciones VALUES (19, 'Bici', '', '2026-06-11 19:29:27.72+00', true, 'activa', '2026-06-11 19:29:27.721+00', '2026-06-11 19:29:27.721+00', 5);
INSERT INTO public.publicaciones VALUES (18, 'Gimnasio ', '', '2026-06-11 19:26:47.417+00', false, 'activa', '2026-06-11 19:26:47.418+00', '2026-06-11 19:31:50.153+00', 5);
INSERT INTO public.publicaciones VALUES (13, 'Pug', '', '2026-06-11 00:10:37.383+00', true, 'activa', '2026-06-11 00:10:37.383+00', '2026-06-11 20:27:37.344+00', 4);
INSERT INTO public.publicaciones VALUES (9, 'Gato Blanco', '', '2026-06-11 00:04:41.298+00', true, 'bajada', '2026-06-11 00:04:41.298+00', '2026-06-11 20:31:15.092+00', 3);
INSERT INTO public.publicaciones VALUES (20, 'Atardecer ', '', '2026-06-11 22:00:06.767+00', true, 'activa', '2026-06-11 22:00:06.767+00', '2026-06-11 22:00:06.767+00', 7);
INSERT INTO public.publicaciones VALUES (21, 'Juana Koslay', '', '2026-06-11 22:01:53.566+00', true, 'activa', '2026-06-11 22:01:53.567+00', '2026-06-11 22:01:53.567+00', 7);
INSERT INTO public.publicaciones VALUES (22, 'Nieve', '', '2026-06-11 22:06:13.782+00', true, 'activa', '2026-06-11 22:06:13.782+00', '2026-06-11 22:06:13.782+00', 7);
INSERT INTO public.publicaciones VALUES (23, 'mascotas', '', '2026-06-11 22:09:51.714+00', true, 'activa', '2026-06-11 22:09:51.714+00', '2026-06-11 22:09:51.714+00', 7);
INSERT INTO public.publicaciones VALUES (24, 'Mañana de paseo', '', '2026-06-12 01:47:09.902+00', true, 'activa', '2026-06-12 01:47:09.903+00', '2026-06-12 01:47:09.903+00', 8);
INSERT INTO public.publicaciones VALUES (25, 'Camino al trabajo', '', '2026-06-12 01:48:11.888+00', true, 'activa', '2026-06-12 01:48:11.889+00', '2026-06-12 01:48:11.889+00', 8);
INSERT INTO public.publicaciones VALUES (26, 'Rutina', '', '2026-06-12 01:49:40.677+00', true, 'activa', '2026-06-12 01:49:40.677+00', '2026-06-12 01:49:40.677+00', 8);
INSERT INTO public.publicaciones VALUES (27, 'Conociendo!!', '', '2026-06-12 01:52:18.654+00', true, 'activa', '2026-06-12 01:52:18.654+00', '2026-06-12 01:52:18.654+00', 8);


--
-- TOC entry 3755 (class 0 OID 40970)
-- Dependencies: 257
-- Data for Name: publicacionetiqueta; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.publicacionetiqueta VALUES ('2026-06-10 22:41:18.032+00', '2026-06-10 22:41:18.032+00', 2, 1);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-10 23:41:22.754+00', '2026-06-10 23:41:22.754+00', 3, 1);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-10 23:42:05.22+00', '2026-06-10 23:42:05.22+00', 4, 1);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-10 23:49:07.98+00', '2026-06-10 23:49:07.98+00', 5, 1);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-10 23:58:12.36+00', '2026-06-10 23:58:12.36+00', 6, 2);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-10 23:59:53.081+00', '2026-06-10 23:59:53.081+00', 7, 2);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:04:11.822+00', '2026-06-11 00:04:11.822+00', 8, 3);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:04:41.878+00', '2026-06-11 00:04:41.878+00', 9, 3);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:05:09.948+00', '2026-06-11 00:05:09.948+00', 10, 3);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:05:34.365+00', '2026-06-11 00:05:34.365+00', 11, 3);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:10:13.115+00', '2026-06-11 00:10:13.115+00', 12, 4);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:10:37.883+00', '2026-06-11 00:10:37.883+00', 13, 4);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:11:06.153+00', '2026-06-11 00:11:06.153+00', 14, 4);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:11:32.578+00', '2026-06-11 00:11:32.578+00', 15, 4);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:22:11.126+00', '2026-06-11 00:22:11.126+00', 16, 5);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 00:27:48.378+00', '2026-06-11 00:27:48.378+00', 17, 5);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 19:26:48.469+00', '2026-06-11 19:26:48.469+00', 18, 6);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 19:29:31.133+00', '2026-06-11 19:29:31.133+00', 19, 6);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 22:00:07.847+00', '2026-06-11 22:00:07.847+00', 20, 7);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 22:01:54.258+00', '2026-06-11 22:01:54.258+00', 21, 7);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 22:06:14.448+00', '2026-06-11 22:06:14.448+00', 22, 8);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-11 22:09:52.374+00', '2026-06-11 22:09:52.374+00', 23, 3);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-12 01:47:10.587+00', '2026-06-12 01:47:10.587+00', 24, 7);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-12 01:48:12.848+00', '2026-06-12 01:48:12.848+00', 25, 7);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-12 01:49:41.36+00', '2026-06-12 01:49:41.36+00', 26, 7);
INSERT INTO public.publicacionetiqueta VALUES ('2026-06-12 01:52:19.696+00', '2026-06-12 01:52:19.696+00', 27, 1);


--
-- TOC entry 3760 (class 0 OID 49260)
-- Dependencies: 262
-- Data for Name: seguidores; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.seguidores VALUES ('2026-06-11 00:33:27.153+00', '2026-06-11 00:33:27.153+00', 5, 4);
INSERT INTO public.seguidores VALUES ('2026-06-11 00:37:19.001+00', '2026-06-11 00:37:19.001+00', 5, 3);
INSERT INTO public.seguidores VALUES ('2026-06-11 19:48:03.168+00', '2026-06-11 19:48:03.168+00', 5, 1);


--
-- TOC entry 3742 (class 0 OID 24577)
-- Dependencies: 244
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.usuarios VALUES (5, 'Natalia', 'nati@gmail', 111, '$2b$10$FEfCs1BXOBN1nzkm6/Etp.UIhcAF3Wu7Er.o4XLHIdfqd5tOfsRGm', 'usuario', 'activo', '2026-06-11 00:15:29.357+00', '2026-06-11 00:15:29.357+00', '2026-06-11 00:15:29.357+00');
INSERT INTO public.usuarios VALUES (6, 'Danielito', 'abc@gmail.com', 22654783, '$2b$10$ugLB.OJkM7WG/msmTX5AJ..ChAszo5XGyticErUr72Ab1dTx040DK', 'usuario', 'activo', '2026-06-11 19:01:22.598+00', '2026-06-11 19:01:22.606+00', '2026-06-11 19:01:22.606+00');
INSERT INTO public.usuarios VALUES (2, 'Pedro', 'pedro@hotmail.com', 6666, '$2b$10$uZwhvyRSRz07DNjcAG7s5emYJF8kG7JODSoRUWwmKUfZ8.i52FyxK', 'usuario', 'activo', '2026-06-10 20:54:35.952+00', '2026-06-10 20:54:35.953+00', '2026-06-11 19:14:44.251+00');
INSERT INTO public.usuarios VALUES (3, 'Juan', 'juan@gmail.com', 333, '$2b$10$n.iK.Cr78a1jGLXdS.ARIuoRn3/qCS1z2/0aQV.YYQ9H.3LPF6nyC', 'usuario', 'activo', '2026-06-11 00:03:21.613+00', '2026-06-11 00:03:21.613+00', '2026-06-11 19:14:57.81+00');
INSERT INTO public.usuarios VALUES (4, 'maria', 'maria@gmail.com', 222, '$2b$10$wPeVkvr.HgOuvt3syRSJfOvQRAGSR24EpGWWb2PC63R20Vjc7E9FW', 'usuario', 'activo', '2026-06-11 00:09:19.255+00', '2026-06-11 00:09:19.256+00', '2026-06-11 20:11:55.977+00');
INSERT INTO public.usuarios VALUES (7, 'Dariana', 'darianacon@hotmail.com', 49867544, '$2b$10$jQAA0gLP9IA6Lv1GeGQWnuiB/eyNVdNGCe8USMVJuGjqr5PmaKwPC', 'usuario', 'activo', '2026-06-11 21:57:40.238+00', '2026-06-11 21:57:40.238+00', '2026-06-11 21:57:40.238+00');
INSERT INTO public.usuarios VALUES (8, 'Johana', 'johana@gmail.com', 777, '$2b$10$X7RgH/ebczrmm6k5ERXmieYgcRCI.u6IKT7HjTK2iZyTK/XVj9yh6', 'usuario', 'activo', '2026-06-12 01:46:14.876+00', '2026-06-12 01:46:14.877+00', '2026-06-12 01:46:14.877+00');
INSERT INTO public.usuarios VALUES (1, 'Pablo', 'pablo@gmail.com', 555, '$2b$10$39jbZIDER3cgrcSjK1Jg2OrD72S7AfwpypawCKbTxI7uWoUlKkYV.', 'admin', 'activo', '2026-06-10 20:08:04.901+00', '2026-06-10 20:08:04.902+00', '2026-06-12 03:03:20.15+00');


--
-- TOC entry 3752 (class 0 OID 32806)
-- Dependencies: 254
-- Data for Name: valoraciones; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.valoraciones VALUES (1, 5, '2026-06-11 00:32:06.054+00', '2026-06-11 00:32:06.054+00', 5, 18);
INSERT INTO public.valoraciones VALUES (2, 1, '2026-06-11 00:34:02.954+00', '2026-06-11 00:34:02.954+00', 5, 11);
INSERT INTO public.valoraciones VALUES (3, 4, '2026-06-11 19:32:52.903+00', '2026-06-11 19:32:52.903+00', 5, 17);
INSERT INTO public.valoraciones VALUES (4, 4, '2026-06-11 21:53:34.458+00', '2026-06-11 21:53:34.458+00', 1, 18);
INSERT INTO public.valoraciones VALUES (5, 5, '2026-06-12 01:55:41.083+00', '2026-06-12 01:55:41.083+00', 8, 18);
INSERT INTO public.valoraciones VALUES (6, 5, '2026-06-12 01:56:47.241+00', '2026-06-12 01:56:47.241+00', 8, 29);
INSERT INTO public.valoraciones VALUES (7, 5, '2026-06-12 01:57:15.569+00', '2026-06-12 01:57:15.569+00', 8, 27);
INSERT INTO public.valoraciones VALUES (8, 4, '2026-06-12 01:57:36.708+00', '2026-06-12 01:57:36.708+00', 8, 26);


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 247
-- Name: archivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.archivos_id_seq', 33, true);


--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 265
-- Name: colecciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.colecciones_id_seq', 3, true);


--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 249
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 3, true);


--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 260
-- Name: denuncias_comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.denuncias_comentarios_id_seq', 2, true);


--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 258
-- Name: denuncias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.denuncias_id_seq', 6, true);


--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 255
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.etiquetas_id_seq', 8, true);


--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 267
-- Name: intereses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.intereses_id_seq', 2, true);


--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 251
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.likes_id_seq', 6, true);


--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 269
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.mensajes_id_seq', 4, true);


--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 263
-- Name: notificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.notificaciones_id_seq', 3, true);


--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 245
-- Name: publicaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.publicaciones_id_seq', 27, true);


--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 243
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 8, true);


--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 253
-- Name: valoraciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.valoraciones_id_seq', 8, true);


--
-- TOC entry 3517 (class 2606 OID 24617)
-- Name: archivos archivos_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.archivos
    ADD CONSTRAINT archivos_pkey PRIMARY KEY (id);


--
-- TOC entry 3570 (class 2606 OID 74345)
-- Name: coleccion_publicacion coleccion_publicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.coleccion_publicacion
    ADD CONSTRAINT coleccion_publicacion_pkey PRIMARY KEY ("coleccionId", "publicacionId");


--
-- TOC entry 3564 (class 2606 OID 49301)
-- Name: colecciones colecciones_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.colecciones
    ADD CONSTRAINT colecciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3519 (class 2606 OID 32777)
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3560 (class 2606 OID 49163)
-- Name: denuncias_comentarios denuncias_comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias_comentarios
    ADD CONSTRAINT denuncias_comentarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3558 (class 2606 OID 40994)
-- Name: denuncias denuncias_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias
    ADD CONSTRAINT denuncias_pkey PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 139678)
-- Name: etiquetas etiquetas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key UNIQUE (nombre);


--
-- TOC entry 3528 (class 2606 OID 139680)
-- Name: etiquetas etiquetas_nombre_key1; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key1 UNIQUE (nombre);


--
-- TOC entry 3530 (class 2606 OID 139664)
-- Name: etiquetas etiquetas_nombre_key10; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key10 UNIQUE (nombre);


--
-- TOC entry 3532 (class 2606 OID 139686)
-- Name: etiquetas etiquetas_nombre_key11; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key11 UNIQUE (nombre);


--
-- TOC entry 3534 (class 2606 OID 139662)
-- Name: etiquetas etiquetas_nombre_key12; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key12 UNIQUE (nombre);


--
-- TOC entry 3536 (class 2606 OID 139688)
-- Name: etiquetas etiquetas_nombre_key13; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key13 UNIQUE (nombre);


--
-- TOC entry 3538 (class 2606 OID 139682)
-- Name: etiquetas etiquetas_nombre_key2; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key2 UNIQUE (nombre);


--
-- TOC entry 3540 (class 2606 OID 139684)
-- Name: etiquetas etiquetas_nombre_key3; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key3 UNIQUE (nombre);


--
-- TOC entry 3542 (class 2606 OID 139676)
-- Name: etiquetas etiquetas_nombre_key4; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key4 UNIQUE (nombre);


--
-- TOC entry 3544 (class 2606 OID 139674)
-- Name: etiquetas etiquetas_nombre_key5; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key5 UNIQUE (nombre);


--
-- TOC entry 3546 (class 2606 OID 139672)
-- Name: etiquetas etiquetas_nombre_key6; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key6 UNIQUE (nombre);


--
-- TOC entry 3548 (class 2606 OID 139666)
-- Name: etiquetas etiquetas_nombre_key7; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key7 UNIQUE (nombre);


--
-- TOC entry 3550 (class 2606 OID 139670)
-- Name: etiquetas etiquetas_nombre_key8; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key8 UNIQUE (nombre);


--
-- TOC entry 3552 (class 2606 OID 139668)
-- Name: etiquetas etiquetas_nombre_key9; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key9 UNIQUE (nombre);


--
-- TOC entry 3554 (class 2606 OID 40967)
-- Name: etiquetas etiquetas_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_pkey PRIMARY KEY (id);


--
-- TOC entry 3566 (class 2606 OID 49315)
-- Name: intereses intereses_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.intereses
    ADD CONSTRAINT intereses_pkey PRIMARY KEY (id);


--
-- TOC entry 3521 (class 2606 OID 32794)
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- TOC entry 3568 (class 2606 OID 49337)
-- Name: mensajes mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);


--
-- TOC entry 3562 (class 2606 OID 49287)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3515 (class 2606 OID 24602)
-- Name: publicaciones publicaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicaciones
    ADD CONSTRAINT publicaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3556 (class 2606 OID 40974)
-- Name: publicacionetiqueta publicacionetiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicacionetiqueta
    ADD CONSTRAINT publicacionetiqueta_pkey PRIMARY KEY ("publicacionId", "etiquetaId");


--
-- TOC entry 3351 (class 2606 OID 221323)
-- Name: usuarios usuarios_dni_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key UNIQUE (dni);


--
-- TOC entry 3353 (class 2606 OID 221325)
-- Name: usuarios usuarios_dni_key1; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key1 UNIQUE (dni);


--
-- TOC entry 3355 (class 2606 OID 221341)
-- Name: usuarios usuarios_dni_key10; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key10 UNIQUE (dni);


--
-- TOC entry 3357 (class 2606 OID 221343)
-- Name: usuarios usuarios_dni_key11; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key11 UNIQUE (dni);


--
-- TOC entry 3359 (class 2606 OID 221319)
-- Name: usuarios usuarios_dni_key12; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key12 UNIQUE (dni);


--
-- TOC entry 3361 (class 2606 OID 221345)
-- Name: usuarios usuarios_dni_key13; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key13 UNIQUE (dni);


--
-- TOC entry 3363 (class 2606 OID 221315)
-- Name: usuarios usuarios_dni_key14; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key14 UNIQUE (dni);


--
-- TOC entry 3365 (class 2606 OID 221271)
-- Name: usuarios usuarios_dni_key15; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key15 UNIQUE (dni);


--
-- TOC entry 3367 (class 2606 OID 221313)
-- Name: usuarios usuarios_dni_key16; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key16 UNIQUE (dni);


--
-- TOC entry 3369 (class 2606 OID 221273)
-- Name: usuarios usuarios_dni_key17; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key17 UNIQUE (dni);


--
-- TOC entry 3371 (class 2606 OID 221311)
-- Name: usuarios usuarios_dni_key18; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key18 UNIQUE (dni);


--
-- TOC entry 3373 (class 2606 OID 221275)
-- Name: usuarios usuarios_dni_key19; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key19 UNIQUE (dni);


--
-- TOC entry 3375 (class 2606 OID 221327)
-- Name: usuarios usuarios_dni_key2; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key2 UNIQUE (dni);


--
-- TOC entry 3377 (class 2606 OID 221309)
-- Name: usuarios usuarios_dni_key20; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key20 UNIQUE (dni);


--
-- TOC entry 3379 (class 2606 OID 221277)
-- Name: usuarios usuarios_dni_key21; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key21 UNIQUE (dni);


--
-- TOC entry 3381 (class 2606 OID 221279)
-- Name: usuarios usuarios_dni_key22; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key22 UNIQUE (dni);


--
-- TOC entry 3383 (class 2606 OID 221307)
-- Name: usuarios usuarios_dni_key23; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key23 UNIQUE (dni);


--
-- TOC entry 3385 (class 2606 OID 221281)
-- Name: usuarios usuarios_dni_key24; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key24 UNIQUE (dni);


--
-- TOC entry 3387 (class 2606 OID 221283)
-- Name: usuarios usuarios_dni_key25; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key25 UNIQUE (dni);


--
-- TOC entry 3389 (class 2606 OID 221305)
-- Name: usuarios usuarios_dni_key26; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key26 UNIQUE (dni);


--
-- TOC entry 3391 (class 2606 OID 221317)
-- Name: usuarios usuarios_dni_key27; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key27 UNIQUE (dni);


--
-- TOC entry 3393 (class 2606 OID 221303)
-- Name: usuarios usuarios_dni_key28; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key28 UNIQUE (dni);


--
-- TOC entry 3395 (class 2606 OID 221285)
-- Name: usuarios usuarios_dni_key29; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key29 UNIQUE (dni);


--
-- TOC entry 3397 (class 2606 OID 221329)
-- Name: usuarios usuarios_dni_key3; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key3 UNIQUE (dni);


--
-- TOC entry 3399 (class 2606 OID 221301)
-- Name: usuarios usuarios_dni_key30; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key30 UNIQUE (dni);


--
-- TOC entry 3401 (class 2606 OID 221287)
-- Name: usuarios usuarios_dni_key31; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key31 UNIQUE (dni);


--
-- TOC entry 3403 (class 2606 OID 221289)
-- Name: usuarios usuarios_dni_key32; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key32 UNIQUE (dni);


--
-- TOC entry 3405 (class 2606 OID 221299)
-- Name: usuarios usuarios_dni_key33; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key33 UNIQUE (dni);


--
-- TOC entry 3407 (class 2606 OID 221297)
-- Name: usuarios usuarios_dni_key34; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key34 UNIQUE (dni);


--
-- TOC entry 3409 (class 2606 OID 221291)
-- Name: usuarios usuarios_dni_key35; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key35 UNIQUE (dni);


--
-- TOC entry 3411 (class 2606 OID 221293)
-- Name: usuarios usuarios_dni_key36; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key36 UNIQUE (dni);


--
-- TOC entry 3413 (class 2606 OID 221295)
-- Name: usuarios usuarios_dni_key37; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key37 UNIQUE (dni);


--
-- TOC entry 3415 (class 2606 OID 221347)
-- Name: usuarios usuarios_dni_key38; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key38 UNIQUE (dni);


--
-- TOC entry 3417 (class 2606 OID 221331)
-- Name: usuarios usuarios_dni_key4; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key4 UNIQUE (dni);


--
-- TOC entry 3419 (class 2606 OID 221333)
-- Name: usuarios usuarios_dni_key5; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key5 UNIQUE (dni);


--
-- TOC entry 3421 (class 2606 OID 221335)
-- Name: usuarios usuarios_dni_key6; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key6 UNIQUE (dni);


--
-- TOC entry 3423 (class 2606 OID 221337)
-- Name: usuarios usuarios_dni_key7; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key7 UNIQUE (dni);


--
-- TOC entry 3425 (class 2606 OID 221321)
-- Name: usuarios usuarios_dni_key8; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key8 UNIQUE (dni);


--
-- TOC entry 3427 (class 2606 OID 221339)
-- Name: usuarios usuarios_dni_key9; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key9 UNIQUE (dni);


--
-- TOC entry 3429 (class 2606 OID 229423)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 3431 (class 2606 OID 229425)
-- Name: usuarios usuarios_email_key1; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key1 UNIQUE (email);


--
-- TOC entry 3433 (class 2606 OID 229441)
-- Name: usuarios usuarios_email_key10; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key10 UNIQUE (email);


--
-- TOC entry 3435 (class 2606 OID 229395)
-- Name: usuarios usuarios_email_key11; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key11 UNIQUE (email);


--
-- TOC entry 3437 (class 2606 OID 229397)
-- Name: usuarios usuarios_email_key12; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key12 UNIQUE (email);


--
-- TOC entry 3439 (class 2606 OID 229419)
-- Name: usuarios usuarios_email_key13; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key13 UNIQUE (email);


--
-- TOC entry 3441 (class 2606 OID 229399)
-- Name: usuarios usuarios_email_key14; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key14 UNIQUE (email);


--
-- TOC entry 3443 (class 2606 OID 229417)
-- Name: usuarios usuarios_email_key15; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key15 UNIQUE (email);


--
-- TOC entry 3445 (class 2606 OID 229401)
-- Name: usuarios usuarios_email_key16; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key16 UNIQUE (email);


--
-- TOC entry 3447 (class 2606 OID 229403)
-- Name: usuarios usuarios_email_key17; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key17 UNIQUE (email);


--
-- TOC entry 3449 (class 2606 OID 229415)
-- Name: usuarios usuarios_email_key18; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key18 UNIQUE (email);


--
-- TOC entry 3451 (class 2606 OID 229405)
-- Name: usuarios usuarios_email_key19; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key19 UNIQUE (email);


--
-- TOC entry 3453 (class 2606 OID 229427)
-- Name: usuarios usuarios_email_key2; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key2 UNIQUE (email);


--
-- TOC entry 3455 (class 2606 OID 229413)
-- Name: usuarios usuarios_email_key20; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key20 UNIQUE (email);


--
-- TOC entry 3457 (class 2606 OID 229411)
-- Name: usuarios usuarios_email_key21; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key21 UNIQUE (email);


--
-- TOC entry 3459 (class 2606 OID 229407)
-- Name: usuarios usuarios_email_key22; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key22 UNIQUE (email);


--
-- TOC entry 3461 (class 2606 OID 229409)
-- Name: usuarios usuarios_email_key23; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key23 UNIQUE (email);


--
-- TOC entry 3463 (class 2606 OID 229443)
-- Name: usuarios usuarios_email_key24; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key24 UNIQUE (email);


--
-- TOC entry 3465 (class 2606 OID 229393)
-- Name: usuarios usuarios_email_key25; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key25 UNIQUE (email);


--
-- TOC entry 3467 (class 2606 OID 229445)
-- Name: usuarios usuarios_email_key26; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key26 UNIQUE (email);


--
-- TOC entry 3469 (class 2606 OID 229391)
-- Name: usuarios usuarios_email_key27; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key27 UNIQUE (email);


--
-- TOC entry 3471 (class 2606 OID 229447)
-- Name: usuarios usuarios_email_key28; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key28 UNIQUE (email);


--
-- TOC entry 3473 (class 2606 OID 229389)
-- Name: usuarios usuarios_email_key29; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key29 UNIQUE (email);


--
-- TOC entry 3475 (class 2606 OID 229429)
-- Name: usuarios usuarios_email_key3; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key3 UNIQUE (email);


--
-- TOC entry 3477 (class 2606 OID 229449)
-- Name: usuarios usuarios_email_key30; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key30 UNIQUE (email);


--
-- TOC entry 3479 (class 2606 OID 229387)
-- Name: usuarios usuarios_email_key31; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key31 UNIQUE (email);


--
-- TOC entry 3481 (class 2606 OID 229451)
-- Name: usuarios usuarios_email_key32; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key32 UNIQUE (email);


--
-- TOC entry 3483 (class 2606 OID 229385)
-- Name: usuarios usuarios_email_key33; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key33 UNIQUE (email);


--
-- TOC entry 3485 (class 2606 OID 229453)
-- Name: usuarios usuarios_email_key34; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key34 UNIQUE (email);


--
-- TOC entry 3487 (class 2606 OID 229383)
-- Name: usuarios usuarios_email_key35; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key35 UNIQUE (email);


--
-- TOC entry 3489 (class 2606 OID 229381)
-- Name: usuarios usuarios_email_key36; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key36 UNIQUE (email);


--
-- TOC entry 3491 (class 2606 OID 229455)
-- Name: usuarios usuarios_email_key37; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key37 UNIQUE (email);


--
-- TOC entry 3493 (class 2606 OID 229457)
-- Name: usuarios usuarios_email_key38; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key38 UNIQUE (email);


--
-- TOC entry 3495 (class 2606 OID 229379)
-- Name: usuarios usuarios_email_key39; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key39 UNIQUE (email);


--
-- TOC entry 3497 (class 2606 OID 229431)
-- Name: usuarios usuarios_email_key4; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key4 UNIQUE (email);


--
-- TOC entry 3499 (class 2606 OID 229459)
-- Name: usuarios usuarios_email_key40; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key40 UNIQUE (email);


--
-- TOC entry 3501 (class 2606 OID 229461)
-- Name: usuarios usuarios_email_key41; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key41 UNIQUE (email);


--
-- TOC entry 3503 (class 2606 OID 229433)
-- Name: usuarios usuarios_email_key5; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key5 UNIQUE (email);


--
-- TOC entry 3505 (class 2606 OID 229435)
-- Name: usuarios usuarios_email_key6; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key6 UNIQUE (email);


--
-- TOC entry 3507 (class 2606 OID 229437)
-- Name: usuarios usuarios_email_key7; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key7 UNIQUE (email);


--
-- TOC entry 3509 (class 2606 OID 229439)
-- Name: usuarios usuarios_email_key8; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key8 UNIQUE (email);


--
-- TOC entry 3511 (class 2606 OID 229421)
-- Name: usuarios usuarios_email_key9; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key9 UNIQUE (email);


--
-- TOC entry 3513 (class 2606 OID 24586)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3523 (class 2606 OID 32811)
-- Name: valoraciones valoraciones_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT valoraciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3524 (class 1259 OID 40960)
-- Name: valoraciones_usuario_id_archivo_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX valoraciones_usuario_id_archivo_id ON public.valoraciones USING btree ("usuarioId", "archivoId");


--
-- TOC entry 3572 (class 2606 OID 204978)
-- Name: archivos archivos_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.archivos
    ADD CONSTRAINT "archivos_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3573 (class 2606 OID 204973)
-- Name: archivos archivos_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.archivos
    ADD CONSTRAINT "archivos_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3594 (class 2606 OID 74346)
-- Name: coleccion_publicacion coleccion_publicacion_coleccionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.coleccion_publicacion
    ADD CONSTRAINT "coleccion_publicacion_coleccionId_fkey" FOREIGN KEY ("coleccionId") REFERENCES public.colecciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3595 (class 2606 OID 74351)
-- Name: coleccion_publicacion coleccion_publicacion_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.coleccion_publicacion
    ADD CONSTRAINT "coleccion_publicacion_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3589 (class 2606 OID 139720)
-- Name: colecciones colecciones_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.colecciones
    ADD CONSTRAINT "colecciones_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3574 (class 2606 OID 196945)
-- Name: comentarios comentarios_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT "comentarios_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3575 (class 2606 OID 196940)
-- Name: comentarios comentarios_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT "comentarios_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3584 (class 2606 OID 139708)
-- Name: denuncias_comentarios denuncias_comentarios_comentarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias_comentarios
    ADD CONSTRAINT "denuncias_comentarios_comentarioId_fkey" FOREIGN KEY ("comentarioId") REFERENCES public.comentarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3585 (class 2606 OID 139703)
-- Name: denuncias_comentarios denuncias_comentarios_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias_comentarios
    ADD CONSTRAINT "denuncias_comentarios_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3582 (class 2606 OID 139696)
-- Name: denuncias denuncias_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias
    ADD CONSTRAINT "denuncias_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3583 (class 2606 OID 139691)
-- Name: denuncias denuncias_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias
    ADD CONSTRAINT "denuncias_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3590 (class 2606 OID 139725)
-- Name: intereses intereses_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.intereses
    ADD CONSTRAINT "intereses_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3591 (class 2606 OID 139732)
-- Name: intereses intereses_usuarioInteresadoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.intereses
    ADD CONSTRAINT "intereses_usuarioInteresadoId_fkey" FOREIGN KEY ("usuarioInteresadoId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3576 (class 2606 OID 196955)
-- Name: likes likes_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3577 (class 2606 OID 196950)
-- Name: likes likes_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3592 (class 2606 OID 139737)
-- Name: mensajes mensajes_emisorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT "mensajes_emisorId_fkey" FOREIGN KEY ("emisorId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3593 (class 2606 OID 139742)
-- Name: mensajes mensajes_receptorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT "mensajes_receptorId_fkey" FOREIGN KEY ("receptorId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3588 (class 2606 OID 139715)
-- Name: notificaciones notificaciones_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT "notificaciones_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3571 (class 2606 OID 204966)
-- Name: publicaciones publicaciones_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicaciones
    ADD CONSTRAINT "publicaciones_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3580 (class 2606 OID 40980)
-- Name: publicacionetiqueta publicacionetiqueta_etiquetaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicacionetiqueta
    ADD CONSTRAINT "publicacionetiqueta_etiquetaId_fkey" FOREIGN KEY ("etiquetaId") REFERENCES public.etiquetas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3581 (class 2606 OID 40975)
-- Name: publicacionetiqueta publicacionetiqueta_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicacionetiqueta
    ADD CONSTRAINT "publicacionetiqueta_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3586 (class 2606 OID 49273)
-- Name: seguidores seguidores_seguidoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.seguidores
    ADD CONSTRAINT "seguidores_seguidoId_fkey" FOREIGN KEY ("seguidoId") REFERENCES public.usuarios(id);


--
-- TOC entry 3587 (class 2606 OID 49268)
-- Name: seguidores seguidores_seguidorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.seguidores
    ADD CONSTRAINT "seguidores_seguidorId_fkey" FOREIGN KEY ("seguidorId") REFERENCES public.usuarios(id);


--
-- TOC entry 3578 (class 2606 OID 196965)
-- Name: valoraciones valoraciones_archivoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT "valoraciones_archivoId_fkey" FOREIGN KEY ("archivoId") REFERENCES public.archivos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3579 (class 2606 OID 196960)
-- Name: valoraciones valoraciones_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT "valoraciones_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2161 (class 826 OID 16397)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2160 (class 826 OID 16396)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2026-06-12 12:39:05

--
-- PostgreSQL database dump complete
--

\unrestrict lbdmX8x9vVAoxKXmHA0Zhtb4vewJ7kVenyFdwrDUNLAxSgZkKCP52gWvuTwu4sH

