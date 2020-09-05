d(X,X,1) :- !.
d(T,X,0) :- atomic(T).

d(U+V,X,DU+DV) :- d(U,X,DU), d(V,X,DV).
d(U-V,X,DU-DV) :- d(U,X,DU), d(V,X,DV).
d(-T,X,-R) :- d(T,X,R).
d(C*U,X,C*W) :- atomic(C), C\=X, !, d(U,X,W).
d(U*V,X,Vd*U+Ud*V) :- d(U,X,Ud), d(V,X,Vd).
d(U/V,X,(Ud*V-Vd*U)/(V*V)) :- d(U,X,Ud), d(V,X,Vd).
