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

<h2>Aprendizados</h2>
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
  
  </code>
  
