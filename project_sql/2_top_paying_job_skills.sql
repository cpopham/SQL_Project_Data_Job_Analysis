/*
Question: What skills are required for the top-paying Business Analyst jobs?
- Use the top 10 highest-paying Business Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)
SELECT
    top_paying_jobs.job_id,
    job_title,
    salary_year_avg,
    skills
FROM
    top_paying_jobs
	INNER JOIN
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
	INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
Here’s the breakdown of the most demanded skills for the top 10 highest-paying business analyst jobs in 2023:

SQL and Excel each have a count of 4, reflecting their strong relevance in data manipulation, reporting, and business operations.
Python, Tableau, and Power BI each have a count of 3, demonstrating their importance for advanced analysis, data visualization, and decision-making.
Tools such as Flow, PowerPoint, Confluence, Word, and Outlook are each counted twice, highlighting their utility in business communication and process automation.

RESULTS
=======
[
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "salary_year_avg": "100000.0",
    "skills": "flow"
  },
  {
    "job_id": 1195476,
    "job_title": "Business Analyst - Work from Home with Data Analytics and Tableau...",
    "salary_year_avg": "90500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "salary_year_avg": "90000.0",
    "skills": "outlook"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "skills": "windows"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "visio"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "flow"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "confluence"
  },
  {
    "job_id": 781213,
    "job_title": "Senior  Business Analyst  Data Visualization",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_id": 781213,
    "job_title": "Senior  Business Analyst  Data Visualization",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_id": 781213,
    "job_title": "Senior  Business Analyst  Data Visualization",
    "salary_year_avg": "84500.0",
    "skills": "power bi"
  },
  {
    "job_id": 911869,
    "job_title": "Sr. Business Analyst/Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 911869,
    "job_title": "Sr. Business Analyst/Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_id": 911869,
    "job_title": "Sr. Business Analyst/Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "skills": "word"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "skills": "outlook"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "skills": "jira"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "skills": "confluence"
  }
]
*/