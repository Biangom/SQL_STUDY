SELECT * FROM emp;

-- 3
SELECT E.ENAME, E.SAL, D.DNAME
FROM emp AS E
	INNER JOIN dept AS D
		ON E.DEPTNO = D.DEPTNO;
        
-- 4
SELECT E.ENAME, D.DNAME
FROM emp AS E
	INNER JOIN dept AS D
		ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME = 'KING';

-- 5
SELECT D.DNAME, E.ENAME, D.DEPTNO, D.DNAME, E.SAL
FROM dept AS D
	LEFT OUTER JOIN emp AS E
		ON D.deptno = E.deptno;


-- 6
SELECT CONCAT(E.ENAME, '의 매니저는 ', M.ENAME, '이다') AS 문장
FROM emp AS E
	INNER JOIN emp AS M
		ON E.MGR = M.EMPNO;


-- 7
SELECT E.ENAME, E.DEPTNO, E.SAL, E.JOB
FROM emp AS E
	WHERE E.JOB = (SELECT JOB
				FROM emp
				WHERE ENAME = 'SCOTT');
                
                
-- 8
SELECT E.EMPNO, E.ENAME, E.HIREDATE, E.SAL
FROM emp AS E
	WHERE E.deptno = (SELECT DEPTNO
				FROM emp
				WHERE ENAME = 'SCOTT');

-- 9
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL
FROM emp AS E
	INNER JOIN dept AS D
		ON E.deptno = D.deptno	
WHERE E.SAL > (SELECT AVG(SAL)
				FROM emp);
                
                
-- 10
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC, E.SAL
FROM emp AS E
	INNER JOIN dept AS D
		ON E.deptno = D.deptno	
WHERE E.job IN (SELECT job FROM emp WHERE deptno = 30)
ORDER BY SAL DESC;

-- 11
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC
FROM emp AS E
	INNER JOIN dept AS D
    ON E.deptno = D.deptno
WHERE E.DEPTNO = 10 AND E.JOB NOT IN (SELECT JOB
			FROM emp
            WHERE DEPTNO = 30);

-- 12
SELECT EMPNO, ENAME, SAL
FROM emp
WHERE SAL IN (SELECT SAL
			FROM emp
            WHERE ENAME IN ('KING', 'JAMES'));


-- 13
SELECT EMPNO, ENAME, SAL
FROM emp
WHERE SAL > (SELECT MAX(SAL)
			FROM emp
            GROUP BY DEPTNO
            HAVING DEPTNO = 30);

-- 15
SELECT ENAME, SAL
FROM emp
WHERE YEAR(HIREDATE) = YEAR((SELECT HIREDATE
						FROM emp
						WHERE ENAME = 'ALLEN'));
