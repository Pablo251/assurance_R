CREATE OR REPLACE FUNCTION ingresos(fecha_inicio DATE, fecha_fin DATE) RETURNS MONEY AS $$
DECLARE
ventas_mes bigint;
BEGIN
	SELECT INTO ventas_mes SUM(monto) from ventas WHERE fecha >= fecha_inicio AND fecha < fecha_fin LIMIT 100;
	RETURN ventas_mes;
END $$
LANGUAGE plpgsql;

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
