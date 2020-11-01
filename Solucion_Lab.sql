#Lab | MySQL Select
# Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id, au_lname as Last_Name, au_fname as First_Name, title as Title, pub_name as Publisher
FROM world.authors
join titleauthor on authors.au_id = titleauthor.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on titles.pub_id = publishers.pub_id

# Challenge 2 - Who Have Published How Many At Where?
# Elevating from your solution in Challenge 1, query how many titles each author has published at each
# publisher. Your output should look something like below:

SELECT authors.au_id, au_lname as 'Last_Name', au_fname as 'First_Name', pub_name as 'Publisher', count(*) as 'Conteo'
FROM world.authors
join titleauthor on authors.au_id = titleauthor.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id
order by Conteo DESC;


# Challenge 3 - Best Selling Authors
# Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
# Requirements:
# Your output should have the following columns:
# AUTHOR ID - the ID of the author
# LAST NAME - author last name
# FIRST NAME - author first name
# TOTAL - total number of titles sold from this author
# Your output should be ordered based on TOTAL from high to low.
#Only output the top 3 best selling authors.

CREATE TEMPORARY TABLE world.Ventas_Totales_por_Libro2
select sales.title_id,sum(qty) as 'Ventas_Totales'
from world.sales
group by title_id:

CREATE TEMPORARY TABLE world.Ventas_Totales_por_Escritor2
SELECT titleauthor.au_id,sum(Ventas_Totales_por_Libro2.Ventas_Totales) as 'Ventas_Totales'
FROM world.Ventas_Totales_por_Libro2
join world.titleauthor on titleauthor.title_id = Ventas_Totales_por_Libro2.title_id
group by au_id:

SELECT authors.au_id, au_lname as 'Last_Name', au_fname as 'First_Name', Ventas_Totales_por_Escritor2.Ventas_Totales as 'Ventas_Totales'
FROM Ventas_Totales_por_Escritor2
join world.authors on Ventas_Totales_por_Escritor2.au_id = authors.au_id
order by Ventas_Totales_por_Escritor2.Ventas_Totales desc

