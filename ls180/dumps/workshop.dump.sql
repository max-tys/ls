--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: devices; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.devices OWNER TO yenseow;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: yenseow
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO yenseow;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yenseow
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.parts (
    id integer NOT NULL,
    part_number integer NOT NULL,
    device_id integer
);


ALTER TABLE public.parts OWNER TO yenseow;

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: yenseow
--

CREATE SEQUENCE public.parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_id_seq OWNER TO yenseow;

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yenseow
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: yenseow
--

INSERT INTO public.devices VALUES (1, 'Accelerometer', '2022-11-27 20:02:56.249036');
INSERT INTO public.devices VALUES (2, 'Gyroscope', '2022-11-27 20:02:56.249036');
INSERT INTO public.devices VALUES (3, 'Magnetometer', '2022-11-27 22:00:10.69423');


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: yenseow
--

INSERT INTO public.parts VALUES (1, 2667, 1);
INSERT INTO public.parts VALUES (2, 7496, 1);
INSERT INTO public.parts VALUES (3, 2676, 1);
INSERT INTO public.parts VALUES (4, 3977, 2);
INSERT INTO public.parts VALUES (5, 4735, 2);
INSERT INTO public.parts VALUES (6, 6115, 2);
INSERT INTO public.parts VALUES (10, 1549, NULL);
INSERT INTO public.parts VALUES (11, 9054, NULL);
INSERT INTO public.parts VALUES (12, 1141, NULL);
INSERT INTO public.parts VALUES (13, 8329, 3);
INSERT INTO public.parts VALUES (7, 4532, 1);
INSERT INTO public.parts VALUES (8, 1026, 2);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yenseow
--

SELECT pg_catalog.setval('public.devices_id_seq', 3, true);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yenseow
--

SELECT pg_catalog.setval('public.parts_id_seq', 13, true);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: parts parts_part_number_key; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_part_number_key UNIQUE (part_number);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: parts parts_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id);


--
-- PostgreSQL database dump complete
--

