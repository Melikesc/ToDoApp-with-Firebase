//
//  MainViewViewModel.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import FirebaseAuth
import Foundation

// bu sınıf, kullanıcı oturum durumunu takip eder.
// `ObservableObject` protokolü sayesinde, bu sınıfın özelliklerindeki değişiklikler UI tarafından gözlemlenebilir.
class MainViewViewModel: ObservableObject {
    
    // Kullanıcının kimlik bilgisini saklar
    @Published var currentUserId: String = ""
    
    // Firebase kimlik doğrulama durumu değişikliklerini dinlemek için bir işleyici (handler).
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        // Firebase Auth servisi ile kimlik doğrulama durumunu dinleyecek bir olay işleyicisi ekleniyor.
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            
            DispatchQueue.main.async {
                
                // Giriş yapan kullanıcının ID'si alınıyor, kullanıcı yoksa boş string atanıyor.
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    // Kullanıcının sisteme giriş yapıp yapmadığını belirten bir özellik.
    public var isSignedIn: Bool {
        
        // Eğer `currentUser` nil değilse, kullanıcı sisteme giriş yapmış demektir.
        return Auth.auth().currentUser != nil
    }
}
