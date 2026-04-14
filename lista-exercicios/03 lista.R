# Arquivo: 03-lista.R
# Autor(a): Lorena Vilela da Silv
# Data: 14/04/2026
# Objetivo: Resolução da Lista de Exercícios 3

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)

# Carrega os pacotes necessários
library(here)
library(tidyverse)


# Exercício 1 ------------------------------------------------

## a) Importar arquivo usando here() e read_csv() salvando em
# um objeto chamado dados_receitas
# Defina o caminho relativo do arquido 
caminho_receitas <- here("dados/brutos/receitas_trimestres.csv")

# Importa o arquivo com read.csv
dados_receitas <- read_csv(caminho_receitas)


## b) Exibir a estrutura do projeto com glimpse()
glimpse(dados_receitas)


## c) Comentário:
# A tabela está em formato desorganizado para analise porque os trimestres 
# (T1, T2, T3, T4) são valores de variáveis trimestrais, mas aparecem como 
# nomes de colunas. 


## d
receitas_longo <- dados_receitas |>
  pivot_longer(
    cols = c("T1","T2","T3","T4"),
    names_to = "trimestre",
    values_to = "receita"
  )


## e
View(receitas_longo)



# Exercício 2 ------------------------------------------------


## a
# Defina o caminho relativo do arquido 
caminho_desempenho <- here("dados/brutos/desempenho-empresa.csv")

# Importa o arquivo com read.csv
dados_desempenho <- read_csv(caminho_desempenho)


## b
glimpse(dados_desempenho)


## c Comentário:
# A tabela está em formato desorganizado, os nomes das colunas misturam as
# informações de receita e despesa e também do período de tempo dos trimestres 
# (T1, T2, T3, T4)


## d
desempenho_longo <- dados_desempenho |>
  pivot_longer(
    cols = -empresa,
    names_to = c("indicador", "trimestre"),
    names_sep = "_",
    values_to = "valor"
  )

## e
View(desempenho_longo)


# Exercício 3 ------------------------------------------------


## a


## b


## c


## d


## e


## f


## g


## h


## i