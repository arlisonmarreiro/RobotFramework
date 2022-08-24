# Exemplo Robot Framework + Selenium 
## I. Pré-Requisitos
### 1. Python
* Instale o python [aqui](https://www.python.org/downloads/)
**Nota**: Tenha certeza que a opção adicionar ao `PATH` foi marcada na instalação
! [Exemplo](https://docs.python.org/3/_images/win_installer.png)
### 2. Robot Framework
Esse comando funciona apenas se o python ja estiver instalado
* `pip install robotframework`
### 3. Biblioteca do Selenium
* `pip install robotframework-seleniumlibrary`
### 4. Baixar webdrivers
Você pode baixar os webdrivers nos links abaixo:
 * [Chrome](https://sites.google.com/a/chromium.org/chromedriver/downloads](https://sites.google.com/chromium.org/driver/))
 * [Firefox (Gecko)](https://github.com/mozilla/geckodriver/releases)
### 5. Adicione os webdrivers ao PATH
* Copie e cole os webdrivers para o diretorio C:\Users\SeuUsuario\AppData\Local\Programs\Python\Python310\Scripts
## II. Editor de texto ou IDE
* [Visual Studio Code](https://code.visualstudio.com/download)
## III. Executar um exemplo
Certifique-se de estar na pasta **WebTesting**
* Digite o seguinte comando no terminal
`robot -d results -v BROWSER:firefox -i menus amazon_testes.robot`
* **-d** significa que vai criar um diretório chamado **results** para armazenar os logs
* **-v** depois desse comando pode-se modificar qualquer valor de váriavel pela linha de comando. Exemplo: **BROWSER** é uma variavel, o valor padrão dela é firefox, ou seja, abrirá o navegador firefox, caso queira abrir o navegador chrome, basta apenas mudar o valor da variavel **BROWSER** para chrome
* **-i** depois desse comando pode-se executar apenas Casos de teste com as Tags que foram definidas. Exemplo: **menus** foi uma tag escolhida para o Caso de teste 01.

# Exemplo Robot Framework + Requests(API testing)
## I. Pré-Requisitos
### 1. Biblioteca Requests
* `pip install robotframework-requests`
## II. Executar um exemplo
Certifique-se de estar na pasta **BooksAPI**
* Digite o seguinte comando no terminal
`robot -d results -i GET TestCasesApiBooks.robot`
* **-d** significa que vai criar um diretório chamado **results** para armazenar os logs
* **-i** depois desse comando pode-se executar apenas Casos de teste com as Tags que foram definidas. Exemplo: **GET** foi uma tag escolhida para o Caso de teste 01 e fará uma requisição GET. Caso queira executar outra requisição, basta trocar o valor GET por GET_ID(Buscar por id), POST, PUT ou DELETE.




