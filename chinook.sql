-- 1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT CustomerId, FirstName, LastName, Country
FROM Customer
WHERE Country != 'USA'


-- 2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT * FROM Customer
WHERE Country = 'Brazil'


-- 3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT Customer.FirstName, Customer.LastName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
FROM Customer
LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
WHERE Invoice.BillingCountry = 'Brazil'


-- 4. sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT * FROM Employee
WHERE Title = 'Sales Support Agent'

-- 5. unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM Invoice
ORDER BY BillingCountry


-- NOTE: The SELECT DISTINCT statement is used to return only distinct (different) values.

-- Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.

-- The SELECT DISTINCT statement is used to return only distinct (different) values.


-- 6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT Employee.FirstName AS EmpFirstName, Employee.LastName AS EmpLastName, Invoice.* --* gets every field in a particular table
FROM Employee
LEFT JOIN Customer ON Customer.SupportRepId = Customer.SupportRepId
LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
ORDER BY Employee.FirstName

-- NOTE: You can only do one SELECT per query but can do multiple Joins, etc


-- 7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT Employee.FirstName AS AgentFirst, Employee.LastName AS AgentLast, Customer.FirstName AS CustomerFirst, Customer.LastName AS CustomerLast, Invoice.Total, Invoice.BillingCountry
FROM Employee
LEFT JOIN Customer ON Customer.SupportRepId = Customer.SupportRepId
LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
ORDER BY Employee.FirstName


-- 8. total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
SELECT COUNT(InvoiceDate)
FROM Invoice
WHERE InvoiceDate LIKE '%2009%' OR InvoiceDate LIKE '%2011%'

-- NOTE: %2009% Finds any values that have "2009" in any position


-- 9. total_sales_{year}.sql: What are the respective total sales for each of those years?
SELECT SUM(Total) FROM Invoice WHERE InvoiceDate LIKE '%2009%'
UNION ALL
SELECT SUM(Total) FROM Invoice WHERE InvoiceDate LIKE '%2011%'

-- NOW ERIN MEAKER'S FANCY SCHMANCY WAY
SELECT strftime --string format time
('%Y', i.InvoiceDate) as 'Year', SUM --'%Y selects the year in the date format
(i.Total) as 'TotalSales'

FROM Invoice i -- set as an alias

WHERE strftime
('%Y', i.InvoiceDate) IN
('2009', '2011') -- this represents an array

GROUP BY strftime
('%Y', i.InvoiceDate)

-- 10. invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(InvoiceId)
FROM InvoiceLine
WHERE InvoiceId = 37


-- 11. line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT InvoiceId, COUNT(InvoiceId) as 'Count'
FROM Invoiceline
GROUP BY InvoiceId


-- 12. line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
SELECT InvoiceLine.InvoiceLineId, Track.Name AS Track
FROM InvoiceLine
JOIN Track on InvoiceLine.TrackId = Track.TrackId
GROUP BY InvoiceLineId


-- 13. line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.

-- 14. country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY

-- 15. playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

-- 16. tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

-- 17. invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

-- 18. sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

-- 19. top_2009_agent.sql: Which sales agent made the most in sales in 2009?
-- Hint: Use the MAX function on a subquery.

-- 20. top_agent.sql: Which sales agent made the most in sales over all?

-- 21. sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

-- 22. sales_per_country.sql: Provide a query that shows the total sales per country.

-- 23. top_country.sql: Which country's customers spent the most?

-- 24. top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

-- 25. top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.

-- 26. top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

-- 27. top_media_type.sql: Provide a query that shows the most purchased Media Type.
