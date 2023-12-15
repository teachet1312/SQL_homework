-- индекс для поиска по названию вакансии
create index title_vacansy_ind on vacancies(title);

-- индекс для поиска откликов в интеравал времени (5 задание)
create index response_time_ind on responses2(date_of_response)

-- индекс для просмотра кандидатов, которые откликнулись
create index resp_vacansy_ind on responses2(candidate_id);
