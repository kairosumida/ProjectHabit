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
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack(alignment: .center){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal,48)

                    Text("Login").foregroundColor(.orange)
                        .font(Font.system(.title).bold())
                        .padding(.bottom, 8)
                    numberField
                    passwordField
                    enterButton
                    registerLink
                    Text("Copyright @YYY")
                        .foregroundColor(Color.gray)
                        .font(Font.system(size: 16).bold())
                        .padding(.top, 16)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.white)
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(navigationHidden)
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
                        destination: Text("Tela de Cadastro"),
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
        Button("Entrar"){
            
        }
    }
}

extension SignInView{
    var passwordField: some View{
        SecureField("", text: $password)
            .border(Color.orange)
    }
}

extension SignInView {
    var numberField: some View{
        TextField("", text: $email)
            .border(Color.black)
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}
