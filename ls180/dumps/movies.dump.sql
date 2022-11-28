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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT valid_name CHECK (((length(name) >= 1) AND ("position"(name, ' '::text) > 0)))
);


ALTER TABLE public.directors OWNER TO yenseow;

--
-- Name: directors_films; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.directors_films (
    id integer NOT NULL,
    director_id integer,
    film_id integer
);


ALTER TABLE public.directors_films OWNER TO yenseow;

--
-- Name: directors_films_id_seq; Type: SEQUENCE; Schema: public; Owner: yenseow
--

CREATE SEQUENCE public.directors_films_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_films_id_seq OWNER TO yenseow;

--
-- Name: directors_films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yenseow
--

ALTER SEQUENCE public.directors_films_id_seq OWNED BY public.directors_films.id;


--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: yenseow
--

CREATE SEQUENCE public.directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_id_seq OWNER TO yenseow;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yenseow
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: yenseow
--

CREATE TABLE public.films (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    duration integer NOT NULL,
    director_id integer NOT NULL,
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


ALTER TABLE public.films OWNER TO yenseow;

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: yenseow
--

CREATE SEQUENCE public.films_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.films_id_seq OWNER TO yenseow;

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yenseow
--

ALTER SEQUENCE public.films_id_seq OWNED BY public.films.id;


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: directors_films id; Type: DEFAULT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.directors_films ALTER COLUMN id SET DEFAULT nextval('public.directors_films_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.films ALTER COLUMN id SET DEFAULT nextval('public.films_id_seq'::regclass);


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: yenseow
--

INSERT INTO public.directors VALUES (1, 'John McTiernan');
INSERT INTO public.directors VALUES (2, 'Michael Curtiz');
INSERT INTO public.directors VALUES (3, 'Francis Ford Coppola');
INSERT INTO public.directors VALUES (4, 'Michael Anderson');
INSERT INTO public.directors VALUES (5, 'Tomas Alfredson');
INSERT INTO public.directors VALUES (6, 'Mike Nichols');
INSERT INTO public.directors VALUES (7, 'Sidney Lumet');
INSERT INTO public.directors VALUES (8, 'Penelope Spheeris');


--
-- Data for Name: directors_films; Type: TABLE DATA; Schema: public; Owner: yenseow
--

INSERT INTO public.directors_films VALUES (1, 1, 1);
INSERT INTO public.directors_films VALUES (2, 2, 2);
INSERT INTO public.directors_films VALUES (3, 3, 3);
INSERT INTO public.directors_films VALUES (4, 4, 4);
INSERT INTO public.directors_films VALUES (5, 5, 5);
INSERT INTO public.directors_films VALUES (6, 6, 6);
INSERT INTO public.directors_films VALUES (7, 3, 7);
INSERT INTO public.directors_films VALUES (8, 7, 8);
INSERT INTO public.directors_films VALUES (9, 8, 9);
INSERT INTO public.directors_films VALUES (10, 4, 10);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: yenseow
--

INSERT INTO public.films VALUES (1, 'Die Hard', 1988, 'action', 132, 1);
INSERT INTO public.films VALUES (2, 'Casablanca', 1942, 'drama', 102, 2);
INSERT INTO public.films VALUES (3, 'The Conversation', 1974, 'thriller', 113, 3);
INSERT INTO public.films VALUES (4, '1984', 1956, 'scifi', 90, 4);
INSERT INTO public.films VALUES (5, 'Tinker Tailor Soldier Spy', 2011, 'espionage', 127, 5);
INSERT INTO public.films VALUES (6, 'The Birdcage', 1996, 'comedy', 118, 6);
INSERT INTO public.films VALUES (7, 'The Godfather', 1972, 'crime', 175, 3);
INSERT INTO public.films VALUES (8, '12 Angry Men', 1957, 'drama', 96, 7);
INSERT INTO public.films VALUES (9, 'Wayne''s World', 1992, 'comedy', 95, 8);
INSERT INTO public.films VALUES (10, 'Let the Right One In', 2008, 'horror', 114, 4);


--
-- Name: directors_films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yenseow
--

SELECT pg_catalog.setval('public.directors_films_id_seq', 10, true);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yenseow
--

SELECT pg_catalog.setval('public.directors_id_seq', 8, true);


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yenseow
--

SELECT pg_catalog.setval('public.films_id_seq', 10, true);


--
-- Name: directors_films directors_films_pkey; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.directors_films
    ADD CONSTRAINT directors_films_pkey PRIMARY KEY (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: films title_unique; Type: CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT title_unique UNIQUE (title);


--
-- Name: directors_films directors_films_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.directors_films
    ADD CONSTRAINT directors_films_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(id) ON DELETE CASCADE;


--
-- Name: directors_films directors_films_films_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.directors_films
    ADD CONSTRAINT directors_films_films_id_fkey FOREIGN KEY (film_id) REFERENCES public.films(id) ON DELETE CASCADE;


--
-- Name: films films_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yenseow
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- PostgreSQL database dump complete
--

