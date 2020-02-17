# Prevendo a Ocorrência de Câncer

# Definição do Problema de Negócio: Previsão de Ocorrência de Câncer de Mama.
# O conjunto de dados foi pego no link abaixo, dados públicos para a utilização:
# http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29

## Etapa 1 - Coletando os Dados

# Os dados do câncer da mama incluem 569 observações de biópsias de câncer, 
# cada um com 32 características (variáveis). Uma característica é um número de 
# identificação (ID), outro é o diagnóstico de câncer, e 30 são medidas laboratoriais 
# numéricas. O diagnóstico é codificado como "M" para indicar maligno ou "B" para 
# indicar benigno.

View(dados)

dados <- read.csv("dataset.csv", stringsAsFactors = FALSE)
str(dados)
head(dados)
tail(dados)

## Etapa 2 - Pré-Processamento

# Excluindo a coluna ID
# Independentemente do método de aprendizagem de máquina, deve sempre ser excluídas 
# variáveis de ID. Caso contrário, isso pode levar a resultados errados porque o ID 
# pode ser usado para unicamente "prever" cada exemplo. Por conseguinte, um modelo 
# que inclui um identificador pode sofrer de superajuste (overfitting), 
# e será muito difícil usá-lo para generalizar outros dados.

dados$id <- NULL

# Ajustando o label da variável alvo
dados$diagnosis = sapply(dados$diagnosis, function(x){ifelse(x=="M", "Maligno", "Benigno")})

head(dados)

# Muitos classificadores requerem que as variáveis sejam do tipo Fator
table(dados$diagnosis)
dados$diagnosis <- factor(dados$diagnosis, levels = c('Benigno', "Maligno"), labels = c("Benigno", "Maligno"))
str(dados$diagnosis)

# Verificando a proporção
round(prop.table(table(dados$diagnosis))*100, digits = 1)

library(ggplot2)

ggplot(dados, aes(x=diagnosis)) + ggtitle("Cander") + xlab("Tipo de Cancer") +
  geom_bar(aes(y = 100*(..count..)/sum(..count..)), width = 0.5) + ylab("Percentual") + coord_flip() + theme_minimal()

# Medidas de Tendência Central
# Detectamos um problema de escala entre os dados, que então precisam ser normalizados
# O cálculo de distância feito pelo kNN é dependente das medidas de escala nos dados de entrada.

summary(dados)
summary(dados[c("radius_mean", "area_mean", "smoothness_mean")])

# Criando um função de normalização

normalizar <- function(x){
  return ((x - min(x)) / (max(x) - min(x)))
}

# Normalizando os dados
dados_norm <- as.data.frame(lapply(dados[2:31], normalizar))
head(dados_norm)


## Etapa 3: Treinando o modelo com KNN

library(class)
library(caTools)

# Criando dados de treino e dados de teste

dados_treino <- dados_norm[1:469, ]
dados_teste <- dados_norm[470:569, ]

# Criando os labels para os dados de treino e de teste
dados_treino_labels <- dados[1:469, 1]
dados_teste_labels <- dados[470:569, 1]
length(dados_treino_labels)
length(dados_teste_labels)

# Criando o modelo
modelo_knn_v1 <- knn(train = dados_treino, 
                     test = dados_teste,
                     cl = dados_treino_labels, 
                     k = 21)

# A função knn() retorna um objeto do tipo fator com as previsões para cada exemplo no dataset de teste

summary(modelo_knn_v1)


## Etapa 3.1: Avaliando e Interpretando o Modelo


# Carregando o gmodels
library(gmodels)

# Criando uma tabela cruzada dos dados previstos x dados atuais
# Usaremos amostra com 100 observações: length(dados_teste_labels)
CrossTable(x = dados_teste_labels, y = modelo_knn_v1, prop.chisq = FALSE)


## 3.2: Interpretando os resultados do modelo 1 - knn

# A tabela cruzada mostra 4 possíveis valores, que representam os falso/verdadeiro positivo e negativo
# Temos duas colunas listando os labels originais nos dados observados
# Temos duas linhas listando os labels dos dados de teste

# Temos:
# Cenário 1: Célula Benigno (Observado) x Benigno (Previsto) - 61 casos - true positive 
# Cenário 2: Célula Maligno (Observado) x Benigno (Previsto) - 00 casos - false positive (o modelo errou)
# Cenário 3: Célula Benigno (Observado) x Maligno (Previsto) - 02 casos - false negative (o modelo errou)
# Cenário 4: Célula Maligno (Observado) x Maligno (Previsto) - 37 casos - true negative 

# Lendo a Confusion Matrix (Perspectiva de ter ou não a doença):

# True Negative  = nosso modelo previu que a pessoa NÃO tinha a doença e os dados mostraram que realmente a pessoa NÃO tinha a doença
# False Positive = nosso modelo previu que a pessoa tinha a doença e os dados mostraram que NÃO, a pessoa tinha a doença
# False Negative = nosso modelo previu que a pessoa NÃO tinha a doença e os dados mostraram que SIM, a pessoa tinha a doença
# True Positive = nosso modelo previu que a pessoa tinha a doença e os dados mostraram que SIM, a pessoa tinha a doença

# Falso Positivo - Erro Tipo I
# Falso Negativo - Erro Tipo II

# Taxa de acerto do Modelo: 98% (acertou 98 em 100)


## Etapa 3.3: Otimizando a Performance do Modelo1 - Modelo 2 - knn

# Usando a função scale() para padronizar o z-score 


dados_z <- as.data.frame(scale(dados[-1]))

# Confirmando transformação realizada com sucesso
summary(dados$area_mean)

# Criando novos datasets de treino e de teste

dados_treino1 <- dados_z[1:469, ]
dados_teste1 <- dados_z[470:569, ]

dados_treino1_labels <- dados[1:469, 1]
dados_teste1_labels <- dados[470:569, 1]

modelo_knn_v2 <- knn(train = dados_treino1,
                     test = dados_teste1,
                     cl = dados_treino1_labels,
                     k = 21)

# Criando uma tabela cruzada dos dados previstos x dados atuais

CrossTable(x = dados_teste1_labels, modelo_knn_v2, prop.chisq = FALSE)

## 3.4: Interpretando os resultados do modelo 2 - KNN


# Temos:
# Cenário 1: Célula Benigno (Observado) x Benigno (Previsto) - 61 casos - true positive 
# Cenário 2: Célula Maligno (Observado) x Benigno (Previsto) - 00 casos - false positive (o modelo errou)
# Cenário 3: Célula Benigno (Observado) x Maligno (Previsto) - 05 casos - false negative (o modelo errou)
# Cenário 4: Célula Maligno (Observado) x Maligno (Previsto) - 34 casos - true negative 

# Podemos observar que aumentou a quantidade de erros em nosso modelo
# Taxa de acerto do Modelo: 95% (acertou 95 em 100)
# Comparamos apenas o primeiro e o segundo modelo ficaremos por enquanto com o primeiro modelo.

## Etapa 4: Construindo um Modelo com Algoritmo Support Vector Machine (SVM)
  

# Prepara o dataset


dados1 <- read.csv("dataset.csv", stringsAsFactors = FALSE)
dados4$id = NULL
dados1[,'index'] <- ifelse(runif(nrow(dados1)) < 0.8,1,0)
View(dados1)

# Dados de treino e teste
trainset <- dados1[dados1$index==1,]
testset <- dados1[dados1$index==0,]

# Obter o índice 
trainColNum <- grep('index', names(trainset))

# Remover o índice dos datasets
trainset <- trainset[,-trainColNum]
testset <- testset[,-trainColNum]

# Obter índice de coluna da variável target no conjunto de dados
typeColNum <- grep('diag',names(dados1))

# Cria o modelo
# Nós ajustamos o kernel para radial, já que este conjunto de dados não tem um 
# plano linear que pode ser desenhado
library(e1071)
?svm
modelo_svm_v1 <- svm(diagnosis ~ ., 
                     data = trainset, 
                     type = 'C-classification', 
                     kernel = 'radial') 


## Etapa 4.1: Previsões

# Previsões nos dados de treino
pred_train <- predict(modelo_svm_v1, trainset) 

# Percentual de previsões corretas com dataset de treino
mean(pred_train == trainset$diagnosis)  


# Previsões nos dados de teste
pred_test <- predict(modelo_svm_v1, testset) 

# Percentual de previsões corretas com dataset de teste
mean(pred_test == testset$diagnosis)  

# Confusion Matrix
table(pred_test, testset$diagnosis)


## 4.2: Interpretando os resultados do modelo 3 - SVM


# Temos:
# Cenário 1: Célula Benigno (Observado) x Benigno (Previsto) - 80 casos - true positive 
# Cenário 2: Célula Maligno (Observado) x Benigno (Previsto) - 01 casos - false positive (o modelo errou)
# Cenário 3: Célula Benigno (Observado) x Maligno (Previsto) - 00 casos - false negative (o modelo errou)
# Cenário 4: Célula Maligno (Observado) x Maligno (Previsto) - 39 casos - true negative 

# Podemos observar que aumentou a quantidade de erros em nosso modelo
# Taxa de acerto do Modelo: 99,17% 
# Comparamos apenas o primeiro e o segundo modelo ficaremos por enquanto com o primeiro modelo.


## Etapa 5: Construindo o Modelo  4 - Random Forest

# Criando o modelo
library(rpart)
modelo_rf_v1 = rpart(diagnosis ~ ., data = trainset, control = rpart.control(cp = .0005)) 

# Previsões nos dados de teste
tree_pred = predict(modelo_rf_v1, testset, type='class')

# Percentual de previsões corretas com dataset de teste
mean(tree_pred==testset$diagnosis) 

# Confusion Matrix
table(tree_pred, testset$diagnosis)


## 5.2: Interpretando os resultados do modelo 4 - Random Forest


# Temos:
# Cenário 1: Célula Benigno (Observado) x Benigno (Previsto) - 75 casos - true positive 
# Cenário 2: Célula Maligno (Observado) x Benigno (Previsto) - 02 casos - false positive (o modelo errou)
# Cenário 3: Célula Benigno (Observado) x Maligno (Previsto) - 05 casos - false negative (o modelo errou)
# Cenário 4: Célula Maligno (Observado) x Maligno (Previsto) - 38 casos - true negative 

# Podemos observar que aumentou a quantidade de erros em nosso modelo
# Taxa de acerto do Modelo: 94,17% 
# Comparamos apenas o primeiro e o segundo modelo ficaremos por enquanto com o primeiro modelo.

## 6: Conclusão:

# conforme podemos observar realizamos 04 modelos de Classificação de prevenção do tipo de cancer: 
# o KNN com uma acurácia de 98%;
# O segundo modelo tentamos otimizar o primeiro modelo, porém conseguimos um índice de acurácia medor, de 95%;
# O terceiro modelo, modamos para o Algoritmo SVM (Support Vector Machine) e conseguindo um aumento na acurácia, 
# mantendo como o modelo a ser considerado, co uma acurácia de 99,17%;
# o Quarto e último modelo, bem conhecido, porem cum uma acurácia de 94,17%, o Random Forest.
# Apresentaremos como modelo final o modelo 03 - Support Vector Machine para entregar para a aprodução. 

