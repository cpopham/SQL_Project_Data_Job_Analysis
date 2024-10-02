/*
Question: What are the most in-demand skills for Business Analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    
    job_postings_fact.job_title_short = 'Business Analyst'
    AND job_work_from_home = True
GROUP BY
    skills_dim.skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Here’s the breakdown of the most demanded skills for business analysts in 2023:

SQL leads the way with a count of 1,266, emphasizing its critical role in data querying and management.
Excel follows with a count of 983, reflecting its ongoing importance in organizing and analyzing data.
Tableau has a count of 728, showcasing the growing demand for visualization tools.
Power BI also ranks high with a count of 555, further highlighting the need for proficiency in data visualization and business intelligence tools.
Python rounds out the top 5 with 546, demonstrating its value for automating tasks and performing advanced analytics.

RESULTS
=======
[
  {
    "skills": "sql",
    "demand_count": "1266"
  },
  {
    "skills": "excel",
    "demand_count": "983"
  },
  {
    "skills": "tableau",
    "demand_count": "728"
  },
  {
    "skills": "power bi",
    "demand_count": "555"
  },
  {
    "skills": "python",
    "demand_count": "546"
  }
]
*/