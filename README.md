

# Consolidação de Dados de Clientes (Python + Excel Power Query)

## 📌 Visão Geral do Projeto

Este projeto demonstra duas abordagens para consolidação automatizada de múltiplas bases de clientes:

* 🐍 Solução em Python (Pandas)
* 📊 Solução em Excel utilizando Power Query

O desafio consistia em unificar diversos ficheiros de vendas contendo clientes repetidos, garantindo:

* Ausência de duplicação no ficheiro final
* Consolidação com base em identificador único (NIF)
* Preservação de informações complementares distribuídas entre os ficheiros
* Estrutura escalável para inclusão de novos arquivos

---

## 🧩 Problema

As bases apresentavam:

* Clientes repetidos entre ficheiros
* Mesmo NIF com informações distribuídas
* Estruturas de colunas diferentes (Email, Morada, Telefone, Vendas por mês, Gestor de Conta, etc.)
* Necessidade de manter todos os dados válidos sem duplicação

O objetivo foi:

1. Unificar todos os ficheiros
2. Consolidar os registos por NIF
3. Manter apenas uma linha por cliente
4. Preservar todas as informações não nulas
5. Permitir atualização automática quando novos ficheiros forem adicionados

---

# 🐍 Solução em Python

## Tecnologias utilizadas

* Python
* Pandas

## Estratégia aplicada

* Utilização de `pd.concat()` para empilhar as tabelas
* Agrupamento com `groupby("NIF")`
* Agregação personalizada para manter o primeiro valor não nulo por coluna
* Consolidação dinâmica sem dependência fixa de colunas

## Principais características

✔ Código escalável
✔ Fácil adaptação para pipelines automatizados
✔ Tratamento eficiente de valores nulos
✔ Estrutura reutilizável para novos projetos

---

# 📊 Solução em Excel – Power Query

## Tecnologias utilizadas

* Microsoft Excel
* Power Query (linguagem M)

## Estratégia aplicada

* Leitura dinâmica de todos os ficheiros de uma pasta
* Combinação automática das tabelas
* Agrupamento por NIF utilizando `Table.Group()`
* Consolidação com `List.First(List.RemoveNulls())`
* Atualização automática com “Atualizar Tudo”

## Principais características

✔ Não requer programação avançada
✔ Atualização automática
✔ Escalável com inclusão de novos ficheiros
✔ Estrutura adequada para utilizadores de negócio

---

# 📂 Estrutura do Projeto

```
/Ficheiros .xlsx
   Sales_January.xlsx
   Sales_February.xlsx
   Sales_March.xlsx
   Resolução com PowerQuery.xlsx

Consolidação_de_Dados_de_Clientes.ipynb
Consolidação Dados com Linguagem M.m
```

---

# 🎯 Resultado

Geração de uma base única e consolidada de clientes:

* Uma linha por NIF
* Informações complementares preservadas
* Estrutura limpa e pronta para análise ou relatórios
* Eliminação de consolidação manual


