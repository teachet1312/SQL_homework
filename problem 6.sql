-- индекс для поиска по названию вакансии
create index title_vacansy_ind on vacancies(title);

-- индекс для поиска по минимальной зп
create index min_salary_vacansy_ind on vacancies(salary_from);

-- индекс для поиска по названию города
create index city_vacansy_ind on areas(name);

-- индекс для просмотра кандидатов, которые откликнулись
create index resp_vacansy_ind on responses2(candidate_id);