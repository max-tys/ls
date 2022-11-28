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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: yenseow
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO yenseow;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: books; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.books (
    id integer DEFAULT nextval('public.books_id_seq'::regclass) NOT NULL,
    title character varying(80) NOT NULL,
    author character varying(32) NOT NULL
);


ALTER TABLE public.books OWNER TO yenseow;

--
-- Name: books_categories; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.books_categories (
    book_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.books_categories OWNER TO yenseow;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: yenseow
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO yenseow;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.categories (
    id integer DEFAULT nextval('public.categories_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.categories OWNER TO yenseow;

--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: yenseow
--

COPY public.books (id, title, author) FROM stdin;
1	A Tale of Two Cities	Charles Dickens
2	Harry Potter	J. K. Rowling
3	Einstein: His Life and Universe	Walter Isaacson
4	Sally Ride: America's First Woman in Space	Lynn Sherr
5	Jane Eyre	Charlotte Brontë
6	Vij's: Elegant and Inspired Indian Cuisine	Meeru Dhalwala and Vikram Vij
\.


--
-- Data for Name: books_categories; Type: TABLE DATA; Schema: public; Owner: yenseow
--

COPY public.books_categories (book_id, category_id) FROM stdin;
1	2
1	4
2	2
2	3
3	1
3	5
3	6
4	5
4	1
4	7
5	2
5	4
6	8
6	1
6	9
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: yenseow
--

COPY public.categories (id, name) FROM stdin;
1	Nonfiction
2	Fiction
3	Fantasy
4	Classics
5	Biography
6	Physics
7	Space Exploration
8	Cookbook
9	South Asia
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yenseow
--

SELECT pg_catalog.setval('public.books_id_seq', 6, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yenseow
--

SELECT pg_catalog.setval('public.categories_id_seq', 9, true);


--
-- Name: books_categories books_categories_book_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_book_id_category_id_key UNIQUE (book_id, category_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: books_categories books_categories_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON DELETE CASCADE;


--
-- Name: books_categories books_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.books_categories
    ADD CONSTRAINT books_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

