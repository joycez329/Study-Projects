USE mavenfuzzyfactory;
-- date < '2012-05-10'
-- gsearch nonbrand
-- COUNT (session volume), group by year, week

SELECT
	-- YEAR(created_at),
	-- WEEK(created_at),
    MIN(DATE(created_at)) AS week_start_date,
    COUNT(DISTINCT website_session_id) AS sessions
FROM website_sessions
WHERE created_at < '2012-05-10'
	AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY 
	YEAR(created_at),
	WEEK(created_at)