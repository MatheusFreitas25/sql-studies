--These questions start off with the basics and then get continually more difficult.


--How can you retrieve all the information from the cd.facilities table?

SELECT * FROM cd.facilities

--You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

SELECT name, membercost FROM cd.facilities

--How can you produce a list of facilities that charge a fee to members?

SELECT *
FROM cd.facilities
WHERE membercost > 0

--How can you produce a list of facilities that charge a fee to members,
--and that fee is less than 1/50th of the monthly maintenance cost?
--Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
AND membercost < ((1/50.0)*monthlymaintenance)

--How can you produce a list of all facilities with the word 'Tennis' in their name?

SELECT *
FROM cd.facilities
WHERE name lIKE '%Tennis%'

--How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

SELECT *
FROM cd.facilities
WHERE facid IN (1,5)

--How can you produce a list of members who joined after the start of September 2012?
--Return the memid, surname, firstname, and joindate of the members in question.

SELECT *
FROM cd.members
WHERE DATE(joindate) >= '2012-09-01'

--How can you produce an ordered list of the first 10 surnames in the members table?
--The list must not contain duplicates.

SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname ASC
LIMIT 10

--You'd like to get the signup date of your last member. How can you retrieve this information?

SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1

--Produce a count of the number of facilities that have a cost to guests of 10 or more.

SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10

--Produce a list of the total number of slots booked per facility in the month of September 2012.
--Produce an output table consisting of facility id and slots, sorted by the number of slots.

SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
WHERE TO_CHAR(starttime, 'YY-MM') = '12-09'
GROUP BY facid
ORDER BY SUM(slots)

SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
WHERE starttime >= '2012-09-01' AND starttime <= '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots)

--Produce a list of facilities with more than 1000 slots booked.
--Produce an output table consisting of facility id and total slots, sorted by facility id.

SELECT f.facid, SUM(b.slots)
FROM cd.facilities AS f
INNER JOIN cd.bookings as b
ON f.facid = b.facid
GROUP BY(f.facid)
HAVING SUM(b.slots) > 1000
ORDER BY f.facid

--How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'?
--Return a list of start time and facility name pairings, ordered by the time.

SELECT b.starttime, f.name
FROM cd.facilities AS f
INNER JOIN cd.bookings AS b
ON f.facid = b.facid
WHERE starttime >= '2012-09-21' AND f.name LIKE '%Tennis Court%'
ORDER BY starttime ASC

--How can you produce a list of the start times for bookings by members named 'David Farrell'?

SELECT m.firstname, m.surname, b.starttime
FROM cd.bookings AS b
INNER JOIN cd.members AS m
ON b.memid = m.memid
WHERE m.firstname || ' ' || m.surname LIKE 'David Farrell'

