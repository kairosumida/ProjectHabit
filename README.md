# ProjectHabit
Primeiro Projeto em Swift

Programa tem como objetivo estudar um fluxo entre telas
<ul>
  <li>1 - tela de splash</li>
  <li>2 - tela de login</li>
  <li>3 - tela de cadadastro</li>
  <li>4 - tela principal</li>
</ul>

<h2>tela de splash</h2>
<p>é uma tela que mostra o logo da empresa e espera alguma informação para poder direcionar o usuário para a outra tela</p>
<p>Usado um switch que indica os estados </p>
<ul>
  <li>loading</li>
  <li>goToSignScreen</li>
  <li>goToHomeScreen</li>
  <li>error</li>
</ul>

<h2>Aprendizados 1</h2>
<h3>Quebrando modelos de layouts para tornar o codigo mais limpo</p>
<h4>Compartilhamento de objetos</h3>
<p>Usado quando queremos acessa-la de outros documentos </h4>
```Swift
struct LoadingView: View{
    var body: some View {
        ZStack{
        }
    }
}
```
<h3>Variaveis em extensões</h3>
<p>Usado pelo documento atual, como uma extensao da struct SpashView, porem como é uma variavel. Não é possível passar parâmetros.</p>
  ```Swift
  extension SplashView {
  extension SplashView {
    var loading: some View{
        ZStack{ 
        }
    }
}
  ```

  
  <h3>Função em extensão</h3>
  <h4>Usado pelo documento atual, e permite a passagem de parâmetros</h4>

 ```Swift
  extension SplashView {
  func loadingView()-> some View{
      ZStack{}
  }
}
 ```
  
<h2>Aprendizados 2</h2>
  <h3>MVVM</h3>
  <h4>Model</h4>
  <p>Onde os estados ficam armazenados</p>
  <h4>View</h4>
  <p>Todos os componentes visuais ficam aqui</p>
  <h4>ViewModel</h4>
  <p>Onde ocorre o processamento e alterações dos estados do programa</p>
  
  <h2>Tecnica</h2>
  <h3>Criar uma rotina de espera por tempo</h3>
  <code>DispatchQueue.main.asyncAfter(deadline: .now()+3){//aqui é chamado depois de 3 seg}</code>
  
  <h2>Aprendizados 3</h3>
  <h3>Navegação entre telas</h3>
  <p>Quem realiza a navegação é a ViewModel, mas geralmente por um botão da View. Por isso:</p>
  <code>viewModel.generic2View()</code>
  <p>esse codigo se encontra na view e é ele que chama o metodo generic2View q se encontra na viewModel</p>
  <code>extension Generic1ViewModel{func generic2View() -> some View{return Generic1ViewRouter.makeGeneric2View()}}</code>
  <p>esse codigo esta chamando a Generic1ViewRouter que tem a responsabilidade de fazer a rota para a nova view</p>
  <code>enum Generic1ViewRouter{static func makeGeneric2View() -> some View{let viewModel = Generic2ViewModel()return Generic2View(viewModel: viewModel)}}</code>
  
  <h2>Bug 🤯</h2>
  <h3>PreviewView não queria mais mostrar</h3>
  <p>Possivel solução: BuildSettings -> Search -> "Architectures" -> Build Active Architecture Only</p>
  <p>Resolveu porem não tenho ideia do que foi isso, detalhe que em cima, antes ficava a build para o celular(iphone13), e apos desativar e ativar o build ficou como Arm64</p>
  
  <h2>Aprendizado 4</h2>
  <h3>Criando picker com varios elementos</h3>
  <p>1 - Crie um enum que implementa CaseIterable, Identifiable e o tipo do enum(Pode ser String)</p>
  <p>2 - Dentro do corpo do enum coloque case para cada elemento do picker. Sendo case 'nomeComputacional' = 'nomeRepresentativo</p>
  <p>3 - crie uma variavel id que é obrigatoria e passe o id que representará cada elemento </p>
  <code>enum Gender: String, CaseIterable, Identifiable{
    case male = "Masculino"
    case female = "Feminino"
    var id: String{
      self.rawValue
    }
  }
  </code>
  <p> 4 - Crie o picker </p>
  <p> 5 - Adicione um valor incial</p>
  <p> 6 - Coloque o seguinte ForEach dentro do picker</p>
  <code>Picker("Gender", selection: $gender){
    ForEach(Gender.allCases, id: \.self){ value in 
      Text(value.rawValue)
        .tag(value)
    }
   }
  </code>
  <p>Para mudar o estilo do picker é so colocar Picker'}.pickerStyle('Estilo')</p>
  
  <h2>Aprendizado 5</h2>
  <h3>Callback para pagina inicial</h3>
  <p>Quando temos uma pagina login e entramos em uma pagina de cadastro. Quando o cadastro é realizado gostariamos que fosse direcionado para a main page e não para o login. Por isso usamos uma callback para avisar a pagina de login</p>
  <p>1 - Criar uma variavel AnyCancellable? e instanciamos um  o bool representa osucesso e o never o erro</p>
  <p>2 - Crie uma constancia chamada publisher e instancie o callback <code>PassthroughSubject&ltBool, Never&gt </code></p>
  <p>3 - Atribuimos a variavel AnyCancellable? no construtor da classe</p>
   <code> publisher.sink{
            value in 
            if value {
                //faz tal coisa
            } 
     }
  </code>
  <p>4 - declare um destructor para que a callback se encerre caso essa pagina seja encerrada</p>
  <code>
    deinit{
        cancellable?.cancel()
    }
  </code>
  <p>5 - Passe para o Router o publisher e declarar no router que tem um publisher. </p>
  <p>6 - Passe o publisher para a tela(ViewModel) que o router chama</p>
  <p>7 - Na classe que recebe o publisher pelo router basta dar publisher.send(true) e a callback acontece</p>
  
  <h2>Aprendizado 6</h2>
  <h3>Customização de componentes</h3>
  <p>1 - Criamos uma pasta em Common chamada View</p>
  <p>2 - Criamos um arquivo com o nome do elemento que iremos customizar (Ex: EditTextView)</p>
  <p>3 - Importamos o SwiftUI</p>
  <p>4 - Criamos a estrutura padrão com a struct e o body : some view</p>
  <p>5 - Adicionamos o Preview para facilitar a visualização com o modo dark e o modo light</p>
  <p>6 - Dentro do body: some View(){} temos que colocar o elemento que será customizado e nele ir agregando os codigos(Ex: TextField(placeholder: placeholder, text: texto)</p>
  <p>7 - E ao lado do TextField(...). adicionamos os elementos que sao customizados<p/>
  <p>8 - Agora é só chamar a struct criada em qualquer lugar do codigo(EditTextView) e passar os parametros necessarios.</p>
  <p>9 - É bom passar os parametros na ordem que está criado no arquivo, pois se passar em outra ordem, o compilador fala que está errado</p>
  </br>
  
  <h2>Aprendizado 7 </h2>
  <h3>Criando um asset</h3>
  <p> 1 - Clique em assets</p>
  <p> 2 - Clique no + em baixo</p>
  <p> 3 - Escolha o tipo do asset a ser criado</p>
  <p> 4 - Renomeie</p>
  <p> 5 - Coloque as caracteristicas do asset criado</p>
  <p> 6 - Chame em qualquer lugar do codigo o nome do asset criado(O que foi renomeado) dentro de "" (por exemplo: "CorQueEuCriei")</p>

   <h2>Aprendizado 8 </h2>
  <h3>Usar as variaveis na ViewModel e na View</h3>
  <p> 1 - Crie na View uma variavel do tipo ViewModel essa variavel deve ter no comeco dela o @ObservedObject </p>
  <p> 2 - Crie uma variavel viewModel que recebe a instancia da ViewModel acima do codigo que chama a view</p>
  <p> 3 - Assim que a View for criada pegamos a variavel recem criada da viewModel e passamos como argumento na View</p>
  <p> 4 - Para adicionar variaveis, criamos dentro da ViewModel com a seguinte nomenclatura @Published var 'nomeDaVariavel'</p>
  <p> 5 - Na view basta passar viewModel.'nomeDaVariavel' ou se for um Biding $viewModel.'nomeDaVariavel'</p>

<h2> Estudando componentes da view</h2>
<h3> ZStack</h3>
<p> Coloca um objeto na frente do outro sendo quanto mais abaixo do codigo, sobrescreve o item anterior. Também podemos dizer que se move no eixo Z</p>
<h3> VStack </h3>
<p> Coloca os objetos na vertical ou seja cada novo elemento vai aparecendo em baixo</p>
<h3> HStack </h3>
<p> Coloca os objetos na horizontal ou seja os elementos são colocado um ao lado do outro</p>
<h3> ScrollView</h3>
<p> Pode ter um parametro para remover a indicação nas laterais showsIndicator: false</p>
<p> Serve para scrollar tudo que está dentro dele</p>
<h3> NavigationView</h3>
<p> Representa uma navegação entre views ou seja vai stakando views uma sobre a outra</p>
<p> Para que nas outras paginas saiba o nome da sua view. Devemos colocar .navigationBarTitle("NomeDaView")</p>
<p> Porem ao colocar o navigationBarTitle. Um titulo irá aparecer. E para faze-lo sumir usamos: .navigationBarHidden</p>
<h3> Spacer</h3> 
<p> Cria uma area vazia. Como se um objeto invisivel estivesse naquela região</p>

<h2> Estudando modificadores da view</h2>
<h3> .padding()</h3>
<p> Coloca para cada lado do objeto um espaço invisivel(Porem esse espaço ainda é o objeto) e se não tiver lugar para criar acredito que ele usa o proprio objeto para criar aquela area invisivel</p>
<h3> .font('tipoDaFonte') </h3>
<p>Escolhe uma fonte </p>
<p>.font(Font.system(.title3)) Escolhe a fonte do sistema
<h3> .resizable()</h3>
<p>Força o objeto a expandir até o maximo que puder. Respeitando as areas de outros objetos. Por exemplo digamos que tenha uma tela de 1000 e 2 objetoc ocupam 100 cada. ou seja 800 está livre. Se der um risizable o objeto ira ocupar 900</p>
<h3> .background('Color')</h3>
<p>Escolhe uma cor de fundo</p>
<h3>.frame(width: 'tamanho', height: 'tamanho')</h3>
<p>Diz o tamanho que o elemento vai ter. Diferente do padding que o objeto pode ter qualquer tamanho e vai acrescentar uma quantia, aqui independente do tamanho, se usar o frame, o objeto terá aquele tamanho. Forçando ele a encolher, ou aumentar. Porem se aumentar ele aumenta com areas transparentes ao redor do objeto. Agora se o objeto for maior e tiver que reduzir ele fará proporcional</p>
<h3>.scaledToFit()</h3>
<p>Força o objeto a caber na area(Sem deformar) onde esse objeto mantem a sua proporção original</p>
<h3>.foregroundColor('Color')</h3>
<p>Faz o objeto que está dentro do elemento ganhar cor</p>
<h3>.keyboardType('Keyboard')</h3>
<p>Escolhe um tipo de teclado. Tem que ser em um elemento que abra o teclado para digitar</p>
<h3>.textFieldStyle('Estilo')</h3>
<p>Coloca um estilo no texto. O 'Estilo' Pode ser criado a parte em um customStyle</p>
</h3>.cornerRadius</h3>
<p>Faz o elemento ganhar arredondamento, cuidado se tiver um padding antes, o padding que ganha o arredondamento, deixando imperceptivel o arredondamento</p>
<h3>.navigationBarTitle('Titulo')</h3>
<p>Coloca um titulo na pagina que é uma navigation</p>
<h3>.ignoresSafeArea()</h3>
<p>Ignora a area de cima, onde mostra o relogio, bateria e etc</p>
<h1> Aprendizado 9 </h1>
<h2>Convertendo em Json</h2>
<p>Para converter uma lista dictionary criamos o dictionary com o nome de json e entao adicionamos em: </p>
<code>let jsonData = try? JSONSerialization.data(withJSONObject: json)</code>
<p> Pronto, o jsonData está pronto</p>
 <h1>Aprendizado 10</h1>
 <h2>Enviando para a web</h2>
<p>1 Crie um enum chamado. WebService</p>
<p>2 Crie um enum dentro de WebService chamado Endpoint do tipo String</p>
<p>3 Adicione os casos ao Endpoint sendo o primeiro o base que contem o endereco do servidor</p>
<p>4 Adicione os demais casos ao entipoint cada uma das possiveis rotas. Como cadastro, update, get e etc</p>
<p>5 Crie um metodo estatico que irá completar a URL e retornar uma URLRequest</p>
```Swift
private static func completeUrl(path: Endpoint) -> URLRequest? {
    guard let url = URL(string: "\(Endpoint.base.rawValue)\(path.rawValue)") else {return nil}

            return URLRequest(url: url)
}
```
<p>6. Crie um metodo que contem a ação que ele fará na nuvem(Ex: cadastrarUsuario)</p>
<p>7. Crie o jsonData</p>
<p>8. Crie uma urlRequest apartir do completeUrl</p>
<p>9. passe os seguintes comandos</p>
  ```swift
  urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
  ```
<p>10. Espere pela task</p> 
  ```Swift
  let task = URLSession.shared.dataTask(with: urlRequest){
            data, response, error in
            }
  ```
 
