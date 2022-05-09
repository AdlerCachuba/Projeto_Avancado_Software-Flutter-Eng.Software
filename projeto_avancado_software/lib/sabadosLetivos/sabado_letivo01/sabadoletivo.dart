// O que é e para que serve tratamento de erros?
// R: Serve para quando acontecer algum erro no seu projeto ele cair em uma tratativa de erro, como por exemplo o uso do “try catch finally” que permite que se acontecer um erro dentro do bloco do “try” tenha comando específicos no bloco do “catch”, coletando o erro, e realizando atividades.

// Quais são as formas de tratamentos de erros?
// R: Depende do erro. Por exemplo, é possível pegar o erro do que aconteceu, e caso seja um determinado erro aconteça alguma coisa específica. E também, algo muito importante é que esse erro quando cai em um bloco de “catch” por exemplo, pode usar para exibir a mensagem do erro, salvar. 
// Quando fazemos um exemplo de um erro de “index out of bounds” é quando tentamos pegar uma posição em um array que não existe. Causando um erro. Quando causado isso, podemos direcionar para o bloco do catch para salvar essa mensagem e direcionar para aparecer uma mensagem de erro na tela do usuário, por exemplo, caso não tivesse o bloco “catch” iria quebrar a aplicação. 

// Qual a diferença entre erro e exceção? 
// R: Um erro quando acontece faz com que a aplicação termine a execução, por exemplo: out of memory error, quando acontece significa que faltou memória para continuar a aplicação e ela é finalizada, e não é possível realizar nenhuma operação.
// Já as exceções são quando são recuperáveis, e que quando acontecem seu programa ainda pode continuar a funcionar. Por exemplo, dentro de um bloco de “try catch finally”, se acontecer um erro de “index out of bounds” é possível pegar essa exceção no bloco do catch, e poder exibir uma mensagem para o usuário, e a aplicação pode continuar a sua execução.

// Qual a diferença entre exceção implícita (contornável) e explícita (incontornável)? 
// R: A implícita significa que é uma exceção que não precisa de tratamento, e seu comportamento é contornável.
// Já a explícita é um comportamento que precisa de tratamento, e seu comportamento é incontornável.

// O que são: (1) throwables; (2) Checked Exception; e (3) Unchecked (Runtime)?
// R: 1. Throwable é um erro verificado.

// 2.Checked Exception são as exceções que são verificadas na hora de ser compilado o código. Se algum código dentro de algum método lançar uma exceção, então o método deve lidar com a exceção e/ou deve especificar a exceção.

// 3. A uncheked é uma exceção que acontece em tempo de compilação de código. No site da oracle diz: “Se um cliente pode razoavelmente esperar se recuperar de uma exceção, faça disso uma exceção verificada. Se um cliente não pode fazer nada para se recuperar da exceção, faça disso uma exceção não verificada.”

// Quais são os tratamentos de erros existentes no dart?
// R: DefferedLoadException
// Ele é lançado quando uma biblioteca adiada falha ao carregar.

// FromatException
//  É a exceção lançada quando uma string ou algum outro dado não tem um formato esperado

// IntegerDivisionByZeroException
// É lançado quando o número é dividido por zero.

// IOEException
// É a classe base das exceções relacionadas a entradas e saídas.

// IsolateSpawnException
// Ele é lançado quando um isolado não pode ser criado.

// Tempo esgotado
// É acionado quando ocorre um tempo limite programado durante a espera por um resultado assíncrono.


// Quais são as principais excessões existentes no dart?
// R: Classes de exceção, DefferedLoadException, FromatException, IntegerDivisionByZeroException,IOEException, IsolateSpawnException.

// Explique e exemplifique o uso das cláusulas on e finally no bloco try-cath.
// R: Um exemplo seria colocar dentro de um bloco de try-catch a requisição de uma API, para que caso aconteça algum erro essa mensagem seja capturada.

// try{
// latitude = APIGoogle.buscaLatitude(endereco);
// longitude = APIGoogle.buscaLongitude(endereco);
// }catch(Exception e){
// print(“ A api causou um erro, a mensagem é: ” + e.toString());
// }

// O que é para que serve o bloco try-catch? O que é e como utilizamos o objeto de exceção? O que é e como utilizamos o objeto Stack trace?
// R: Bloco try catch é para quando acontecer um erro dentro do bloco do try poder ser capturado o erro no bloco do catch. O objeto de exceção é a mensagem do erro capturada, como por exemplo, se dentro do bloco do catch estiver o parâmetro “NullpointerException mensagem” essa mensagem será capturada na variável “mensagem”.
// O stack trace é um relatório semelhante a uma pilha de atividades do programa, que você pode rastrear o que foi acontecendo na ordem.

// É possível criar exceções específicas? Se sim, em que caso podem ser utilizas?
// R: Sim, as exceções específicas tem como objetivo criar um tratamento especial para um bloco específico de código, podendo exibir uma mensagem personalizada para o usuário se acontecer a condição da exceção.  Para criar uma exceção específica basta criar uma classe e implementar o Exception, e colocar o código desejado dentro do método.


// Implemente o try-catch (com relevância) em nas funções do seu projeto. Analise o seu projeto e crie exceções específicas que facilite a localização e a manutenção do projeto.
// R: Criei um menu, e a classe Produto. A partir da classe produto, o usuário pode verificar a lista de produtos cadastrados (atualmente está hard-coded, colocado diretamente no código), e pode selecionar um dos produtos no menu, a escolha é através do ID para facilitar a utilização do programa via console. Caso não encontre o ID do produto dentro da lista, uma exceção deve ser lançada. 
// Essa função pode ser encontrada na classe : funcoes_menu.dart, localizada na pasta do projeto_principal.