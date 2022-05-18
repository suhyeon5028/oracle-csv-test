-- ���� ���� �߻��� �� ������ ����, �߻��ڼ� ���
SELECT ����, �߻��ڼ�
FROM CANCER_STATISTICS
WHERE �߻��ڼ� = (
    SELECT MAX(�߻��ڼ�) 
    FROM CANCER_STATISTICS
    WHERE ���� NOT IN (100)
);

-- ���� ���� �߻��� �� ���� 1 ~ 5������ �ڷ� ���
SELECT *
FROM (
    SELECT a.*, RANK() OVER (ORDER BY �߻��ڼ� DESC) ���
    FROM CANCER_STATISTICS a
    WHERE ���� NOT IN (100)
)
WHERE ROWNUM <= 5;

-- ������ 10% �̻��� �ڷ� ���
SELECT *
FROM CANCER_STATISTICS
WHERE ���� >= 10 AND ���� NOT IN (100);

-- �������� �߻��ڼ� ���
SELECT ����, �߻��ڼ�
FROM CANCER_STATISTICS
WHERE ���� LIKE '%������%';