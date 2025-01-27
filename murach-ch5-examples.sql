USE MurachCollege


-- 1. 

SELECT COUNT(DISTINCT InstructorID) AS InstructorCount,
	AVG(AnnualSalary) AS AvgAnnual
	FROM Instructors
	WHERE Status = 'f'


-- 2.

SELECT d.DepartmentName, COUNT(*) AS InstructorCount, MAX(i.AnnualSalary)
	FROM Departments d
	JOIN Instructors i 
	ON d.DepartmentID = i.DepartmentID
	GROUP BY DepartmentName 
	ORDER BY InstructorCount DESC

-- 3.

SELECT FirstName +' ' +LastName, COUNT(*) AS NumberofCourses, SUM(CourseUnits) AS TotalUnits
	FROM Instructors i
	JOIN Courses C 
	ON i.InstructorID = c.InstructorID
	GROUP BY FirstName +' ' +LastName
	ORDER BY TotalUnits DESC

-- 4. 

SELECT DepartmentName, CourseDescription, COUNT(*) AS StudentCount
	FROM Departments d
	JOIN Courses c 
	ON d.DepartmentID = c.DepartmentID
	JOIN StudentCourses sc 
	ON sc.CourseID = c.CourseID
	JOIN Students s 
	ON s.StudentID = sc.StudentID
	GROUP BY DepartmentName, CourseDescription
	ORDER BY DepartmentName, StudentCount DESC

-- 5. 

SELECT s.StudentID, SUM(CourseUnits) AS TotalCourseUnits
	FROM Students s
	JOIN StudentCourses sc
	ON s.StudentID = sc.StudentID
	JOIN Courses c
	ON c.CourseID = sc.CourseID
	GROUP BY s.StudentID
	ORDER BY TotalCourseUnits DESC


-- 6.

SELECT s.StudentID, SUM(CourseUnits) AS TotalCourseUnits
	FROM Students s
	JOIN StudentCourses sc
	ON s.StudentID = sc.StudentID
	JOIN Courses c
	ON c.CourseID = sc.CourseID
	WHERE GraduationDate IS NULL
	GROUP BY s.StudentID
	HAVING SUM(CourseUnits) > 9
	ORDER BY TotalCourseUnits DESC


-- 7.

SELECT LastName +', ' + FirstName, SUM(DISTINCT c.InstructorID) AS TotalCourses 
	FROM Courses c
	JOIN Instructors i
	ON c.InstructorID = i.InstructorID
	WHERE Status = 'p'
	GROUP BY LastName +', ' + FirstName WITH ROLLUP
	


