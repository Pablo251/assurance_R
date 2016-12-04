-- Funciones de los KPI

-- Ingresos en un rango de fechas
CREATE OR REPLACE FUNCTION ventas(fecha_inicio DATE, fecha_fin DATE, row_limit INTEGER) RETURNS BIGINT AS $$
DECLARE
ventas bigint;
BEGIN
	IF row_limit IS NULL
	THEN
		SELECT INTO ventas SUM(monto) from (SELECT monto from ventas WHERE fecha >= fecha_inicio AND fecha < fecha_fin) as ventas;
	ELSE
		SELECT INTO ventas SUM(monto) from (SELECT monto from ventas WHERE fecha >= fecha_inicio AND fecha < fecha_fin LIMIT row_limit) as ventas;
	END IF;
	RETURN ventas;
END $$
LANGUAGE plpgsql;

-- Inversiones en un cierto rango de fechas
CREATE OR REPLACE FUNCTION inversiones(fecha_inicio DATE, fecha_fin DATE, row_limit integer) RETURNS BIGINT AS $$
DECLARE
inversiones bigint;
BEGIN
	IF row_limit IS NULL
	THEN
		SELECT INTO inversiones SUM(monto) from (SELECT monto from inversiones WHERE fecha >= fecha_inicio AND fecha < fecha_fin) as inversiones;
	ELSE
		SELECT INTO inversiones SUM(monto) from (SELECT monto from inversiones WHERE fecha >= fecha_inicio AND fecha < fecha_fin LIMIT row_limit) as inversiones;
	END IF;
	RETURN inversiones;
END $$
LANGUAGE plpgsql;

-- Beneficio o rentabilidad de la inversión
CREATE OR REPLACE FUNCTION rentabilidad_inversion(fecha_inicio DATE, fecha_fin DATE) RETURNS BIGINT AS $$
DECLARE
ventas BIGINT;
inversiones BIGINT;
BEGIN
	SELECT INTO ventas ventas(fecha_inicio, fecha_fin, NULL);
	SELECT INTO inversiones inversiones(fecha_inicio, fecha_fin, NULL);

	IF inversiones IS NULL
	THEN
		inversiones := 0;
	END IF;

	RETURN ventas + inversiones;
END $$
LANGUAGE plpgsql;

-- Interés del producto


-- Crecimiento de las ventas


-- Fidelidad del cliente



-- Funciones para la creación de datos aleatorios

-- Crear ventas aleatorias
CREATE OR REPLACE FUNCTION crear_ventas()
RETURNS void AS
$BODY$BEGIN
	for i in 1..43 loop
		INSERT INTO public.ventas(id_cliente, fecha, monto) VALUES (random()*(43-1)+1, now() + trunc(random()  * 20) * '1 day'::interval, 0);
	end loop;
END;$BODY$
LANGUAGE 'plpgsql' VOLATILE;

-- Crear los contratos basados en los 12 seguros registrados.
CREATE OR REPLACE FUNCTION crear_contratos()
RETURNS void AS
$BODY$BEGIN
	for i in 1..43 loop
		INSERT INTO public.contratos(id_seguro, duracion) VALUES (random() * (12-1)+1, random() * 12);
	end loop;
END;$BODY$
LANGUAGE 'plpgsql' VOLATILE;

-- Generar 167 ventas
CREATE OR REPLACE FUNCTION generar_ventas() RETURNS void AS $$
DECLARE
num_contrato bigint;
BEGIN
	for i in 1..167 loop
	-- Crear una nueva venta
	INSERT INTO public.ventas(id, id_cliente, fecha, monto) VALUES (default, random()*(43-1)+1, timestamp '2016-12-01 20:00:00' + (random() * (timestamp '2016-12-31 20:00:00' -timestamp '2016-12-01 10:00:00')), 0);
	--** Alojar en una variable el valor del random para el contrato
	num_contrato = random()*(47-1)+1;
	-- Crear una ventas_contratos
	INSERT INTO ventas_contratos(id_venta, id_contrato, fecha_limite) values (currval('ventas_id_seq'), num_contrato, now());
	-- Actualizar fecha límite
	UPDATE public.ventas_contratos
	SET fecha_limite=
		(select (v.fecha + '1 month'::interval * c.duracion) as "suma"
		from contratos as c, ventas_contratos as vc, ventas as v
		where vc.id_contrato = c.id and vc.id_venta = v.id and vc.id_contrato = num_contrato and vc.id_venta = currval('ventas_id_seq'))
	WHERE id_venta= currval('ventas_id_seq');
	-- Actualizar el monto de la venta
	UPDATE public.ventas
	SET monto=
		(select s.precio
		from seguros as s, contratos as c, ventas_contratos as vc, ventas as v
		where v.id = vc.id_venta and vc.id_contrato = c.id and c.id_seguro = s.id and v.id = currval('ventas_id_seq'))
	WHERE id=currval('ventas_id_seq');
	end loop;
END $$
LANGUAGE plpgsql;
