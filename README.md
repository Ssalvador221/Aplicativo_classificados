# Atividade Avaliativa 2: Desenvolvimento de Aplicativo de Classificados em Flutter com Firebase

## Objetivo

O objetivo desta atividade é desenvolver um aplicativo de classificados onde os usuários podem cadastrar, visualizar e pesquisar anúncios de produtos. O aplicativo será desenvolvido utilizando **Flutter** para a interface e **Firebase** para o backend, com foco na autenticação de usuários e armazenamento de dados.

---

## Descrição da Atividade

Os alunos devem criar um aplicativo com as seguintes funcionalidades:

1. **Publicação de anúncios**: O usuário pode criar e publicar anúncios de produtos.
2. **Visualização de anúncios**: Os usuários podem visualizar anúncios criados por outros usuários.
3. **Pesquisa e Filtros**: Permitir que o usuário pesquise e filtre anúncios por categoria, preço e localização.
4. **Detalhes do produto**: Exibir informações detalhadas sobre o produto, incluindo fotos e informações de contato do vendedor.

---

## Requisitos e Funcionalidades

### 1. **Prototipagem no Figma**

Os alunos devem criar um protótipo no **Figma** com as seguintes telas:

- **Tela de Login/Cadastro**:
  - Campos para e-mail e senha.
  - Botões para login e cadastro.
  - Link para recuperação de senha.

- **Tela de Criação de Novo Anúncio**:
  - Campos para inserir:
    - Nome do produto
    - Descrição
    - Preço
    - Categoria (dropdown)
    - Localização
    - Fotos do produto (opcional)

- **Tela de Listagem de Produtos**:
  - Lista de produtos exibindo:
    - Nome do produto
    - Foto do produto
    - Preço
    - Categoria
  - Filtros para:
    - Categoria
    - Faixa de preço
    - Localização

- **Tela de Detalhes do Produto**:
  - Exibição de informações detalhadas do produto, incluindo:
    - Descrição completa
    - Fotos do produto
    - Informações de contato do vendedor (email, telefone)

**Critérios**: O protótipo deve ser claro, funcional e fácil de navegar, com destaque para os produtos.

---

### 2. **Cadastro e Autenticação de Usuários**

Utilize **Firebase Authentication** para gerenciar o login e cadastro de usuários. O processo de autenticação deve incluir:

- Cadastro com e-mail e senha.
- Login com e-mail e senha.
- Recuperação de senha, caso o usuário esqueça.

---

### 3. **Criação de Anúncios**

Permitir que os usuários publiquem anúncios com as seguintes informações:

- **Nome do produto**
- **Descrição**
- **Preço**
- **Categoria** (Exemplo: Eletrônicos, Móveis, etc.)
- **Fotos do produto** (opcional)
- **Localização** (cidade ou estado)

Esses dados serão enviados para o **Firebase Firestore** para persistência.

---

### 4. **Busca e Filtros**

Implemente uma funcionalidade de busca de produtos com filtros baseados em:

- **Categoria**
- **Faixa de preço**
- **Localização** (por cidade ou estado)

A pesquisa deve ser eficiente e retornar apenas os anúncios que atendem aos critérios selecionados.

---

### 5. **Detalhes do Produto**

Quando o usuário clicar em um anúncio, o aplicativo deve exibir os detalhes completos do produto, incluindo:

- **Nome do produto**
- **Descrição**
- **Preço**
- **Fotos do produto**
- **Informações de contato do vendedor** (email ou número de telefone)

---

### 6. **Persistência dos Dados**

Utilize **Firebase Firestore** para armazenar os anúncios de forma persistente. Cada anúncio deve ser salvo como um documento dentro de uma coleção específica no Firestore, com os dados do produto e informações do vendedor.

---

## Critérios de Avaliação

1. **Prototipagem no Figma**: 
   - Qualidade do design e usabilidade do protótipo.
   - Navegação clara entre as telas.

2. **Funcionalidade do App**: 
   - O aplicativo deve permitir:
     - Criação de novos anúncios.
     - Exibição de anúncios de outros usuários.
     - Busca e filtros eficientes.

3. **Integração com Firebase**:
   - O aplicativo deve usar **Firebase Authentication** para login e cadastro de usuários.
   - O Firebase Firestore deve ser utilizado para armazenar e recuperar os anúncios de forma eficiente.

4. **Interface Usuário**:
   - Interface fácil de usar e intuitiva.
   - Design claro e funcional.

5. **Código Limpo e Organizado**:
   - Uso de boas práticas de codificação.
   - O código deve ser modular, reutilizável e bem documentado.

---

## Recursos Utilizáveis

- **Figma** (para o protótipo)
- **Flutter** (Dart) (para o desenvolvimento do app)
- **Firebase Authentication** (para autenticação de usuários)
- **Firebase Firestore** (para armazenamento de dados)

---

## Entrega

1. **Link do protótipo no Figma**: Compartilhar o link do protótipo criado no Figma.
2. **Código-fonte completo do aplicativo**: Enviar o código-fonte do aplicativo desenvolvido.
3. **Vídeo demonstrativo**: Criar um vídeo demonstrando o funcionamento do aplicativo, incluindo a navegação entre telas e a criação de anúncios.

---

## Como Rodar o Projeto

1. **Instalar o Flutter**:
   - Se ainda não tiver o Flutter instalado, siga as instruções no [site oficial do Flutter](https://flutter.dev/docs/get-started/install).

2. **Instalar as dependências**:
   - Navegue até o diretório do projeto e execute:
     ```bash
     flutter pub get
     ```

3. **Configurar o Firebase**:
   - Crie um projeto no [Firebase Console](https://console.firebase.google.com/).
   - Adicione o Firebase ao seu projeto Flutter, conforme as instruções no [Guia de Firebase Flutter](https://firebase.flutter.dev/docs/overview).

4. **Rodar o aplicativo**:
   - Para rodar o aplicativo no seu dispositivo ou emulador, execute:
     ```bash
     flutter run
     ```

---

## Conclusão

Essa atividade oferece uma experiência prática no desenvolvimento de aplicativos móveis, combinando o uso de **Flutter** e **Firebase** para criar um sistema funcional de classificados com autenticação de usuários, persistência de dados e uma interface amigável. Ao seguir os passos e requisitos fornecidos, você criará um app de classificados com boas práticas de design e codificação.
