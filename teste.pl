estado_inicial([fechada(0), porCima(0,1), porCima(1,2), porCima(2,3),
maoLivre(robo), fechado(1),fechado(2),fechado(3), estaGav(a,1), estaGav(b,2),estaGav(c,3)]).
estado_final([maoLivre(robo), fechado(1),fechado(2),fechado(3), estaGav(a,1),
estaGav(b,2),estaGav(c,2)]).
estado_final2([maoLivre(robo), fechado(1),fechado(2),fechado(3), estaGav(a,2),
estaGav(b,3),estaGav(c,2)]).
%acao(Nome,Precondições, ADDList, DELList)
accao(abre(G), [fechada(G),maoLivre(robo)],[aberta(G)],[fechada(G)]):- member(G,[1,2,3]).
accao(fecha(G),[aberta(G)],[fechada(G)],[aberta(G)]):- member(G,[1,2,3]).
accao(agarra(O,G), [porCima(G0,G), fechada(G0), maoLivre(robo), aberta(G),
estaGav(O,G)],[na-mao(O)],[maoLivre(robo), estaGav(O,G)]):- member(G,[1,2,3]),
member(O,[a,b,c]).
accao(larga(O,G), [porCima(G0,G), fechada(G0), aberta(G), na-mao(O)],
[estaGav(O,G),maoLivre(robo)], [na-mao(O)]):- member(G,[1,2,3]), member(O,[a,b,c]).