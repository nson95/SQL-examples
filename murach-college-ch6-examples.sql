USE MurachCollege

-- 1.

SELECT LastName, FirstName
	FROM Instructors i
	WHERE i.InstructorID IN
	(SELECT DISTINCT InstructorID
	FROM Courses)
	ORDER BY LastName, FirstName

-- 2.

SELECT LastName, FirstName, AnnualSalary
	FROM Instructors
	WHERE AnnualSalary > (
	SELECT AVG(AnnualSalary) 
	FROM Instructors)
	ORDER BY AnnualSalary DESC


-- 3. 

SELECT LastName, FirstName
	FROM Instructors i
	WHERE NOT EXISTS
	(SELECT InstructorID
	FROM Courses c
	WHERE i.InstructorID = c.InstructorID)
	ORDER BY LastName, FirstName


-- 4.
--need to get example of how to work through or figure this out
SELECT LastName, FirstName
	FROM Students s
	JOIN StudentCourses sc
	ON s.StudentID = sc.StudentID



-- 5. 
SELECT LastName, FirstName, AnnualSalary
	FROM Instructors i
	WHERE AnnualSalary NOT IN
	(SELECT AnnualSalary 
	FROM Instructors i2
	GROUP BY AnnualSalary
	HAVING COUNT(AnnualSalary) > 1)
	ORDER BY LastName, FirstName


	


	
