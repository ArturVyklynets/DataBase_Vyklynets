--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: busesschedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.busesschedules (
    bus_schedule_id bigint NOT NULL,
    schedule_id bigint NOT NULL,
    price_id bigint NOT NULL
);


ALTER TABLE public.busesschedules OWNER TO postgres;

--
-- Name: busesschedules_bus_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.busesschedules ALTER COLUMN bus_schedule_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.busesschedules_bus_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: intermediatestations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intermediatestations (
    id integer NOT NULL,
    route_id bigint NOT NULL,
    station_id bigint NOT NULL,
    sequence integer NOT NULL
);


ALTER TABLE public.intermediatestations OWNER TO postgres;

--
-- Name: intermediatestations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intermediatestations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.intermediatestations_id_seq OWNER TO postgres;

--
-- Name: intermediatestations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intermediatestations_id_seq OWNED BY public.intermediatestations.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    route_id bigint NOT NULL,
    route_name text NOT NULL,
    route_time interval,
    distance real NOT NULL,
    start_station_id bigint,
    end_station_id bigint
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- Name: routes_route_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.routes_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.routes_route_id_seq OWNER TO postgres;

--
-- Name: routes_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.routes_route_id_seq OWNED BY public.routes.route_id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedules (
    schedule_id bigint NOT NULL,
    departure_time time with time zone NOT NULL,
    arrival_time time with time zone NOT NULL,
    route_id bigint NOT NULL
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- Name: schedules_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.schedules ALTER COLUMN schedule_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.schedules_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stations (
    station_id bigint NOT NULL,
    name_station text NOT NULL,
    address_station text NOT NULL
);


ALTER TABLE public.stations OWNER TO postgres;

--
-- Name: stations_station_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.stations ALTER COLUMN station_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.stations_station_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ticketprices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticketprices (
    price_id bigint NOT NULL,
    price numeric NOT NULL,
    type_vehicle text NOT NULL
);


ALTER TABLE public.ticketprices OWNER TO postgres;

--
-- Name: ticketprices_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticketprices_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ticketprices_price_id_seq OWNER TO postgres;

--
-- Name: ticketprices_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticketprices_price_id_seq OWNED BY public.ticketprices.price_id;


--
-- Name: intermediatestations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediatestations ALTER COLUMN id SET DEFAULT nextval('public.intermediatestations_id_seq'::regclass);


--
-- Name: routes route_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes ALTER COLUMN route_id SET DEFAULT nextval('public.routes_route_id_seq'::regclass);


--
-- Name: ticketprices price_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticketprices ALTER COLUMN price_id SET DEFAULT nextval('public.ticketprices_price_id_seq'::regclass);


--
-- Data for Name: busesschedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.busesschedules (bus_schedule_id, schedule_id, price_id) FROM stdin;
4	23	4
6	27	4
10	31	4
1	26	4
2	25	5
3	24	3
5	22	4
7	28	3
8	29	5
9	30	4
11	32	3
12	33	5
13	34	3
14	35	3
15	36	3
\.


--
-- Data for Name: intermediatestations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intermediatestations (id, route_id, station_id, sequence) FROM stdin;
1	1	2	1
2	1	11	2
3	1	3	3
4	1	4	4
5	1	5	5
6	1	12	6
7	1	9	7
8	1	13	8
9	1	14	9
11	5	2	1
12	5	11	2
13	5	3	3
14	5	4	4
15	5	5	5
16	5	12	6
17	5	9	7
18	5	13	8
19	5	16	9
20	5	17	10
21	5	18	11
10	1	15	12
39	1	26	11
40	1	25	10
22	2	2	13
23	2	11	12
24	2	3	11
25	2	4	10
26	2	5	9
27	2	12	8
28	2	9	7
29	2	13	6
30	2	14	5
31	2	15	2
41	2	25	4
42	2	26	3
48	1	6	13
49	2	6	1
32	3	24	2
33	3	9	3
34	3	13	4
35	3	14	5
36	3	25	6
37	3	26	7
38	3	27	8
50	3	7	1
51	3	8	9
43	4	19	2
44	4	20	3
45	4	21	4
46	4	22	5
47	4	23	6
52	4	9	1
53	5	8	12
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (route_id, route_name, route_time, distance, start_station_id, end_station_id) FROM stdin;
1	Каскад - Онкодиспансер	01:10:00	12.18	2	6
2	Онкодиспансер - Каскад\n	01:10:00	12.18	6	2
3	Хоткевича - Автостанція №3	00:45:00	8.59	7	8
5	Каскад - Автостанція №3	00:50:00	8.22	2	8
4	Залізничний вокзал - Юності	00:40:00	8.48	9	23
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedules (schedule_id, departure_time, arrival_time, route_id) FROM stdin;
22	06:30:00+00	07:40:00+00	1
23	06:45:00+00	07:55:00+00	2
24	07:00:00+00	08:05:00+00	3
25	07:15:00+00	08:30:00+00	4
26	07:30:00+00	08:45:00+00	1
27	07:45:00+00	09:05:00+00	2
28	08:00:00+00	09:15:00+00	3
29	08:15:00+00	09:30:00+00	4
30	08:30:00+00	09:45:00+00	1
31	08:45:00+00	10:05:00+00	2
32	06:40:00+00	07:30:00+00	5
33	07:00:00+00	08:00:00+00	5
34	11:40:00+00	12:55:00+00	5
35	14:20:00+00	15:25:00+00	5
36	18:15:00+00	19:25:00+00	5
\.


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stations (station_id, name_station, address_station) FROM stdin;
2	Каскад	Каскад
3	В.Симоненка	вул. В. Симоненка
4	Родон\n	вул. Вовчинецька
5	Велес\n	вул. Вовчинецька
6	Онкодиспансер	вул. Медична
7	Хоткевича	вул. Хоткевича
8	Автостанція №3	вул. Гетьмана Мазепи
9	Залізничний вокзал	Привокзальна площа
11	Миколайчука	вул. В. Симоненка
12	Кобзарик	вул. Вовчинецька
13	Надія	вул. Незалежності
14	Університет Короля Данила	вул. Коновальця
15	Аеропорт	вул. Коновальця
16	Головпоштамт	вул. Січових Стрільців
17	Міська лікарня	вул. Гетьмана Мазепи
18	Коледж фізичного виховання	вул. Гетьмана Мазепи
19	Крок	вул. Вовчинецька
20	Космос	вул. Незалежності
21	Трускавецька	вул. Трускавецька
22	Автостанція №4	вул. Юності
23	КарпатПресМаш	вул. Юності
24	Старицького\n	вул. Старицького
25	Обласна дитяча лікарня	вул. Коновальця
26	Велмарт\n	вул. Коновальця
27	Хлібокомбінат	вул. Петлюри
\.


--
-- Data for Name: ticketprices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticketprices (price_id, price, type_vehicle) FROM stdin;
3	10.00	Маршрутка
4	8.00	Автобус
5	7.00	Тролейбус
6	5.00	Трамвай
\.


--
-- Name: busesschedules_bus_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.busesschedules_bus_schedule_id_seq', 15, true);


--
-- Name: intermediatestations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intermediatestations_id_seq', 53, true);


--
-- Name: routes_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.routes_route_id_seq', 5, true);


--
-- Name: schedules_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedules_schedule_id_seq', 36, true);


--
-- Name: stations_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stations_station_id_seq', 27, true);


--
-- Name: ticketprices_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticketprices_price_id_seq', 6, true);


--
-- Name: busesschedules busesschedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.busesschedules
    ADD CONSTRAINT busesschedules_pkey PRIMARY KEY (bus_schedule_id);


--
-- Name: intermediatestations intermediatestations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediatestations
    ADD CONSTRAINT intermediatestations_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (route_id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (schedule_id);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);


--
-- Name: ticketprices ticketprices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticketprices
    ADD CONSTRAINT ticketprices_pkey PRIMARY KEY (price_id);


--
-- Name: intermediatestations intermediatestations_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediatestations
    ADD CONSTRAINT intermediatestations_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.routes(route_id);


--
-- Name: intermediatestations intermediatestations_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intermediatestations
    ADD CONSTRAINT intermediatestations_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.stations(station_id);


--
-- Name: busesschedules price_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.busesschedules
    ADD CONSTRAINT price_id_fkey FOREIGN KEY (price_id) REFERENCES public.ticketprices(price_id) NOT VALID;


--
-- Name: schedules route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT route_id_fkey FOREIGN KEY (route_id) REFERENCES public.routes(route_id) NOT VALID;


--
-- Name: routes routes_end_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_end_station_id_fkey FOREIGN KEY (end_station_id) REFERENCES public.stations(station_id);


--
-- Name: routes routes_start_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_start_station_id_fkey FOREIGN KEY (start_station_id) REFERENCES public.stations(station_id);


--
-- Name: busesschedules schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.busesschedules
    ADD CONSTRAINT schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedules(schedule_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

