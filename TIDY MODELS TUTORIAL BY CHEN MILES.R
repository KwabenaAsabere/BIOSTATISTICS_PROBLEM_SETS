linear_reg_glm_spec <-
  linear_reg() %>%
  set_engine('glm')

linear_reg_glm_spec <-
  linear_reg() %>%
  set_engine('glm')

linear_reg_glm_spec <-
  linear_reg() %>%
  set_engine('glm')

linear_reg_keras_spec <-
  linear_reg(penalty = tune()) %>%
  set_engine('keras')

linear_reg_lm_spec <-
  linear_reg() %>%
  set_engine('lm')

