--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: fun_facts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fun_facts (
    fun_facts_id integer NOT NULL,
    name character varying(300) NOT NULL,
    extra_description text
);


ALTER TABLE public.fun_facts OWNER TO freecodecamp;

--
-- Name: fun_facts_fun_fact_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.fun_facts_fun_fact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fun_facts_fun_fact_id_seq OWNER TO freecodecamp;

--
-- Name: fun_facts_fun_fact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.fun_facts_fun_fact_id_seq OWNED BY public.fun_facts.fun_facts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(120) NOT NULL,
    description character varying(256),
    cool_fact character varying(120),
    has_life boolean,
    dist_from_earth_mpc numeric(5,3),
    diameter_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(120) NOT NULL,
    description text,
    does_rotate boolean,
    distance_from_nearest_planet_miles numeric(5,3),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(120) NOT NULL,
    contains_life boolean,
    rotations_per_orbit numeric(5,3),
    moon_names character varying(120),
    description text,
    star_id integer,
    radius_mi integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(120) NOT NULL,
    description character varying(256),
    galaxy_id integer,
    solar_mass_m numeric(5,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: fun_facts fun_facts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fun_facts ALTER COLUMN fun_facts_id SET DEFAULT nextval('public.fun_facts_fun_fact_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: fun_facts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fun_facts VALUES (1, 'The Earth is the only planet we know to have life on it.', 'true story');
INSERT INTO public.fun_facts VALUES (2, 'Mars is named after the Roman God of War', 'He violent tho');
INSERT INTO public.fun_facts VALUES (3, 'Jupiter has the most moons in the solar system', 'Because it''s so massive');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Draco II', 'Satellite of Milky Way', '', false, 0.022, 120);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Sphr SagDEG', 'Satellite of Milky Way', 'partial accretion by Milky Way', false, 0.024, 10000);
INSERT INTO public.galaxy VALUES (4, 'Pictor II', 'Satellite of Milky Way', 'possibly associated with the Large Magellanic Cloud', false, 0.045, 300);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral Galaxy', 'Home galaxy of Earth', true, 0.008, 87400);
INSERT INTO public.galaxy VALUES (5, 'Tucana III', 'Satellite of Milky way that is being tidally disrupted', NULL, NULL, 0.023, 220);
INSERT INTO public.galaxy VALUES (6, 'Hydrus I', 'Possibly associated with the magellanic clouds', NULL, NULL, 0.028, 348);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Io', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Europa', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Hyperion', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Prometheus', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Pandora', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Janus', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Epimetheus', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Titania', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (21, 'Despina', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (22, 'Galatea', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (23, 'Halimede', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (24, 'Hippocamp', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (25, 'Laomedeia', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (26, 'Larissa', NULL, NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Jupiter', false, NULL, NULL, 'The largest planet in the solar system', 1, 43441);
INSERT INTO public.planet VALUES (2, 'Venus', false, NULL, NULL, 'Toxic gaseous planet', 1, 3760);
INSERT INTO public.planet VALUES (6, 'Saturn', false, NULL, NULL, 'Known for its beautiful rings', 1, 36184);
INSERT INTO public.planet VALUES (7, 'Uranus', false, NULL, NULL, 'Known for its hilarious jokes', 1, 15759);
INSERT INTO public.planet VALUES (1, 'Mercury', false, NULL, NULL, 'Closest Planet to the sun', 1, 1516);
INSERT INTO public.planet VALUES (4, 'Mars', false, NULL, NULL, 'The red planet, famously named after the god of war', 1, 2106);
INSERT INTO public.planet VALUES (8, 'Neptune', false, NULL, NULL, 'A deep, blue gas giant', 1, 15299);
INSERT INTO public.planet VALUES (3, 'Earth', true, NULL, NULL, 'The only planet with life', 1, 3958);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', false, NULL, NULL, 'undisputed candidate', 2, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', false, NULL, NULL, 'disputed candidate', 2, NULL);
INSERT INTO public.planet VALUES (11, 'Lalande 21185 c', false, NULL, NULL, 'Exoplanet', 7, NULL);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 b', false, NULL, NULL, 'Exoplanet', 7, NULL);
INSERT INTO public.planet VALUES (13, 'Tau Ceti g', false, NULL, NULL, 'Exoplanet', 8, NULL);
INSERT INTO public.planet VALUES (14, 'Tau Ceti h', false, NULL, NULL, 'Exoplanet', 8, NULL);
INSERT INTO public.planet VALUES (15, 'Tau Ceti e', false, NULL, NULL, 'Exoplanet', 8, NULL);
INSERT INTO public.planet VALUES (16, 'Tau Ceti f', false, NULL, NULL, 'Exoplanet', 8, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Our planet Earth''s star', 1, 1.000);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'flare star, two confirmed planets, and third disputed planet', 1, 0.122);
INSERT INTO public.star VALUES (3, 'Alpha Canis Majoris', 'Also known as the north star', 1, 2.063);
INSERT INTO public.star VALUES (4, 'Ran', 'three circumstellar disks, one confirmed planet and one candidate', 1, 0.820);
INSERT INTO public.star VALUES (5, 'madeup1', 'description', 1, 1.200);
INSERT INTO public.star VALUES (6, 'madeup2', 'description', 1, 5.210);
INSERT INTO public.star VALUES (7, 'Lalande 21185', 'A star in the south of Ursa Major', 1, 0.123);
INSERT INTO public.star VALUES (8, 'Tau Ceti', 'A single star in the constellation Cetus', 1, 0.780);


--
-- Name: fun_facts_fun_fact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.fun_facts_fun_fact_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: fun_facts fun_facts_fun_fact_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fun_facts
    ADD CONSTRAINT fun_facts_fun_fact_id_key UNIQUE (fun_facts_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (galaxy_id);


--
-- Name: fun_facts pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fun_facts
    ADD CONSTRAINT pk PRIMARY KEY (fun_facts_id);


--
-- Name: moon pk_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT pk_moon PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (star_id);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (moon_id);


--
-- Name: star galaxy_belongs_to; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_belongs_to FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_belongs_to; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_belongs_to FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_belongs_to; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_belongs_to FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
