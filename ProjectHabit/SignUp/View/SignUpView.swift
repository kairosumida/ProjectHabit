//
//  SignUpView.swift
//  ProjectHabit
//
//  Created by Kairo Sumida on 08/05/22.
//

import SwiftUI

struct SignUpView: View{
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var phone = ""
    @State var document = ""
    @State var birthday = ""
    
    var body: some View{
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
            saveButton
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
    var saveButton: some View{
        Button("Cadastrar"){
            
            
        }
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        
        SignUpView()
    }
}
