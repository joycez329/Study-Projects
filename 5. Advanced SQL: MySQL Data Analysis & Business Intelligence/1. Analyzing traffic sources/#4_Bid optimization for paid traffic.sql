use mavenfuzzyfactory;

-- conv_rate = #sessions_with_orders / #all_sessions, group by device type

SELECT 
	device_type,
    COUNT(DISTINCT website_session_id) AS sessions,
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT order_id) / COUNT(DISTINCT website_session_id) AS session_to_order_conv_rate
FROM website_sessions ws
	LEFT JOIN orders o
		USING(website_session_id)
WHERE ws.created_at < '2012-05-11'
	AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY 1


