-- месяц с наибольшим количеством вакансий
select year, month, count(id) as cnt from
    (
        select
            date_part('year', create_date) as year,
            date_part('month', create_date) as month,
            id from vacancies)
        year_month
        group by year, month
        order by cnt desc
        limit 1;

-- месяц с наибольшим количеством резюме
select year, month, count(id) as cnt from
    (
        select
            date_part('year', time_of_registration) as year,
            date_part('month', time_of_registration) as month,
            id from candidates2)
        year_month
        group by year, month
        order by cnt desc
        limit 1;