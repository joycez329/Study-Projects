-- CVR= #sessions with orders / #all sessions
-- date < '2012-04-14'
-- gsearch nonbrand
-- LEFT JOIN orders table to get order details

SELECT 
	COUNT(DISTINCT website_session_id) AS sessions,
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT order_id) / COUNT(DISTINCT website_session_id) AS session_to_order_conv_rate
FROM website_sessions AS ws
	LEFT JOIN orders o
		USING(website_session_id)
WHERE ws.created_at < '2012-04-14'
	AND utm_source = 'gsearch'
	AND utm_campaign = 'nonbrand'


