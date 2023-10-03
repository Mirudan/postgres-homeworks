-- SQL-команды для создания таблиц

-- employees
CREATE TABLE IF NOT EXISTS public.employees
(
    employee_id integer NOT NULL DEFAULT nextval('employees_employee_id_seq'::regclass),
    first_name character varying(64) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(64) COLLATE pg_catalog."default" NOT NULL,
    title text COLLATE pg_catalog."default" NOT NULL,
    birth_date date NOT NULL,
    notes text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_employee_id PRIMARY KEY (employee_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employees
    OWNER to postgres;

-- customers
CREATE TABLE IF NOT EXISTS public.customers
(
    customers_id character varying(128) COLLATE pg_catalog."default" NOT NULL,
    company_name text COLLATE pg_catalog."default" NOT NULL,
    contact_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_customers_id PRIMARY KEY (customers_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customers
    OWNER to postgres;

-- orders
CREATE TABLE IF NOT EXISTS public.orders
(
    order_id integer NOT NULL,
    customer_id character varying(128) COLLATE pg_catalog."default" NOT NULL,
    employee_id integer NOT NULL,
    order_date date NOT NULL,
    ship_city character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_order_id PRIMARY KEY (order_id),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
        REFERENCES public.customers (customers_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_employee_id FOREIGN KEY (employee_id)
        REFERENCES public.employees (employee_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;