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
-- Name: expenses; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    amount numeric(6,2) NOT NULL,
    memo text NOT NULL,
    created_on date NOT NULL,
    CONSTRAINT positive_amount CHECK ((amount > (0)::numeric))
);


ALTER TABLE public.expenses OWNER TO yenseow;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: yenseow
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO yenseow;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yenseow
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: yenseow
--

INSERT INTO public.expenses VALUES (1, 14.56, 'Pencils', '2022-12-02');
INSERT INTO public.expenses VALUES (2, 3.29, 'Coffee', '2022-12-02');
INSERT INTO public.expenses VALUES (3, 49.99, 'Text Editor', '2022-12-02');
INSERT INTO public.expenses VALUES (5, 3.59, 'More Coffee', '2022-12-02');
INSERT INTO public.expenses VALUES (6, 199.00, 'School Fees', '2022-12-02');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yenseow
--

SELECT pg_catalog.setval('public.expenses_id_seq', 6, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

