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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_sun numeric NOT NULL,
    diameter_in_km numeric,
    description text,
    orbit_period_days numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    age_in_millions_of_years integer,
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
    name character varying(20) NOT NULL,
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_id integer NOT NULL,
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
    name character varying(20) NOT NULL,
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    age_in_millions_of_years integer,
    star_id integer NOT NULL,
    description text
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
    name character varying(20) NOT NULL,
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL,
    description text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 2.77, 940, 'El asteroide más grande del cinturón de asteroides entre Marte y Júpiter.', 1680);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 2.77, 512, 'Un gran asteroide en el cinturón principal, el tercero en tamaño.', 1680);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 2.36, 525, 'Un asteroide grande y brillante en el cinturón de asteroides.', 1316);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2537000.00, true, 10000, 'La galaxia más cercana a la Vía Láctea.');
INSERT INTO public.galaxy VALUES (2, 'Vía Láctea', 0.00, true, 13000, 'Nuestra galaxia, que contiene el sistema solar.');
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 3000000.00, false, 10000, 'Una galaxia en el grupo local de galaxias.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 28000000.00, true, 10000, 'Una galaxia espiral con una forma de sombrero.');
INSERT INTO public.galaxy VALUES (5, 'Nube de Magallanes Grande', 160000.00, false, 14000, 'Una galaxia enana satélite de la Vía Láctea.');
INSERT INTO public.galaxy VALUES (6, 'Nube de Magallanes Pequeña', 200000.00, false, 10000, 'Otra galaxia enana satélite de la Vía Láctea.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 0.00, true, 4500, 3, 'La única luna de la Tierra.');
INSERT INTO public.moon VALUES (22, 'Calisto', 0.00, true, 4600, 5, 'Una de las lunas más grandes de Júpiter.');
INSERT INTO public.moon VALUES (23, 'Ío', 0.00, true, 4600, 5, 'Luna volcánicamente activa de Júpiter.');
INSERT INTO public.moon VALUES (24, 'Europa', 0.00, true, 4600, 5, 'Luna de Júpiter con una posible capa de hielo sobre un océano.');
INSERT INTO public.moon VALUES (25, 'Ganímedes', 0.00, true, 4600, 5, 'La luna más grande del sistema solar.');
INSERT INTO public.moon VALUES (26, 'Titán', 0.00, true, 4600, 6, 'La luna más grande de Saturno con una densa atmósfera.');
INSERT INTO public.moon VALUES (27, 'Rea', 0.00, true, 4600, 6, 'Una luna de Saturno con anillos.');
INSERT INTO public.moon VALUES (28, 'Oberón', 0.00, true, 4600, 7, 'Una luna de Urano.');
INSERT INTO public.moon VALUES (29, 'Miranda', 0.00, true, 4600, 7, 'Una luna con un paisaje diverso de Urano.');
INSERT INTO public.moon VALUES (30, 'Tritón', 0.00, true, 4600, 8, 'La luna más grande de Neptuno.');
INSERT INTO public.moon VALUES (31, 'Proteo', 0.00, true, 4600, 8, 'Una luna irregular de Neptuno.');
INSERT INTO public.moon VALUES (32, 'Phobos', 0.00, true, 4600, 4, 'Una de las lunas de Marte, muy cercana a su planeta.');
INSERT INTO public.moon VALUES (33, 'Deimos', 0.00, true, 4600, 4, 'La otra luna de Marte.');
INSERT INTO public.moon VALUES (34, 'Mimas', 0.00, true, 4600, 6, 'Una luna de Saturno con un gran cráter.');
INSERT INTO public.moon VALUES (35, 'Encélado', 0.00, true, 4600, 6, 'Una luna de Saturno con géiseres de agua.');
INSERT INTO public.moon VALUES (36, 'Metis', 0.00, true, 4600, 5, 'Una luna pequeña y cercana a Júpiter.');
INSERT INTO public.moon VALUES (37, 'Adrastea', 0.00, true, 4600, 5, 'Otra luna pequeña cercana a Júpiter.');
INSERT INTO public.moon VALUES (38, 'Carme', 0.00, true, 4600, 5, 'Una luna irregular de Júpiter.');
INSERT INTO public.moon VALUES (39, 'Umbriel', 0.00, true, 4600, 7, 'Otra luna de Urano con un paisaje variado.');
INSERT INTO public.moon VALUES (40, 'Titania', 0.00, true, 4600, 7, 'Una luna de Urano con un paisaje variado.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 0.00, true, 4600, 5, 'El planeta más cercano al Sol.');
INSERT INTO public.planet VALUES (2, 'Venus', 0.00, true, 4600, 5, 'El planeta con la atmósfera más densa.');
INSERT INTO public.planet VALUES (3, 'Tierra', 0.00, true, 4600, 5, 'Nuestro hogar.');
INSERT INTO public.planet VALUES (4, 'Marte', 0.00, true, 4600, 5, 'El planeta rojo.');
INSERT INTO public.planet VALUES (5, 'Júpiter', 0.00, true, 4600, 5, 'El planeta más grande del sistema solar.');
INSERT INTO public.planet VALUES (6, 'Saturno', 0.00, true, 4600, 5, 'Conocido por sus impresionantes anillos.');
INSERT INTO public.planet VALUES (7, 'Urano', 0.00, true, 4600, 5, 'Un planeta azul con un gran sistema de anillos.');
INSERT INTO public.planet VALUES (8, 'Neptuno', 0.01, true, 4600, 5, 'El planeta más lejano del sistema solar.');
INSERT INTO public.planet VALUES (9, 'Proxima b', 0.00, true, 2000, 9, 'Un exoplaneta potencialmente habitable alrededor de Proxima Centauri.');
INSERT INTO public.planet VALUES (10, 'Proxima c', 0.00, true, 2000, 9, 'Un exoplaneta gigante en la zona habitable de Proxima Centauri.');
INSERT INTO public.planet VALUES (11, 'Sirius b', 0.00, true, 1000, 6, 'Un hipotético planeta en la órbita de Sirius.');
INSERT INTO public.planet VALUES (12, 'Sirius c', 0.00, true, 1000, 6, 'Otro posible planeta en el sistema de Sirius.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'Sol', 0.00, true, 4600, 2, 'La estrella en el centro del sistema solar.');
INSERT INTO public.star VALUES (6, 'Sirius', 8.60, true, 150, 1, 'La estrella más brillante en el cielo nocturno.');
INSERT INTO public.star VALUES (7, 'Betelgeuse', 642.00, true, 10000, 1, 'Una supergigante roja en la constelación de Orión.');
INSERT INTO public.star VALUES (8, 'Rigel', 863.00, true, 80000, 1, 'Una supergigante azul en la constelación de Orión.');
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 4.24, true, 4500, 2, 'La estrella más cercana al sistema solar.');
INSERT INTO public.star VALUES (10, 'Aldebarán', 65.00, true, 6500, 2, 'Una gigante roja en la constelación de Tauro.');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


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

