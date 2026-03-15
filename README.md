# 🌐 Network Graph Analysis: Conexões Profissionais com Neo4j

## 📖 Descrição do Projeto
Este repositório contém o desafio prático de Banco de Dados em Grafos da **DIO**. O objetivo foi modelar uma rede de conexões profissional, onde pessoas são interligadas por interesses, tecnologias e instituições de ensino. 

A escolha pelo **Neo4j** se justifica pela complexidade dos relacionamentos. Em um banco SQL, encontrar "quem estuda a mesma tecnologia que eu" exigiria JOINs custosos; em grafos, isso é uma navegação natural entre nós.

---

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** Neo4j (AuraDB / Desktop)
* **Linguagem de Consulta:** Cypher
* **Modelagem:** Arrows.app

---

## 🏗️ Modelo de Dados (Schema)
O grafo foi estruturado com os seguintes componentes:

* **Labels (Nós):** * `Pessoa`: Representa os usuários da rede.
    * `Tecnologia`: Linguagens e ferramentas (Python, Neo4j, AWS).
    * `Curso`: Formação acadêmica (Engenharia de Software).
* **Relacionamentos:**
    * `(:Pessoa)-[:ESTUDA]->(:Curso)`
    * `(:Pessoa)-[:APRENDENDO]->(:Tecnologia)`
    * `(:Pessoa)-[:CONECTADO_COM]->(:Pessoa)`

---

## 🚀 Scripts de Carga e Consultas

### 1. Carga de Dados (Seed)
Utilizei o comando `CREATE` e `MERGE` para garantir a integridade dos dados e evitar duplicatas.
```cypher
// Exemplo de criação de conexão
MATCH (e:Pessoa {nome: "Edirley"}), (m:Pessoa {nome: "Marina"})
MERGE (e)-[:CONECTADO_COM]->(m)
