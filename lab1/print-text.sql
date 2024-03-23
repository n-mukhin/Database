WITH RandomTexts AS (
    SELECT
        generate_series(1, 6) AS num
),
DinosaursText1 AS (
    SELECT
        Din.Вид || ', ' || Д_1.Описание || '. ' AS Текст
    FROM
        RandomTexts
    LEFT JOIN
        Действия AS Д_1 ON Д_1.Динозавр_ID IS NOT NULL
    LEFT JOIN
        Динозавры AS Din ON Д_1.Динозавр_ID = Din.ID
    LEFT JOIN
        Состояния_Динозавров AS С ON Din.Состояние_ID = С.ID
    LEFT JOIN
        Голоса_Динозавров AS Г ON Din.Голос_ID = Г.ID
    ORDER BY
        RANDOM()
    LIMIT 1
),
HumansText1 AS (
    SELECT
        L.Имя || ' ' || Д_1.Описание || ' ' || Д_1.Дата_и_время || '.' AS Текст
    FROM
        RandomTexts
    LEFT JOIN
        Действия AS Д_1 ON Д_1.Человек_ID IS NOT NULL
    LEFT JOIN
        Люди AS L ON Д_1.Человек_ID = L.ID
    ORDER BY
        RANDOM()
    LIMIT 1
),
DinosaursText2 AS (
    SELECT
        'Он ' || Д_2.Описание || '. ' AS Текст
    FROM
        RandomTexts
    LEFT JOIN
        Действия AS Д_2 ON Д_2.Динозавр_ID IS NOT NULL
    LEFT JOIN
        Динозавры AS Din ON Д_2.Динозавр_ID = Din.ID
    LEFT JOIN
        Состояния_Динозавров AS С ON Din.Состояние_ID = С.ID
    LEFT JOIN
        Голоса_Динозавров AS Г ON Din.Голос_ID = Г.ID
    ORDER BY
        RANDOM()
    LIMIT 1
),
HumansText2 AS (
    SELECT
        L.Имя || ' ' || Д_2.Описание || '.' AS Текст
    FROM
        RandomTexts
    LEFT JOIN
        Действия AS Д_2 ON Д_2.Человек_ID IS NOT NULL
    LEFT JOIN
        Люди AS L ON Д_2.Человек_ID = L.ID
    ORDER BY
        RANDOM()
    LIMIT 1
),
DinosaursText3 AS (
    SELECT
        Din.Вид || ' ' || С.Состояние || ' и ' || Г.Звук || '. ' AS Текст
    FROM
        RandomTexts
    LEFT JOIN
        Действия AS Д_3 ON Д_3.Динозавр_ID IS NOT NULL
    LEFT JOIN
        Динозавры AS Din ON Д_3.Динозавр_ID = Din.ID
    LEFT JOIN
        Состояния_Динозавров AS С ON Din.Состояние_ID = С.ID
    LEFT JOIN
        Голоса_Динозавров AS Г ON Din.Голос_ID = Г.ID
    ORDER BY
        RANDOM()
    LIMIT 1
),
HumansText3 AS (
    SELECT
        L.Имя || ' ' || Д_3.Описание || '.' AS Текст
    FROM
        RandomTexts
    LEFT JOIN
        Действия AS Д_3 ON Д_3.Человек_ID IS NOT NULL
    LEFT JOIN
        Люди AS L ON Д_3.Человек_ID = L.ID
    ORDER BY
        RANDOM()
    LIMIT 1
)
SELECT Текст FROM (
    SELECT * FROM DinosaursText1
    UNION ALL
    SELECT * FROM HumansText1
    UNION ALL
    SELECT * FROM DinosaursText2
    UNION ALL
    SELECT * FROM HumansText2
    UNION ALL
    SELECT * FROM DinosaursText3
    UNION ALL
    SELECT * FROM HumansText3
) AS CombinedTexts;
