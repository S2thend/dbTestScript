https://docs.google.com/presentation/d/1dMg_1FBkB0e1nkkGuKjMray4-0ANMMLmTUkFMeEnT7E/edit?usp=sharing
In this example we'll setup a very simple schema. We're creating a basic app where we have a bunch of companies, and those companies have contacts.
```
CREATE TABLE companies(
   company_id SERIAL PRIMARY KEY,
   company_name VARCHAR(255) NOT NULL
);

CREATE TABLE contacts(
   contact_id SERIAL PRIMARY KEY,
   company_id INT,
   contact_name VARCHAR(255) NOT NULL,
   phone VARCHAR(25),
   email VARCHAR(100),
   CONSTRAINT fk_company
      FOREIGN KEY(company_id) 
      REFERENCES companies(company_id)
);
```
```
INSERT INTO companies(company_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');     
       
INSERT INTO contacts(company_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
```
```
INSERT INTO companies(company_name)
SELECT md5(random()::text)
FROM generate_series(1,100);

INSERT INTO contacts(company_id, contact_name, phone, email)
SELECT id, md5(random()::text), md5(random()::text)::varchar(20), md5(random()::text) 
FROM generate_series(1,100) id;
```
```
select * from companies;
select * from contacts;
```