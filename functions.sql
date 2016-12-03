CREATE OR REPLACE FUNCTION ingresos(fecha_inicio DATE, fecha_fin DATE) RETURNS MONEY AS $$
DECLARE
ventas_mes bigint;
BEGIN
	SELECT INTO ventas_mes SUM(monto) from ventas WHERE fecha >= fecha_inicio AND fecha < fecha_fin LIMIT 100;
	RETURN ventas_mes;
END $$
LANGUAGE plpgsql;
