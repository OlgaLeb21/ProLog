implement main 
    open core, file, stdio 
 
domains 
    country = string 
    city = string 
    capital = string 
    part = string 
    population = integer 
 
class facts - geoDb 
    country : (integer Id, country Name, capital Capital, part Part, population Population). 
    city : (integer Id, city Name, countryId CountryId). 
    capital : (integer Id, capital Name, countryId CountryId). 
 
class predicates 
    cities_in_part : (part Part) nondeterm. 
    population_of_country : (country Name) -> (population Population). 
 
clauses 
    country(1, "Russia", "Moscow", "Europe/Asia", 146793744). 
    country(2, "USA", "Washington, D.C.", "North America", 331449281). 
    country(3, "China", "Beijing", "Asia", 1440297825). 
    country(4, "Germany", "Berlin", "Europe", 83166711). 
    country(5, "Brazil", "Brasilia", "South America", 213993437). 
    country(6, "Australia", "Canberra", "Australia/Oceania", 25788200). 
    country(7, "South Africa", "Pretoria", "Africa", 59308690). 
    country(8, "India", "New Delhi", "Asia", 1380004385). 
    country(9, "Canada", "Ottawa", "North America", 37742154). 
    country(10, "France", "Paris", "Europe", 65273511). 

    city(1, "Moscow", 1). 
    city(2, "Saint Petersburg", 1). 
    city(3, "Novosibirsk", 1). 
    city(4, "Kazan", 1). 
    city(5, "New York City", 2). 
    city(6, "Los Angeles", 2). 
    city(7, "Chicago", 2). 
    city(8, "Houston", 2). 
    city(9, "Beijing", 3). 
    city(10, "Shanghai", 3). 
    city(11, "Hong Kong", 3). 
    city(12, "Taipei", 3). 
    city(13, "Berlin", 4). 
    city(14, "Munich", 4). 
    city(15, "Hamburg", 4). 
    city(16, "Frankfurt", 4). 
    city(17, "São Paulo", 5). 
    city(18, "Rio de Janeiro", 5). 
    city(19, "Salvador", 5). 
    city(20, "Brasília", 5). 
    city(21, "Sydney", 6). 
    city(22, "Melbourne", 6). 
    city(23, "Brisbane", 6). 
    city(24, "Perth", 6). 
    city(25, "Pretoria", 7). 
    city(26, "Cape Town", 7). 
    city(27, "Durban", 7). 
    city(28, "Johannesburg", 7). 
    city(29, "New Delhi", 8). 
    city(30, "Mumbai", 8). 
    city(31, "Bangalore", 8). 
    city(32, "Chennai", 8). 
    city(33, "Ottawa", 9). 
    city(34, "Toronto", 9). 
    city(35, "Montreal", 9). 
    city(36, "Vancouver", 9).
    city(37, "Paris", 10). 
    city(38, "Lyon", 10). 
    city(39, "Marseille", 10). 
    city(40, "Toulouse", 10). 

    capital(1, "Moscow", 1). 
    capital(2, "Washington, D.C.", 2). 
    capital(3, "Beijing", 3). 
    capital(4, "Berlin", 4). 
    capital(5, "Brasilia", 5). 
    capital(6, "Canberra", 6). 
    capital(7, "Pretoria", 7). 
    capital(8, "New Delhi", 8). 
    capital(9, "Ottawa", 9). 
    capital(10, "Paris", 10). 
 
class predicates 
    country_cities : (country Name) nondeterm. 
    capital_of_country : (country Name) -> (capital Capital). 
 
clauses 
    country_cities(Name) :- 
        country(Id, Name, _, _, _), 
        write("Cities in ", Name, ":"), 
        nl, 
        city(CityId, CityName, Id), 
        write("  - ", CityName), 
        nl, 
        fail. 
    country_cities(Name) :- 
        succeed. 
 
    capital_of_country(Name, Capital) :- 
        country(_, Name, Capital, _, _). 
 
    population_of_country(Name, Population) :- 
        country(_, Name, _, _, Population). 
 
    cities_in_part(Part) :- 
        write("Cities in ", Part, ":"), 
        nl, 
        country(_, _, _, Part, _), 
        city(_, CityName, CountryId), 
        country(CountryId, _, _, _, _), 
        write("  - ", CityName), 
        nl, 
        fail. 
    cities_in_part(Part) :- 
        succeed. 
 
 
    run() :- 
        console::init(), 
        reconsult("..\\geo.txt", geoDb), 
        country_cities("Russia"), 
        fail. 
    run() :- 
        capital_of_country("USA", Capital), 
        write("The capital of USA is ", Capital), 
        nl. 
    run() :- 
        population_of_country("China", Population), 
        write("Population of China is ", Population), 
        nl. 
    run() :- 
        cities_in_part("Europe"), 
        fail. 
    run() :- 
        succeed.
end implement main 
 
goal 
    console::run(main::run).