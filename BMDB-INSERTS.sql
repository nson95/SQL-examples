USE BMDB
GO

INSERT INTO Movie(Title, Year, Rating, Director)
VALUES ('Step Brothers', 2008, 'R', 'Adam McKay'),
				('Elf', 2003, 'PG', 'Jon Favreau');
--				('Step Brothers', 2008, 'R', 'Adam McKay');
--				('Step Brothers', 2008, 'R', 'Adam McKay');
--				('Step Brothers', 2008, 'R', 'Adam McKay');


Credits - 
ELf (2)
Will Ferrell (1) - Buddy
Zooey Deschanel (2) - Jovie
Peter Dinklage (3) - Miles Finch

Step Brothers (1)

INSERT INTO Actor(FirstName, LastName, Gender, DOB)
VALUES ('Will', 'Ferrell', 'M', '1967-07-16'),
	   ('Zooey', 'Deschanel', 'F', '1980-01-17'),
	   ('Peter', 'Dinklage', 'M', '1969-06-21'),
	   ('John C.', 'Reilly', 'M', '1965-05-24'),
	   ('Mary', 'Steenburgen', 'F', '1953-02-08'),
	   ('Brad', 'Pitt', 'M', '1963-12-28'),
	   ('Morgan', 'Freeman', 'M', '1937-06-01'),
	   ('Gwyneth', 'Paltrow', 'F', '1972-09-27'),
	   ('Jim', 'Carrey', 'M', '1962-01-17'),
	   ('Steve', 'Carell', 'M', '1962-08-16'),
	   ('Jeff', 'Bridges', 'M', '1949-12-04'),
	   ('John', 'Goodman', 'M', '1952-06-20'),
	   ('Steve', 'Buscemi', 'M', '1957-12-13'),
	   ('John', 'Turturro', 'M', '1957-02-28'),
	   ('George', 'Clooney', 'M', '1961-05-06'),
	   ('Tim Blake', 'Nelson', 'M', '1964-05-11')



INSERT INTO Credit (MovieID, ActorID, Role)
VALUES  (2, 1, 'Buddy'),
		(2, 2, 'Jovie'),
		(2, 3, 'Miles Finch'),
		(2, 5, 'Emily Hobbs'),
		(1, 1, 'Brennan Huff'),
		(1, 4, 'Dale Doback'),
		(1, 5, 'Nancy Huff'),
		(3, 6, 'David Mills'),
		(3, 7, 'Detective Lt. William Somerset'),
		(3, 8, 'Tracy Mills'),
		(4, 9, 'Bruce Nolan'),
		(4, 7, 'God'),
		(4, 10, 'Evan Baxter')
		(5, 11, 'The Dude'),
		(5, 12, 'Walter Sobchak'),
		(5, 13, 'Theodore Donald Kerabatsos'),
		(5, 14, 'Jesus Quintana'),
		(6, 15, 'Ulysses Everett McGill'),
		(6, 16, 'Delmar O''Donnel'),
		(6, 12, 'Big Dan Teague'),
		(6, 14, 'Pete')
		
		USE BMDB
		SELECT * FROM MOVIE
		SELECT * FROM Actor
		

		INSERT INTO Movie(Title, Year, Rating, Director)
VALUES		('Seven', 1995, 'R', 'David Fincher'),
	('Bruce Almighty', 2003, 'PG-13', 'Tom Shadyac'),
	('The Big Lebowski', 1998, 'R', 'The Cohen Brothers'),
	('O Brother, Where Art Thou', 2000, 'PG-13', 'The Cohen Brothers'),
	('Step Brothers', 2008, 'R', 'Adam McKay'),
		('Elf', 2003, 'PG', 'Jon Favreau');