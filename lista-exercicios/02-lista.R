# Arquivo: 02-lista.R
# Autor(a): Lorena Vilela
# Data: 06/04/2026
# Objetivo:
# 1. Resolver os exercícios da lista 2


# Configurações globais ---------------------------------------------------

# Configura o número de dígitos a serem exibidos
options(digits = 5, scipen = 999)

# carrega os pacotes necessários


# Exercicio 1 -------------------------------------------------------------


## a) # Carregar pacotes here, tidyverse e janitor
library(here)
library(tidyverse)
library(janitor)



## b) # Importar o arquivo dados_marketing.csv da pasta dados/brutos
dados_marketing <- read_csv(here("dados", "brutos", "dados-marketing.csv"))


## c) # Analisar a estrutura do objeto dados_marketing para entender como foram
# registrados
glimpse(dados_marketing)



# Exercicio 2 -------------------------------------------------------------

## a) # Cada linha representa uma semana de observação.


## b)# O número de observações corresponde ao número de semanas registradas.

# O número de variáveis corresponde às colunas: 9 colunas de variáveis
# Data, Mês, Gasto TV, Gasto Rádio, Gasto Redes Sociais,
# Gasto Email, Promoção, Atividade Concorrente, Receita Vendas


# Exercicio 3 -------------------------------------------------------------

## a) # Padronizar nomes das colunas e criar novo objeto dados_marketing_limpos
dados_marketing_limpos <- dados_marketing %>%
  clean_names()


## b) # Verificar os novos nomes das colunas e variáveis
names(dados_marketing_limpos)



# Exercicio 4 -------------------------------------------------------------
# Criar um pipeline que mostre apenas as seguintes variáveis: 
# Data, mês, gasto_tv, gasto_radio, promoção e receita_vendas
dados_marketing_limpos %>%
  select(data, mes, gasto_tv, gasto_radio, promocao, receita_vendas)



# Exercicio 5 -------------------------------------------------------------
# Crie uma nova variável chamada gasto_total, irá corresponder á soma dos gastos
# com gast_tv, gasto_radio, gasto_redes_sociais, gasto_email
dados_marketing_limpos <- dados_marketing_limpos %>%
  mutate(
    gasto_total = gasto_tv + gasto_radio + gasto_redes_sociais + gasto_email
  )

# Exibir colunas específicas (data, mês, gasto_total e receita_vendas)
dados_marketing_limpos %>%
  select(data, mes, gasto_total, receita_vendas)

# Visualizar o objeto com a nova variável criada
View(dados_marketing_limpos)



# Exercicio 6 -------------------------------------------------------------
# Criar as seguintes novas variáveis no objeto dados_marketing_limpos 
# status_promocao, com os valores "Com promoção" e "Sem promoção"
# Status_concorrencia, com os valores "Com concorrência" e "Sem concorrência"
# Manter variáveis originais promocao e atividade_concorrente
dados_marketing_limpos <- dados_marketing_limpos %>%
  mutate(
    status_promocao = ifelse(promocao == 1, "Com promoção", "Sem promoção"),
    status_concorrencia = ifelse(atividade_concorrente == 1,
                                 "Com concorrência",
                                 "Sem concorrência")
  )

#Para visualizar a base de dados e verificar se as novas variáveis foram criadas
# corretamente
View(dados_marketing_limpos)



# Exercicio 7 -------------------------------------------------------------
# Salvar o objeto dados_marketing_limpos na pasta dados/limpos 
write_rds(dados_marketing_limpos,
          here("dados", "limpos", "dados_marketing_limpos.rds"))


# Exercicio 8 -------------------------------------------------------------





# Exercicio 9 -------------------------------------------------------------