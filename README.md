<h1 align="center">🏡 Gestão Imobiliária — Banco de Dados SQL</h1>

<p align="center">
Projeto desenvolvido para a disciplina de <strong>Modelagem e Banco de Dados</strong>, incluindo DER, normalização, criação do modelo lógico e implementação completa em SQL.
</p>

---

## 📘 Descrição do Projeto (Minimundo)

Uma imobiliária necessita registrar seus **clientes**, **corretores**, **imóveis**, **visitas**, **contratos** e **pagamentos**.  
O sistema foi modelado para permitir:

- Cadastro e classificação de clientes (proprietário, comprador, locatatório, interessado)
- Registro de corretores e suas credenciais
- Controle de imóveis disponíveis e seus proprietários
- Agendamento e histórico de visitas
- Registro de contratos de venda ou locação
- Controle detalhado de pagamentos de contratos

Todo o modelo foi revisado e normalizado até a **3ª Forma Normal (3FN)**.

---

## 🗄️ Modelo Lógico — DER

<img width="750" alt="der" src="https://github.com/user-attachments/assets/4595f772-22b5-4212-9133-9174d24528ff" />

✔ Entidades definidas  
✔ Chaves primárias e estrangeiras destacadas  
✔ Cardinalidades aplicadas (1:N, N:1)  
✔ Modelo revisado em 1FN, 2FN e 3FN  

---

## 🧱 Estrutura do Banco de Dados

O projeto contém as seguintes tabelas principais:

- **Cliente**
- **Corretor**
- **Imovel**
- **Visita**
- **Contrato**
- **Pagamento**

### 🔗 Relacionamentos

- **Cliente 1:N Imóvel** (proprietário)
- **Cliente 1:N Visita**
- **Imóvel 1:N Visita**
- **Corretor 1:N Visita**
- **Cliente 1:N Contrato** (cliente final)
- **Corretor 1:N Contrato**
- **Imóvel 1:N Contrato**
- **Contrato 1:N Pagamento**

---

## 📁 Estrutura do Repositório

| Arquivo | Descrição |
|--------|-----------|
| **01_create_table.sql** | Criação das tabelas (DDL) com PK, FK e integridade referencial |
| **02_insert_data.sql** | Inserção de dados nas tabelas principais (INSERT) |
| **03_select_queries.sql** | Consultas SELECT (JOIN, WHERE, ORDER BY, LIMIT etc.) |
| **04_update_delete.sql** | Comandos UPDATE e DELETE com regras de integridade |
| **README.md** | Documentação completa do projeto |

---

## 💾 Como Executar o Projeto

### 1️⃣ Abrir ou criar o banco no SQLiteStudio

1. Abra o SQLiteStudio  
2. Vá em **Banco de Dados → Adicionar Banco de Dados**  
3. Escolha ou crie um arquivo `.sqlite`  

---

### 2️⃣ Executar os scripts na ordem correta

Execute no editor SQL:

1. `01_create_table.sql`  
2. `02_insert_data.sql`  
3. `03_select_queries.sql`  
4. `04_update_delete.sql`  

---

### 3️⃣ Verificar se os dados foram inseridos

```sql
SELECT * FROM Cliente;
SELECT * FROM Imovel;
SELECT * FROM Contrato
```
🔍 Exemplos de Consultas SQL (SELECT)

▶ 1. Listar clientes proprietários
```sql
Copiar código
SELECT nome, tipo_cliente
FROM Cliente
WHERE tipo_cliente = 'proprietario';
```
▶ 2. Imóveis ordenados por valor
```sql
Copiar código
SELECT endereco, cidade, valor
FROM Imovel
ORDER BY valor DESC
LIMIT 5;
```
▶ 3. Histórico completo de visitas (JOIN)
```sql
Copiar código
SELECT 
    v.data_visita,
    c.nome AS cliente,
    i.endereco AS imovel,
    co.nome AS corretor
FROM Visita v
JOIN Cliente c  ON c.id_cliente = v.id_cliente
JOIN Imovel i   ON i.id_imovel = v.id_imovel
JOIN Corretor co ON co.id_corretor = v.id_corretor
ORDER BY v.data_visita DESC;
```
✏️ Exemplos de UPDATE e DELETE
▶ UPDATE — alterar status de um imóvel
```sql
Copiar código
UPDATE Imovel
SET status = 'vendido'
WHERE id_imovel = 1;
```
▶ UPDATE — corrigir telefone de cliente
```sql
Copiar código
UPDATE Cliente
SET telefone = '51999999999'
WHERE id_cliente = 3;
```
▶ DELETE — remover visita específica
```sql
Copiar código
DELETE FROM Visita
WHERE id_visita = 4;
```
<h2><strong>🛠️ Tecnologias Utilizadas</strong></h2>

- **SQLite 3**
- **SQLiteStudio 3.4.17**
- **SQL (DDL e DML)**
- **Git & GitHub**

---

<h2><strong>👤 Autor</strong></h2>

**Gabriel Teixeira**  
Disciplina: *Modelagem de Banco de Dados*  
Universidade Cruzeiro do Sul
