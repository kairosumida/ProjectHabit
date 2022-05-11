//
//  SignUpView.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 08/05/22.
//

import SwiftUI

struct SignUpView: View{
    
    @ObservedObject var viewModel: SignUpViewModel
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var phone = ""
    @State var document = ""
    @State var birthday = ""
    @State var gender = Gender.male
    
    var body: some View{
        ZStack{
            ScrollView{
                VStack(alignment: .center){
                    VStack(alignment: .leading, spacing: 8){
                        Text("cadastre")
                            .foregroundColor(Color("textColor"))
                            .font(Font.system(.title).bold())
                            .padding(.bottom, 8)
                        
                        fullNameField
                        emailField
                        documentField
                        phoneField
                        birthdayField
                        genderPicker
                        saveButton
                    }
                }.padding(.horizontal, 8)
            }.padding()
            if case SignUpUIState.error(let value) = viewModel.uiState{
                Text("").alert(isPresented: .constant(true)){
                    Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")){
                        //Faz algo quando o alert some
                    })
                }
            }
        }
    }
}
extension SignUpView{
    var fullNameField: some View{
        EditTextView(placeholder: "Nome Completo",
                     text: $fullName,
                     keyboard: .alphabet,
                     error: "Nome Inválido",
                     failure: fullName.count < 3)
    }
}
extension SignUpView{
    var emailField: some View{
        EditTextView(placeholder: "E-mail",
                     text: $email,
                     keyboard: .emailAddress,
                     error: "Email Inválido",
                     failure: !email.isEmail())
    }
}
extension SignUpView{
    var passwordField: some View{
        EditTextView(placeholder: "Senha",
                     text: $password,
                     keyboard: .emailAddress,
                     error: "Senha Inválida: Minimo de 8 caracteres",
                     failure: password.count < 8,
                     isSecure: true)
    }
}
extension SignUpView{
    var phoneField: some View{
        EditTextView(placeholder: "Telefone",
                     text: $phone,
                     keyboard: .phonePad,
                     error: "Telefone inválido",
                     failure: phone.count < 11)
    }
}
extension SignUpView{
    var documentField: some View{
        EditTextView(placeholder: "CPF",
                     text: $document,
                     keyboard: .numberPad,
                     error: "CPF Inválido",
                     failure: document.count < 11)
    }
}
extension SignUpView{
    var birthdayField: some View{
        EditTextView(placeholder: "Aniversario",
                     text: $birthday,
                     keyboard: .default,
                     error: "data Inválida",
                     failure: birthday.count < 10)
    }
}
extension SignUpView{
    var genderPicker: some View{
        Picker("Gender", selection: $gender){
            ForEach(Gender.allCases, id: \.self){ value in Text(value.rawValue)
                    .tag(value)
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}
extension SignUpView{
    var saveButton: some View{
        LoadingButtonView(action: {viewModel.signUp()},
                          text: "Realize seu cadastro", showProgress: self.viewModel.uiState == SignUpUIState.loading,                    disabled: !email.isEmail() ||
                          password.count < 8 ||
                          phone.count < 10 || phone.count >= 12 ||
                          document.count != 11 ||
                          birthday.count != 10 ||
                          fullName.count < 3
                          
        )
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self){ value in
        let viewModel = SignUpViewModel()
        SignUpView(viewModel: viewModel)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .previewDevice("IPhone 11")
                .preferredColorScheme(value)
        }
    }
}
