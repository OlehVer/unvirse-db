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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(25) NOT NULL,
    composition character varying(50),
    distance_from_star numeric,
    star_id integer
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    is_researched boolean
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
    name character varying(25) NOT NULL,
    is_spherical boolean,
    planet_id integer,
    description text
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
    name character varying(25) NOT NULL,
    description text,
    distance_from_earth numeric,
    star_id integer,
    has_life boolean
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
    name character varying(25) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Main Belt', 'Carbonaceous, Silicaceous', 2.8, 1);
INSERT INTO public.asteroid_belt VALUES (2, 'Kuiper Belt', 'Icy bodies, Carbonaceous', 30, 1);
INSERT INTO public.asteroid_belt VALUES (3, 'Proxima Belt', 'Rocky, Silicaceous', 0.5, 2);
INSERT INTO public.asteroid_belt VALUES (4, 'Betelgeuse Belt', 'Metal-rich', 700, 3);
INSERT INTO public.asteroid_belt VALUES (5, 'Sirius Outer Belt', 'Silicaceous', 9, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Our home galaxy, containing the Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'The nearest major galaxy to the Milky Way.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 9000, 'A small spiral galaxy located in the constellation Triangulum.', true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 11000, 'A galaxy known for its bright nucleus and large central bulge.', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 600, 'A galaxy interacting with a nearby companion, creating a whirlpool effect.', true);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 11000, 'Named for the dark band of dust in front of its bright nucleus.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, 'Earth’s only natural satellite, affecting tides.');
INSERT INTO public.moon VALUES (2, 'Phobos', true, 2, 'The larger of Mars’ two moons, with an irregular shape.');
INSERT INTO public.moon VALUES (3, 'Deimos', true, 2, 'The smaller of Mars’ two moons, also irregular.');
INSERT INTO public.moon VALUES (4, 'Europa', true, 3, 'Potentially hosts a subsurface ocean under an icy crust.');
INSERT INTO public.moon VALUES (5, 'Ganymede', true, 3, 'The largest moon in the Solar System, larger than Mercury.');
INSERT INTO public.moon VALUES (6, 'Callisto', true, 3, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (7, 'Io', true, 3, 'Jupiter’s volcanic moon, the most geologically active object in the Solar System.');
INSERT INTO public.moon VALUES (8, 'Titan', true, 3, 'Saturn’s largest moon, with a dense atmosphere and liquid methane lakes.');
INSERT INTO public.moon VALUES (9, 'Rhea', true, 3, 'An icy moon of Saturn, with a heavily cratered surface.');
INSERT INTO public.moon VALUES (10, 'Iapetus', true, 3, 'Saturn moon with contrasting dark and light hemispheres.');
INSERT INTO public.moon VALUES (11, 'Proxima c', false, 4, 'Hypothetical moon orbiting Proxima b, possibly non-spherical.');
INSERT INTO public.moon VALUES (12, 'Betelgeuse Alpha', true, 5, 'First confirmed moon around Betelgeuse I.');
INSERT INTO public.moon VALUES (13, 'Betelgeuse Beta', true, 5, 'Second moon of Betelgeuse I, smaller than Alpha.');
INSERT INTO public.moon VALUES (14, 'Betelgeuse Gamma', false, 6, 'A small, irregular moon of Betelgeuse II.');
INSERT INTO public.moon VALUES (15, 'Rigel Minor', true, 7, 'The only known moon of Rigel b.');
INSERT INTO public.moon VALUES (16, 'Mizar Minor', false, 8, 'An irregular, non-spherical moon of Mizar I.');
INSERT INTO public.moon VALUES (17, 'Mizar Major', true, 8, 'The largest moon orbiting Mizar I.');
INSERT INTO public.moon VALUES (18, 'Sirius Alpha', true, 10, 'A moon orbiting Sirius A, very close to its parent planet.');
INSERT INTO public.moon VALUES (19, 'Sirius Beta', false, 10, 'A small, non-spherical moon orbiting Sirius B.');
INSERT INTO public.moon VALUES (20, 'Andromeda Prime I', true, 12, 'Gas giant Andromeda Prime’s largest moon, spherical.');
INSERT INTO public.moon VALUES (21, 'Andromeda Prime II', false, 12, 'An irregular moon with a fast orbit around Andromeda Prime.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only planet known to support life.', 0, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet, potential for past life.', 225, 1, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the Solar System.', 778, 1, false);
INSERT INTO public.planet VALUES (4, 'Proxima b', 'An exoplanet orbiting Proxima Centauri, in habitable zone.', 4.24, 2, false);
INSERT INTO public.planet VALUES (5, 'Betelgeuse I', 'First known planet orbiting Betelgeuse.', 642, 3, false);
INSERT INTO public.planet VALUES (6, 'Betelgeuse II', 'Second planet orbiting Betelgeuse, gas giant.', 645, 3, false);
INSERT INTO public.planet VALUES (7, 'Rigel b', 'Massive planet orbiting the blue supergiant Rigel.', 864, 4, false);
INSERT INTO public.planet VALUES (8, 'Mizar I', 'A rocky planet orbiting Mizar.', 78.9, 5, false);
INSERT INTO public.planet VALUES (9, 'Mizar II', 'A small icy planet in the Mizar system.', 80, 5, false);
INSERT INTO public.planet VALUES (10, 'Sirius A', 'Planet orbiting Sirius, too hot to support life.', 8.6, 6, false);
INSERT INTO public.planet VALUES (11, 'Sirius B', 'Dwarf planet in the Sirius system.', 8.7, 6, false);
INSERT INTO public.planet VALUES (12, 'Andromeda Prime', 'A gas giant in the Andromeda galaxy.', 2540000, 2, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun.', 4500, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star nearing the end of its life.', 8500, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'A blue supergiant, one of the brightest stars in the night sky.', 8000, 2);
INSERT INTO public.star VALUES (5, 'Mizar', 'A star part of a binary system in the Big Dipper.', 6000, 3);
INSERT INTO public.star VALUES (6, 'Sirius', 'The brightest star in the Earth’s night sky.', 500, 4);


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid_belt unique_asteroid_belt_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT unique_asteroid_belt_name UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

