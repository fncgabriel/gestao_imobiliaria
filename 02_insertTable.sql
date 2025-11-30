----CLIENTES----
INSERT INTO Cliente (nome, telefone, email, tipo_cliente) VALUES
 ('João Santos', '51900001111', 'joao.santos@email.com', 'proprietario'),
 ('Maria Alves', '51900002222', 'maria.alves@email.com', 'comprador'),
 ('Pedro Oliveira', '51900003333', 'pedro.oliveira@email.com', 'locatario'),
 ('Carla Pereira', '51900004444', 'carla.pereira@email.com', 'interessado'),
 ('Thiago Ramos', '51900009999', 'thiago.ramos@email.com', 'comprador'),
 ('Laura Martins', '51900008888', 'laura.martins@email.com', 'interessado'),
 ('Rafael Nunes', '51900007777', 'rafael.nunes@email.com', 'proprietario'),
 ('Beatriz Silveira', '51900006666', 'bia.silveira@email.com', 'locatario'),
 ('Otávio Barros', '51900005544', 'otavio.barros@email.com', 'comprador'),
 ('Julia Krüger', '51900003322', 'julia.kruger@email.com', 'interessado');
 
SELECT * FROM Cliente;

----CORRETORES----
INSERT INTO Corretor (nome, creci, telefone, email) VALUES
 ('Ana Costa', 'CRECI-12345', '51910001111', 'ana.costa@imobiliaria.com'),
 ('Bruno Lima', 'CRECI-54321', '51910002222', 'bruno.lima@imobiliaria.com');
 
INSERT INTO Corretor (nome, creci, telefone, email) VALUES
 ('Marcos Teles', 'CRECI-77889', '51910005555', 'marcos.teles@imobiliaria.com'),
 ('Patrícia Gomes', 'CRECI-88990', '51910006666', 'patricia.gomes@imobiliaria.com');


SELECT * FROM Corretor;

----IMÓVEIS----
INSERT INTO Imovel (endereco, bairro, cidade, tipo_imovel, area_m2, quartos, valor, status, id_proprietario) VALUES
 ('Rua das Flores, 123', 'Centro', 'Montenegro', 'apartamento', 85.0, 2, 250000.00, 'disponivel', 1),
 ('Av. Brasil, 456', 'Bela Vista', 'Montenegro', 'casa', 120.0, 3, 380000.00, 'disponivel', 1),
 ('Rua das Orquídeas, 78', 'São José', 'Montenegro', 'terreno', 450.0, 0, 150000.00, 'disponivel', 2);
 
INSERT INTO Imovel (endereco, bairro, cidade, tipo_imovel, area_m2, quartos, valor, status, id_proprietario) VALUES
 ('Rua das Acácias, 512', 'Progresso', 'Montenegro', 'casa', 140.0, 3, 410000.00, 'disponivel', 1),
 ('Alameda Verde, 78', 'Timbaúva', 'Montenegro', 'apartamento', 72.5, 2, 210000.00, 'disponivel', 11),
 ('Av. Independência, 900', 'Centro', 'Montenegro', 'sala comercial', 45.0, 0, 190000.00, 'disponivel', 1);

SELECT id_cliente, nome, tipo_cliente FROM Cliente;

SELECT * FROM Imovel;

----CONTRATOS----
INSERT INTO Contrato (id_imovel, id_cliente_final, id_corretor, tipo_contrato, valor_total, data_contrato) VALUES
 (1, 2, 1, 'venda', 250000.00, '2025-05-10'),
 (3, 3, 2, 'locacao', 1200.00, '2025-06-01');
 
INSERT INTO Contrato (id_imovel, id_cliente_final, id_corretor, tipo_contrato, valor_total, data_contrato) VALUES
 (1, 2, 1, 'venda', 250000.00, '2025-08-01'),
 (3, 3, 2, 'locacao', 1300.00, '2025-08-05');

SELECT * FROM Contrato;


----VISITAS----
INSERT INTO Visita (id_cliente, id_imovel, id_corretor, data_visita) VALUES
 (2, 1, 1, '2025-04-20 10:00:00'),
 (4, 1, 1, '2025-04-21 14:30:00'),
 (3, 3, 2, '2025-05-28 16:00:00'),
 (2, 2, 1, '2025-05-05 09:30:00');
 
INSERT INTO Visita (id_cliente, id_imovel, id_corretor, data_visita) VALUES
 (1, 1, 1, '2025-07-15 10:00:00'),
 (2, 2, 2, '2025-07-16 14:00:00'),
 (3, 3, 3, '2025-07-17 09:30:00'),
 (4, 1, 1, '2025-07-18 11:00:00');

SELECT * FROM Visita;

----PAGAMENTOS----
INSERT INTO Pagamento (id_contrato, valor_pagamento, forma_pagamento) VALUES
 (1, 125000.00, 'PIX'),
 (1, 125000.00, 'transferencia'),
 (2, 1200.00, 'boleto');
 
INSERT INTO Pagamento (id_contrato, valor_pagamento, forma_pagamento) VALUES
 (1, 125000.00, 'PIX'),
 (1, 125000.00, 'transferencia'),
 (2, 1300.00, 'boleto');

SELECT * FROM Pagamento;




