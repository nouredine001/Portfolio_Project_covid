select * from covid19 order by 2,1

--select data that we are going to be using

select Country_Region,Date,Confirmed,New_cases,Deaths 
from covid19 
order by 1,2

-- looking at confirmed VS Deaths

select Country_Region,Date,Confirmed,Deaths,(Deaths/Confirmed)*100 as Deaths_percentage  
from covid19 
order by 1,2

--shows likelihood of daying if you contract covid in your contry 

select Country_Region,Date,Confirmed,Deaths,(Deaths/Confirmed)*100 as Deaths_percentage  
from covid19 
where Country_Region like 'Algeria'
order by 1,2

-- looking at confirmed VS Recovered

select Country_Region,Date,Confirmed,Recovered,(Recovered/Confirmed)*100 as Recovered_percentage  
from covid19 
order by 1,2

--shows likelihood of Recovered if you contract covid in your contry 

select Country_Region,Date,Confirmed,Recovered,(Recovered/Confirmed)*100 as Recovered_percentage  
from covid19 
where Country_Region like 'Algeria'
order by 1,2

-- looking at contries with highest Deaths rate Compared to confirmed Cases
select Country_Region,Max(Deaths) as hisghestDeathsCount,Max((Deaths/Confirmed))*100 as hisghest_Deaths_percentage  
from covid19 
Group by Country_Region
order by hisghest_Deaths_percentage desc


-- looking at contries with highest Recovered rate Compared to confirmed Cases
select Country_Region,Max(Recovered) as hisghestRecoveredCount,Max((Recovered/Confirmed))*100 as hisghest_Recovered_percentage  
from covid19 
Group by Country_Region
order by hisghest_Recovered_percentage desc

-- looking at region with highest Deaths rate Compared to confirmed Cases
select WHO_Region,Max(Deaths) as hisghestDeathsCount  
from covid19 
Group by WHO_Region
order by hisghestDeathsCount desc


--

select * 
from population
order by Population

--join 2 tables

select cov.Country_Region,cov.Date,cov.Confirmed,cov.Recovered,cov.Deaths,pop.Population
from covid19 cov
Join population pop
	On cov.Country_Region = pop.Country_Region
	order by 1,2

-- looking at contries with highest Confirmed cases Compared to Population

select cov.Country_Region,Max(cov.Confirmed) as total_Confirmed,pop.Population ,(Max(cov.Confirmed)/pop.Population)*100 as percentage_Confirmed
from covid19 cov
Join population pop
	On cov.Country_Region = pop.Country_Region
	Group by cov.Country_Region,pop.Population
	order by 4 desc

-- looking at contries with highest deaths Compared to Population

select cov.Country_Region,Max(cov.Deaths) as total_Deaths,pop.Population ,(Max(cast(cov.Deaths as float))/pop.Population)*100 as percentage_Deaths
from covid19 cov
Join population pop
	On cov.Country_Region = pop.Country_Region
	Group by cov.Country_Region,pop.Population
	order by 4 desc


-- looking at contries with highest recoverd cases Compared to Population

select cov.Country_Region,Max(cov.Recovered) as total_Recovered,pop.Population ,(Max(cast(cov.Recovered as float))/pop.Population)*100 as percentage_Recovered
from covid19 cov
Join population pop
	On cov.Country_Region = pop.Country_Region
	Group by cov.Country_Region,pop.Population
	order by 4 desc


