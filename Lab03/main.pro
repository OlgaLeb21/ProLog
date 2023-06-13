%Лабораторная работа №3 (на основе 1 и 2 Лаб. работ)

implement main
     open core, file, stdio
 
 domains
     country = string.
     city = string.
     capital = string.
     part = string.
     population = integer.
     country_id = integer.
 
 class facts - geoDb
     country : (integer Id, country Name, capital Capital, part Part, population Population).
     city : (integer Id, city Name, country_id CountryId).
     capital : (integer Id, capital Name, country_id CountryId).
 
 class predicates
     cities_in_part : (part Part) -> (city_list).
     population_of_country : (country Name) -> (population).
     country_cities : (country Name) -> (city_list).
     capital_of_country : (country Name) -> (capital_list).
     calc_population_stats : (country Name) -> (count, max_population, avg_population, min_population).
 
%хранение информации о городах и столицах с помощью списков

 clauses
     country_cities(Name) :-
         country(_, Name, _, _, _),
         city_list = [CityName : city(_, CityName, CountryId), country(CountryId, _, _, _, _)],
         write("Cities in ", Name, ":"),
         nl,
         write_list(city_list),
         fail.
 
     capital_of_country(Name) :-
         country(_, Name, _, _, _),
         capital_list = [Capital : capital(_, Capital, CountryId), country(CountryId, _, _, _, _)],
         write("Capitals of ", Name, ":"),
         nl,
         write_list(capital_list),
         fail.
 
     population_of_country(Name) :-
         country(_, Name, _, _, Population),
         write(Name, "'s population:\t", Population),
         nl,
         fail.
 
     cities_in_part(Part) :-
         write("Cities in ", Part, ":"),
         nl,
         country_list = [country(Name) : country(_, Name, _, Part, _)],
         city_list = [CityName : city(_, CityName, CountryId), country(CountryId, _, _, Part, _)],
         write_list(city_list),
         fail.
         
 %предикат p_calculation, который вычисляет количество жителей, максимальное/среднее/минимальное значения населения для заданной страны.
     p_calculation(Name) :-
         country(_, Name, _, _, _),
         population_list = [Population : country(_, Name, _, _, Population)],
         length(population_list, Count),
         max_list(population_list, Max),
         min_list(population_list, Min),
         sumlist(population_list, Sum),
         AvgPopulation is Sum / Count,
         write(Name, "'s population statistics:"),
         nl,
         write("Count:\t\t", Count),
         nl,
         write("Max:\t\t", Max),
         nl,
         write("Min:\t\t", Min),
         nl,
         write("Average:\t", AvgPopulation),
         nl,
         fail.
 
 
     run() :-
         console::init(),
         reconsult("..\\clauses.txt", geoDb),
         country_cities("Russia"),
         fail.
 
     run() :-
         capital_of_country("USA"),
         fail.
 
     run() :-
         population_of_country("China"),
         fail.
 
     run() :-
         cities_in_part("Europe"),
         fail.
 
     run() :-
         p_calculation("Russia"),
         fail.
 
     run() :-
         p_calculation("USA"),
         fail.
 
     run() :-
         p_calculation("China"),
         fail.
 
     run().
 
%список List выводится на экран с помощью рекурсивного алгоритма
 clauses
     write_list([X | List]) :-
         write("  - "),
         write(X),
         nl,
         write_list(List).
 
     write_list(List) :-
         List = [].
 
 end implement main
 
 goal
     console::run(main::run).
