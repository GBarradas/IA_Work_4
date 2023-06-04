%condições: ao_lado(casa,casa)
%Fluentes:na_mao(O), na_casa(casa,Bloco), braco_na_casa(C), casa_vazia(C),
%   mao_vazia()
%Ações: agarrar(O):-
%       Pre-Cond: mao_vazia(), na_casa(C,O). braço_na_casa(C)
%       AddL: na_mao(O),casa_vazia(C)
%       DelL: mao_vazia(), na_casa(C,O)
%       largar(O):-
%       Pre-Cond: na_mao(O), braço_na_casa(C), casa_vazia(C)
%       AddL: mao_vazia(), na_casa(C,O)
%       DelL: na_mao(O), casa_vazia(C)
%       mover_dir(C, C1):-
%       Pre-cond: ao_lado(C,C1), C1 is C+1, braço_na_casa(C)
%       AddL: braço_na_casa(C1)
%       DelL: braço_na_casa(C)

estado_inicial(
    [
        ao_lado(parede,0), ao_lado(0,1), ao_lado(1,2), ao_lado(2,3), ao_lado(3,parede),
        ao_lado(parede,3), ao_lado(3,2), ao_lado(2,1), ao_lado(1,0), ao_lado(0,parede),
        na_casa(0,a), na_casa(1,b), na_casa(2,c), braco_na_casa(0), casa_vazia(3),
        mao_vazia(m)
    ]).

estado_final(
    [
        ao_lado(parede,0), ao_lado(0,1), ao_lado(1,2), ao_lado(2,3), ao_lado(3,parede),
        ao_lado(parede,3), ao_lado(3,2), ao_lado(2,1), ao_lado(1,0), ao_lado(0,parede),
        na_casa(1,c), na_casa(2,a), na_casa(3,b), braco_na_casa(0), casa_vazia(0),
        mao_vazia(m)
    ]).

accao(agarrar(O), [na_casa(C,O), braco_na_casa(C), mao_vazia(m)],
        [na_mao(O),casa_vazia(C)], [mao_vazia(m), na_casa(C,O)]):-
            member(C,[0,1,2,3]), member(O,[a,b,c]).

accao(largar(O), [na_mao(O), braco_na_casa(C), casa_vazia(C)],
        [mao_vazia(m), na_casa(C,O)],[na_mao(O),casa_vazia(C)]):-
            member(C,[0,1,2,3]), member(O,[a,b,c,d]).

accao(mover(C,C1), [ao_lado(C,C1),braco_na_casa(C)],[braco_na_casa(C1)],
        [braco_na_casa(C)]):-
            member(C,[0,1,2,3]), member(C1,[0,1,2,3]).