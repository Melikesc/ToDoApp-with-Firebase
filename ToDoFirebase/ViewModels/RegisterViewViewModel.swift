//
//  RegisterViewViewModel.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

// Kullanıcı kaydı için ViewModel
class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessageR = ""
    @Published var isRegistrationSuccessful = false // Başarılı kaydı kontrol etmek için
    
    init() {}
    
    // Kullanıcı kaydı yapma fonksiyonu
    func register() {
        guard validate() else {
            return
        }
        // Kullanıcı oluşturma işlemi
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            // Kullanıcı kaydını veritabanına ekle
            self?.insertUserRecord(id: userId)
        }
    }
    
    // Kullanıcı veritabanına kaydı işlevi
    private func insertUserRecord(id: String) {
       let newUser = User(id: id,
                          name: name,
                          email: email,
                          joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) { [weak self] error in
                if error == nil {
                    DispatchQueue.main.async {
                        // Başarı durumunu güncelle
                        self?.isRegistrationSuccessful = true
                    }
                }
            }
    }
    
    private func validate() -> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessageR = "Lütfen tüm boşlukları doldurun."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessageR = "Lütfen geçerli bir email girin."
            return false
        }
        guard password.count >= 6 else {
            return false
        }
        return true
    }
}


