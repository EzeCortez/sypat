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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    distance_from_earth numeric,
    stars_amount integer,
    age integer,
    description text
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
    name character varying(30) NOT NULL,
    diameter numeric,
    distance_from_the_earth_km numeric,
    orbital_period numeric,
    temperature integer,
    description text,
    is_habitable boolean,
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
    name character varying(30) NOT NULL,
    planet_type character varying(30),
    diameter numeric,
    distance_from_its_star numeric,
    orbital_period numeric,
    description text,
    is_habitable boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    spectral_type character varying(30),
    temperature integer,
    mass numeric,
    age integer,
    description text,
    galaxy_id integer
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
-- Name: stellar_systems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stellar_systems (
    name character varying(30) NOT NULL,
    type character varying(30),
    distance_from_earth numeric,
    star_count integer,
    age integer,
    description text,
    has_black_hole boolean,
    stellar_systems_id integer NOT NULL
);


ALTER TABLE public.stellar_systems OWNER TO freecodecamp;

--
-- Name: stellar_systems_stellar_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stellar_systems_stellar_systems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stellar_systems_stellar_systems_id_seq OWNER TO freecodecamp;

--
-- Name: stellar_systems_stellar_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stellar_systems_stellar_systems_id_seq OWNED BY public.stellar_systems.stellar_systems_id;


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
-- Name: stellar_systems stellar_systems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_systems ALTER COLUMN stellar_systems_id SET DEFAULT nextval('public.stellar_systems_stellar_systems_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 300, 14, 'The galaxy that contains our sola system.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral', 2537, 24, 11, 'The Andromeda Galaxy is the closest spiral galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 28, 40, 7, 'The Triangulum Galaxy is a member of the Local Group of galaxies');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Spiral', 263, 800, 10, 'The Sombrero Galaxy is known for its prominent bulge and central dust lane');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 217, 100, 500, 'The Whirlpool Galaxy is famous for its spiral arms');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Spiral', 198, 1, 4, 'The Pinwheel Galaxy is named for its prominent spiral arms');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 384400, 27.32, -233, 'Earth''s only natural satellite.', false, 1);
INSERT INTO public.moon VALUES (12, 'Europa', 3121, 628300, 3.55, -160, 'Moon of Jupiter with an icy surface.', true, 1);
INSERT INTO public.moon VALUES (13, 'Titan', 5151, 1272500, 15.95, -179, 'Saturn''s moon with a dense atmosphere and lakes of methane', false, 1);
INSERT INTO public.moon VALUES (14, 'Ganymede', 5268, 857500, 7.16, -163, 'Jupiter''s moon, it is the largest moon in the solar system.', true, 1);
INSERT INTO public.moon VALUES (15, 'Callisto', 4821, 1882700, 16.69, -193, 'Moon of Jupiter with a cratered surface and possible subsurface oceans.', true, 1);
INSERT INTO public.moon VALUES (16, 'Io', 3643, 421700, 1.77, -153, 'Moon of Jupiter with intense volcanic activity', false, 1);
INSERT INTO public.moon VALUES (37, 'Phobos', 22.4, 9376, 0.32, -40, 'Moon of Mars, it is the innermost and larger of the two natural satellites of Mars', false, 1);
INSERT INTO public.moon VALUES (38, 'Deimos', 12.4, 23460, 1.26, -40, 'Moon of Mars, it is the smaller and outer of the two natural satellites of Mars', false, 1);
INSERT INTO public.moon VALUES (39, 'Enceladus', 504, 238020, 1.37, -198, 'Moon of Saturn, it is mostly covered by fresh, clean ice', false, 1);
INSERT INTO public.moon VALUES (40, 'Tethys', 1062, 294660, 1.89, -187, 'Moon of Saturn, it is composed almost entirely of water ice', false, 1);
INSERT INTO public.moon VALUES (41, 'Dione', 1122.8, 377400, 2.74, -186, 'Moon of Saturn, it is composed mostly of water ice with a small amount of rock', false, 1);
INSERT INTO public.moon VALUES (42, 'Rhea', 1527.6, 527040, 4.52, -174, 'Moon of Saturn, it is the second-largest moon in the Saturnian system', false, 1);
INSERT INTO public.moon VALUES (43, 'Iapetus', 1468.6, 3561300, 79.33, -143, 'Moon of Saturn, it has a two-toned coloration with one hemisphere being dark and the other bright', false, 1);
INSERT INTO public.moon VALUES (44, 'Miranda', 471.6, 129390, 1.41, -187, 'Moon of Uranus, it has the most extreme and varied topography of any moon in the solar system', false, 1);
INSERT INTO public.moon VALUES (45, 'Ariel', 1158.8, 191020, 2.52, -213, 'Moon of Uranus, it is the fourth-largest of the 27 known moons of Uranus', false, 1);
INSERT INTO public.moon VALUES (46, 'Umbriel', 1169.4, 266300, 4.14, -203, 'Moon of Uranus, it is the third-largest and fourth-most-massive of the Uranian moons', false, 1);
INSERT INTO public.moon VALUES (47, 'Titania', 1577.8, 436300, 8.71, -213, 'Moon of Uranus, it is the largest of the moons of Uranus and the eighth largest moon in the Solar System', false, 1);
INSERT INTO public.moon VALUES (48, 'Oberon', 1522.8, 583520, 13.46, -203, 'Moon of Uranus, it is the second-largest and second most massive of the Uranian moons', false, 1);
INSERT INTO public.moon VALUES (49, 'Triton', 2706.8, 354760, 5.88, -235, 'Moon of Neptune, it is the seventh-largest moon in the Solar System', false, 1);
INSERT INTO public.moon VALUES (50, 'Proteus', 436.2, 117647, 1.12, -220, 'Moon of Neptune, it is one of the largest inner moons of Neptune', false, 1);
INSERT INTO public.moon VALUES (51, 'Nereid', 340, 5513815, 360.13, -240, 'Moon of Neptune, it is the third-largest moon of Neptune', false, 1);
INSERT INTO public.moon VALUES (52, 'Charon', 1208, 19571, 6.39, -220, 'Moon of Pluto, it is the largest of the five known moons of Pluto', false, 1);
INSERT INTO public.moon VALUES (53, 'Styx', 10, 426569, 20.16, -233, 'Moon of Pluto, it is the second moon of Pluto to be discovered', false, 1);
INSERT INTO public.moon VALUES (54, 'Nix', 49.8, 48694, 24.85, -233, 'Moon of Pluto, it is the third moon of Pluto to be discovered', false, 1);
INSERT INTO public.moon VALUES (55, 'Kerberos', 7, 57783, 32.17, -233, 'Moon of Pluto, it is the fourth moon of Pluto to be discovered', false, 1);
INSERT INTO public.moon VALUES (56, 'Hydra', 30, 64738, 38.20, -233, 'Moon of Pluto, it is the fifth moon of Pluto to be discovered', false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 12742, 149.6, 365.25, 'The third planet from the Sun.', true, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Mars', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Venus', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Mercury', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Eris', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (13, 'Haumea', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (14, 'MakeMake', NULL, NULL, NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alfa Centauri', 'G2V', 5778, 1.1, 5, 'Alfa Centauri is a triple star system...', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A1V', 9940, 2.02, 240, 'Sirius is the brightest star in the night sky', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'G2V', 5790, 1.1, 6, 'Alpha Centauri is the closest star system to the Solar System', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M1-2Ia-Iab', 3600, -10, 8, 'Betelgeuse is a red supergiant star in the constellation of Orion', 1);
INSERT INTO public.star VALUES (5, 'Vega', 'A0Va', 9602, 2.15, 455, 'Vega is the brightest star in the constellation of Lyra', 1);
INSERT INTO public.star VALUES (6, 'Arcturus', 'K1.5III', 4290, 1.08, 7, 'Arcturus is the brightest star in the northern celestial hemisphere', 1);


--
-- Data for Name: stellar_systems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stellar_systems VALUES ('Alpha Centauri', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.stellar_systems VALUES ('Sirius', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.stellar_systems VALUES ('Proxima Centauri', NULL, NULL, NULL, NULL, NULL, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 56, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: stellar_systems_stellar_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stellar_systems_stellar_systems_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: stellar_systems stellar_systems_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_systems
    ADD CONSTRAINT stellar_systems_name_key UNIQUE (name);


--
-- Name: stellar_systems stellar_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_systems
    ADD CONSTRAINT stellar_systems_pkey PRIMARY KEY (stellar_systems_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

