# Arquivo: 05-lista-resolucao.R
# Autor(a): Lorena Vilela
# Data: 25/05/2026
# Objetivo: Resolução da Lista de Exercícios 5

# Configurações globais --------------------------------------

options(digits = 5, scipen = 999)

# carrega os pacotes usados
library(tidyverse)


# Exercício 1 ------------------------------------------------
# Campanha de marketing por e-mail

# Parâmetros do modelo:
# n_emails é o número de contatos realizados em cada semana.
# prob_conversao é a taxa histórica usada como estimativa de p.
# n_semanas é o número de semanas simuladas no computador.
n_emails <- 600
prob_conversao <- 0.07
n_semanas <- 5000

# Fixa a semente para reprodutibilidade
set.seed(123)

# Simula o número de conversões em cada semana.
# Cada valor do vetor conversoes representa uma semana simulada.
conversoes <- rbinom(
  n = n_semanas,       # use n_semanas
  size = n_emails,    # use n_emails
  prob = prob_conversao     # use prob_conversao
)

# Mostra os dez primeiros valores simulados.
head(conversoes, 10)

# Média das conversões simuladas.
mean(conversoes)
media_conversoes <- mean (conversoes)
media_conversoes

# desvio-padrão das conversões simuladas
sd(conversoes)
dp_conversoes <- sd(conversoes)
dp_conversoes

# quantis/percentis 5% e 95%: faixa central de aproximadamente 90% das semanas.
faixa_central_conversoes <- quantile(conversoes, c(0.05, 0.95))
faixa_central_conversoes

# Proporção de semanas com baixo desempenho.
# A expressão conversoes < limite retorna TRUE/FALSE; mean() calcula a proporção.
prob_baixo_desempenho <- mean(conversoes < 35)
prob_baixo_desempenho

# Proporção de semanas com desempenho alto.
prob_alto_desempenho <- mean(conversoes >= 55)
prob_alto_desempenho

# Interpretação:
# Escreva aqui se uma semana com menos de 35 conversões parece variação
# plausível do processo ou sinal forte de problema.
# Uma semana com menos de 35 conversões parece relativamente rara na simulação.
# Portanto, esse resultado pode indicar um possível problema na campanha,
# e não apenas uma variação comum do processo.


# Exercício 2 ------------------------------------------------
# Atendimento em hora de pico

# Parâmetros do modelo:
# lambda é o número médio de clientes por hora de pico.
# capacidade é o número de clientes que a unidade consegue atender por hora.
# n_horas é o número de horas de pico simuladas.
lambda <- 12
capacidade <- 22
n_horas <- 10000

# Fixa a semente para que a simulação possa ser reproduzida.
set.seed(456)

# Simula o número de clientes em cada hora de pico.
# Cada valor do vetor clientes representa uma hora simulada.
clientes <- rpois(
  n = n_horas,          # use n_horas
  lambda = lambda      # use lambda
)

# Média e variância simuladas.
# Na distribuição de Poisson, média e variância teóricas são iguais a lambda.
mean(clientes)
var(clientes)


# Proporção de horas em que a demanda excede a capacidade.
prob_saturacao_atual <- mean(clientes > capacidade)
prob_saturacao_atual

# Capacidade que cobre aproximadamente 95% das horas simuladas.
capacidade_95 <- quantile(clientes, 0.95)
capacidade_95

# Observação:
# se o quantil não for inteiro, a capacidade operacional deve ser
# arredondada para cima, pois não é possível atender uma fração de cliente.

# Clientes excedentes médios por hora.
# if_else() calcula o excedente quando há saturação e zero caso contrário.
excedente_medio_atual <- mean(
  if_else(clientes > capacidade, clientes - capacidade, 0)
)

# exibe o resultado
excedente_medio_atual

# Comparação de políticas de capacidade.
capacidades <- c(20, 22, 25)

# Proporção de horas em que cada capacidade fica saturada.
prob_saturacao <- c(
  mean(clientes > 20),
  mean(clientes > 22),
  mean(clientes > 25)
)

# Clientes acima da capacidade, considerando todas as horas simuladas.
excedente_medio <- c(
  mean(if_else(clientes > 20, clientes - 20, 0)),
  mean(if_else(clientes > 22, clientes - 22, 0)),
  mean(if_else(clientes > 25, clientes - 25, 0))
)

# Capacidade ociosa, considerando todas as horas simuladas.
ociosidade_media <- c(
  mean(if_else(clientes < 20, 20 - clientes, 0)),
  mean(if_else(clientes < 22, 22 - clientes, 0)),
  mean(if_else(clientes < 25, 25 - clientes, 0))
)

# Organiza os resultados em uma tabela.
politicas_capacidade <- tibble(
  capacidade = capacidades,
  prob_saturacao = prob_saturacao,
  excedente_medio = excedente_medio,
  ociosidade_media = ociosidade_media
)

# exibe o resultado
politicas_capacidade

# Interpretação:
# Escreva aqui qual capacidade parece mais razoável, considerando saturação
# e ociosidade.
# A capacidade 22 parece um compromisso razoável entre reduzir saturação
# e evitar excesso de ociosidade. A capacidade 20 gera mais saturação,
# enquanto 25 reduz a saturação, mas aumenta bastante a ociosidade.

# Exercício 3 (opcional) ------------------------------------
# Estudo complementar: controle orçamentário

# Resolva esta seção apenas se houver tempo para praticar a distribuição Normal.
#
# Parâmetros do modelo:
# mu é a variação percentual média do custo em relação ao orçamento.
# sigma é o desvio-padrão dessa variação, em pontos percentuais.
# n_periodos é o número de meses simulados.
mu <- _
sigma <- _
n_periodos <- _

# Fixa a semente para que a simulação possa ser reproduzida.
set.seed(789)

# Simula variações percentuais do custo em relação ao orçamento.
# Cada valor do vetor variacao representa um mês simulado.
variacao <- rnorm(
  n = _,       # use n_periodos
  mean = _,    # use mu
  sd = _       # use sigma
)

# Média e desvio-padrão simulados.
mean(variacao)
sd(variacao)


# Proporção de meses com custo mais de 8% acima do orçamento.
prob_acima_8 <- mean(variacao > _)
prob_acima_8

# Proporção de meses com custo abaixo do orçamento.
prob_abaixo_orcamento <- mean(variacao < _)
prob_abaixo_orcamento

# Quantis 5% e 95%: faixa central de aproximadamente 90% dos meses.
faixa_central_variacao <- quantile(variacao, c(_, _))
faixa_central_variacao

# Comparação de limites de alerta.
limites_alerta <- c(_, _, _)

# Proporção de meses em que cada limite seria acionado.
prob_alerta <- c(
  mean(variacao > _),
  mean(variacao > _),
  mean(variacao > _)
)

# Excedente médio acima de cada limite de alerta.
excedente_medio <- c(
  mean(if_else(variacao > _, variacao - _, 0)),
  mean(if_else(variacao > _, variacao - _, 0)),
  mean(if_else(variacao > _, variacao - _, 0))
)

# Organiza os resultados em uma tabela.
politicas_alerta <- tibble(
  limite_alerta = limites_alerta,
  prob_alerta = prob_alerta,
  excedente_medio = excedente_medio
)

# exibe o resultado
politicas_alerta

# Interpretação:
# Escreva aqui qual limite parece mais adequado se a empresa aceita investigar
# aproximadamente 5% a 10% dos meses.

