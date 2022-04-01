# Pewlett Hackard Analysis - A pgAdmin and PostgreSQL Study
 
## Preparing for the "Silver Tsunami" at Pewlett Hackard

### Background

Pewlett-Packard (PH) is a large firm that currently employs `300,024` people. Many employees are approaching retirement age, which will result in a significant number of job openings in the organization. The management at PH wants to be prepared for this development, known as the "Silver Tsunami" by designating some of the retirees as mentors to train the future generation of workers who would run Pewlett Hackard's operations and day-to-day activities.

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

#### Image 1: Pewlett Hackard ERD entity-relationship diagram (ERD) and database schema
![Image1](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/2da018219c8c1cd3fb2af9939efc42b96e3e334e/PH_Schema.png)

The SQL code used to create the tables can be found in [this link](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/ee969eee70c913e313f3d23fc934add0dc9cd624/Queries/TableCreation.sql). 


## 2. Results:

The deliverables for this analysis are:

### 2.1   The Number of [Retiring Employees by Title](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/retirement_titles.csv). `retirement_titles.csv`

The names of those born between 1952 and 1955 are presented in the table in Image #2 below. The number of entries in this table is calculated using `SELECT count(emp_no) FROM retirement_titles;`, which gives a total of `133,776` lines.  Because the data comprises more than 130,000 lines, it requires additional filtration before it can be useful to PH management. Some entries are duplicated since some employees' titles have changed throughout their careers as they moved from one position to another.

Code used to create this table

```
SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
```

#### Image 2: Pewlett Hackard - `retirement_titles.csv`
![Image2](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/19d6690d236b9466c7b8747c107b68ce07080cef/Images/retirement_titles.png)

### 2.2   A table with [Unique Titles](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/unique_titles.csv). `unique_titles.csv`

Image 3 shows the table with the employees born between 1953 and 1955 but without the duplicates.  The number of entries in the table is now `90,398`.  The query used to count them is:

```
SELECT Count(DISTINCT emp_no)
FROM retirement_titles;
```

Since `90,398` is still a large number to make any decision, we need to refine the data even further. 

#### Image 3: Pewlett Hackard - `unique_titles.csv`
![Image3](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/4ced2f465a7bf59b37c8b4112e9c2542f60dbfd4/Images/unique_titles.png)

### 2.3   A table with [Retiring Titles](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/700a40aa6f1e9eb6f477447c252b182d98e41470/Data/retiring_titles.csv). `retiring_titles.csv`

The final filtering step is to present the data of the `90,398` employees grouped by title.  Below is the code used to generate the table shown in Image 4

```
SELECT COUNT(emp_no), title
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;
```

Looking at the numbers in the table we see that `90,398 / 300,024 = 30.1%` of the employees of the company are about to retire.  This a tremendous challenge for any company and in particular for Pewlett Hackard because the majority of the retirees are engineers with many years of experience.  So, even if the company manages to hire substitute engineers in a short amount of time, the new hires will require a lot of training before they can contribute effectively to the operations of PH.

The total number of engineers in the Image 4 table is `45,397` or `50.2%` of the retirees.

The Senior Staff group is also another important part of the labor force that is retiring.  There is a total of `28,254` or 31.3% of the group. 

#### Image 4: Pewlett Hackard - `retiring_titles.csv`
![Image4](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/1dd649bb3a853ab4a0f737549cc5425c62766fa3/Images/retiring_titles.png)

### 2.4   The [Employees Eligible for the Mentorship Program](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/578def9f4ae99c5263375880d37d524d14305bc4/Data/mentorship_eligibilty.csv) whose birth dates are between January 1, 1965 and December 31, 1965. `mentorship_eligibility.csv`

Given the vast number of employees departing and the skillsets they possess, the firm decides to select a group of employees born in 1965 (i.e., they are 10 years younger than the retirees) and turn them into trainers for new hires and coworkers who will be promoted to fill future openings.

Below is the image showing the list of employees who fall under the indicated criteria.  The code used to generate the table is

```
SELECT DISTINCT ON (e.emp_no) 
    e.emp_no,
	   e.first_name,
    e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;
```

#### Image 5: Pewlett Hackard - `mentorship_eligibility.csv`
![Image4](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/4ced2f465a7bf59b37c8b4112e9c2542f60dbfd4/Images/mentorship_elegibility.png)

Using the code below, we obtain another table showing the number of potential trainers per title:

```
SELECT COUNT(emp_no), title
FROM public.mentorship_eligibilty
GROUP BY title
ORDER BY COUNT(emp_no) DESC;
```
The total number of personnel that have been pre-selected for the post of trainer is `1,549`. When we split this amount by the total number of employees departing, we get a group of `90,398 total retirees / 1,549 potential trainers = 59 employees per trainer`. This figure appears to be rather high, implying that if the training program is to be effective, the corporation will need to increase the number of potential trainers by a factor of at least ten. 

#### Image 6: Pewlett Hackard - `mentorship_eligibility.csv` Grouped by `title`
![Image4](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/ecf51ea7e6febca2775aa1bd479fd83288df6323/Images/mentorship_elegibility_grouped(1).png)

## 3. Summary

### - How many roles will need to be filled as the "silver tsunami" begins to make an impact?

The "silver tsunami" poses a major threat to Pewlett Hackard's future. `30.1%`, or `90,398` employees, will need to be replaced. The problem is made more difficult by the fact that there are `45,397` engineers in the organization, accounting for `50.2%` of all retirees. Another key segment of the labor force that is retiring is the Senior Staff. There are a total of `28,254` departing workers, accounting for `31.3%` of the total.  A more detailed analysis is in Section 2.

Below is a table detailing the composition of the group

#### Image 7: Pewlett Hackard - `unique_titles.csv`
![Image7](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/1dd649bb3a853ab4a0f737549cc5425c62766fa3/Images/retiring_titles.png)

### - Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

The total number of people who have been chosen for the job of trainer is `1,549` people. There are `90,398` people who are retiring.  Dividing `90,398 / 1,549 people who want to be trainers = 59 people per trainer`. In order for the training program to be effective, the company will need to increase at least tenfold the number of people who could become trainers, so that each trainer has only 6 trainees under supervision.  More details in section 2.4.

#### Image 8: Pewlett Hackard - `mentorship_eligibility.csv` Grouped by `title`
![Image4](https://github.com/Peteresis/Pewlett-Hackard-Analysis/blob/ecf51ea7e6febca2775aa1bd479fd83288df6323/Images/mentorship_elegibility_grouped(1).png)







