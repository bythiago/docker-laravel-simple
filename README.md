## Leia-me - Laravel Docker

Este projeto configura um ambiente de desenvolvimento Laravel usando Docker Compose.

**Serviços:**

* **laravel** (nome do container: `test_docker`)
  * **Build:** `.` (Instrui o Docker Compose a construir a imagem do container usando o Dockerfile no diretório atual do projeto.)
  * **Volumes:**
    * `./storage:/app/storage` (Monta o diretório `storage` do projeto local no diretório `/app/storage` dentro do container. Isso garante persistência dos dados de armazenamento do Laravel.)
  * **Redes:**
    * `my_network` (Conecta o container Laravel à rede `my_network`)

**Redes:**

* **my_network**
  * **Externo:** `true` (Indica que esta rede é uma rede externa existente em seu host Docker. Certifique-se de ter uma rede chamada `my_network` criada antes de executar `docker-compose up`.)
  * **Nome:** `my_network` (Define o nome explícito da rede para clareza)

**Começando**

1. **Pré-requisitos:**
   * Docker e Docker Compose instalados em seu sistema. ([https://docs.docker.com/get-started/](https://docs.docker.com/get-started/))
   * Uma rede externa existente chamada `my_network` em seu host Docker. Você pode criar uma usando `docker network create my_network`.
   * Um projeto Laravel existente no diretório atual.

2. **Configuração:**
   * **(.env)**  Certifique-se de ter um arquivo `.env` configurado com as variáveis de ambiente necessárias do seu projeto Laravel. 
   * **(Configuração adicional)**  Você pode precisar ajustar outras configurações no seu `docker-compose.yml` ou no seu projeto Laravel para atender às suas necessidades específicas. Consulte a documentação do Docker Compose e do Laravel para obter mais informações.

3. **Executar o aplicativo:**
   * Abra um terminal no diretório do projeto e execute `docker-compose up -d`. Isso construirá a imagem do container Laravel (se necessário), criará os serviços e a rede (se ainda não existirem) e os iniciará em modo separado (plano de fundo).

4. **Acesse seu aplicativo Laravel:**
   * A URL de acesso ao seu aplicativo Laravel dependerá da configuração do seu projeto e do servidor web configurado dentro do container. Geralmente, você pode tentar acessar `http://localhost:<porta_do_servidor_web>`, onde `<porta_do_servidor_web>` é a porta configurada para o servidor web no seu projeto Laravel (por exemplo, porta 80). Consulte a documentação do seu projeto Laravel para obter detalhes específicos.

**Observações Adicionais**

* Para parar os containers, execute `docker-compose down`.
* Para reiniciar os containers com qualquer alteração, execute `docker-compose up -d`.
* Para entrar no container e executar comandos, use `docker-compose exec laravel bash`.

**Personalização**

Você pode personalizar este arquivo `docker-compose.yml` para atender às suas necessidades específicas. Por exemplo, você pode:

* Alterar o nome do container Laravel.
* Montar volumes adicionais para persistir outros dados do projeto.
* Configurar portas diferentes para o servidor web.
* Incluir serviços adicionais, como uma base de dados.

Este Leia-me fornece uma visão geral da configuração do projeto e instruções para executar seu ambiente de desenvolvimento Laravel usando Docker Compose. Sinta-se à vontade para personalizá-lo ainda mais com base em seus requisitos específicos.
