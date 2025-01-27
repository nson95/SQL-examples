-- ch4 8 
SELECT * 
	FROM Departments;

SELECT *
	FROM Instructors

SELECT CourseDescription, D.DepartmentName AS CourseDept, 
LastName + ', ' +FirstName AS InstructorName, D2.DepartmentName AS InstructorDept
	FROM Courses C
	JOIN Departments D ON C.DepartmentID = D.DepartmentID
	JOIN Instructors I ON C.InstructorID = I.InstructorID
	JOIN Departments D2 ON I.DepartmentID = D2.DepartmentID
	WHERE D.DepartmentID != D2.DepartmentID

	-- Excersize 7. instructors who havent been assigned a course
	
SELECT LastName + ', ' + FirstName AS InstructorName, CourseDescription
	FROM Instructors I
	LEFT JOIN Courses C ON I.InstructorID = C.InstructorID
	WHERE CourseDescription IS NULL