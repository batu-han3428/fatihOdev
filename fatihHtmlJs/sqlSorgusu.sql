--A�a��daki veri yap�s�nda bir tablonuz oldu�unu d���n�n. 
--Bu tablodan �stanbul'da ikamet eden, 
--20-24 ya� aral���nda 
--ve Mezun durumundaki ��rencilerden; 
--ID, Ad, Soyad ve 2 yar�y�ldaki not ortalamalar�n�n ortalamas�n� verecek SQL sorgusunuz yaz�n�z.

--��renci ID (int), 
--Ad (nvarchar), 
--Soyad (nvarchar), 
--�l (nvarchar), 
--�l�e (nvarchar), 
--Do�um Tarihi (date), 
--Mezun (bit)
--1. Yar�y�l Not Ortalamas� (decimal)
--2. Yar�y�l Not Ortalamas� (decimal)


create table #ogrenciler(
	Ogrenci_ID int NOT NULL IDENTITY(1,1), 
	Ad nvarchar(50), 
	Soyad nvarchar(50), 
	Il nvarchar(50), 
	Ilce nvarchar(50), 
	Dogum_Tarihi date, 
	Mezun bit,
	BirYariyil_Not_Ortalamasi decimal(5,2),
	IkiYariyil_Not_Ortalamasi decimal(5,2),
	CONSTRAINT PK_Ogrenci_ID PRIMARY KEY(Ogrenci_ID)
)

CREATE NONCLUSTERED INDEX ogrenciSorgu
ON #ogrenciler(Il ASC,Dogum_Tarihi ASC, Mezun ASC)
INCLUDE (Ogrenci_ID, Ad,Soyad,IkiYariyil_Not_Ortalamasi);  
GO 


insert into #ogrenciler (Ad,Soyad,Il,Ilce,Dogum_Tarihi,Mezun,BirYariyil_Not_Ortalamasi,IkiYariyil_Not_Ortalamasi) values('Batuhan','F�nd�k','�stanbul','Beylikd�z�','19970430',1,60.50,75)
insert into #ogrenciler (Ad,Soyad,Il,Ilce,Dogum_Tarihi,Mezun,BirYariyil_Not_Ortalamasi,IkiYariyil_Not_Ortalamasi) values('Fatih','Ayg�n','�stanbul','Fatih','19940101',1,70,75)
insert into #ogrenciler (Ad,Soyad,Il,Ilce,Dogum_Tarihi,Mezun,BirYariyil_Not_Ortalamasi,IkiYariyil_Not_Ortalamasi) values('Brad','Pitt','Ankara','Yeni Mahalle','19980504',0,60.50,0)
insert into #ogrenciler (Ad,Soyad,Il,Ilce,Dogum_Tarihi,Mezun,BirYariyil_Not_Ortalamasi,IkiYariyil_Not_Ortalamasi) values('Tom','Cruise','�stanbul','Beylikd�z�','19990430',1,80,100)
insert into #ogrenciler (Ad,Soyad,Il,Ilce,Dogum_Tarihi,Mezun,BirYariyil_Not_Ortalamasi,IkiYariyil_Not_Ortalamasi) values('Carla','Lazzari','�stanbul','Beylikd�z�','20000430',1,60,70)


select
Ogrenci_ID as ID,
Ad,
Soyad,
IkiYariyil_Not_Ortalamasi as '2. Yar� Y�l Ortalamas�'
from #ogrenciler (nolock)
where
Il in ('istanbul')
and
datediff(year,Dogum_Tarihi,getdate()) between 20 and 24
and
Mezun = 1
union all
select ID = '', Ad = '', Soyad = '',  Convert(decimal(5,2),avg(IkiYariyil_Not_Ortalamasi)) as '2. Yar� Y�l Ortalamas�' from #ogrenciler (nolock)
where
Il in ('istanbul')
and
datediff(year,Dogum_Tarihi,getdate()) between 20 and 24
and
Mezun = 1

drop table #ogrenciler