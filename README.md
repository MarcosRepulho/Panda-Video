🧪 Automação de Teste com Robot Framework
Projeto: Validação de Compra no Sauce Demo
Este repositório contém testes automatizados desenvolvidos com Robot Framework , validando os seguintes fluxos no site Sauce Demo :

- Login bem-sucedido
- Adição de produto ao carrinho
- Finalização completa da compra
- O objetivo é demonstrar a capacidade de automação de interface web, além de servir como base para futuras implementações e integrações.



🛠️ Requisitos
Certifique-se de ter instalado:

- pip install robotframework
- pip install robotframework-seleniumlibrary






🧪 Como Executar os Testes
1. Clone o repositório:
- git clone https://github.com/MarcosRepulho/Panda-Video.git
- Entre no Projeto

3. Execute os testes:
- robot tests/compra_completa.robot

4. Visualize os relatórios em:
-results/report.html – Resumo visual do teste
-results/log.html – Detalhes da execução passo a passo






✅ Fluxo Automatizado
1.Login
- Usuário: standard_user
Senha: secret_sauce

2.Adicionar Produto
- Produto adicionado: Sauce Labs Backpack

3.Checkout
- Nome: Joao
- Sobrenome: Silva
- CEP: 12345




- <img width="742" height="272" alt="Salvar para o teste" src="https://github.com/user-attachments/assets/555bae87-f66f-4515-b59d-024e0dfa5991" />




4.Finalização
- Valida se aparece a mensagem: Thank you for your order!
