# Arquivo: 04-lista-resolucao.R
# Autor(a): Lorena Vilela
# Data: 12/m05/2026
# Objetivo: Resolução da Lista de Exercícios 4

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)


# Exercício 2 ------------------------------------------------

# a)
# total de conjuntos diferentes de 20 números sorteados entre 100
total_resultados <- choose(100, 20)
total_resultados


# b)
# resultados favoráveis: os 20 números sorteados precisam estar
# dentro dos 50 números escolhidos na aposta
resultados_favoraveis <- choose(50, 20)
resultados_favoraveis


# c)
# probabilidade de acertar os 20 números
prob_acertar_20 <- choose(50, 20) / choose(100, 20)
prob_acertar_20

# forma alternativa de interpretação: uma chance em quantas apostas?
uma_chance_em <- 1 / choose(50, 20) / choose(100, 20)
uma_chance_em


# d)
# Escreva sua interpretação como comentário.

# Essa probabilidade é extremamente baixa. Isso significa que acertar os 
# 20 números da Lotomania é muito difícil, pois existem bilhões de combinações 
# possíveis e apenas uma pequena parte delas está contida na aposta feita pelo
# jogador.


# Exercício 3 ------------------------------------------------

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <- 2 / 6
prob_teorica

# resultados possíveis do dado
dado <- 1:6

# número de lançamentos
n <- 100

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <- mean(evento_A)
freq_relativa

# Depois de completar para n = 100, altere n para 1000 e 10000.

# -------------------------------
# Simulação com n = 1000
# -------------------------------

n <- 1000

lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE
)

evento_A <- lancamentos >= 5

favoraveis <- sum(evento_A)
favoraveis

freq_relativa <- mean(evento_A)
freq_relativa


# -------------------------------
# Simulação com n = 10000
# -------------------------------

n <- 10000

lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE
)

evento_A <- lancamentos >= 5

favoraveis <- sum(evento_A)
favoraveis

freq_relativa <- mean(evento_A)
freq_relativa


# Exercício 5 ------------------------------------------------


# Cálculo do valor esperado com R

# parâmetros do modelo
prob_incendio <- 0.01
indenizacao <- 150000
carregamento <- 0.25

# valor esperado de indenização por residência
valor_esperado <- prob_incendio * indenizacao

# exibe o resultado
valor_esperado

# prêmio anual por residência com acréscimo
premio <- valor_esperado * (1 + carregamento)

# exibe o resultado
premio


# a) O valor esperado representa o custo médio esperado de indenizações por 
# residência segurada no longo prazo. Isso significa que, considerando muitas
# residências semelhantes, a seguradora espera gastar em média R$ 1.500 por 
# residência com indenizações.


# b) Porque o valor esperado é uma média probabilística. A maioria das 
# residências não terá incêndio e gerará indenização igual a R$ 0;poucas 
# residências terão incêndio e receberão R$ 150.000.Assim, o valor de R$ 1.500 
# não é o pagamento real de cada residência, mas sim uma média obtida ao 
# considerar muitas apólices.


# c) O carregamento de 25% é uma simplificação porque considera apenas um 
# acréscimo fixo sobre o valor esperado. Uma seguradora real precisaria 
# considerar vários outros fatores, como: despesas administrativas; corretagem;
# impostos; margem de lucro; inflação; risco de eventos extremos; variações regionais;
# perfil dos segurados; necessidade de reservas financeiras.
# Na prática, o cálculo atuarial é bem mais complexo do que aplicar apenas uma 
# porcentagem fixa.



# Exercício 6 ------------------------------------------------

# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 100

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0, indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- premio * n
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- total_premios - total_indenizacoes
resultado_carteira

# Depois de completar para n = 100, altere n para 10000 e 100000.

# a) 
n <- 10000

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0, indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- premio * n
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- total_premios - total_indenizacoes
resultado_carteira



n <- 100000


# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0, indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- premio * n
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- total_premios - total_indenizacoes
resultado_carteira

# Conforme n aumenta, a média das indenizações fica mais estável e varia menos 
# entre as simulações.

# b) Ela tende a se aproximar do valor esperado teórico da indenização:
# E(X) =0,01 × 150000 = 1500


# c) Porque, com um número maior de segurados, os efeitos do acaso individual se
#compensam. Assim, a média observada tende a ficar mais próxima do valor esperado,
# conforme a Lei dos Grandes Números.


# d) Porque ainda podem ocorrer muitos sinistros ao mesmo tempo ou eventos 
# extremos inesperados. Mesmo com uma carteira grande, existe incerteza e 
# possibilidade de perdas elevadas. Por isso, seguradoras precisam manter 
# reservas financeiras e mecanismos de proteção, como resseguro.






