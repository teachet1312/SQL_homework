-- заполняем 20 городов
with test_data(counter, name) as (
    select generate_series(1, 20) as counter,
           md5(random()::text) as name)
insert
into areas(name)
select name
from test_data;

-- заполняем кандидатов

with test_data(id, first_name, last_name, email, phone_number, time_of_registration, city_id, find_job, education, years_experience, skills) as (
    select generate_series(1, 100000) as id,
           'firstName' || md5(random()::text) as first_name,
           'lastName' || md5(random()::text) as last_name,
           md5(random()::text) || '@mail.ru' as email,
           (random()*(79999999999 - 70000000000) + 70000000000) as phone_number,
           --'2000-01-01'::date + trunc(random() * 366 * 53)::int as time_of_registration,
           timestamp '2015-01-01 20:00:00' +random() * (timestamp '2023-12-20 20:00:00' - timestamp '2015-01-01 10:00:00') as time_of_registration,
           random()*(21 - 1) + 1 as city_id,
           TRUE as find_job,
           md5(random()::text) as education,
           random()*(40 - 1) * 1 as years_experience,
           md5(random()::text) as skills
)
insert
into
candidates2(first_name, last_name, email, phone_number, time_of_registration, city_id, education, years_experience, skills)
select first_name, last_name, email, phone_number, time_of_registration, city_id, education, years_experience, skills
from test_data;

-- заполняем работодателей
with test_data (id, name, email, phone_number, city_id, description) as (
    select generate_series(1, 1000) as id,
           md5(random()::text) as name,
           md5(random()::text) || '@gmail.com' as email,
           (random()*(7999999 - 7000000) + 7000000) as phone_number,
           random()*(21 - 1) + 1 as city_id,
           md5(random()::text) as description
)
insert
into
employers(name, email, phone_number, city_id, description)
select name, email, phone_number, city_id, description
from test_data;

--заполняем 10к вакансий
with test_data(id, company_id, title, description, is_active, salary_from, city_id, create_date) as (
    select generate_series(1, 10000) as id,
           random()*(1000-1) + 1 as company_id,
           md5(random()::text) as title,
           md5(random()::text) as description,
           TRUE as is_active,
           random()*(500000-15000) + 15000 as salary_from,
           random()*(21 - 1) + 1 as city_id,
           timestamp '2022-01-01 20:00:00' +random() * (timestamp '2023-12-20 20:00:00' - timestamp '2022-01-01 10:00:00')
)
insert
into
vacancies(company_id, title, description, is_active, salary_from, salary_to, city_id, create_date)
select company_id, title, description, is_active, salary_from, salary_from + 10000, city_id, create_date
from test_data;

-- заполняем таблицу откликов
with test_data(id, candidate_id, vacancy_id, date_of_response) as (
    select generate_series(1, 5000),
           random()*(100000 - 1) + 1 as candidate_id,
           random()*(10000 - 1) + 1 as vacancy_id,
           timestamp '2022-01-01 20:00:00' +random() * (timestamp '2023-12-20 20:00:00' - timestamp '2022-01-01 10:00:00')


)
insert
into
responses2(candidate_id, vacancy_id, date_of_response)
select candidate_id, vacancy_id, date_of_response
from test_data;

with test_data(id, specialization_name) as (
    select generate_series(1, 1000) as id,
           md5(random()::text) as specialization_name
)
insert
into
specializations(specialization_name)
select specialization_name
from test_data;