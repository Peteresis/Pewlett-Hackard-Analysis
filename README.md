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

### 2.1 Results:
- The Number of [Retiring Employees by Title](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/retirement_titles.csv). `retirement_titles.csv`

The names of those born between 1952 and 1955 are presented in the table in Image #2 below. The number of entries in this table is calculated using `SELECT count(emp_no) FROM retirement_titles;`, which gives a total of 133,776 lines.  Because the data comprises more than 130,000 lines, it requires additional filtration before it can be useful to PH management. Some entries are duplicated since some employees' titles have changed throughout their careers as they moved from one position to another.

### Image 2: Pewlett Hackard - `retirement_titles.csv`
![Image2](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/19d6690d236b9466c7b8747c107b68ce07080cef/Images/retirement_titles.png)

### 2.2 Results:

  - A table with [Unique Titles](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/unique_titles.csv). `unique_titles.csv`

Image 3 shows the table with the employees born between 1953 and 1955 but without the duplicates.  The number of entries in the table is now 90,398.  The query used to count them is:

```
SELECT Count(DISTINCT emp_no)
FROM retirement_titles;
```

Since 90,398 is still a large number to make any decision, we need to refine the data even further. 

### Image 3: Pewlett Hackard - `unique_titles.csv`
![Image3](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/4ced2f465a7bf59b37c8b4112e9c2542f60dbfd4/Images/unique_titles.png)

### 2.3 Results:

- A table with [Retiring Titles](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/retiring_titles.csv). `retiring_titles.csv`


### Image 4: Pewlett Hackard - `retiring_titles.csv`
![Image4](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/40a58b9edb3ac4eac70f3b135492ff065bf3860f/Images/retirement_titles_grouped.png)

### 2.4 Results:

- The [Employees Eligible for the Mentorship Program](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/578def9f4ae99c5263375880d37d524d14305bc4/Data/mentorship_eligibilty.csv) whose birth dates are between January 1, 1965 and December 31, 1965. `mentorship_eligibility.csv`

### Image 5: Pewlett Hackard - `mentorship_eligibility.csv`
![Image4](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/4ced2f465a7bf59b37c8b4112e9c2542f60dbfd4/Images/mentorship_elegibility.png)
  
## 3. Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?





- Determine the sum of retiring employees grouped by title.
- Identify the employees eligible for participation in the mentorship program.
- Determine the number of roles-to-fill grouped by title and department.
- Determine the number of qualified, retirement-ready employees to mentor the next generation grouped by title and department.
