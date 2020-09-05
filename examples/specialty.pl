studied(petya,mathematics).
studied(vasya,german).	
studied(petya,compscience).
studied(vasya,literature).
studied(petya,english).

studied_technical(X) :- studied(X,mathematics).
studied_technical(X) :- studied(X,compscience).
studied_languages(X) :- studied(X,english).
studied_languages(X) :- studied(X,german).
speciality(X,tech_translator) :- studied_languages(X),studied_technical(X).
speciality(X,programmer) :- 
	studied(X,mathematics),studied(X, compscience).
speciality(X,lit_translator) :- studied_languages(X),studied(X,literature).
