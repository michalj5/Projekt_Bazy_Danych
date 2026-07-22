CREATE TABLE adres (
    kod_pocztowy VARCHAR2(30 CHAR) NOT NULL,
    wojewodztwo  VARCHAR2(30 CHAR),
    powiat       VARCHAR2(30 CHAR),
    miejscowosc  VARCHAR2(30 CHAR),
    ulica        VARCHAR2(30 CHAR),
    primary key (kod_pocztowy)
);

CREATE TABLE kategorie (
    id_kategorii    INTEGER NOT NULL,
    nazwa_kategorii VARCHAR2(30 CHAR),
    primary key (id_kategorii)
);

CREATE TABLE sposoby_zaplaty (
    id_sposobu_zaplaty INTEGER NOT NULL,
    sposob_zaplaty     VARCHAR2(20 CHAR),
    primary key (id_sposobu_zaplaty)
);

CREATE TABLE stanowisko (
    id_stanowiska    INTEGER NOT NULL,
    nazwa_stanowiska VARCHAR2(30 CHAR),
    primary key (id_stanowiska)
);

CREATE TABLE klienci (
    id_klienta               INTEGER NOT NULL,
    nazwa_firmy              VARCHAR2(30 CHAR),
    imie                     VARCHAR2(20 CHAR),
    nazwisko                 VARCHAR2(30 CHAR),
    pesel             	      INTEGER,
    adres                    VARCHAR2(30 CHAR) NOT NULL,
    nr_ulicy                 VARCHAR2(30 CHAR),
    primary key (id_klienta),
    foreign key (adres) references adres(kod_pocztowy)
);

CREATE TABLE pracownicy (
    id_pracownika            INTEGER NOT NULL,
    imie                     VARCHAR2(20 CHAR),
    nazwisko                 VARCHAR2(30 CHAR),
    nr_telefonu              INTEGER,
    wynagrodzenie_podstawowe INTEGER,
    adres                    VARCHAR2(30 CHAR) NOT NULL,
    id_stanowiska            INTEGER NOT NULL,
    primary key (id_pracownika),
    foreign key (adres) references adres(kod_pocztowy),
    foreign key (id_stanowiska) references stanowisko(id_stanowiska)
);

CREATE TABLE historia_zatr_pracownika (
    id_pracownika                INTEGER NOT NULL,
    id_stanowiska                INTEGER NOT NULL,
    data_zatr_w_firmie           DATE,
    data_zatr_na_stanowisku      DATE,
    data_zak_pracy_na_stanowisku DATE,
    foreign key (id_pracownika) references pracownicy(id_pracownika),
    foreign key (id_stanowiska) references stanowisko(id_stanowiska)
);





CREATE TABLE producenci (
    nip_producenta       INTEGER NOT NULL,
    nazwa_firmy          VARCHAR2(30 CHAR),
    imie_wlasciciela     VARCHAR2(20 CHAR),
    nazwisko_wlasciciela VARCHAR2(30 CHAR),
    nr_telefonu          INTEGER,
    adres                VARCHAR2(30 CHAR) NOT NULL,
    nr_ulicy             VARCHAR2(30 CHAR),
    primary key (nip_producenta),
    foreign key (adres) references adres(kod_pocztowy)
);

CREATE TABLE samochody_firmowe (
    numer_rejestracyjny VARCHAR2(10 CHAR) NOT NULL,
    marka               VARCHAR2(20 CHAR),
    model               VARCHAR2(20 CHAR),
    id_pracownika       INTEGER NOT NULL,
    primary key (numer_rejestracyjny),
    foreign key (id_pracownika) references pracownicy(id_pracownika)
);


CREATE TABLE zabawki (
    id_zabawki     INTEGER NOT NULL,
    nazwa          VARCHAR2(30 CHAR),
    cena           FLOAT,
    dostepna_ilosc INTEGER,
    id_kategorii   INTEGER NOT NULL,
    primary key (id_zabawki),
    foreign key (id_kategorii) references kategorie(id_kategorii)
);

CREATE TABLE sprzedaz (
    nr_faktury_sprzedazy INTEGER NOT NULL,
    ilosc_sztuk          INTEGER,
    data_sprzedazy       DATE,
    id_sposobu_zaplaty   INTEGER NOT NULL,
    id_klienta           INTEGER NOT NULL,
    id_pracownika        INTEGER NOT NULL,
    id_zabawki           INTEGER NOT NULL,
    primary key (nr_faktury_sprzedazy),
    foreign key (id_sposobu_zaplaty) references sposoby_zaplaty(id_sposobu_zaplaty),
    foreign key (id_klienta) references klienci(id_klienta),
    foreign key (id_pracownika) references pracownicy(id_pracownika),
    foreign key (id_zabawki) references zabawki(id_zabawki)
);

CREATE TABLE magazyn (
    nr_faktury         INTEGER NOT NULL,
    data_zamowienia    DATE,
    ilosc_sztuk        INTEGER,
    id_sposobu_zaplaty INTEGER NOT NULL,
    id_zabawki         INTEGER NOT NULL,
    id_pracownika      INTEGER NOT NULL,
    nip_producenta     INTEGER NOT NULL,
    primary key (nr_faktury),
    foreign key (id_sposobu_zaplaty) references sposoby_zaplaty (id_sposobu_zaplaty),
    foreign key (id_zabawki) references zabawki (id_zabawki),
    foreign key (id_pracownika) references pracownicy (id_pracownika),
    foreign key (nip_producenta) references producenci (nip_producenta)
);



INSERT INTO Kategorie VALUES(1, 'gry karciane');
INSERT INTO Kategorie VALUES(2, 'lalki');
INSERT INTO Kategorie VALUES(3, 'sport i rekreacja');
INSERT INTO Kategorie VALUES(4, 'gry planszowe');
INSERT INTO Kategorie VALUES(5, 'klocki');
INSERT INTO Kategorie VALUES(6, 'pluszaki');
INSERT INTO Kategorie VALUES(7, 'niemowlęce');
INSERT INTO Kategorie VALUES(8, 'figurki');
INSERT INTO Kategorie VALUES(9, 'edukacja i rozwój');
INSERT INTO Kategorie VALUES(10, 'puzzle');
INSERT INTO Kategorie VALUES(11, 'inne');



INSERT INTO sposoby_zaplaty VALUES(1, 'Karta');
INSERT INTO sposoby_zaplaty VALUES(2, 'Gotówka');
INSERT INTO sposoby_zaplaty VALUES(3, 'Przelew');
INSERT INTO sposoby_zaplaty VALUES(4, 'Blik');



INSERT INTO Adres VALUES('35-001','Podkarpackie','Rzeszów','Rzeszów','Adama Asnyka');
INSERT INTO Adres VALUES('35-021','Podkarpackie','Rzeszów','Rzeszów','Wincentego Pola');
INSERT INTO Adres VALUES('35-025','Podkarpackie','Rzeszów','Rzeszów','Lisa Kuli');
INSERT INTO Adres VALUES('35-002','Podkarpackie','Rzeszów','Rzeszów','Stefana Batorego');
INSERT INTO Adres VALUES('36-061','Podkarpackie','rzeszowski','Wysoka Głogowska','');
INSERT INTO Adres VALUES('35-005','Podkarpackie','rzeszowski','Rzeszów','Łączna');
INSERT INTO Adres VALUES('35-010','Podkarpackie','rzeszowski','Rzeszów','Sokoła');
INSERT INTO Adres VALUES('39-200','Podkarpackie','dębicki','Dębica','Tadeusza Kościuszki');
INSERT INTO Adres VALUES('33-100','Małopolskie','tarnowski','Tarnów','Adama Mickiewicza');
INSERT INTO Adres VALUES('33-302','Małopolskie','nowosądecki','Nowy Sącz','Lwowska');
INSERT INTO Adres VALUES('27-200','Świętokrzyskie','starachowicki','Starachowice','Kielecka');
INSERT INTO Adres VALUES('27-500','Świętokrzyskie','opatowski','Opatów','Henryka Sienkiewicza');
INSERT INTO Adres VALUES('27-400','Świętokrzyskie','ostrowiecki','Ostowiec Świętokrzyski','Kręta');
INSERT INTO Adres VALUES('21-100','Lubelskie','lubartowski','Lubartów','Zamojska');
INSERT INTO Adres VALUES('27-300','Lubelskie','janowski','Janów Lubelski','Cicha');
INSERT INTO Adres VALUES('20-001','Lubelskie','Lublin','Lublin','Krakowskie Przedmieście');
INSERT INTO Adres VALUES('21-047','Lubelskie','świdnicki','Świdnik','Stefana Wyszyńskiego');
INSERT INTO Adres VALUES('36-100','Podkarpackie','Kolbuszowski','Kolbuszowa','Główna');
INSERT INTO Adres VALUES('36-002','Podkarpackie','rzeszowski','Jasionka','');
INSERT INTO Adres VALUES('36-001','Podkarpackie','rzeszowski','Trzebownisko','');
INSERT INTO Adres VALUES('36-040','Podkarpackie','rzeszowski','Boguchwała','rzeszowska');







INSERT INTO stanowisko VALUES(1, 'prezes');
INSERT INTO stanowisko VALUES(2, 'kasjer');
INSERT INTO stanowisko VALUES(3, 'dostawca');
INSERT INTO stanowisko VALUES(4, 'kierownik działu');
INSERT INTO stanowisko VALUES(5, 'logistyk');
INSERT INTO stanowisko VALUES(6, 'magazynier');
INSERT INTO stanowisko VALUES(7, 'księgowy');
INSERT INTO stanowisko VALUES(8, 'informatyk');




INSERT INTO zabawki VALUES(1, 'Barbie', 35, 15, 2);
INSERT INTO zabawki VALUES(2, 'Klocki-Straż', 120, 10, 5);
INSERT INTO zabawki VALUES(3, 'Piłka nożna', 70, 14, 3);
INSERT INTO zabawki VALUES(4, 'Gra miejska', 60, 10, 4);
INSERT INTO zabawki VALUES(5, 'Lalka Ania', 62, 10, 2);
INSERT INTO zabawki VALUES(6, 'Klocki-Samochód', 250, 20, 5);
INSERT INTO zabawki VALUES(7, 'Miś', 30, 13, 6);
INSERT INTO zabawki VALUES(8, 'Grzechotka', 25, 40, 7);
INSERT INTO zabawki VALUES(9, 'Batman', 40, 20, 8);
INSERT INTO zabawki VALUES(10, 'Układanka', 25, 50, 10);
INSERT INTO zabawki VALUES(11, 'Kuchnia', 120, 30, 9);
INSERT INTO zabawki VALUES(12, 'Robot', 200, 15, 8);
INSERT INTO zabawki VALUES(13, 'Gryzak', 27, 50, 7);
INSERT INTO zabawki VALUES(14, 'Zestaw plastyczny', 140, 22, 9);
INSERT INTO zabawki VALUES(15, 'Hulajnoga', 300, 5, 3);
INSERT INTO zabawki VALUES(16, 'Lalka Miki', 60, 24, 2);
INSERT INTO zabawki VALUES(17, 'Kolejka', 85, 18, 5);
INSERT INTO zabawki VALUES(18, 'Książeczka', 45, 21, 7);
INSERT INTO zabawki VALUES(19, 'Samolot', 330, 7, 5);
INSERT INTO zabawki VALUES(20, 'Puzzle', 43, 5, 10);
INSERT INTO zabawki VALUES(21, 'Lalka Elsa', 17, 8, 2);
INSERT INTO zabawki VALUES(22, 'Konik na biegunach', 45, 21, 6);
INSERT INTO zabawki VALUES(23, 'Telefon', 44, 28, 9);
INSERT INTO zabawki VALUES(24, 'Statek', 80, 18, 5);
INSERT INTO zabawki VALUES(25, 'Lalka Lola', 50, 28, 2);
INSERT INTO zabawki VALUES(26, 'Garaż', 240, 20, 5);
INSERT INTO zabawki VALUES(27, 'Miś polarowy', 20, 83, 6);
INSERT INTO zabawki VALUES(28, 'Pociąg', 76, 45, 5);
INSERT INTO zabawki VALUES(29, 'Zestaw do rysowania', 56, 20, 9);
INSERT INTO zabawki VALUES(30, 'Klocki LEGO', 120, 60, 5);
INSERT INTO zabawki VALUES(31, 'Lalka Ken', 95, 20, 2);
INSERT INTO zabawki VALUES(32, 'Hulajnoga elektryczna', 450, 5, 3);
INSERT INTO zabawki VALUES(33, 'Gra planszowa "Monopoly"', 100, 30, 4);
INSERT INTO zabawki VALUES(34, 'Lalka Baby Born', 33, 13, 2);
INSERT INTO zabawki VALUES(35, 'Samochodzik na akumulator', 159, 43, 5);
INSERT INTO zabawki VALUES(36, 'Misiek-kontroler', 74,9, 6);
INSERT INTO zabawki VALUES(37, 'Puzzle 3D', 30, 1, 10);
INSERT INTO zabawki VALUES(38, 'Zestaw do ciastoliny', 50, 14, 9);
INSERT INTO zabawki VALUES(39, 'Lalka Barbie-Sylwia', 22, 12, 2);
INSERT INTO zabawki VALUES(40, 'Zestaw narzędziowy', 66, 20, 9);
INSERT INTO zabawki VALUES(41, 'Klocki z zamkiem', 150, 30, 5);
INSERT INTO zabawki VALUES(42, 'Miś-książę', 40, 30, 6);
INSERT INTO zabawki VALUES(43, 'Zestaw do malowania', 75, 15, 9);
INSERT INTO zabawki VALUES(44, 'Lalka Luna', 70, 31, 2);
INSERT INTO zabawki VALUES(45, 'Gra edukacyjna', 22, 8, 9);
INSERT INTO zabawki VALUES(46, 'Miś-księżniczka', 50, 12, 6);
INSERT INTO zabawki VALUES(47, 'Samochodzik zdalnie sterowany', 120, 45, 5);
INSERT INTO zabawki VALUES(48, 'Zestaw do cukierków', 120, 30, 9);
INSERT INTO zabawki VALUES(49, 'Lalka Elsa-Anna', 55, 10, 2);
INSERT INTO zabawki VALUES(50, 'Karty Classic', 5, 12, 1);
INSERT INTO zabawki VALUES(51, 'UNO', 25, 50, 1);
INSERT INTO zabawki VALUES(52, 'Karty McQueen', 15, 10, 1);
INSERT INTO zabawki VALUES(53, 'Pasjans', 17, 14, 1);




INSERT INTO klienci VALUES(1, 'ABC', 'Jan', 'Kowalski', 88032411672, '35-001', '8/1');
INSERT INTO klienci VALUES(2, 'Maxim', 'Anna', 'Nowak', 78090727735, '35-002', '12/3');
INSERT INTO klienci VALUES(3, 'Raczek', 'Piotr', 'Wiśniewski', 85061115536, '35-005', '15/4');
INSERT INTO klienci VALUES(4, 'Qwerty', 'Agnieszka', 'Dąbrowska', 80070722588, '35-010', '5/5');
INSERT INTO klienci VALUES(5, 'SP nr 1 Rzeszów', 'Krzysztof', 'Zając', 86080811212, '35-021', '9/6');
INSERT INTO klienci VALUES(6, 'Brzdąc', 'Ewa', 'Kaczmarek', 89101144487, '35-025', '7/7');
INSERT INTO klienci VALUES(7, 'XYZ', 'Adam', 'Mazur', 84070123456, '36-061', '1/8');
INSERT INTO klienci VALUES(8, 'Od A do Z', 'Marta', 'Jankowska', 83040226654, '39-200', '2/9');
INSERT INTO klienci VALUES(9, 'Osoba prywatna', 'Tomasz', 'Wojciechowski', 86051211145, '33-100', '3/10');
INSERT INTO klienci VALUES(10, 'Odido', 'Joanna', 'Kwiatkowska', 87071012345, '33-302', '4/11');
INSERT INTO klienci VALUES(11, 'Osoba prywatna', 'Dawid', 'Kozłowski', 82071414355, '27-200', '5/12');
INSERT INTO klienci VALUES(12, 'Majster', 'Paulina', 'Wieczorek', 90101215400, '27-500', '6/13');
INSERT INTO klienci VALUES(13, 'Lewiatan', 'Sebastian', 'Majewski', 87061012345, '27-400', '7/14');
INSERT INTO klienci VALUES(14, 'Light', 'Magdalena', 'Krawczyk', 85061112345, '21-100', '8/15');
INSERT INTO klienci VALUES(15, 'Future', 'Paweł', 'Nowicki', 86071312244, '35-001', '9/16');
INSERT INTO klienci VALUES(16, 'Fundacja Życie', 'Beata', 'Stępień', 84444234122, '27-400', '3/4');
INSERT INTO klienci VALUES(17, 'Dom Dziecka Rzeszów', 'Marek', 'Jabłoński', 86090727735, '35-005', '12/18');
INSERT INTO klienci VALUES(18, 'Fundacja Dla Dziecka', 'Karolina', 'Woźniak', 85031215536, '35-010', '15/19');
INSERT INTO klienci VALUES(19, 'Fast', 'Kamil', 'Zieliński', 80101722588, '35-021', '5/20');
INSERT INTO klienci VALUES(20, 'Perfect', 'Monika', 'Wiśniewska', 86101811212, '35-025', '9/21');
INSERT INTO klienci VALUES(21, 'SP nr 3 Rzeszów', 'Grzegorz', 'Mazurek', 89121444487, '36-061', '7/22');
INSERT INTO klienci VALUES(22, 'Osoba prywatna', 'Alicja', 'Jankowska', 83070226654, '39-200', '2/23');
INSERT INTO klienci VALUES(23, 'Small Gift', 'Marcin', 'Wojciechowski', 86061211145, '33-100', '3/24');
INSERT INTO klienci VALUES(24, 'Box4Life', 'Agata', 'Kwiatkowska', 87081412345, '33-302', '4/25');
INSERT INTO klienci VALUES(25, 'Fundacja Teraz', 'Łukasz', 'Kozłowski', 82091514355, '27-200', '5/26');
INSERT INTO klienci VALUES(26, 'Speedy', 'Martyna', 'Wieczorek', 90121515400, '27-500', '6/27');
INSERT INTO klienci VALUES(27, 'Mądrość', 'Dominik', 'Majewski', 87011512345, '27-400', '7/28');
INSERT INTO klienci VALUES(28, 'Osoba prywatna', 'Nina', 'Krawczyk', 85011612345, '21-100', '8/29');
INSERT INTO klienci VALUES(29, 'Lollipop', 'Bartosz', 'Nowicki', 86071712244, '35-001', '9/30');
INSERT INTO klienci VALUES(30, 'Fitness4Life', 'Sylwia', 'Stępień', 83011811122, '35-005', '10/31');




INSERT INTO producenci VALUES(1283741712, 'Zabawkowa Kraina', 'Aneta', 'Nowak', 824168374, '35-001', '12/17');
INSERT INTO producenci VALUES(8172837123, 'Toyland', 'Tomasz', 'Jankowski', 412948371, '35-021', '23/4');
INSERT INTO producenci VALUES(8472912374, 'Zabawki dla Maluchów', 'Agnieszka', 'Kowalska', 658293741, '35-025', '15/3');
INSERT INTO producenci VALUES(1236782934, 'Gift', 'Katarzyna', 'Wiśniewska', 876283412, '35-002', '45/9');
INSERT INTO producenci VALUES(1238762934, 'Kids Playground', 'Jerzy', 'Mazur', 751284739, '36-061', '6/21');
INSERT INTO producenci VALUES(9123678452, 'Happy Toys', 'Anna', 'Krawczyk', 231748293, '35-005', '9/11');
INSERT INTO producenci VALUES(7491238520, 'Toy World', 'Adam', 'Piotrowski', 841268374, '35-010', '7/1');
INSERT INTO producenci VALUES(9128356741, 'Little Treasures', 'Marta', 'Wojciechowska', 123876293, '39-200', '8/3');
INSERT INTO producenci VALUES(8123746590, 'Maluchy', 'Jan', 'Kowalczyk', 658273912, '35-001', '5/7');
INSERT INTO producenci VALUES(9128354762, 'Toy Box', 'Magdalena', 'Dąbrowska', 827341689, '33-100', '13/2');
INSERT INTO producenci VALUES(1283567941, 'Zabawkolandia', 'Piotr', 'Nowakowski', 912783465, '33-302', '14/6');
INSERT INTO producenci VALUES(9128347650, 'Toy Store', 'Agnieszka', 'Wiśniewska', 123875642, '27-200', '10/4');
INSERT INTO producenci VALUES(9128433651, 'MaxFun', 'Katarzyna', 'Krawczyk', 834129756, '27-500', '1/8');
INSERT INTO producenci VALUES(9133427652, 'Toy4Kids', 'Adam', 'Piotrowski', 123874695, '27-400', '9/6');
INSERT INTO producenci VALUES(9128341253, 'Funny', 'Marta', 'Wojciechowska', 827341649, '21-100', '3/5');



Alter table pracownicy add nr_ulicy varchar2(50);
INSERT INTO pracownicy VALUES(1, 'Piotr', 'Kowalczyk', 512341738, 7000, '27-500', 1, '8/36');
INSERT INTO pracownicy VALUES(2, 'Anna', 'Kowalska', 538341274, 3200, '35-001', 2, '14/4' );
INSERT INTO pracownicy VALUES(3, 'Piotr', 'Wiśniewski', 778341256, 3500, '27-500', 2, '12/8');
INSERT INTO pracownicy VALUES(4, 'Agnieszka', 'Dąbrowska', 800412376, 2850, '20-001', 2, '7/34');
INSERT INTO pracownicy VALUES(5, 'Tomasz', 'Kozłowski', 828349856, 3300,'36-061', 2, '2/4');
INSERT INTO pracownicy VALUES(6, 'Magdalena', 'Jankowska', 788341278, 3400, '39-200', 2, '7/17');
INSERT INTO pracownicy VALUES(7, 'Katarzyna', 'Wojciechowska', 328441279, 3550, '35-025', 3, '8/10');
INSERT INTO pracownicy VALUES(8, 'Marcin', 'Kwiatkowski', 843341243, 3600, '35-002', 3, '5/15');
INSERT INTO pracownicy VALUES(9, 'Marek', 'Zieliński', 348341255, 3750, '35-025', 3, '3/10');
INSERT INTO pracownicy VALUES(10, 'Dorota', 'Szymańska', 933341235, 4000, '35-001', 4, '1/16');
INSERT INTO pracownicy VALUES(11, 'Paweł', 'Wróbel', 502112482, 4150, '21-100', 4, '12/74');
INSERT INTO pracownicy VALUES(12, 'Ewa', 'Mazur', 828895238, 3250, '33-302', 4, '16/31');
INSERT INTO pracownicy VALUES(13, 'Jolanta', 'Krawczyk', 530341239, 3000, '27-400', 5, '12/34');
INSERT INTO pracownicy VALUES(14, 'Andrzej', 'Kaczmarek', 538441240, 3450, '21-047', 6, '7/45');
INSERT INTO pracownicy VALUES(15, 'Monika', 'Piotrowska', 8528341241, 3250, '35-001', 6, '10/10');
INSERT INTO pracownicy VALUES(16, 'Grzegorz', 'Grabowski', 745412422, 3550, '27-200', 6, '18/31');
INSERT INTO pracownicy VALUES(17, 'Paulina', 'Mikołajewska', 567341273, 3750, '21-100', 6, '7/40');
INSERT INTO pracownicy VALUES(18, 'Sylwia', 'Pawlak', 437238753, 3950, '36-002', 7, '9/19');
INSERT INTO pracownicy VALUES(19, 'Paweł', 'Nowak', 655341246, 4250, '20-001', 8, '10/14');


INSERT INTO samochody_firmowe VALUES('RZE 323RF', 'Citroen', 'Berlingo', 1);
INSERT INTO samochody_firmowe VALUES('RZ 337F3', 'Opel', 'Vivaro', 2);
INSERT INTO samochody_firmowe VALUES('RZ XD21', 'Opel', 'Movano', 4);
INSERT INTO samochody_firmowe VALUES('RZE 931R', 'Renault', 'Master', 5);
INSERT INTO samochody_firmowe VALUES('RZ 112Z', 'Ford', 'Transit', 14);
INSERT INTO samochody_firmowe VALUES('RKR 436Y', 'Volkswagen', 'Transporter', 3);
INSERT INTO samochody_firmowe VALUES('RZE 8HA8', 'Peugeot', 'Expert', 15);
INSERT INTO samochody_firmowe VALUES('RZ A22A', 'Renault', 'Master', 6);
INSERT INTO samochody_firmowe VALUES('RZ P123', 'Mercedes-Benz', 'Sprinter', 7);
INSERT INTO samochody_firmowe VALUES('RZE J87A', 'Fiat', 'Ducato', 8);
INSERT INTO samochody_firmowe VALUES('RZ 77ST', 'Citroen', 'Jumpy', 9);
INSERT INTO samochody_firmowe VALUES('RZE A74S', 'Opel', 'Movano', 10);
INSERT INTO samochody_firmowe VALUES('RZ 16ES', 'Ford', 'Custom', 18);
INSERT INTO samochody_firmowe VALUES('RBR 33MV', 'Volkswagen', 'Crafter', 12);
INSERT INTO samochody_firmowe VALUES('RJS 56YT', 'Peugeot', 'Boxer', 13);



INSERT INTO magazyn VALUES(1, TO_DATE('2021-02-15', 'YYYY-MM-DD'), 3, 1, 23, 1, 9128356741);
INSERT INTO magazyn VALUES(2, TO_DATE('2021-03-08', 'YYYY-MM-DD'), 5, 2, 31, 1, 1283741712);
INSERT INTO magazyn VALUES(3, TO_DATE('2021-05-12', 'YYYY-MM-DD'), 2, 1, 43, 1, 1236782934);
INSERT INTO magazyn VALUES(4, TO_DATE('2021-06-05', 'YYYY-MM-DD'), 8, 2, 15, 10, 8472912374);
INSERT INTO magazyn VALUES(5, TO_DATE('2021-07-01', 'YYYY-MM-DD'), 7, 3, 32, 12, 1238762934);
INSERT INTO magazyn VALUES(6, TO_DATE('2021-08-15', 'YYYY-MM-DD'), 4, 1, 17, 11, 9123678452);
INSERT INTO magazyn VALUES(7, TO_DATE('2021-09-07', 'YYYY-MM-DD'), 6, 4, 51, 1, 7491238520);
INSERT INTO magazyn VALUES(8, TO_DATE('2021-10-01', 'YYYY-MM-DD'), 3, 3, 41, 11, 9128354762);
INSERT INTO magazyn VALUES(9, TO_DATE('2021-11-15', 'YYYY-MM-DD'), 5, 1, 22, 12, 1283567941);
INSERT INTO magazyn VALUES(10, TO_DATE('2021-12-08', 'YYYY-MM-DD'), 2, 2, 35, 11, 9128347650);
INSERT INTO magazyn VALUES(11, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 8, 3, 50, 10, 8472912374);
INSERT INTO magazyn VALUES(12, TO_DATE('2022-02-15', 'YYYY-MM-DD'), 7, 4, 31, 10, 8472912374);
INSERT INTO magazyn VALUES(13, TO_DATE('2022-03-08', 'YYYY-MM-DD'), 4, 2, 21, 11, 1283567941);
INSERT INTO magazyn VALUES(14, TO_DATE('2022-04-01', 'YYYY-MM-DD'), 6, 3, 48, 1, 8123746590);
INSERT INTO magazyn VALUES(15, TO_DATE('2022-05-15', 'YYYY-MM-DD'), 3, 1, 39, 12, 1283741712);
INSERT INTO magazyn VALUES(16, TO_DATE('2022-06-08', 'YYYY-MM-DD'), 5, 2, 26, 12, 9128354762);
INSERT INTO magazyn VALUES(17, TO_DATE('2022-07-01', 'YYYY-MM-DD'), 2, 3, 45, 1, 1283567941);
INSERT INTO magazyn VALUES(18, TO_DATE('2022-08-15', 'YYYY-MM-DD'), 8, 1, 33, 1, 9128347650);
INSERT INTO magazyn VALUES(19, TO_DATE('2022-09-07', 'YYYY-MM-DD'), 7, 2, 52, 1, 9128347650);
INSERT INTO magazyn VALUES(20, TO_DATE('2022-10-01', 'YYYY-MM-DD'), 4, 3, 24, 11, 8123746590);
INSERT INTO magazyn VALUES(21, TO_DATE('2022-11-15', 'YYYY-MM-DD'), 6, 1, 38, 12, 9123678452);
INSERT INTO magazyn VALUES(22, TO_DATE('2022-12-08', 'YYYY-MM-DD'), 3, 2, 46, 10, 8123746590);
INSERT INTO magazyn VALUES(23, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 5, 3, 20, 10, 1283741712);
INSERT INTO magazyn VALUES(24, TO_DATE('2022-02-15', 'YYYY-MM-DD'), 2, 1, 37, 12, 9128354762);
INSERT INTO magazyn VALUES(25, TO_DATE('2022-03-08', 'YYYY-MM-DD'), 8, 2, 30, 11, 1283567941);
INSERT INTO magazyn VALUES(26, TO_DATE('2022-04-01', 'YYYY-MM-DD'), 7, 4, 44, 1, 9128347650);
INSERT INTO magazyn VALUES(27, TO_DATE('2022-05-15', 'YYYY-MM-DD'), 4, 1, 19, 10, 9128433651);
INSERT INTO magazyn VALUES(28, TO_DATE('2022-06-08', 'YYYY-MM-DD'), 6, 2, 51, 11, 1238762934);
INSERT INTO magazyn VALUES(29, TO_DATE('2022-07-01', 'YYYY-MM-DD'), 3, 3, 35, 12, 1283741712);
INSERT INTO magazyn VALUES(30, TO_DATE('2022-08-15', 'YYYY-MM-DD'), 5, 1, 23, 12, 8123746590);
INSERT INTO magazyn VALUES(31, TO_DATE('2022-09-07', 'YYYY-MM-DD'), 2, 2, 49, 10, 1283741712);
INSERT INTO magazyn VALUES(32, TO_DATE('2022-10-01', 'YYYY-MM-DD'), 8, 3, 29, 10, 9128354762);
INSERT INTO magazyn VALUES(33, TO_DATE('2022-11-15', 'YYYY-MM-DD'), 7, 1, 40, 1, 1283567941);
INSERT INTO magazyn VALUES(34, TO_DATE('2022-12-08', 'YYYY-MM-DD'), 4, 2, 45, 11, 9128347650);
INSERT INTO magazyn VALUES(35, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 6, 3, 18, 12, 9128347650);



INSERT INTO sprzedaz VALUES(1, 4, TO_DATE('2022-03-15', 'YYYY-MM-DD'), 3, 24, 3, 32);
INSERT INTO sprzedaz VALUES(2, 6, TO_DATE('2022-02-22', 'YYYY-MM-DD'), 1, 12, 2, 45);
INSERT INTO sprzedaz VALUES(3, 7, TO_DATE('2022-01-19', 'YYYY-MM-DD'), 2, 29, 3, 15);
INSERT INTO sprzedaz VALUES(4, 3, TO_DATE('2022-03-05', 'YYYY-MM-DD'), 1, 5, 4, 53);
INSERT INTO sprzedaz VALUES(5, 5, TO_DATE('2022-02-14', 'YYYY-MM-DD'), 3, 8, 5, 18);
INSERT INTO sprzedaz VALUES(6, 8, TO_DATE('2021-12-22', 'YYYY-MM-DD'), 2, 15, 2, 34);
INSERT INTO sprzedaz VALUES(7, 6, TO_DATE('2021-10-14', 'YYYY-MM-DD'), 2, 29, 6, 39);
INSERT INTO sprzedaz VALUES(8, 2, TO_DATE('2021-11-30', 'YYYY-MM-DD'), 1, 28, 3, 51);
INSERT INTO sprzedaz VALUES(9, 10, TO_DATE('2021-10-23', 'YYYY-MM-DD'), 3, 3, 4, 29);
INSERT INTO sprzedaz VALUES(10, 3, TO_DATE('2022-01-02', 'YYYY-MM-DD'), 2, 9, 5, 22);
INSERT INTO sprzedaz VALUES(11, 5, TO_DATE('2021-11-12', 'YYYY-MM-DD'), 1, 20, 2, 46);
INSERT INTO sprzedaz VALUES(12, 8, TO_DATE('2022-01-16', 'YYYY-MM-DD'), 3, 13, 3, 30);
INSERT INTO sprzedaz VALUES(13, 7, TO_DATE('2022-01-27', 'YYYY-MM-DD'), 1, 19, 6, 25);
INSERT INTO sprzedaz VALUES(14, 4, TO_DATE('2022-03-08', 'YYYY-MM-DD'), 2, 26, 4, 50);
INSERT INTO sprzedaz VALUES(15, 6, TO_DATE('2022-02-01', 'YYYY-MM-DD'), 1, 1, 5, 17);
INSERT INTO sprzedaz VALUES(16, 2, TO_DATE('2021-12-18', 'YYYY-MM-DD'), 3, 24, 2, 37);
INSERT INTO sprzedaz VALUES(17, 10, TO_DATE('2021-11-03', 'YYYY-MM-DD'), 2, 7, 3, 52);
INSERT INTO sprzedaz VALUES(18, 3, TO_DATE('2021-10-16', 'YYYY-MM-DD'), 1, 19, 4, 25);
INSERT INTO sprzedaz VALUES(19, 5, TO_DATE('2022-01-09', 'YYYY-MM-DD'), 3, 2, 5, 41);
INSERT INTO sprzedaz VALUES(20, 8, TO_DATE('2021-12-11', 'YYYY-MM-DD'), 2, 15, 2, 48);
INSERT INTO sprzedaz VALUES(21, 2, TO_DATE('2021-11-06', 'YYYY-MM-DD'), 1, 28, 3, 33);
INSERT INTO sprzedaz VALUES(22, 10, TO_DATE('2021-10-02', 'YYYY-MM-DD'), 3, 11, 4, 21);
INSERT INTO sprzedaz VALUES(23, 3, TO_DATE('2022-03-22', 'YYYY-MM-DD'), 2, 24, 5, 44);
INSERT INTO sprzedaz VALUES(24, 5, TO_DATE('2022-04-07', 'YYYY-MM-DD'), 3, 21, 6, 11);
INSERT INTO sprzedaz VALUES(25, 5, TO_DATE('2022-02-15', 'YYYY-MM-DD'), 1, 7, 2, 36);
INSERT INTO sprzedaz VALUES(26, 8, TO_DATE('2021-12-08', 'YYYY-MM-DD'), 3, 20, 3, 49);
INSERT INTO sprzedaz VALUES(27, 4, TO_DATE('2021-11-01', 'YYYY-MM-DD'), 2, 13, 4, 31);
INSERT INTO sprzedaz VALUES(28, 6, TO_DATE('2021-10-25', 'YYYY-MM-DD'), 1, 26, 5, 40);
INSERT INTO sprzedaz VALUES(29, 6, TO_DATE('2021-08-25', 'YYYY-MM-DD'), 1, 22, 5, 41);
INSERT INTO sprzedaz VALUES(30, 8, TO_DATE('2022-02-08', 'YYYY-MM-DD'), 3, 9, 2, 51);
INSERT INTO sprzedaz VALUES(31, 4, TO_DATE('2021-12-01', 'YYYY-MM-DD'), 2, 22, 3, 20);
INSERT INTO sprzedaz VALUES(32, 6, TO_DATE('2021-11-24', 'YYYY-MM-DD'), 1, 5, 4, 35);
INSERT INTO sprzedaz VALUES(33, 2, TO_DATE('2021-10-17', 'YYYY-MM-DD'), 3, 18, 5, 43);
INSERT INTO sprzedaz VALUES(34, 10, TO_DATE('2022-03-10', 'YYYY-MM-DD'), 2, 1, 2, 27);
INSERT INTO sprzedaz VALUES(35, 3, TO_DATE('2022-02-03', 'YYYY-MM-DD'), 1, 14, 3, 38);
INSERT INTO sprzedaz VALUES(36, 5, TO_DATE('2021-12-29', 'YYYY-MM-DD'), 3, 27, 4, 49);
INSERT INTO sprzedaz VALUES(37, 8, TO_DATE('2021-11-22', 'YYYY-MM-DD'), 2, 10, 5, 32);
INSERT INTO sprzedaz VALUES(38, 4, TO_DATE('2021-10-15', 'YYYY-MM-DD'), 1, 23, 2, 44);
INSERT INTO sprzedaz VALUES(39, 6, TO_DATE('2022-03-01', 'YYYY-MM-DD'), 3, 6, 3, 16);
INSERT INTO sprzedaz VALUES(40, 2, TO_DATE('2022-02-24', 'YYYY-MM-DD'), 2, 19, 4, 41);
INSERT INTO sprzedaz VALUES(41, 10, TO_DATE('2021-12-17', 'YYYY-MM-DD'), 1, 2, 5, 34);
INSERT INTO sprzedaz VALUES(42, 3, TO_DATE('2021-11-10', 'YYYY-MM-DD'), 3, 15, 2, 50);
INSERT INTO sprzedaz VALUES(43, 5, TO_DATE('2021-10-03', 'YYYY-MM-DD'), 2, 28, 3, 25);
INSERT INTO sprzedaz VALUES(44, 9, TO_DATE('2022-07-05', 'YYYY-MM-DD'), 1, 16, 6, 8);



INSERT INTO historia_zatr_pracownika VALUES(1, 1, TO_DATE('2020-09-01', 'YYYY-MM-DD'), TO_DATE('2020-09-01', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(2, 2, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(3, 2, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(4, 2, TO_DATE('2021-05-10', 'YYYY-MM-DD'), TO_DATE('2021-05-10', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(5, 2, TO_DATE('2020-06-22', 'YYYY-MM-DD'), TO_DATE('2021-06-22', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(6, 2, TO_DATE('2021-06-14', 'YYYY-MM-DD'), TO_DATE('2021-06-14', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(7, 6, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-09-05', 'YYYY-MM-DD'));
INSERT INTO historia_zatr_pracownika VALUES(8, 3, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-09-06', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(9, 2, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-05-09', 'YYYY-MM-DD'));
INSERT INTO historia_zatr_pracownika VALUES(9, 3, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-05-09', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(10, 6, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-04-17', 'YYYY-MM-DD'));
INSERT INTO historia_zatr_pracownika VALUES(10, 4, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-04-17', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(11, 4, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-09-05', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(12, 2, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-06-15', 'YYYY-MM-DD'));
INSERT INTO historia_zatr_pracownika VALUES(12, 4, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2021-06-15', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(13, 4, TO_DATE('2021-02-14', 'YYYY-MM-DD'), TO_DATE('2021-02-14', 'YYYY-MM-DD'), TO_DATE('2022-07-05', 'YYYY-MM-DD'));
INSERT INTO historia_zatr_pracownika VALUES(13, 5, TO_DATE('2021-02-14', 'YYYY-MM-DD'), TO_DATE('2021-07-06', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(14, 6, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(15, 6, TO_DATE('2021-08-30', 'YYYY-MM-DD'), TO_DATE('2021-08-30', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(16, 6, TO_DATE('2022-01-02', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(17, 6, TO_DATE('2020-09-10', 'YYYY-MM-DD'), TO_DATE('2021-09-10', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(18, 7, TO_DATE('2020-09-05', 'YYYY-MM-DD'), TO_DATE('2020-09-05', 'YYYY-MM-DD'), NULL);
INSERT INTO historia_zatr_pracownika VALUES(19, 8, TO_DATE('2022-04-21', 'YYYY-MM-DD'), TO_DATE('2021-04-21', 'YYYY-MM-DD'), NULL);


SELECT pracownicy.imie, pracownicy.nazwisko, samochody_firmowe.model, samochody_firmowe.marka
FROM Samochody_firmowe
JOIN Pracownicy ON Samochody_firmowe.ID_Pracownika = Pracownicy.ID_Pracownika


SELECT pracownicy.imie, pracownicy.nazwisko
FROM pracownicy
JOIN adres ON pracownicy.adres = adres.kod_pocztowy 
WHERE adres.miejscowość = 'Rzeszów' 


SELECT kategorie.nazwa_kategorii, SUM(zabawki.dostepna_ilosc) as ilosc
FROM kategorie
JOIN zabawki ON kategorie.id_kategorii = zabawki.id_kategorii
GROUP BY kategorie.nazwa_kategorii 
ORDER BY ilosc DESC


SELECT * FROM zabawki
WHERE dostepna_ilosc < 10

UPDATE zabawki
SET cena = cena * 0.5
WHERE dostepna_ilosc < 6

UPDATE zabawki
SET cena = cena * 2
WHERE dostepna_ilosc < 6


SELECT stanowisko.nazwa_stanowiska, AVG(pracownicy.wynagrodzenie_podstawowe) as srednia_pensja
FROM stanowisko
JOIN pracownicy ON pracownicy.id_stanowiska = stanowisko.id_stanowiska
GROUP BY stanowisko.nazwa_stanowiska
ORDER BY srednia_pensja DESC


select pracownicy.imie, pracownicy.nazwisko, historia_zatr_pracownika.data_zatr_w_firmie, stanowisko.nazwa stanowiska
from pracownicy
join historia_zatr_pracownika on historia_zatr_pracownika.id_pracownika = pracownicy.id_pracownika
join stanowisko on stanowisko.id_stanowiska = pracownicy.id_stanowiska
where historia_zatr_pracownika.data_zatr_w_firmie > '22/01/01';


SELECT producenci.nazwa_firmy, SUM(magazyn.ilosc_sztuk) as ilosc
FROM producenci
JOIN magazyn ON producenci.nip_producenta = magazyn.nip_producenta
GROUP by producenci.nazwa_firmy
ORDER BY ilosc DESC


update pracownicy
set pracownicy.wynagrodzenie_podstawowe = pracownicy.wynagrodzenie_podstawowe + 200
where pracownicy.adres not in (select adres.kod_pocztowy from adres where adres.powiat = 'Rzeszow' or adres.powiat = 'rzeszowski');


select * from sprzedaz
where data_sprzedazy between '22/03/01' and '22/03/31';


select adres.miejscowosc, count(adres.miejscowosc) as ilosc
from adres
join klienci on klienci.adres = adres.kod_pocztowy
group by adres.miejscowosc
order by ilosc desc;


select zabawki.nazwa, zabawki.cena
from zabawki
where zabawki.cena = (select max(zabawki.cena) from zabawki);


select pracownicy.imie, pracownicy.nazwisko, stanowisko.nazwa_stanowiska
from pracownicy
join historia_zatr_pracownika on historia_zatr_pracownika.id_pracownika = pracownicy.id_pracownika
join stanowisko on pracownicy.id_stanowiska = stanowisko.id_stanowiska
where historia_zatr_pracownika.data_zak_pracy_na_stanowisku is not null;


select zabawki.nazwa, sum(sprzedaz.ilosc_sztuk0 as ilosc
from zabawki
join sprzedaz on sprzedaz.id_zabawki = zabawki.id_zabawki
group by zabawki.nazwa
order by ilosc desc;


select klienci.imie as imie_klineta, klienci.nazwisko as nazwisko_klienta, sprzedaz.data_sprzedazy, sposoby_zaplaty.sposob_zaplaty, zabawki.nazwa
from klienci
join sprzedaz on sprzedaz.id_klienta = klienci.id_klienta
join sposoby_zaplaty on sposoby_zaplaty.id_sposobu_zaplaty = sprzedaz.id_sposobu_zaplaty
join zabawki on zabawki.id_zabawki = sprzedaz.id_zabawki
where sprzedaz.data_sprzedazy between '22/01/01' and '22/03/31';


select pracownicy.imie, pracownicy.nazwisko, count(sprzedaz.id_pracownika) as ilosc
from pracownicy 
join sprzedaz on sprzedaz.id_pracownika = pracownicy.id_pracownika
group by pracownicy.imie, pracownicy.nazwisko
order by ilosc desc;











