USE prsdb

INSERT INTO [User](UserName, Password, FirstName, LastName, PhoneNumber, Email,
Reviewer, Admin)
VALUES ('nson95', 'password1!', 'Nick', 'Sonnenberg', '513-373-1999', 'nicksonnenberg95@gmail.com',
1, 1),
('jb9', 'whodey', 'Joe', 'Burrow', '999-999-9999', 'patrickmahomesfather@gmail.com',
0, 0)

INSERT INTO Vendor(Code, Name, Address, City, State, Zip, PhoneNumber, Email)
VALUES ('MC', 'Micro Center', '11755 Mosteller Rd', 'Sharonville', 'OH', '45241',
)