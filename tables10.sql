SELECT NombreCliente, RutCliente
FROM Clientes
WHERE RutCliente NOT IN (
    SELECT RutCliente
    FROM Arriendos
);

SELECT A.Folio, A.Fecha, A.Dias, A.ValorDia, C.NombreCliente, C.RutCliente
FROM Arriendos A
JOIN Clientes C ON A.RutCliente = C.RutCliente;

SELECT C.NombreCliente, C.RutCliente, H.NombreHerramienta
FROM Clientes C
JOIN Arriendos A ON C.RutCliente = A.RutCliente
JOIN Herramientas H ON A.HerramientaID = H.HerramientaID
WHERE H.NombreHerramienta = (
    SELECT H.NombreHerramienta
    FROM Arriendos A
    JOIN Herramientas H ON A.HerramientaID = H.HerramientaID
    GROUP BY H.NombreHerramienta
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
