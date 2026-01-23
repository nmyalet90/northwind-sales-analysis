SELECT
    o.OrderID,
    o.OrderDate,
    o.CustomerID,
    o.EmployeeID,
    o.ShipVia AS ShipperID,
    od.ProductID,
    od.Quantity,
    od.UnitPrice,
    od.Discount,
    (od.UnitPrice * od.Quantity * (1 - od.Discount)) AS SalesAmount
FROM Orders o
JOIN [Order Details] od 
    ON o.OrderID = od.OrderID;
