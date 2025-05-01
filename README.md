# 📘 Library Student Management System (SQL Project)

## 🧠 Project Objective
To design and implement a **relational database** for managing a library system in a student-based environment. The project allows for the management of students, books, issue/return transactions, fines, authors, and departments using SQL.

## 📂 Database Tables Used

| Table Name       | Description |
|------------------|-------------|
| **Students**     | Stores student details (name, email, department, etc.) |
| **Departments**  | Academic departments like CS, IT, etc. |
| **Books**        | Book details including title, author, category |
| **Authors**      | Author information |
| **BookCategories** | Book genres like Thriller, Drama, etc. |
| **IssuedBooks**  | Issue/return records of books |
| **Fines**        | Tracks fines for overdue books |

## 🔗 Table Relationships
- **Students** belong to one **Department**
- **Books** have one **Author** and one **Category**
- **IssuedBooks** links **Students** and **Books**
- **Fines** are linked to **IssuedBooks**

## 🔍 Features Covered
- Store and manage student data
- Add and track books with categories and authors
- Issue and return books with date tracking
- Auto-calculate fines for overdue books
- Simple reporting (book counts, department stats, etc.)

## 📊 Sample Queries Included
15 SQL queries (basic to advanced) such as:
- View available books
- Show overdue books
- Department-wise student count
- Top 5 most issued books
- Students with unpaid fines
