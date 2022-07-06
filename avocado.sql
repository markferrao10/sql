select AveragePrice, region, year
FROM dwdwda.avocado12
where region = 'California' and year = 2016
group by year, region
order by 1, 2;

-- data cleaning

alter table dwdwda.avocado12
drop column MyUnknownColumn;

 alter table dwdwda.avocado12
drop column Date;


SELECT  TotalBags, ROUND(TotalBags, -1) as total_bags, 
 ROUND(SmallBags, -1) as small_size, round(LargeBags, -1) as medium_size 
FROM dwdwda.avocado12;

-- count of total bags, xlargebags, largebags
select count(SmallBags), count(TotalBags), count(XLargeBags), count(LargeBags), date
 FROM dwdwda.avocado12
 where region = ('California' and region = 'Albany')
 order by region, date;
 
 --  bags
 select region ,count(distinct SmallBags) as small_bags, count(distinct LargeBags) as medium_bags, count(distinct XLargeBags) as big_bags
  FROM dwdwda.avocado12
  where  year > 2015 and year < 2018;
  
-- max, min, avg -- grouping
select  TotalBags, year, AveragePrice
 FROM dwdwda.avocado12
 WHERE (region = 'Albany' or  region = 'Houston') 
and year between 2016 and  2018
group by year
order by region, year;

select type, TotalBags, AveragePrice
from dwdwda.avocado12
where year in (2015,2016, 2018, 2017)
group by type 
order by region, type;

select sum(SmallBags),sum(XLargeBags), sum(LargeBags), region
from dwdwda.avocado12
where year > 2015
group by region;

select avg(TotalBags), region
from dwdwda.avocado12
where AveragePrice >  0.50
group by region,year
order by region
desc;

select max(AveragePrice), region, year
from dwdwda.avocado12
group by region,year
order by region 
limit 10;

select min(SmallBags), region, year
from dwdwda.avocado12
group by region,year
order by region 
limit 10;

SELECT region, AVG(TotalBags) AS avg_bags, 
       AVG(AveragePrice) AS avg_totalprice
FROM dwdwda.avocado12
GROUP BY region , type
ORDER BY region
limit 7
;
