--
-- PostgreSQL database dump
--

\restrict EYS72qt6NdcjC1ks4eNxVId7jsJg0a2XVK7xKnUgxzUDhfh5jkLCaWCTdag3Vy2

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.4 (Debian 18.4-1.pgdg13+1)

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
-- Name: antecedentes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.antecedentes (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    patologicos text DEFAULT 'Sin enfermedades crónicas.'::text,
    medicaciones text DEFAULT 'Sin medicaciones regulares.'::text,
    quirurgicos text,
    alergias text DEFAULT 'Sin alergias conocidas.'::text,
    toxicos text DEFAULT 'No refiere.'::text,
    habitos text,
    vacunacion text,
    tocogineco text DEFAULT 'No refiere.'::text,
    familiares text
);


--
-- Name: antecedentes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.antecedentes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: antecedentes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.antecedentes_id_seq OWNED BY public.antecedentes.id;


--
-- Name: citas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.citas (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    fecha date NOT NULL,
    horario character varying(20) NOT NULL,
    estado character varying(50),
    observaciones text
);


--
-- Name: citas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.citas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: citas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.citas_id_seq OWNED BY public.citas.id;


--
-- Name: consultas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.consultas (
    id integer NOT NULL,
    paciente_id integer,
    fecha_hora timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    motivo_consulta text NOT NULL,
    enfermedad_actual text,
    antecedentes integer,
    signos_vitales text,
    exploracion_fisica text,
    diag_info_plan_ia text,
    diagnostico_med text,
    terapia_med text,
    internado smallint DEFAULT 0 NOT NULL
);


--
-- Name: consultas_guardia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.consultas_guardia (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    motivo_consulta text NOT NULL,
    anamnesis text,
    exploracion text,
    signos_vitales text,
    diagnostico text,
    estudios text,
    conductas text,
    fecha_hora timestamp without time zone NOT NULL,
    interna smallint DEFAULT 0
);


--
-- Name: consultas_guardia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.consultas_guardia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: consultas_guardia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.consultas_guardia_id_seq OWNED BY public.consultas_guardia.id;


--
-- Name: consultas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.consultas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: consultas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.consultas_id_seq OWNED BY public.consultas.id;


--
-- Name: estudios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estudios (
    id integer NOT NULL,
    paciente_id integer,
    fecha_creado timestamp without time zone NOT NULL,
    fecha_resultado timestamp without time zone,
    tipo character varying(100) NOT NULL,
    nombre_estudio character varying(200) NOT NULL,
    ruta_estudio text,
    informe text,
    servicio character varying(100) NOT NULL
);


--
-- Name: estudios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estudios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estudios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.estudios_id_seq OWNED BY public.estudios.id;


--
-- Name: evoluciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evoluciones (
    id integer NOT NULL,
    paciente_id integer,
    evolucion_med text NOT NULL,
    alta_med smallint DEFAULT 0,
    fecha_hora timestamp without time zone NOT NULL,
    estado_clinico character varying(100) DEFAULT NULL::character varying
);


--
-- Name: evoluciones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.evoluciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: evoluciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.evoluciones_id_seq OWNED BY public.evoluciones.id;


--
-- Name: pacientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pacientes (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    documento character varying(50),
    fecha_nacimiento date,
    sexo character varying(20),
    telefono character varying(50),
    email character varying(150),
    direccion text,
    creado_en timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: pacientes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;


--
-- Name: antecedentes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.antecedentes ALTER COLUMN id SET DEFAULT nextval('public.antecedentes_id_seq'::regclass);


--
-- Name: citas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.citas ALTER COLUMN id SET DEFAULT nextval('public.citas_id_seq'::regclass);


--
-- Name: consultas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultas ALTER COLUMN id SET DEFAULT nextval('public.consultas_id_seq'::regclass);


--
-- Name: consultas_guardia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultas_guardia ALTER COLUMN id SET DEFAULT nextval('public.consultas_guardia_id_seq'::regclass);


--
-- Name: estudios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudios ALTER COLUMN id SET DEFAULT nextval('public.estudios_id_seq'::regclass);


--
-- Name: evoluciones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evoluciones ALTER COLUMN id SET DEFAULT nextval('public.evoluciones_id_seq'::regclass);


--
-- Name: pacientes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);


--
-- Name: antecedentes antecedentes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.antecedentes
    ADD CONSTRAINT antecedentes_pkey PRIMARY KEY (id);


--
-- Name: citas citas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id);


--
-- Name: consultas_guardia consultas_guardia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultas_guardia
    ADD CONSTRAINT consultas_guardia_pkey PRIMARY KEY (id);


--
-- Name: consultas consultas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id);


--
-- Name: estudios estudios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudios
    ADD CONSTRAINT estudios_pkey PRIMARY KEY (id);


--
-- Name: evoluciones evoluciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evoluciones
    ADD CONSTRAINT evoluciones_pkey PRIMARY KEY (id);


--
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- Name: antecedentes antecedentes_paciente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.antecedentes
    ADD CONSTRAINT antecedentes_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) ON DELETE CASCADE;


--
-- Name: citas citas_paciente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) ON DELETE CASCADE;


--
-- Name: consultas consultas_antecedentes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_antecedentes_fkey FOREIGN KEY (antecedentes) REFERENCES public.antecedentes(id) ON DELETE SET NULL;


--
-- Name: consultas_guardia consultas_guardia_paciente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultas_guardia
    ADD CONSTRAINT consultas_guardia_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) ON DELETE CASCADE;


--
-- Name: consultas consultas_paciente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) ON DELETE SET NULL;


--
-- Name: estudios estudios_paciente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudios
    ADD CONSTRAINT estudios_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) ON DELETE SET NULL;


--
-- Name: evoluciones evoluciones_paciente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evoluciones
    ADD CONSTRAINT evoluciones_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict EYS72qt6NdcjC1ks4eNxVId7jsJg0a2XVK7xKnUgxzUDhfh5jkLCaWCTdag3Vy2

