--Clients

insert into client values(DEFAULT,'miguelnoronha@gmail.com ','Miguel Noronha','96544323','Rua do Miradouro nº5');

insert into client values(DEFAULT,'rodrigoalves@gmail.com', 'Rodrigo Alves', '918917916','Rua da Maria Albertina nº3');

insert into client values(DEFAULT,'miguelteixeira@gmail.com','Miguel Teixeira', '968967966',' Rua Soldado Caido nº1');

insert into client values(DEFAULT, 'albertomagalhaes@gmail.com', 'Alberto Magalhaes', '913912914', 'Rua Placido de Abreu nº10');

insert into client values(DEFAULT, 'mariaazeitona@gmail.com', 'Maria Azeitona', '916915234', 'Rua da Piscina nº15');

--Orders

insert into order_ values(DEFAULT, '2023-09-07',1);

insert into order_ values(DEFAULT, '2022-07-04', 2);

insert into order_ values(DEFAULT, '2023-12-02',3);

insert into order_ values(DEFAULT, '2023-02-12',4);

insert into order_ values(DEFAULT, '2023-01-30',5);

--Sales

insert into sale values(1);

insert into sale values(2);

insert into sale values(3);

insert into sale values(4);

insert into sale values(5);

--Products 

insert into product values('ZXC456789098','Massa com carne','Massa esparguete com carne estufada na panela de pressão',55.8);

insert into product values('DEF654321012','Hamburguer do Chefe', 'Fantástico hamburger com queijo, bacon, cebola, tomate e alface', 9.69);

insert into product values('FDS275468913', 'Hamburguer Vegan', 'Delicioso hamburguer de feijão e tofu com alface e pickles', 55.89);

insert into product values('MER795830185', 'Batatas fritas', 'Batatas cortadas em palitos fritas na hora', 3.7);

insert into product values('DRF849385748', 'Bifana', 'Carne de porco dentro de uma carcaça', 54.99);

--EAN_product

insert into ean_product values('ZXC456789098','1079604386958');

insert into ean_product values('DEF654321012','1079605486958');

insert into ean_product values('FDS275468913','1079604346758');

--Suppliers

insert into supplier values('324534252345','ZXC456789098','Talho do Alberto', 'Rua da crismina nº 29', '2023-11-30');

insert into supplier values('195483912049','DEF654321012', 'Mercearia da Teresa', 'Rua dos Bombeiros nº11', '2023-05-23');

insert into supplier values('134865342595','FDS275468913', 'Pingo doce', 'Rua Ana Conceição nº 14', '2023-02-19');

insert into supplier values('123455745464','MER795830185', 'Continente', 'Rua da Amargura nº54','2023-08-31');

insert into supplier values('439258234923','DRF849385748', 'Auchan', 'Rua Santa Teresa do menino Jesus nº1', '2023-07-20');

--Employees

insert into employee values('12043452132', '123133333','1979-04-12', 'Manuel Salgado');

insert into employee values('12423482432', '154386565','1969-09-14', 'André Ventura');

insert into employee values('54776453345', '435534755', '1980-02-20', 'Mariana Mortagua');

insert into employee values('43889563356', '237659635','1974-05-18', 'João Galamba');

insert into employee values('42364895454', '245643234','1984-03-23', 'Ricardo Bolacha');

--Departments

insert into department values('IT');

insert into department values('Controlo de Qualidade');

insert into department values('Cozinha');

insert into department values('Limpeza');

--Workplace 

insert into workplace values('Rua do Lampiao nº10',15.34324,35.23421);

insert into workplace values('Rua Alberto Maravilha nº14',13.21432, 40.23423);

insert into workplace values('Rua das Flores nº314', 16.23434,23.12343);

insert into workplace values('Rua dos Carrinhos Coloridos', 12.25432, 43.13433);

insert into workplace values('Rua João Vaz', 14.23525, 54.23423);

--Office

insert into office values('Rua do Lampiao nº10');

insert into office values('Rua dos Carrinhos Coloridos');

--Warehouse

insert into warehouse values('Rua das Flores nº314');

insert into warehouse values('Rua João Vaz');

insert into warehouse values('Rua Alberto Maravilha nº14');

--Interactions

--pay
insert into pay values(1,1);

insert into pay values(2,2);

insert into pay values(3,3);

insert into pay values(4,4);

insert into pay values(5,5);

--contains_

insert into contains_ values(1,'ZXC456789098', 3);

insert into contains_ values(2,'DEF654321012',4);

insert into contains_ values(3,'FDS275468913',26);

insert into contains_ values(4,'MER795830185',14);

insert into contains_ values(5,'DRF849385748',10);

--Process

insert into process values(1,'12043452132');

insert into process values(2,'12423482432');

insert into process values(3,'54776453345');

insert into process values(4,'43889563356');

insert into process values(5,'42364895454');

--works

insert into works values('Rua do Lampiao nº10','12043452132','Cozinha');

insert into works values('Rua João Vaz','12423482432','IT');

insert into works values('Rua Alberto Maravilha nº14','54776453345','IT');

insert into works values('Rua dos Carrinhos Coloridos','43889563356','Controlo de Qualidade');

insert into works values('Rua das Flores nº314','42364895454','Limpeza');

--delivery

insert into delivery values('ZXC456789098','324534252345','Rua das Flores nº314');

insert into delivery values('DEF654321012','195483912049','Rua João Vaz');

insert into delivery values('FDS275468913','134865342595','Rua Alberto Maravilha nº14');

----------------------------------------------------------------------------------------------------------------------

