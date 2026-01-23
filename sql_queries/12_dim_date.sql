CREATE TABLE dim_date (
    DateKey INT PRIMARY KEY,          -- YYYYMMDD
    [Date] DATE NOT NULL,
    [Year] INT,
    [Month] INT,
    MonthName VARCHAR(20),
    MonthShort VARCHAR(3),
    Quarter INT,
    YearMonth VARCHAR(7),              -- YYYY-MM
    DayOfMonth INT,
    DayOfWeek INT,
    DayName VARCHAR(20),
    IsWeekend BIT
);

DECLARE @StartDate DATE = '1996-01-01';
DECLARE @EndDate   DATE = '1998-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO dim_date
    SELECT
        CONVERT(INT, FORMAT(@StartDate, 'yyyyMMdd')) AS DateKey,
        @StartDate,
        YEAR(@StartDate),
        MONTH(@StartDate),
        DATENAME(MONTH, @StartDate),
        LEFT(DATENAME(MONTH, @StartDate), 3),
        DATEPART(QUARTER, @StartDate),
        FORMAT(@StartDate, 'yyyy-MM'),
        DAY(@StartDate),
        DATEPART(WEEKDAY, @StartDate),
        DATENAME(WEEKDAY, @StartDate),
        CASE 
            WHEN DATENAME(WEEKDAY, @StartDate) IN ('Saturday', 'Sunday') THEN 1 
            ELSE 0 
        END;

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;
