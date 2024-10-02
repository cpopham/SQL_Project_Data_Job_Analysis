/*
Question: What are the most in-demand skills for Business Analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills_dim.skills AS skill, 
    ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
	skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
	skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Business Analyst' 
    AND job_postings_fact.salary_year_avg IS NOT NULL 
	AND job_work_from_home = True  -- optional to filter for remote jobs
GROUP BY
    skills_dim.skills 
ORDER BY
    avg_salary DESC
LIMIT 10;

/*
Here’s a breakdown of the highest-paying skills for business analysts in 2023:

Chef tops the list, offering an average salary of $220,000, reflecting its specialized use in automation and infrastructure.
Phoenix follows with $135,990, showing the growing demand for this web framework in scalable applications.
Looker, MongoDB, and Python round out the top skills, with salaries ranging from $114,500 to $130,400, demonstrating the value of proficiency in data analytics, database management, and advanced scripting.
[
  {
    "skill": "chef",
    "avg_salary": "220000.00"
  },
  {
    "skill": "phoenix",
    "avg_salary": "135990.00"
  },
  {
    "skill": "looker",
    "avg_salary": "130400.00"
  },
  {
    "skill": "mongodb",
    "avg_salary": "120000.00"
  },
  {
    "skill": "python",
    "avg_salary": "116516.25"
  },
  {
    "skill": "bigquery",
    "avg_salary": "115833.33"
  },
  {
    "skill": "gcp",
    "avg_salary": "115833.33"
  },
  {
    "skill": "r",
    "avg_salary": "114628.75"
  },
  {
    "skill": "db2",
    "avg_salary": "114500.00"
  },
  {
    "skill": "snowflake",
    "avg_salary": "114500.00"
  }
]
*/