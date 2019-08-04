--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9
-- Dumped by pg_dump version 10.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO josh;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: josh
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO josh;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: josh
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    project_id integer
);


ALTER TABLE public.volunteers OWNER TO josh;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: josh
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO josh;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: josh
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: josh
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: josh
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY public.projects (id, title) FROM stdin;
1	Fishing
2	Hanging out
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY public.volunteers (id, name, project_id) FROM stdin;
1	Josh	1
2	Josh	1
3	Josh	1
4	Leonardo	1
5	Leonardo	1
6	Leonardo	1
7	Leonardo	1
8	Leonardo	1
9	Leonardo	1
10	Kelsey	1
11	Kelsey	1
12	Kelsey	1
13	Josh	2
14	Josh	2
15	Josh	2
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('public.projects_id_seq', 2, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 15, true);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

