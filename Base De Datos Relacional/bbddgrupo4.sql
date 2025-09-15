--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-10 20:37:22

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: bbdd_relacional_grupo_4_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO bbdd_relacional_grupo_4_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16466)
-- Name: alumno; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.alumno (
    id_alumno character varying(100) NOT NULL,
    id_curso character varying(100),
    nombre character varying(100),
    mail character varying(100)
);


ALTER TABLE public.alumno OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 223 (class 1259 OID 16476)
-- Name: alumno_proyecto; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.alumno_proyecto (
    id_alumno character varying(100),
    id_proyecto character varying(100),
    nota character varying(100)
);


ALTER TABLE public.alumno_proyecto OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 215 (class 1259 OID 16403)
-- Name: campus; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.campus (
    id_campus character varying(100) NOT NULL,
    localidad character varying(100)
);


ALTER TABLE public.campus OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 219 (class 1259 OID 16423)
-- Name: curso; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.curso (
    id_curso character varying(100) NOT NULL,
    id_promocion character varying(100),
    id_campus character varying(100),
    id_vertical character varying(100),
    descripcion character varying(100)
);


ALTER TABLE public.curso OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 220 (class 1259 OID 16443)
-- Name: profesor_curso; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.profesor_curso (
    id_staff character varying(100),
    id_curso character varying(100)
);


ALTER TABLE public.profesor_curso OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 216 (class 1259 OID 16408)
-- Name: promocion; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.promocion (
    id_promocion character varying(100) NOT NULL,
    mes character varying(100),
    fecha_promocion date
);


ALTER TABLE public.promocion OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 221 (class 1259 OID 16456)
-- Name: proyecto; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.proyecto (
    id_proyecto character varying(100) NOT NULL,
    id_vertical character varying(100),
    descripcion character varying(36)
);


ALTER TABLE public.proyecto OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 218 (class 1259 OID 16418)
-- Name: staff; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.staff (
    id_staff character varying(100) NOT NULL,
    nombre character varying(100),
    rol character varying(100),
    modalidad character varying(100)
);


ALTER TABLE public.staff OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 217 (class 1259 OID 16413)
-- Name: vertical; Type: TABLE; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

CREATE TABLE public.vertical (
    id_vertical character varying(100) NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE public.vertical OWNER TO bbdd_relacional_grupo_4_user;

--
-- TOC entry 3411 (class 0 OID 16466)
-- Dependencies: 222
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.alumno (id_alumno, id_curso, nombre, mail) FROM stdin;
Alum_001	Curs_001	Jafet Casals	Jafet_Casals@gmail.com
Alum_002	Curs_001	Jorge Manzanares	Jorge_Manzanares@gmail.com
Alum_003	Curs_001	Onofre Adadia	Onofre_Adadia@gmail.com
Alum_004	Curs_001	Merche Prada	Merche_Prada@gmail.com
Alum_005	Curs_001	Pilar Abella	Pilar_Abella@gmail.com
Alum_006	Curs_001	Leoncio Tena	Leoncio_Tena@gmail.com
Alum_007	Curs_001	Odalys Torrijos	Odalys_Torrijos@gmail.com
Alum_008	Curs_001	Eduardo Caparrós	Eduardo_Caparrós@gmail.com
Alum_009	Curs_001	Ignacio Goicoechea	Ignacio_Goicoechea@gmail.com
Alum_010	Curs_001	Clementina Santos	Clementina_Santos@gmail.com
Alum_011	Curs_001	Daniela Falcó	Daniela_Falcó@gmail.com
Alum_012	Curs_001	Abraham Vélez	Abraham_Vélez@gmail.com
Alum_013	Curs_001	Maximiliano Menéndez	Maximiliano_Menéndez@gmail.com
Alum_014	Curs_001	Anita Heredia	Anita_Heredia@gmail.com
Alum_015	Curs_001	Eli Casas	Eli_Casas@gmail.com
Alum_016	Curs_002	Guillermo Borrego	Guillermo_Borrego@gmail.com
Alum_017	Curs_002	Sergio Aguirre	Sergio_Aguirre@gmail.com
Alum_018	Curs_002	Carlito Carrión	Carlito_Carrión@gmail.com
Alum_019	Curs_002	Haydée Figueroa	Haydée_Figueroa@gmail.com
Alum_020	Curs_002	Chita Mancebo	Chita_Mancebo@gmail.com
Alum_021	Curs_002	Joaquina Asensio	Joaquina_Asensio@gmail.com
Alum_022	Curs_002	Cristian Sarabia	Cristian_Sarabia@gmail.com
Alum_023	Curs_002	Isabel Ibáñez	Isabel_Ibáñez@gmail.com
Alum_024	Curs_002	Desiderio Jordá	Desiderio_Jordá@gmail.com
Alum_025	Curs_002	Rosalina Llanos	Rosalina_Llanos@gmail.com
Alum_026	Curs_003	Amor Larrañaga	Amor_Larrañaga@gmail.com
Alum_027	Curs_003	Teodoro Alberola	Teodoro_Alberola@gmail.com
Alum_028	Curs_003	Cleto Plana	Cleto_Plana@gmail.com
Alum_029	Curs_003	Aitana Sebastián	Aitana_Sebastián@gmail.com
Alum_030	Curs_003	Dolores Valbuena	Dolores_Valbuena@gmail.com
Alum_031	Curs_003	Julie Ferrer	Julie_Ferrer@gmail.com
Alum_032	Curs_003	Mireia Cabañas	Mireia_Cabañas@gmail.com
Alum_033	Curs_003	Flavia Amador	Flavia_Amador@gmail.com
Alum_034	Curs_003	Albino Macias	Albino_Macias@gmail.com
Alum_035	Curs_003	Ester Sánchez	Ester_Sánchez@gmail.com
Alum_036	Curs_003	Luis Miguel Galvez	Luis_Miguel_Galvez@gmail.com
Alum_037	Curs_003	Loida Arellano	Loida_Arellano@gmail.com
Alum_038	Curs_003	Heraclio Duque	Heraclio_Duque@gmail.com
Alum_039	Curs_003	Herberto Figueras	Herberto_Figueras@gmail.com
Alum_040	Curs_004	Teresa Laguna	Teresa_Laguna@gmail.com
Alum_041	Curs_004	Estrella Murillo	Estrella_Murillo@gmail.com
Alum_042	Curs_004	Ernesto Uriarte	Ernesto_Uriarte@gmail.com
Alum_043	Curs_004	Daniela Guitart	Daniela_Guitart@gmail.com
Alum_044	Curs_004	Timoteo Trillo	Timoteo_Trillo@gmail.com
Alum_045	Curs_004	Ricarda Tovar	Ricarda_Tovar@gmail.com
Alum_046	Curs_004	Alejandra Vilaplana	Alejandra_Vilaplana@gmail.com
Alum_047	Curs_004	Daniel Rosselló	Daniel_Rosselló@gmail.com
Alum_048	Curs_004	Rita Olivares	Rita_Olivares@gmail.com
Alum_049	Curs_004	Cleto Montes	Cleto_Montes@gmail.com
Alum_050	Curs_004	Marino Castilla	Marino_Castilla@gmail.com
Alum_051	Curs_004	Estefanía Valcárcel	Estefanía_Valcárcel@gmail.com
Alum_052	Curs_004	Noemí Vilanova	Noemí_Vilanova@gmail.com
\.


--
-- TOC entry 3412 (class 0 OID 16476)
-- Dependencies: 223
-- Data for Name: alumno_proyecto; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.alumno_proyecto (id_alumno, id_proyecto, nota) FROM stdin;
Alum_001	Proy_001	Apto
Alum_001	Proy_002	No Apto
Alum_001	Proy_003	Apto
Alum_001	Proy_004	Apto
Alum_001	Proy_005	Apto
Alum_002	Proy_001	Apto
Alum_002	Proy_002	No Apto
Alum_002	Proy_003	Apto
Alum_002	Proy_004	Apto
Alum_002	Proy_005	Apto
Alum_003	Proy_001	Apto
Alum_003	Proy_002	Apto
Alum_003	Proy_003	Apto
Alum_003	Proy_004	No Apto
Alum_003	Proy_005	Apto
Alum_004	Proy_001	Apto
Alum_004	Proy_002	No Apto
Alum_004	Proy_003	No Apto
Alum_004	Proy_004	Apto
Alum_004	Proy_005	No Apto
Alum_005	Proy_001	Apto
Alum_005	Proy_002	No Apto
Alum_005	Proy_003	Apto
Alum_005	Proy_004	Apto
Alum_005	Proy_005	Apto
Alum_006	Proy_001	Apto
Alum_006	Proy_002	Apto
Alum_006	Proy_003	Apto
Alum_006	Proy_004	Apto
Alum_006	Proy_005	Apto
Alum_007	Proy_001	No Apto
Alum_007	Proy_002	Apto
Alum_007	Proy_003	Apto
Alum_007	Proy_004	Apto
Alum_007	Proy_005	Apto
Alum_008	Proy_001	No Apto
Alum_008	Proy_002	Apto
Alum_008	Proy_003	Apto
Alum_008	Proy_004	Apto
Alum_008	Proy_005	Apto
Alum_009	Proy_001	Apto
Alum_009	Proy_002	Apto
Alum_009	Proy_003	Apto
Alum_009	Proy_004	No Apto
Alum_009	Proy_005	Apto
Alum_010	Proy_001	Apto
Alum_010	Proy_002	No Apto
Alum_010	Proy_003	Apto
Alum_010	Proy_004	Apto
Alum_010	Proy_005	Apto
Alum_011	Proy_001	Apto
Alum_011	Proy_002	Apto
Alum_011	Proy_003	Apto
Alum_011	Proy_004	Apto
Alum_011	Proy_005	Apto
Alum_012	Proy_001	Apto
Alum_012	Proy_002	No Apto
Alum_012	Proy_003	No Apto
Alum_012	Proy_004	Apto
Alum_012	Proy_005	Apto
Alum_013	Proy_001	Apto
Alum_013	Proy_002	No Apto
Alum_013	Proy_003	Apto
Alum_013	Proy_004	Apto
Alum_013	Proy_005	Apto
Alum_014	Proy_001	Apto
Alum_014	Proy_002	Apto
Alum_014	Proy_003	Apto
Alum_014	Proy_004	Apto
Alum_014	Proy_005	Apto
Alum_015	Proy_001	Apto
Alum_015	Proy_002	Apto
Alum_015	Proy_003	Apto
Alum_015	Proy_004	Apto
Alum_015	Proy_005	Apto
Alum_016	Proy_001	Apto
Alum_016	Proy_002	No Apto
Alum_016	Proy_003	No Apto
Alum_016	Proy_004	Apto
Alum_016	Proy_005	No Apto
Alum_017	Proy_001	Apto
Alum_017	Proy_002	No Apto
Alum_017	Proy_003	Apto
Alum_017	Proy_004	Apto
Alum_017	Proy_005	No Apto
Alum_018	Proy_001	Apto
Alum_018	Proy_002	No Apto
Alum_018	Proy_003	Apto
Alum_018	Proy_004	Apto
Alum_018	Proy_005	Apto
Alum_019	Proy_001	Apto
Alum_019	Proy_002	Apto
Alum_019	Proy_003	Apto
Alum_019	Proy_004	Apto
Alum_019	Proy_005	Apto
Alum_020	Proy_001	No Apto
Alum_020	Proy_002	Apto
Alum_020	Proy_003	No Apto
Alum_020	Proy_004	Apto
Alum_020	Proy_005	Apto
Alum_021	Proy_001	No Apto
Alum_021	Proy_002	No Apto
Alum_021	Proy_003	Apto
Alum_021	Proy_004	Apto
Alum_021	Proy_005	Apto
Alum_022	Proy_001	Apto
Alum_022	Proy_002	Apto
Alum_022	Proy_003	No Apto
Alum_022	Proy_004	Apto
Alum_022	Proy_005	Apto
Alum_023	Proy_001	No Apto
Alum_023	Proy_002	Apto
Alum_023	Proy_003	No Apto
Alum_023	Proy_004	Apto
Alum_023	Proy_005	Apto
Alum_024	Proy_001	No Apto
Alum_024	Proy_002	Apto
Alum_024	Proy_003	No Apto
Alum_024	Proy_004	No Apto
Alum_024	Proy_005	Apto
Alum_025	Proy_001	Apto
Alum_025	Proy_002	Apto
Alum_025	Proy_003	Apto
Alum_025	Proy_004	Apto
Alum_025	Proy_005	Apto
Alum_026	Proy_001	Apto
Alum_026	Proy_002	Apto
Alum_026	Proy_003	Apto
Alum_026	Proy_004	Apto
Alum_026	Proy_005	No Apto
Alum_027	Proy_001	No Apto
Alum_027	Proy_002	No Apto
Alum_027	Proy_003	Apto
Alum_027	Proy_004	No Apto
Alum_027	Proy_005	Apto
Alum_028	Proy_006	Apto
Alum_028	Proy_007	No Apto
Alum_028	Proy_008	Apto
Alum_028	Proy_009	No Apto
Alum_028	Proy_010	Apto
Alum_029	Proy_006	Apto
Alum_029	Proy_007	No Apto
Alum_029	Proy_008	Apto
Alum_029	Proy_009	No Apto
Alum_029	Proy_010	Apto
Alum_030	Proy_006	Apto
Alum_030	Proy_007	Apto
Alum_030	Proy_008	Apto
Alum_030	Proy_009	Apto
Alum_030	Proy_010	No Apto
Alum_031	Proy_006	No Apto
Alum_031	Proy_007	No Apto
Alum_031	Proy_008	No Apto
Alum_031	Proy_009	Apto
Alum_031	Proy_010	No Apto
Alum_032	Proy_006	No Apto
Alum_032	Proy_007	Apto
Alum_032	Proy_008	Apto
Alum_032	Proy_009	Apto
Alum_032	Proy_010	Apto
Alum_033	Proy_006	Apto
Alum_033	Proy_007	Apto
Alum_033	Proy_008	No Apto
Alum_033	Proy_009	Apto
Alum_033	Proy_010	Apto
Alum_034	Proy_006	No Apto
Alum_034	Proy_007	Apto
Alum_034	Proy_008	Apto
Alum_034	Proy_009	Apto
Alum_034	Proy_010	Apto
Alum_035	Proy_006	No Apto
Alum_035	Proy_007	Apto
Alum_035	Proy_008	Apto
Alum_035	Proy_009	No Apto
Alum_035	Proy_010	Apto
Alum_036	Proy_006	No Apto
Alum_036	Proy_007	Apto
Alum_036	Proy_008	Apto
Alum_036	Proy_009	Apto
Alum_036	Proy_010	Apto
Alum_037	Proy_006	Apto
Alum_037	Proy_007	Apto
Alum_037	Proy_008	Apto
Alum_037	Proy_009	Apto
Alum_037	Proy_010	Apto
Alum_038	Proy_006	Apto
Alum_038	Proy_007	Apto
Alum_038	Proy_008	No Apto
Alum_038	Proy_009	No Apto
Alum_038	Proy_010	No Apto
Alum_039	Proy_006	Apto
Alum_039	Proy_007	Apto
Alum_039	Proy_008	Apto
Alum_039	Proy_009	Apto
Alum_039	Proy_010	Apto
Alum_040	Proy_006	Apto
Alum_040	Proy_007	Apto
Alum_040	Proy_008	Apto
Alum_040	Proy_009	Apto
Alum_040	Proy_010	Apto
Alum_041	Proy_006	Apto
Alum_041	Proy_007	Apto
Alum_041	Proy_008	No Apto
Alum_041	Proy_009	Apto
Alum_041	Proy_010	Apto
Alum_042	Proy_006	Apto
Alum_042	Proy_007	Apto
Alum_042	Proy_008	Apto
Alum_042	Proy_009	Apto
Alum_042	Proy_010	Apto
Alum_043	Proy_006	Apto
Alum_043	Proy_007	No Apto
Alum_043	Proy_008	No Apto
Alum_043	Proy_009	Apto
Alum_043	Proy_010	Apto
Alum_044	Proy_006	No Apto
Alum_044	Proy_007	Apto
Alum_044	Proy_008	Apto
Alum_044	Proy_009	Apto
Alum_044	Proy_010	No Apto
Alum_045	Proy_006	Apto
Alum_045	Proy_007	Apto
Alum_045	Proy_008	Apto
Alum_045	Proy_009	Apto
Alum_045	Proy_010	Apto
Alum_046	Proy_006	No Apto
Alum_046	Proy_007	No Apto
Alum_046	Proy_008	No Apto
Alum_046	Proy_009	Apto
Alum_046	Proy_010	Apto
Alum_047	Proy_006	No Apto
Alum_047	Proy_007	No Apto
Alum_047	Proy_008	Apto
Alum_047	Proy_009	No Apto
Alum_047	Proy_010	No Apto
Alum_048	Proy_006	No Apto
Alum_048	Proy_007	No Apto
Alum_048	Proy_008	No Apto
Alum_048	Proy_009	Apto
Alum_048	Proy_010	Apto
Alum_049	Proy_006	Apto
Alum_049	Proy_007	Apto
Alum_049	Proy_008	No Apto
Alum_049	Proy_009	Apto
Alum_049	Proy_010	Apto
Alum_050	Proy_006	No Apto
Alum_050	Proy_007	No Apto
Alum_050	Proy_008	Apto
Alum_050	Proy_009	No Apto
Alum_050	Proy_010	No Apto
Alum_051	Proy_006	Apto
Alum_051	Proy_007	Apto
Alum_051	Proy_008	No Apto
Alum_051	Proy_009	No Apto
Alum_051	Proy_010	Apto
Alum_052	Proy_006	Apto
Alum_052	Proy_007	No Apto
Alum_052	Proy_008	No Apto
Alum_052	Proy_009	Apto
Alum_052	Proy_010	Apto
\.


--
-- TOC entry 3404 (class 0 OID 16403)
-- Dependencies: 215
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.campus (id_campus, localidad) FROM stdin;
Camp_001	Madrid
Camp_002	Valencia
\.


--
-- TOC entry 3408 (class 0 OID 16423)
-- Dependencies: 219
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.curso (id_curso, id_promocion, id_campus, id_vertical, descripcion) FROM stdin;
Curs_001	Prom_001	Camp_001	Vert_001	Boot Camp Data Science Madrid Septiembre 2023
Curs_002	Prom_002	Camp_001	Vert_001	Boot Camp Data Science Madrid Febrero 2024
Curs_003	Prom_001	Camp_001	Vert_002	Boot Camp FullStack Madrid Septiembre 2023
Curs_004	Prom_002	Camp_002	Vert_002	Boot Camp FullStack Valencia Febrero 2024
Curs_005	Prom_001	Camp_002	Vert_002	Boot Camp FullStack Valencia Septiembre 2024
Curs_006	Prom_002	Camp_001	Vert_002	Boot Camp FullStack Madrid Febrero 2023
\.


--
-- TOC entry 3409 (class 0 OID 16443)
-- Dependencies: 220
-- Data for Name: profesor_curso; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.profesor_curso (id_staff, id_curso) FROM stdin;
Staf_001	Curs_001
Staf_002	Curs_001
Staf_003	Curs_001
Staf_004	Curs_001
Staf_005	Curs_003
Staf_006	Curs_005
Staf_007	Curs_004
Staf_008	Curs_006
Staf_009	Curs_004
Staf_010	Curs_003
\.


--
-- TOC entry 3405 (class 0 OID 16408)
-- Dependencies: 216
-- Data for Name: promocion; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.promocion (id_promocion, mes, fecha_promocion) FROM stdin;
Prom_001	SEPTIEMBRE	2023-09-18
Prom_002	FEBRERO	2024-02-12
\.


--
-- TOC entry 3410 (class 0 OID 16456)
-- Dependencies: 221
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.proyecto (id_proyecto, id_vertical, descripcion) FROM stdin;
Proy_001	Vert_001	HLF
Proy_002	Vert_001	EDA
Proy_003	Vert_001	BBDD
Proy_004	Vert_001	ML
Proy_005	Vert_001	Deployment
Proy_006	Vert_002	WebDev
Proy_007	Vert_002	FrontEnd
Proy_008	Vert_002	Backend
Proy_009	Vert_002	React
Proy_010	Vert_002	FullStack
\.


--
-- TOC entry 3407 (class 0 OID 16418)
-- Dependencies: 218
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.staff (id_staff, nombre, rol, modalidad) FROM stdin;
Staf_001	Noa Yáñez	TA	Presencial
Staf_002	Saturnina Benitez	TA	Presencial
Staf_003	Ariel Lledó	TA	Presencial
Staf_004	María Dolores Diaz	LI	Online
Staf_005	Anna Feliu	TA	Presencial
Staf_006	Rosalva Ayuso	TA	Presencial
Staf_007	Ana Sofía Ferrer	TA	Presencial
Staf_008	Angélica Corral	TA	Presencial
Staf_009	Mario Prats	LI	Online
Staf_010	Luis Ángel Suárez	LI	Online
\.


--
-- TOC entry 3406 (class 0 OID 16413)
-- Dependencies: 217
-- Data for Name: vertical; Type: TABLE DATA; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

COPY public.vertical (id_vertical, descripcion) FROM stdin;
Vert_001	Data Science
Vert_002	Full Stack
\.


--
-- TOC entry 3251 (class 2606 OID 16671)
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (id_alumno);


--
-- TOC entry 3239 (class 2606 OID 16693)
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (id_campus);


--
-- TOC entry 3247 (class 2606 OID 16596)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 3241 (class 2606 OID 16623)
-- Name: promocion promocion_pkey; Type: CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_pkey PRIMARY KEY (id_promocion);


--
-- TOC entry 3249 (class 2606 OID 16659)
-- Name: proyecto proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (id_proyecto);


--
-- TOC entry 3245 (class 2606 OID 16642)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id_staff);


--
-- TOC entry 3243 (class 2606 OID 16630)
-- Name: vertical vertical_pkey; Type: CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.vertical
    ADD CONSTRAINT vertical_pkey PRIMARY KEY (id_vertical);


--
-- TOC entry 3258 (class 2606 OID 16677)
-- Name: alumno alumno_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);


--
-- TOC entry 3259 (class 2606 OID 16682)
-- Name: alumno_proyecto alumno_proyecto_id_alumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.alumno_proyecto
    ADD CONSTRAINT alumno_proyecto_id_alumno_fkey FOREIGN KEY (id_alumno) REFERENCES public.alumno(id_alumno);


--
-- TOC entry 3260 (class 2606 OID 16687)
-- Name: alumno_proyecto alumno_proyecto_id_proyecto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.alumno_proyecto
    ADD CONSTRAINT alumno_proyecto_id_proyecto_fkey FOREIGN KEY (id_proyecto) REFERENCES public.proyecto(id_proyecto);


--
-- TOC entry 3252 (class 2606 OID 16694)
-- Name: curso curso_id_campus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_id_campus_fkey FOREIGN KEY (id_campus) REFERENCES public.campus(id_campus);


--
-- TOC entry 3253 (class 2606 OID 16624)
-- Name: curso curso_id_promocion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_id_promocion_fkey FOREIGN KEY (id_promocion) REFERENCES public.promocion(id_promocion);


--
-- TOC entry 3254 (class 2606 OID 16636)
-- Name: curso curso_id_vertical_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_id_vertical_fkey FOREIGN KEY (id_vertical) REFERENCES public.vertical(id_vertical);


--
-- TOC entry 3255 (class 2606 OID 16653)
-- Name: profesor_curso profesor_curso_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.profesor_curso
    ADD CONSTRAINT profesor_curso_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);


--
-- TOC entry 3256 (class 2606 OID 16648)
-- Name: profesor_curso profesor_curso_id_staff_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.profesor_curso
    ADD CONSTRAINT profesor_curso_id_staff_fkey FOREIGN KEY (id_staff) REFERENCES public.staff(id_staff);


--
-- TOC entry 3257 (class 2606 OID 16665)
-- Name: proyecto proyecto_id_vertical_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bbdd_relacional_grupo_4_user
--

ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT proyecto_id_vertical_fkey FOREIGN KEY (id_vertical) REFERENCES public.vertical(id_vertical);


--
-- TOC entry 2070 (class 826 OID 16391)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO bbdd_relacional_grupo_4_user;


--
-- TOC entry 2072 (class 826 OID 16393)
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO bbdd_relacional_grupo_4_user;


--
-- TOC entry 2071 (class 826 OID 16392)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO bbdd_relacional_grupo_4_user;


--
-- TOC entry 2069 (class 826 OID 16390)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO bbdd_relacional_grupo_4_user;


-- Completed on 2025-07-10 20:37:26

--
-- PostgreSQL database dump complete
--

