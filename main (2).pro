implement main
    open core, file, stdio

domains
    country1 = string.
    city1 = string.
    capital1 = string.
    part1 = string.
    population1 = integer.
    countryId1 = integer.

class facts - geoDb
    country : (integer Id, country1 Name, capital1 Capital, part1 Part, population1 Population).
    city : (integer Id, city1 Name, countryId1 CountryId).
    capital : (integer Id, capital1 Name, countryId1 CountryId).

class predicates
    cities_in_part : (part1 Part).
    population_of_country : (country1 Name).
    country_cities : (country1 Name).
    capital_of_country : (country1 Name).

clauses
    country_cities(Name) :-
        country(Id, Name, _, _, _),
        write("Cities in ", Name, ":"),
        nl,
        city(_CityId, CityName, Id),
        write("  - "),
        write(CityName),
        nl,
        fail.
    country_cities(_).

    capital_of_country(Name) :-
        country(_, Name, Capital, _, _),
        write(Name, ":\t", Capital),
        nl,
        fail.
    capital_of_country(_).

    population_of_country(Name) :-
        country(_, Name, _, _, Population),
        write(Name, ":\t", Population),
        nl,
        fail.
    population_of_country(_).

    cities_in_part(Part) :-
        write("Cities in ", Part, ":"),
        nl,
        country(_, _, _, Part, _),
        city(_, CityName, CountryId),
        country(CountryId, _, _, _, _),
        write("  - "),
        write(CityName),
        nl,
        fail.
    cities_in_part(_).

    run() :-
        console::init(),
        reconsult("..\\geo.txt", geoDb),
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

    run().

end implement main

goal
    console::run(main::run).
