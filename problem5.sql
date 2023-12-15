select vacancies.id, title from vacancies
inner join responses2 on vacancies.id = responses2.vacancy_id
where responses2.date_of_response - vacancies.create_date) <= interval '7 days'
group by vacancies.id
having count(responses2.vacancy_id) > 5
order by count(responses2.vacancy_id) desc;
