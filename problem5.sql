select vacancies.id, title from vacancies
inner join responses2 on vacancies.id = responses2.vacancy_id
where date_part('day', responses2.date_of_response - vacancies.create_date) <=7
group by vacancies.id
having count(responses2.vacancy_id) > 5
order by count(responses2.vacancy_id) desc;

