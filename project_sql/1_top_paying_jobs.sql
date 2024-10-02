/*
Question: What are the top-paying Business Analyst jobs?
- Identify the top 10 highest-paying Business Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Business Analysts, offering insights into employment options and location flexibility.
*/

SELECT
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
	name AS company_name
FROM
	job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
	job_title LIKE '%Business Analyst%'
	AND salary_year_avg IS NOT NULL
	AND job_location = 'Anywhere'
ORDER BY
	salary_year_avg DESC 
LIMIT 10

/*
Here's the breakdown of the top data analyst jobs in 2023:

Salary Range: The top 10 highest-paying business analyst roles offer salaries between $90,000 and $100,000 annually.
Job Titles: Roles such as “Business Analyst - Data Quality” and “Staff Business Analyst - Finance” top the list, while some entry-level positions also offer competitive salaries.
Industries: High-paying positions span industries like tech, finance, and data management, reflecting the broad demand for business analysts across sectors.

RESULTS
=======
[
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100000.0",
    "job_posted_date": "2023-12-12 16:18:07",
    "company_name": "Armavel, LLC"
  },
  {
    "job_id": 1195476,
    "job_title": "Business Analyst - Work from Home with Data Analytics and Tableau...",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90500.0",
    "job_posted_date": "2023-04-23 08:01:03",
    "company_name": "Get It Recruit - Information Technology"
  },
  {
    "job_id": 204292,
    "job_title": "Business Analyst (Entry Level)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "job_posted_date": "2023-12-18 14:01:02",
    "company_name": "Magnus Technology Solutions"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "job_posted_date": "2023-09-15 22:01:25",
    "company_name": "TEKtalent Inc"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "job_posted_date": "2023-10-23 18:55:27",
    "company_name": "Get It Recruit - Finance"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "85000.0",
    "job_posted_date": "2023-08-09 07:00:35",
    "company_name": "Summit Consulting"
  },
  {
    "job_id": 781213,
    "job_title": "Senior  Business Analyst  Data Visualization",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "84500.0",
    "job_posted_date": "2023-10-03 17:01:27",
    "company_name": "Z&A Recruiting"
  },
  {
    "job_id": 599880,
    "job_title": "Business Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "81200.0",
    "job_posted_date": "2023-12-11 23:01:51",
    "company_name": "West Bend Mutual Insurance Company"
  },
  {
    "job_id": 911869,
    "job_title": "Sr. Business Analyst/Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "80000.0",
    "job_posted_date": "2023-06-21 16:02:08",
    "company_name": "CBRE"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time and Temp work",
    "salary_year_avg": "80000.0",
    "job_posted_date": "2023-10-04 19:02:14",
    "company_name": "Coders Data"
  }
]
*/