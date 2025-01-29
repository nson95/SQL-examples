-- ch7.
-- update and delete funcitonality

SELECT * 
	FROM Movie


INSERT INTO Movie(Title, Year, Rating, Director)
VALUES ('Test', 2025, 'R', 'Director')



SELECT *	
	FROM Movie 
	WHERE ID = 4


-- update statement
UPDATE Movie
	SET Title = 'TEST2',
		 Year = 2026
	WHERE ID = 4


-- delete statement

DELETE Movie
WHERE ID = 4


INSERT INTO Actor(FirstName, LastName, Gender, DOB)
VALUES ('Will', 'Ferrell', 'M', '1967-07-16'),
	   ('Zooey', 'Deschanel', 'F', '1980-01-17'),
	   ('Peter', 'Dinklage', 'M', '1969-06-21'),
	   ('John C.', 'Reilly', 'M', '1965-05-24'),
	   ('Mary', 'Steenburgen', 'F', '1953-02-08')






SELECT Title, CONCAT(LastName, ', ', FirstName) AS Actor, Role, YEAR, Director
	FROM Credit c
	JOIN Actor a 
	ON a.ID = c.ActorID
	JOIN Movie m
	ON m.ID = c.MovieID