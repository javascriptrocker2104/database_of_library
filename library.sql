CREATE TABLE IF NOT EXISTS public.readers(
    reader_id serial PRIMARY key,
    ticket_number BIGINT NOT NULL,
    fio VARCHAR(255) NOT NULL,
    adress varchar(255),
    phonenumber BIGINT
);

CREATE TABLE IF NOT EXISTS public.publishing_house(
    publishing_house_id SERIAL PRIMARY KEY,
    name_of_house VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.books(
    book_id SERIAL PRIMARY KEY,
    code BIGINT NOT NULL,
    name_of_book VARCHAR(255) NOT NULL,
    create_date DATE,
    sheets INTEGER NOT NULL,
    number_of_instances BIGINT NOT NULL,
    price BIGINT,
    publishing_house_id BIGINT,
    FOREIGN KEY(publishing_house_id) REFERENCES publishing_house (publishing_house_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS public.authors(
   author_id SERIAL PRIMARY KEY,
   author_fio VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.author_books(
    book_id BIGINT,
    author_id BIGINT,
    FOREIGN KEY(book_id) REFERENCES books (book_id) ON DELETE SET NULL,
    FOREIGN KEY(author_id) REFERENCES authors (author_id) ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS public.rent(
    rent_id serial PRIMARY KEY,
    book_id BIGINT,
    FOREIGN KEY(book_id ) REFERENCES books (book_id) ON DELETE CASCADE,
    rent_date DATE
);

CREATE TABLE IF NOT EXISTS public.readers_rent(
    reader_id BIGINT,
    rent_id BIGINT,
    FOREIGN KEY(reader_id) REFERENCES readers (reader_id) ON DELETE SET NULL,
    FOREIGN KEY(rent_id) REFERENCES rent (rent_id) ON DELETE SET NULL
);





