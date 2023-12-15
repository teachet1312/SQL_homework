--среднее значение по регионам salary_from
select city_id, avg(salary_from) from vacancies
    group by city_id;

--среднее значение по регионам salary_to
select city_id, avg(salary_to) from vacancies
    group by city_id;

-- средняя зп в общем
select city_id, avg((salary_from + salary_to)/2) from vacancies
    group by city_id;
