Create database Student_Management_System;

Use Student_Management_System;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    DepartmentID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(100) NOT NULL
);


CREATE TABLE BookCategories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL
);


CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT,
    CategoryID INT,
    ISBN VARCHAR(20) UNIQUE,
    TotalCopies INT DEFAULT 1,
    AvailableCopies INT DEFAULT 1,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES BookCategories(CategoryID)
);


CREATE TABLE Librarians (
    LibrarianID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);


CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    StudentID INT,
    LibrarianID INT,
    IssueDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (LibrarianID) REFERENCES Librarians(LibrarianID)
);


CREATE TABLE Fines (
    FineID INT PRIMARY KEY AUTO_INCREMENT,
    IssueID INT,
    FineAmount DECIMAL(6,2),
    Paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (IssueID) REFERENCES IssuedBooks(IssueID)
);


INSERT INTO Departments (DepartmentName) VALUES 
('Computer Science'),
('Mechanical Engineering'),
('Electrical Engineering'),
('Civil Engineering'),
('Business Administration'),
('English Literature'),
('Mathematics'),
('Physics');

INSERT INTO Students (FullName, Email, PhoneNumber, DepartmentID, EnrollmentDate) VALUES
('Aarav Mehta', 'aarav.mehta@university.edu', '9876543210', 1, '2022-07-15'),
('Neha Sharma', 'neha.sharma@university.edu', '9823456789', 2, '2021-08-01'),
('Ravi Kumar', 'ravi.kumar@university.edu', '9812345678', 5, '2023-01-10'),
('Isha Desai', 'isha.desai@university.edu', '9901234567', 6, '2022-02-20'),
('Sanjay Patel', 'sanjay.patel@university.edu', '9876001111', 3, '2022-06-01'),
('Pooja Nair', 'pooja.nair@university.edu', '9876002222', 4, '2023-01-25'),
('Tanya Bhosale', 'tanya.bhosale@university.edu', '9876003333', 7, '2022-08-14'),
('Mohit Verma', 'mohit.verma@university.edu', '9876004444', 8, '2021-09-10'),
('Anjali Kapoor', 'anjali.kapoor@university.edu', '9876005555', 1, '2023-02-18'),
('Rohan Das', 'rohan.das@university.edu', '9876006666', 5, '2022-11-05');


INSERT INTO Authors (AuthorName) VALUES
('J.K. Rowling'),
('George Orwell'),
('Dan Brown'),
('Chetan Bhagat'),
('Paulo Coelho'),
('Stephen Hawking'),
('Agatha Christie'),
('Robin Sharma');


INSERT INTO BookCategories (CategoryName) VALUES
('Fiction'),
('Thriller'),
('Science'),
('Self-Help'),
('Biography'),
('Engineering');


INSERT INTO Books (Title, AuthorID, CategoryID, ISBN, TotalCopies, AvailableCopies) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 1, '9780747532743', 5, 2),
('1984', 2, 3, '9780451524935', 3, 1),
('The Da Vinci Code', 3, 2, '9780307474278', 4, 2),
('2 States', 4, 4, '9788129115300', 2, 0),
('The Alchemist', 5, 1, '9780061122415', 5, 4),
('Brief History of Time', 6, 3, '9780553176988', 4, 3),
('Murder on the Orient Express', 7, 2, '9780062693662', 3, 3),
('The Monk Who Sold His Ferrari', 8, 4, '9780062515677', 3, 2),
('To Kill a Mockingbird', 2, 1, '9780061120084', 2, 1),
('Digital Fortress', 3, 2, '9780312944926', 3, 2),
('Wings of Fire', 4, 5, '9788173711466', 4, 3),
('Thermodynamics Basics', 6, 6, '9788121921950', 2, 2);


INSERT INTO Librarians (FullName, Email, PhoneNumber) VALUES
('Sunita Rao', 'sunita.rao@university.edu', '9876543211'),
('Ajay Verma', 'ajay.verma@university.edu', '9876543212'),
('Priya Nanda', 'priya.nanda@university.edu', '9876543213'),
('Rajesh Iyer', 'rajesh.iyer@university.edu', '9876543214'),
('Sneha Pillai', 'sneha.pillai@university.edu', '9876543215');


INSERT INTO IssuedBooks (BookID, StudentID, LibrarianID, IssueDate, DueDate, ReturnDate) VALUES
(1, 1, 1, '2025-04-01', '2025-04-15', NULL),
(2, 2, 2, '2025-03-20', '2025-04-05', '2025-04-07'),
(3, 3, 3, '2025-04-10', '2025-04-24', NULL),
(4, 4, 4, '2025-03-25', '2025-04-10', '2025-04-08'),
(5, 5, 1, '2025-04-01', '2025-04-15', NULL),
(6, 6, 2, '2025-04-02', '2025-04-16', NULL),
(7, 7, 3, '2025-03-28', '2025-04-12', '2025-04-11'),
(8, 8, 4, '2025-04-05', '2025-04-19', NULL),
(9, 9, 5, '2025-04-06', '2025-04-20', NULL),
(10, 10, 1, '2025-04-07', '2025-04-21', NULL);


INSERT INTO Fines (IssueID, FineAmount, Paid) VALUES
(2, 50.00, TRUE),
(4, 20.00, TRUE),
(7, 10.00, FALSE);


# Show all students
SELECT * FROM Students;

# List all books with available copies.
SELECT Title, AvailableCopies FROM Books WHERE AvailableCopies > 0;

# Show all departments.
SELECT * FROM Departments;

# Get student names and their emails
SELECT FullName, Email FROM Students;

# List all authors in alphabetical order
SELECT AuthorName FROM Authors ORDER BY AuthorName;

# List all issued books (not yet returned)
SELECT s.FullName, b.Title, i.IssueDate, i.DueDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL;

# Count total number of books per category
SELECT c.CategoryName, COUNT(*) AS TotalBooks
FROM Books b
JOIN BookCategories c ON b.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

# Find students who borrowed books from the "Thriller" category.
SELECT DISTINCT s.FullName
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
JOIN BookCategories c ON b.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Thriller';

# Show books with their authors and categories.
SELECT b.Title, a.AuthorName, c.CategoryName
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
JOIN BookCategories c ON b.CategoryID = c.CategoryID;

# Get all returned books with return dates.
SELECT s.FullName, b.Title, i.ReturnDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NOT NULL;

# List students with unpaid fines
SELECT s.FullName, f.FineAmount
FROM Fines f
JOIN IssuedBooks i ON f.IssueID = i.IssueID
JOIN Students s ON i.StudentID = s.StudentID
WHERE f.Paid = FALSE;

# Top 5 most issued books
SELECT b.Title, COUNT(*) AS IssueCount
FROM IssuedBooks i
JOIN Books b ON i.BookID = b.BookID
GROUP BY b.Title
ORDER BY IssueCount DESC
LIMIT 5;

# Find students who have issued more than 1 book.
SELECT s.FullName, COUNT(*) AS BooksIssued
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
GROUP BY s.FullName
HAVING COUNT(*) > 1;

# Show overdue books (due date passed and not returned).
SELECT s.FullName, b.Title, i.DueDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL AND i.DueDate < CURDATE();

# Department-wise student count.
SELECT d.DepartmentName, COUNT(s.StudentID) AS TotalStudents
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
























