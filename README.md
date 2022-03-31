# Pewlett Hackard Analysis - A pgAdmin and PostgreSQL Study
 
## Preparing for the "Silver Tsunami" at Pewlett Hackard

### Background

Pewlett-Packard (PH) is a large firm that employs over 300,000 people. Many employees are approaching retirement age, which will result in a significant number of job openings in the organization. The management at PH wants to be prepared for this development, known as the "Silver Tsunami" by designating some of the retirees as mentors to train the future generation of workers who would run Pewlett Hackard's operations and day-to-day activities.

## 1. Overview of the analysis: Explain the purpose of this analysis.

The goal of this study is to construct a list of employees approaching retirement age using Pewlett-Packard (PH) employee data. Employees born between January 1, 1952, and December 31, 1955 are included on the list. The company's management must be aware of the overall number of retirees, as well as the department in which they work and their title.

The database provided by PH consisted of 6 CSV files:

- `Employees`
- `Departments`
- `Dat_emp`
- `Dept_manager`
- `Titles`
- `Salaries`

These CSV files had to be imported into database tables and linked between them using SQL statements.  The final schema showing the links between the tables is shown in the image below.

### Image 1: Pewlett Hackard ERD entity-relationship diagram (ERD) and database schema
![Image1](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/2da018219c8c1cd3fb2af9939efc42b96e3e334e/PH_Schema.png)

The SQL code used to create the tables can be found in [this link](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/ee969eee70c913e313f3d23fc934add0dc9cd624/Queries/TableCreation.sql). 


## 2. Results:

The deliverables for this analysis are:

- The Number of [Retiring Employees by Title](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/retirement_titles.csv). `retirement_titles.csv`
  - A table with [Unique Titles](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/unique_titles.csv). `unique_titles.csv`
  - A table with [Retiring Titles](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/retiring_titles.csv). `retiring_titles.csv`
  
    
- The Employees Eligible for the Mentorship Program.
  - A table with the list of employees whose birth dates are between January 1, 1965 and December 31, 1965. The table is 

- Determine the sum of retiring employees grouped by title.
- Identify the employees eligible for participation in the mentorship program.
- Determine the number of roles-to-fill grouped by title and department.
- Determine the number of qualified, retirement-ready employees to mentor the next generation grouped by title and department.

## 3. Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
