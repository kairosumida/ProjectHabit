//
//  SignInView.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 07/05/22.
//

import SwiftUI

struct SignInView: View{
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    @State var action: Int? = 0
    @State var navigationHidden = true
    var body: some View{
        ZStack{
            if case SignInUIState.goToHomeScreen = viewModel.uiState{
                viewModel.homeView()

            }else{
                NavigationView {
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .center){
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal,48)

                            Text("Login").foregroundColor(.orange)
                                .font(Font.system(.title).bold())
                                .padding(.bottom, 8)
                            emailField
                            passwordField
                            enterButton
                            registerLink
                            Text("Copyright @YYY")
                                .foregroundColor(Color.gray)
                                .font(Font.system(size: 16).bold())
                                .padding(.top, 16)
                        }
                        if case SignInUIState.error(let value) = viewModel.uiState{
                            Text("").alert(isPresented: .constant(true)){
                                Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")){
                                    //Faz algo quando o alert some
                                    })
                                }
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .navigationBarTitle("Login", displayMode: .inline)
                    .navigationBarHidden(navigationHidden)
                }.onAppear{
                    self.navigationHidden = true
                }.onDisappear{
                    self.navigationHidden = false
                }
            }
        }
       
    }
}
extension SignInView{
    var registerLink: some View{
        VStack{
            Spacer(minLength: 36)
            VStack{
                Text("Ainda não possui um login ativo?")
                    .foregroundColor(.gray)
                    .padding(.top, 48)
                
                ZStack{
                    NavigationLink(
                        destination: viewModel.signUpView(),
                        tag: 1,
                        selection: $action,
                        label:{EmptyView()})
                    
                    Button("Realize seu Cadastro"){
                        self.action = 1
                    }.padding(.top, 48)
                }
            }
        }
    }
}

extension SignInView{
    
    var enterButton: some View{
        LoadingButtonView(action: {viewModel.login(email: email, password: password)}, text: "Entrar", showProgress: self.viewModel.uiState == SignInUIState.loading, disabled: !email.isEmail() || password.count < 8)
    }
}

extension SignInView{
    var passwordField: some View{
        EditTextView(placeholder: "Senha",
                     text: $password,
                     keyboard: .emailAddress,
                     error: "Senha Inválida: Minimo de 8 caracteres",
                     failure: password.count < 8,
                     isSecure: true)
    }
}

extension SignInView {
    var emailField: some View{
        EditTextView(placeholder: "E-mail",
                     text: $email,
                     keyboard: .emailAddress,
                     error: "Email Inválido",
                     failure: !email.isEmail())
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self){ value in
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .previewDevice("IPhone 11")
                .preferredColorScheme(value)
        }
    }
}
