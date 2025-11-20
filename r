CREATE TABLE klient (
    klient_id INT PRIMARY KEY,
    imya VARCHAR(300),
    pochta VARCHAR(30)
);

CREATE TABLE zakaz (
    zakaz_id int PRIMARY KEY,
    data_zakaza DATE,
    klient_id int,
    Foreign Key (klient_id) REFERENCES klient (klient_id)
);

CREATE TABLE tovar (
    tovar_id int PRIMARY KEY,
    nazvanie VARCHAR(100),
    cena int
);

CREATE TABLE tovar_v_zakaze (
    zakaz_id int,
    tovar_id int,
    kolichestvo int,
    Foreign Key (zakaz_id) REFERENCES zakaz (zakaz_id),
    Foreign Key (tovar_id) REFERENCES tovar (tovar_id)
);

ALTER TABLE tovar_v_zakaze
ADD COLUMN tovar_v_zakaze_id SERIAL PRIMARY KEY;

CREATE TABLE avtor (
    avtor_id SERIAL PRIMARY KEY,
    avtor_imya VARCHAR(200) not NULL
);

CREATE TABLE knigi (
    knigi_id SERIAL PRIMARY KEY,
    nazvanie VARCHAR(4000) NOT NULL,
    data_publikacii int,
    avtor_id int,
    Foreign Key (avtor_id) REFERENCES avtor (avtor_id)
);

ALTER TABLE knigi add COLUMN gener VARCHAR(100);

ALTER TABLE knigi
ADD constraint data_publikacii check (data_publikacii <= 2025);

ALTER TABLE knigi DROP COLUMN avtor_id;

CREATE TABLE knigi_avtori (
    knigi_id int,
    avtor_id int,
    Foreign Key (knigi_id) REFERENCES knigi (knigi_id),
    Foreign Key (avtor_id) REFERENCES avtor (avtor_id)
);

CREATE TABLE aaaa (AAAA_id int);

DROP TABLE aaaa;

ALTER TABLE knigi_avtori add COLUMN PRIMARY KEY (knigi_id, avtor_id);

DROP TABLE knigi_avtori;

CREATE TABLE knigi_avtori (
    knigi_id int,
    avtor_id int,
    Foreign Key (knigi_id) REFERENCES knigi (knigi_id),
    Foreign Key (avtor_id) REFERENCES avtor (avtor_id),
    PRIMARY KEY (knigi_id, avtor_id)
)
