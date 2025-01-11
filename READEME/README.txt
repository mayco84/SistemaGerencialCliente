Sistema de Gerenciamento de Clientes
Objetivo
Este sistema permite o gerenciamento completo do cadastro de clientes, incluindo funcionalidades como busca por nome, CPF, e e-mail, além de integração com o serviço de busca de CEP para preencher automaticamente os campos de endereço. Ele também suporta múltiplos bancos de dados, permitindo flexibilidade no armazenamento dos dados.

Estrutura da Base de Dados
Nome da Base de Dados: BaseDeDados
Sistema de Banco de Dados: SQLite

Tabelas Principais
Cliente: Gerencia informações de clientes.

Campos Obrigatórios:
TipoPessoa, NomeCompleto, DataNascimento, CPF, RG, Email
Campos Opcionais:
Telefone, Endereço, Bairro, Cidade, CEP, Número, Complemento, UF
Pedido: Armazena pedidos realizados pelos clientes.

Campos:
id, DataPedido, IdCliente (referenciando a tabela Cliente), Total.
PedidoItens: Detalha os itens de cada pedido.

Campos:
id, idPedido (referenciando a tabela Pedido), Quantidade, idUnidadeMedida (referenciando a tabela UnidadeMedida), Valor, Total, idProduto (referenciando a tabela Produtos).
Produtos: Registra os produtos disponíveis.

Campos:
id, idUnidadeMedida (referenciando a tabela UnidadeMedida), DataCadastro, DescricaoProduto, Valor.
UnidadeMedida: Define unidades de medida para produtos e pedidos.

Campos:
id, DescricaoUnidadeMedida, SiglaUnidadeMedida, DataCadastro.
Funcionalidades do Sistema
Tela de Pesquisa de Clientes
Filtros de Pesquisa: Código, Nome, e E-mail.
Consulta Detalhada: Exibe informações completas do cliente ao clicar duas vezes em um registro.
Navegação Intuitiva: Exibição de resultados em um grid organizado.
Tela de Cadastro de Clientes
Cadastro Completo: Inclusão, alteração, exclusão e visualização de clientes.
Validação Automática: Campos obrigatórios destacados em vermelho.
Busca por CEP: Preenchimento automático dos campos de endereço.
Tela de Pedidos
Inserção de Pedidos: Criação de pedidos vinculados a um cliente.
Gerenciamento de Itens: Adicionar, editar ou remover itens do pedido, especificando produto, quantidade, unidade de medida e valores.
Cálculo Automático: Atualização do total do pedido com base nos itens.
Consulta de Pedidos: Busca de pedidos por cliente, data ou valor total.
Edição e Exclusão: Alterar ou excluir pedidos existentes.
Tela de Produtos
Cadastro de Produtos: Adicionar novos produtos com descrição, unidade de medida e valor.
Consulta de Produtos: Listagem e busca por descrição ou unidade de medida.
Edição e Exclusão: Atualizar ou remover produtos cadastrados.
Tela de Unidades de Medida
Cadastro de Unidades: Inserção de novas unidades com descrição e sigla.
Gerenciamento: Exibição, edição ou exclusão de unidades cadastradas.
Requisitos do Sistema
Conexão com a Internet: Necessária para acessar o serviço de busca de CEP (ViaCEP).
Conexão com Banco de Dados: É obrigatório para operações de CRUD no sistema.