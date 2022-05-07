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
<p>Quebrando modelos de layouts para tornar o codigo mais limpo</p>
<h3>Compartilhamento de objetos</h3>
<h4>Usado quando queremos acessa-la de outros documentos </h4>
<code>
struct LoadingView: View{
    var body: some View {
        ZStack{
        }
    }
}
  </code>
<h3>Variaveis em extensões<h3>
<h4>Usado pelo documento atual, como uma extensao da struct SpashView, porem como é uma variavel. Não é possível passar parâmetros.</h4>
  <code>extension SplashView {
    var loading: some View{
        ZStack{ 
        }
    }
}
  </code>
  
  <h3>Função em extensão</h3>
  <h4>Usado pelo documento atual, e permite a passagem de parâmetros</h4>
  <code>
    extension SplashView {
    func loadingView()-> some View{
        ZStack{}
    }
}
  </code>
  
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
  
  
