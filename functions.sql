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
		INSERT INTO public.ventas(id_cliente, fecha, monto) VALUES (random()*(43-1)+1, now() + trunc(random()  * 20) * '1 day'::interval, '1000' * i);
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
