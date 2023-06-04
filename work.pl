estado_inicial([
    robo_na_posicao(0),
    bloco_na_posicao(a, 0),
    bloco_na_posicao(b, 1),
    bloco_na_posicao(c, 2),
    posicao_livre(3),
    braco_livre
    ]).
estado_final([
    robo_na_posicao(0),
    bloco_na_posicao(c, 0),
    bloco_na_posicao(a, 1),
    bloco_na_posicao(b, 2),
    posicao_livre(3),
    braco_livre
    ]).

accao(mover_direita(C, C1),
    [robo_na_posicao(C)],
    [robo_na_posicao(C1)],
    [robo_na_posicao(C)]):-member(C, [0,1,2,3]),  C1 is C + 1,
    
    member(C1, [0,1,2,3]).

accao(mover_esquerda(C1, C),
    [robo_na_posicao(C)],
    [robo_na_posicao(C1)],
    [robo_na_posicao(C)]):- member(C, [0,1,2,3]), C1 is C - 1,
    
    member(C1, [0,1,2,3]).

accao(agarrar_bloco(B),
    [bloco_na_posicao(B, C), robo_na_posicao(C), braco_livre],
    [bloco_na_mao(B),posicao_livre(B)],
    [bloco_na_posicao(B, C), braco_livre]):- member(B, [a, b, c]).

accao(largar_bloco(B),
    [bloco_na_mao(B),robo_na_posicao(C)],
    [bloco_na_posicao(B, C), braco_livre],
    [bloco_na_mao(B), posicao_livre(C)]):- member(B, [a, b, c]).