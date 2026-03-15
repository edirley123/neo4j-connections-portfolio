// ==========================================
// 1. CARGA INICIAL: CRIANDO NÓS E RELAÇÕES
// ==========================================

// Criando o perfil principal e conexões iniciais
CREATE (e:Pessoa {nome: "Edirley", cidade: "Minas Gerais"})
CREATE (g:Curso {nome: "Engenharia de Software", instituicao: "Gran Faculdade"})
CREATE (n:Tecnologia {nome: "Neo4j"})
CREATE (p:Tecnologia {nome: "Python"})

// Estabelecendo os relacionamentos de estudo e aprendizado
MERGE (e)-[:ESTUDA]->(g)
MERGE (e)-[:APRENDENDO]->(n)
MERGE (e)-[:DESENVOLVE_COM]->(p)

// ==========================================
// 2. POVOAMENTO DA REDE (OUTROS USUÁRIOS)
// ==========================================

CREATE (c:Pessoa {nome: "Carlos", cidade: "Curitiba"})
CREATE (m:Pessoa {nome: "Marina", cidade: "Belo Horizonte"})
CREATE (a:Pessoa {nome: "Ana", cidade: "Salvador"})
CREATE (f:Tecnologia {nome: "Flask"})
CREATE (aws:Tecnologia {nome: "AWS"})

// Conectando pessoas e tecnologias para simular networking
MATCH (e:Pessoa {nome: "Edirley"}), (m:Pessoa {nome: "Marina"})
MERGE (e)-[:CONECTADO_COM]->(m)

MATCH (c:Pessoa {nome: "Carlos"}), (p:Tecnologia {nome: "Python"})
MERGE (c)-[:DESENVOLVE_COM]->(p)

MATCH (a:Pessoa {nome: "Ana"}), (n:Tecnologia {nome: "Neo4j"})
MERGE (a)-[:APRENDENDO]->(n)

MATCH (e:Pessoa {nome: "Edirley"}), (aws:Tecnologia {nome: "AWS"})
MERGE (e)-[:ESTUDA]->(aws)

// ==========================================
// 3. QUERIES DE CONSULTA (INSIGHTS)
// ==========================================

// Visualizar todo o grafo
MATCH (n) RETURN n;

// Buscar quem na rede estuda Python ou Neo4j
MATCH (p:Pessoa)-[:APRENDENDO|DESENVOLVE_COM]->(t:Tecnologia)
WHERE t.nome IN ["Python", "Neo4j"]
RETURN p.nome AS Nome, t.nome AS Tecnologia;
