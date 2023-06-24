
/* Task D1 */

select vaccinations.date as 'ObservationDate', locations.location as 'Country', vaccinations.dailyvaccinations as 
'Administered Vaccine on OD1 (VOD1)'
from locations join vaccinations 
on locations.isocode = vaccinations.isocode
where ObservationDate = '01-04-2021';

/* Task D2 */ 

select locations.location as 'Country',
vaccinations.totalvaccinations as 'Cumulative Doses'
from vaccinations join locations on 
locations.isocode = vaccinations.isocode
where locations.lastobservationdate = vaccinations.date
group by Country;

/* Task D3 */ 

select locations.location as 'Country', vaccines.vaccinename as 'Vaccine Type'
from locations 
join locationandvaccine on locations.isocode= locationandvaccine.isocode
join vaccines on locationandvaccine.vaccineid = vaccines.vaccineid;

/* Task D4 */ 

select locations.sourcename as 'Source Name', sum(vaccinations.dailyvaccinations) as 'Total Administered Vaccines', 
locations.sourceurl as 'Source URL'
from locations join vaccinations on vaccinations.isocode = locations.isocode
group by locations.sourcename, locations.sourceurl 
order by sum(vaccinations.dailyvaccinations);

/* Task D5 */ 

select date as 'Date', (select peoplefullyvaccinated from vaccinations where isocode 
= (select isocode from locations where location = 'Australia') and date = vaccinations.date) as 
'Australia',
(select peoplefullyvaccinated from vaccinations where isocode 
= (select isocode from locations where location = 'United States') and date = vaccinations.date) as 
'United States',
(select peoplefullyvaccinated from vaccinations where isocode 
= (select isocode from locations where location = 'England') and date = vaccinations.date) as 
'England',
(select peoplefullyvaccinated from vaccinations where isocode 
= (select isocode from locations where location = 'China') and date = vaccinations.date) as 
'China' from vaccinations group by date order by date;


