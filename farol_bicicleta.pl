 % Problema do Farol de Bicicleta
% Definindo as variáveis e seus valores de probabilidades
% P(Str) - Condição da rua
0.7::str(dry); 0.2::str(wet); 0.1::str(snow_covered).

% P(Flw) - Volante do dínamo desgastado
0.4::flw(true); 0.6::flw(false).

% P(B) - Lâmpada ok
0.8::b(true); 0.2::b(false).

% P(K) - Cabo ok
0.85::k(true); 0.15::k(false).

% P(R|Str,Flw) - Probabilidade do dínamo deslizar
0.4::r(true) :- str(dry), flw(true).
0.2::r(true) :- str(dry), flw(false).
0.8::r(true) :- str(wet), flw(true).
0.5::r(true) :- str(wet), flw(false).
0.8::r(true) :- str(snow_covered), flw(true).
0.7::r(true) :- str(snow_covered), flw(false).
r(false) :- not r(true).

% P(V|R) - Probabilidade do dínamo mostrar tensão
0.96::v(true) :- r(true).
0.3::v(true) :- r(false).
v(false) :- not v(true).

% P(Li|V,B,K) - Probabilidade da luz estar ligada
0.99::li(true) :- v(true), b(true), k(true).
0.01::li(true) :- v(true), b(true), k(false).
0.01::li(true) :- v(true), b(false), k(true).
0.001::li(true) :- v(true), b(false), k(false).
0.3::li(true) :- v(false), b(true), k(true).
0.005::li(true) :- v(false), b(true), k(false).
0.005::li(true) :- v(false), b(false), k(true).
0.0::li(true) :- v(false), b(false), k(false).
li(false) :- not li(true).

% Consulta 1(e): P(Li=true|Str=snow_covered)
evidence(str(snow_covered)).
query(v(true)).
query(v(false)).
