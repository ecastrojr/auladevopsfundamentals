variable "location" {
  type = string
  default = "eastus"
}

variable "tags" {
  type = map
  default = {
      "Ambiente" = "Desenvolvimento"
      "Integracao" = "Processo Devops"
      "Compania" = "Aula Devops DIO"
      "Area" = "Design"
    }
}