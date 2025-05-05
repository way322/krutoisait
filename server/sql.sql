--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-05 23:33:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 221 (class 1259 OID 17460)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT cart_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17505)
-- Name: favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite (
    product_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.favorite OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17489)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17477)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    delivery_date timestamp with time zone NOT NULL,
    address character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total numeric(10,2) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17476)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 220 (class 1259 OID 17452)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    image_url character varying(255) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17451)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 218 (class 1259 OID 17442)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    phone_number character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17441)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4666 (class 2604 OID 17480)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4665 (class 2604 OID 17455)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4663 (class 2604 OID 17445)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4842 (class 0 OID 17460)
-- Dependencies: 221
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (product_id, user_id, quantity) FROM stdin;
3	26	1
2	27	4
\.


--
-- TOC entry 4846 (class 0 OID 17505)
-- Dependencies: 225
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite (product_id, user_id) FROM stdin;
2	24
1	23
1	25
3	26
2	27
1	28
6	28
5	28
7	28
8	28
4	28
3	28
2	28
\.


--
-- TOC entry 4845 (class 0 OID 17489)
-- Dependencies: 224
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_id, product_id, quantity) FROM stdin;
9	2	1
10	1	2
11	1	1
11	2	1
12	8	1
12	3	1
14	6	1
15	2	1
15	6	1
16	1	3
\.


--
-- TOC entry 4844 (class 0 OID 17477)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, created_at, delivery_date, address, name, total) FROM stdin;
9	27	2025-05-04 01:31:33.618294+03	2025-05-04 07:31:33.617+03	1 пыпва	аыввыа	700.00
10	27	2025-05-04 01:32:20.240541+03	2025-05-04 07:32:20.239+03	выаваы	ыва	1000.00
11	27	2025-05-04 03:26:08.939857+03	2025-05-04 09:26:08.939+03	gdfgfd	gdfgdf	1200.00
12	27	2025-05-04 03:58:37.677964+03	2025-05-04 09:58:37.677+03	сми	впа	1635.00
14	28	2025-05-04 22:21:22.644575+03	2025-05-05 04:21:22.644+03	sad	dsaa	329.00
15	28	2025-05-04 22:37:14.45058+03	2025-05-05 04:37:14.45+03	выа	ыва	1029.00
16	28	2025-05-05 21:21:12.528683+03	2025-05-06 03:21:12.528+03	gfdgdfsdsfg	dgfvxdfgxfhgd	1500.00
\.


--
-- TOC entry 4841 (class 0 OID 17452)
-- Dependencies: 220
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, price, image_url) FROM stdin;
1	Да Хун Пао	500.00	chay1.png
2	Хун Цзинь Гуй	700.00	chay2.png
3	Хакка Лэй Ча	900.00	chay3.png
4	Тайский чай	200.00	chay4.png
5	Лунцзин	439.00	chay5.png
6	Би Ло Чунь	329.00	chay6.png
7	Те Гуань Инь	539.00	chay7.png
8	Бай Хао Иньчжэнь	735.00	chay8.png
\.


--
-- TOC entry 4839 (class 0 OID 17442)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, phone_number, password, created_at) FROM stdin;
21	79999144740	$2b$12$QLki3FlnEBWwaTJRkaQDlueSDbBIniBddD3HgfuieHAtGVHdySDo.	2025-04-07 21:34:26.053557+03
22	79999144741	$2b$12$Rc4OTHI/Fd/fZgv5WxdBEOSaQcUrWqXGW65zOF2FiNBbUnYRNXs9i	2025-04-07 21:35:04.207192+03
23	79999144750	$2b$12$ov.yahbZDtyEZ8g5/tKez..4ojLPub4w.RuH6Mxr2u2xXIYzeGFBu	2025-04-07 22:03:01.850945+03
24	79999144760	$2b$12$tAlTNooESdgS45jJqZ.KGuNFY.SHcJjgKlYo2bUlmz6jMl2xruxyG	2025-04-07 22:28:56.264722+03
25	79999144785	$2b$12$j2Sx0ZRuP7tDRa/xG/VHAeIpgpNQmw3EPSKtzElCX6YxGuCoE2yZu	2025-04-08 04:00:31.297199+03
26	79999144764	$2b$12$SUXWz/zeqWbj/sZeCJHyS.uaB9aiI6AvwcgDQlmOiMowodGMRJzee	2025-05-03 23:44:40.751867+03
27	79999144732	$2b$12$gKYe0YoffShWHGcsdMvvD.heK5SEzwPWQ20nwc9TlVT2O7FB9iHOG	2025-05-04 01:31:11.968126+03
28	79999144793	$2b$12$GABcxttKgSXk6F3pph/Lk.nHvMuiKOHlNbintr7PqneYwsTRZ4YnW	2025-05-04 06:03:41.156081+03
\.


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 16, true);


--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 28, true);


--
-- TOC entry 4677 (class 2606 OID 17465)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (product_id, user_id);


--
-- TOC entry 4685 (class 2606 OID 17509)
-- Name: favorite favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (product_id, user_id);


--
-- TOC entry 4683 (class 2606 OID 17494)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, product_id);


--
-- TOC entry 4680 (class 2606 OID 17483)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4675 (class 2606 OID 17459)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4671 (class 2606 OID 17450)
-- Name: users users_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_number_key UNIQUE (phone_number);


--
-- TOC entry 4673 (class 2606 OID 17448)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 1259 OID 17526)
-- Name: idx_order_items_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order ON public.order_items USING btree (order_id);


--
-- TOC entry 4678 (class 1259 OID 17525)
-- Name: idx_orders_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user ON public.orders USING btree (user_id);


--
-- TOC entry 4686 (class 2606 OID 17466)
-- Name: cart cart_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4687 (class 2606 OID 17471)
-- Name: cart cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4691 (class 2606 OID 17510)
-- Name: favorite favorite_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4692 (class 2606 OID 17515)
-- Name: favorite favorite_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4689 (class 2606 OID 17495)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 4690 (class 2606 OID 17500)
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4688 (class 2606 OID 17484)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-05-05 23:33:15

--
-- PostgreSQL database dump complete
--

