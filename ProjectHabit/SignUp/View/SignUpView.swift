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
                            .foregroundColor(.black)
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
        TextField("", text: $fullName)
            .border(.black)
    }
}
extension SignUpView{
    var emailField: some View{
        TextField("", text: $email)
            .border(.black)
    }
}
extension SignUpView{
    var passwordField: some View{
        TextField("", text: $password)
            .border(.black)
    }
}
extension SignUpView{
    var phoneField: some View{
        TextField("", text: $phone)
            .border(.black)
    }
}
extension SignUpView{
    var documentField: some View{
        TextField("", text: $document)
            .border(.black)
    }
}
extension SignUpView{
    var birthdayField: some View{
        TextField("", text: $birthday)
            .border(.black)
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
        Button("Cadastrar"){
            viewModel.signUp()
            print("teste?")
        }
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignUpViewModel()
        SignUpView(viewModel: viewModel)
    }
}
