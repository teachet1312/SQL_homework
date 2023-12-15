
CREATE TABLE areas (
    id  serial primary key,
    name text
);


CREATE TABLE candidates2 (
    id  serial primary key,
    first_name text not null,
    last_name text not null,
    email text not null,
    phone_number bigint not null,
    time_of_registration date not null,
    city_id integer references areas(id),
    find_job boolean not null default true,
    education text,
    years_experience integer,
    skills text
);


create table employers (
    id  serial primary key,
    name text not null,
    email text not null,
    phone_number integer not null,
    city_id integer not null references areas(id),
    description text
);


create table vacancies (
    id  serial primary key,
    company_id integer references employers(id),
    title text not null,
    description text not null,
    is_active boolean not null default true,
    salary_from integer not null,
    salary_to integer not null,
    city_id integer references areas(id),
    create_date date not null
);


create table responses2 (
    response_id  serial primary key,
    candidate_id integer references candidates2(id),
    vacancy_id integer references vacancies(id),
    date_of_response date not null

);

create table specializations (
    specialization_id  serial primary key,
    specialization_name text not null
);
