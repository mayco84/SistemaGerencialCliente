Sistema de Gerenciamento de Clientes
Objetivo
Este sistema permite o gerenciamento completo do cadastro de clientes, incluindo funcionalidades como busca por nome, CPF, e e-mail, além de integração com o serviço de busca de CEP para preencher automaticamente os campos de endereço. Ele também suporta múltiplos bancos de dados, permitindo flexibilidade no armazenamento dos dados.

Estrutura da Base de Dados
Nome da Base de Dados: BaseDeDados
Sistema de Banco de Dados: SQLite
Tabela: Cliente
Criando a Base de Dados e Tabela
Execute o arquivo Script_SQL.sql, que está localizado na pasta README para criar a base de dados e a tabela Cliente.
Estrutura da Tabela Cliente:
Campos Obrigatórios:
TipoPessoa: Identifica se o cliente é pessoa física (F) ou jurídica (J).
FisicaJuridica: Indica se o cliente é físico ou jurídico.
NomeCompleto: Nome completo do cliente.
DataNascimento: Data de nascimento do cliente.
CPF: CPF único do cliente.
RG: Registro Geral (RG) do cliente.
Email: Endereço de e-mail do cliente.
Campos Opcionais:
Telefone, Endereço, Bairro, Cidade, CEP, Número, Complemento, UF.

Funcionalidades da Tela de Pesquisa de Clientes
Filtros de Pesquisa:
Filtro por Código: Permite buscar clientes pelo código único.
Filtro por Nome: Pesquisa clientes pelo nome completo ou parte dele.
Filtro por E-mail: Localiza clientes a partir do endereço de e-mail registrado.
Consulta Detalhada:
Ao clicar duas vezes em um cliente na lista, você será direcionado para uma tela de detalhes onde pode visualizar ou editar as informações do cliente.
Navegação Intuitiva:
Os resultados serão exibidos em um grid organizado. A interface é simples e direta, permitindo fácil navegação entre os resultados.
Como Usar:
Acessando a Tela:
Navegue até o menu Clientes no sistema e selecione a opção Pesquisar Clientes.
Realizando uma Pesquisa:
Escolha o filtro desejado (por Código, Nome ou E-mail).
Digite o termo de busca no campo correspondente.
Clique no botão Pesquisar para realizar a busca.
Trabalhando com os Resultados:
Os resultados serão exibidos no grid de clientes.
Clique em um cliente para selecioná-lo.
Clique duas vezes para abrir a tela de detalhes do cliente (edição ou visualização).
Tela de Cadastro de Clientes
A Tela de Cadastro de Clientes permite inserir, alterar, excluir e visualizar registros de clientes. Ela também inclui uma funcionalidade de busca automática de endereço via CEP.

Campos Importantes:
Campos obrigatórios: Todos os campos destacados em vermelho são obrigatórios e devem ser preenchidos para salvar ou alterar os dados. Estes campos incluem:
Nome Completo
Data de Nascimento
CPF/CNPJ
Telefone
Endereço
Bairro
Cidade
UF
CEP
Número
Busca por CEP:
O sistema pode preencher automaticamente os campos de Endereço, Bairro, Cidade e UF a partir da digitação do CEP.
Após digitar o CEP, clique no botão Pesquisar CEP para preencher automaticamente os dados de endereço.
Botões e Funcionalidades:
Cadastrar:

Habilita os campos para o preenchimento de um novo cliente.
Após preencher os dados, clique em Gravar para salvar.
Alterar:

Permite editar os dados de um cliente já cadastrado.
Clique em Alterar, faça as edições necessárias e clique em Gravar para salvar as mudanças.
Excluir:

Remove o cliente selecionado do sistema.
Esta ação é irreversível, por isso é necessário confirmar a exclusão.
Gravar:

Salva os dados preenchidos no formulário.
Realiza validação nos campos obrigatórios antes de confirmar a ação.
Cancelar:

Desfaz a ação atual (cadastro ou alteração).
Desabilita os campos e impede a edição.
Sair:

Fecha a tela de cadastro e retorna ao menu principal do sistema.
Como Utilizar a Tela de Cadastro de Clientes
Acessando a Tela:

Navegue até o menu Clientes e clique na opção Cadastrar Cliente.
Cadastrando um Novo Cliente:

Clique no botão Novo para habilitar o preenchimento de novos dados.
Preencha todos os campos obrigatórios destacados em vermelho.
Insira o CEP e use o botão Pesquisar CEP para preencher automaticamente os campos de endereço.
Clique em Gravar para salvar o novo cliente.
Editando um Cliente Existente:

Acesse um cliente existente (geralmente através da Tela de Pesquisa).
Clique no botão Alterar para habilitar a edição.
Realize as edições necessárias e clique em Gravar para salvar as mudanças.
Excluindo um Cliente:

Acesse o cliente desejado na tela de cadastro.
Clique no botão Excluir.
Confirme a exclusão na mensagem de aviso.
Cancelando uma Ação:

Caso deseje interromper o cadastro ou edição, clique em Cancelar.
Requisitos do Sistema
Conexão com a Internet: Necessária para acessar o serviço de busca de CEP (ViaCEP).
Conexão com Banco de Dados: É necessário estar conectado ao banco de dados para salvar e carregar os dados dos clientes.
Com esta documentação, você poderá utilizar o Sistema de Gerenciamento de Clientes de forma eficiente, realizando cadastros, buscas e edições de clientes de maneira rápida e intuitiva!

Esse README oferece uma descrição clara das funcionalidades, etapas de uso e campos da tabela de clientes, facilitando o entendimento para qualquer usuário que precise operar o sistema.