--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-11-26 17:13:12 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12364)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 33238)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    id integer NOT NULL,
    cedula integer,
    nombre character varying(50),
    apellido character varying(50)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33236)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 183
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 192 (class 1259 OID 33283)
-- Name: contratos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contratos (
    id integer NOT NULL,
    id_seguro integer,
    duracion integer
);


ALTER TABLE contratos OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 33281)
-- Name: contratos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contratos_id_seq OWNER TO postgres;

--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 191
-- Name: contratos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratos_id_seq OWNED BY contratos.id;


--
-- TOC entry 182 (class 1259 OID 33230)
-- Name: inversiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE inversiones (
    id integer NOT NULL,
    nombre_inversionista character varying(50),
    fecha date,
    monto bigint
);


ALTER TABLE inversiones OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 33228)
-- Name: inversiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inversiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inversiones_id_seq OWNER TO postgres;

--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 181
-- Name: inversiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inversiones_id_seq OWNED BY inversiones.id;


--
-- TOC entry 188 (class 1259 OID 33254)
-- Name: seguros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE seguros (
    id integer NOT NULL,
    descripcion text,
    id_tipo_seguro integer,
    precio bigint
);


ALTER TABLE seguros OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 33252)
-- Name: seguros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seguros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguros_id_seq OWNER TO postgres;

--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 187
-- Name: seguros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE seguros_id_seq OWNED BY seguros.id;


--
-- TOC entry 186 (class 1259 OID 33246)
-- Name: tipos_seguros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipos_seguros (
    id integer NOT NULL,
    descripcion character varying(50)
);


ALTER TABLE tipos_seguros OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33244)
-- Name: tipos_seguros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipos_seguros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipos_seguros_id_seq OWNER TO postgres;

--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 185
-- Name: tipos_seguros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipos_seguros_id_seq OWNED BY tipos_seguros.id;


--
-- TOC entry 190 (class 1259 OID 33270)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ventas (
    id integer NOT NULL,
    id_cliente integer,
    fecha date,
    monto bigint
);


ALTER TABLE ventas OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 33289)
-- Name: ventas_contratos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ventas_contratos (
    id_venta integer,
    id_contrato integer,
    fecha_limite date
);


ALTER TABLE ventas_contratos OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 33268)
-- Name: ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ventas_id_seq OWNER TO postgres;

--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 189
-- Name: ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ventas_id_seq OWNED BY ventas.id;


--
-- TOC entry 2024 (class 2604 OID 33241)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 33286)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos ALTER COLUMN id SET DEFAULT nextval('contratos_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 33233)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inversiones ALTER COLUMN id SET DEFAULT nextval('inversiones_id_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 33257)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguros ALTER COLUMN id SET DEFAULT nextval('seguros_id_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 33249)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipos_seguros ALTER COLUMN id SET DEFAULT nextval('tipos_seguros_id_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 33273)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas ALTER COLUMN id SET DEFAULT nextval('ventas_id_seq'::regclass);


--
-- TOC entry 2163 (class 0 OID 33238)
-- Dependencies: 184
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (id, cedula, nombre, apellido) FROM stdin;
\.


--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 183
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 1, false);


--
-- TOC entry 2171 (class 0 OID 33283)
-- Dependencies: 192
-- Data for Name: contratos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratos (id, id_seguro, duracion) FROM stdin;
\.


--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 191
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratos_id_seq', 1, false);


--
-- TOC entry 2161 (class 0 OID 33230)
-- Dependencies: 182
-- Data for Name: inversiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY inversiones (id, nombre_inversionista, fecha, monto) FROM stdin;
\.


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 181
-- Name: inversiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inversiones_id_seq', 1, false);


--
-- TOC entry 2167 (class 0 OID 33254)
-- Dependencies: 188
-- Data for Name: seguros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY seguros (id, descripcion, id_tipo_seguro, precio) FROM stdin;
\.


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 187
-- Name: seguros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seguros_id_seq', 1, false);


--
-- TOC entry 2165 (class 0 OID 33246)
-- Dependencies: 186
-- Data for Name: tipos_seguros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipos_seguros (id, descripcion) FROM stdin;
\.


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 185
-- Name: tipos_seguros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipos_seguros_id_seq', 1, false);


--
-- TOC entry 2169 (class 0 OID 33270)
-- Dependencies: 190
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ventas (id, id_cliente, fecha, monto) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 33289)
-- Dependencies: 193
-- Data for Name: ventas_contratos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ventas_contratos (id_venta, id_contrato, fecha_limite) FROM stdin;
\.


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 189
-- Name: ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ventas_id_seq', 1, false);


--
-- TOC entry 2032 (class 2606 OID 33243)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2030 (class 2606 OID 33235)
-- Name: inversiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inversiones
    ADD CONSTRAINT inversiones_pkey PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 33288)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 33262)
-- Name: seguros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguros
    ADD CONSTRAINT seguros_pkey PRIMARY KEY (id);


--
-- TOC entry 2034 (class 2606 OID 33251)
-- Name: tipos_seguros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipos_seguros
    ADD CONSTRAINT tipos_seguros_pkey PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 33275)
-- Name: ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 33297)
-- Name: fk_contrato; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas_contratos
    ADD CONSTRAINT fk_contrato FOREIGN KEY (id_contrato) REFERENCES contratos(id);


--
-- TOC entry 2043 (class 2606 OID 33302)
-- Name: fk_seguro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT fk_seguro FOREIGN KEY (id_seguro) REFERENCES seguros(id);


--
-- TOC entry 2044 (class 2606 OID 33292)
-- Name: fk_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas_contratos
    ADD CONSTRAINT fk_venta FOREIGN KEY (id_venta) REFERENCES ventas(id);


--
-- TOC entry 2041 (class 2606 OID 33263)
-- Name: seguros_id_tipo_seguro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguros
    ADD CONSTRAINT seguros_id_tipo_seguro_fkey FOREIGN KEY (id_tipo_seguro) REFERENCES tipos_seguros(id);


--
-- TOC entry 2042 (class 2606 OID 33276)
-- Name: ventas_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas
    ADD CONSTRAINT ventas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES cliente(id);


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-11-26 17:13:12 CST

--
-- PostgreSQL database dump complete
--


