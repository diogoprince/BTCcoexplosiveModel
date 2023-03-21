#########################################
### Aqui é o BVAR sem coeficientes time-varying e com 1 vetor de cointegracao para compararmos o modelo final que é com TVP 


###########################
###
###   BVAR com coeficientes fixos e 1 vetor de cointegracao para comparacao
###   constante restrita pq modelo escolhido de referencia é com constante restrita
###
###########################

install.packages("bvartools")
install.packages("readxl")
install.packages("openxlsx")

library(bvartools)
#set.seed(123456) # Set seed for reproducibility

# Get data
library(readxl)
library("openxlsx")

#faz diferenca os dois comandos abaixo?
#library(rstanarm)
#options(mc.cores = parallel::detectCores())

y_d <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my_d)

EthereumGold <- read_excel("EthereumGold.xlsx", sheet = "ethereumgold")

data<-ts(EthereumGold[2:3],start=2012,frequency=7)

###Comparando se tem cointegracao com constante irrestrita e parametros fixos
# Create model
model <- gen_vec(data, p = 2, r = 1,
                 const = "restricted", seasonal = NULL,
                 iterations = 36000, burnin = 1000,tvp=FALSE,sv=TRUE)

# Add priors
#model <- add_priors(model)
modela<-add_priors(model,
                   coef = list(v_i = 1, v_i_det = 0.1, shape = 3, rate = 1e-04, rate_det = 0.01),
                   coint = list(v_i = 0, p_tau_i = 1, shape = 3, rate = 1e-04, rho = 0.999),
                   sigma = list(df = "k", scale = 1, mu = 0, v_i = 0.01, sigma_h = 0.05,shape=3,rate=0.0001,rate_det=0.01))

# Obtain posterior draws
object <- draw_posterior(modela)

#resumo dos resultados
summary(object)


###########################
###
###   BVAR com coeficientes variantes no tempo e 1 vetor de cointegracao
###   constante restrita pq modelo escolhido de referencia é com constante restrita
###   MODELO BENCHMARK -> escolhido por criterio de informacao
###
###########################


# Create model
model <- gen_vec(data, p = 2, r = 1,
                 const = "restricted", seasonal = NULL,
                 iterations = 36000, burnin = 1000,tvp=TRUE,sv=TRUE)
##acima esta correto, mas como é muito lento, vou particionar (se particiono, não consigo estimar funcao de resposta ao impulso <- )
#model <- gen_vec(data, p = 2, r = 1,
#                 const = "restricted", seasonal = NULL,
#                 iterations = 10000, burnin = 1000,tvp=TRUE,sv=TRUE)


# Add priors
#model <- add_priors(model)
modela<-add_priors(model,
                   coef = list(v_i = 1, v_i_det = 0.1, shape = 3, rate = 1e-04, rate_det = 0.01),
                   coint = list(v_i = 0, p_tau_i = 1, shape = 3, rate = 1e-04, rho = 0.999),
                   sigma = list(df = "k", scale = 1, mu = 0, v_i = 0.01, sigma_h = 0.05,shape=3,rate=0.0001,rate_det=0.01))

# Obtain posterior draws
object <- draw_posterior(modela)

#resumo dos resultados
summary(object)