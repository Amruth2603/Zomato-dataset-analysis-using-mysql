use restaurent;
drop table zomato;
create table zomato(
Restaurent_ID int PRIMARY KEY,
Restaurent_Name varchar(50),
Country_Code int,
City varchar(50),
Cuisines varchar(100),
Average_Cost_For_Two int,
Currency varchar(50),
Has_Table_Booking varchar(50),
Has_Online_Delivery varchar(50),
Is_delivering_now varchar(50),
Price_range decimal,
Rating decimal,
Rating_Color varchar(50),
Rating_Text varchar(50),
Votes int
);

create table country(
country_code int primary key,
country varchar(50));

alter table zomato 
add foreign key (Country_code) references country(country_code);
