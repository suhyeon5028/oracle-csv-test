-- 가장 많이 발생한 암 종류의 암종, 발생자수 출력
SELECT 암종, 발생자수
FROM CANCER_STATISTICS
WHERE 발생자수 = (
    SELECT MAX(발생자수) 
    FROM CANCER_STATISTICS
    WHERE 분율 NOT IN (100)
);

-- 가장 많이 발생한 암 종류 1 ~ 5위까지 자료 출력
SELECT *
FROM (
    SELECT a.*, RANK() OVER (ORDER BY 발생자수 DESC) 등수
    FROM CANCER_STATISTICS a
    WHERE 분율 NOT IN (100)
)
WHERE ROWNUM <= 5;

-- 분율이 10% 이상인 자료 출력
SELECT *
FROM CANCER_STATISTICS
WHERE 분율 >= 10 AND 분율 NOT IN (100);

-- 백혈병의 발생자수 출력
SELECT 암종, 발생자수
FROM CANCER_STATISTICS
WHERE 암종 LIKE '%백혈병%';