//
//  LoginViewViewModel.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import FirebaseAuth
import Foundation

// Kullanıcı girişi için ViewModel
class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    // Kullanıcı girişi yapma fonksiyonu
    func login(){
        // Giriş verilerinin geçerliliğini kontrol et
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    // Giriş verilerinin geçerliliğini kontrol eden özel fonksiyon
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Lütfen tüm boşlukları doldurun."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir email girin."
            return false
        }
        return true
    }
    
}
