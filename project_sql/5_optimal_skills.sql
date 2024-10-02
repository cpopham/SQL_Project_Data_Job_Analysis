/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Business Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in Business Analysis
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
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
		AND job_postings_fact.salary_year_avg IS NOT NULL
        AND job_postings_fact.job_work_from_home = True
    GROUP BY
        skills_dim.skill_id
),
average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        AVG(job_postings_fact.salary_year_avg) AS avg_salary
    FROM
        job_postings_fact
	INNER JOIN
	    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_postings_fact.job_title_short = 'Business Analyst'
		AND job_postings_fact.salary_year_avg IS NOT NULL
        AND job_postings_fact.job_work_from_home = True
    GROUP BY
        skills_job_dim.skill_id
) 
SELECT
    skills_demand.skills,
    skills_demand.demand_count,
    ROUND(average_salary.avg_salary, 2) AS avg_salary
FROM
    skills_demand
INNER JOIN
	average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY
    demand_count DESC, 
	avg_salary DESC
LIMIT 25;

/*
Here’s a breakdown of the most optimal skills for business analysts in 2023:

SQL leads with a demand count of 42 and an average salary of $99,119.98, proving to be a foundational skill with both high demand and solid earning potential.
Excel follows closely with 31 job postings and an average salary of $94,132.42, emphasizing its continued importance in the business world.
Tableau stands out with a salary of $104,233.33 across 27 job postings, showcasing the value of data visualization.
Python offers the highest salary at $116,516.25, with 20 job postings, demonstrating its growing relevance in business analytics and automation.
Power BI, while slightly lower in demand, offers a competitive average salary of $90,447.50, further underscoring the importance of data visualization tools.

[
  {
    "skills": "sql",
    "demand_count": "42",
    "avg_salary": "99119.98"
  },
  {
    "skills": "excel",
    "demand_count": "31",
    "avg_salary": "94132.42"
  },
  {
    "skills": "tableau",
    "demand_count": "27",
    "avg_salary": "104233.33"
  },
  {
    "skills": "python",
    "demand_count": "20",
    "avg_salary": "116516.25"
  },
  {
    "skills": "power bi",
    "demand_count": "12",
    "avg_salary": "90447.50"
  }
]
*/