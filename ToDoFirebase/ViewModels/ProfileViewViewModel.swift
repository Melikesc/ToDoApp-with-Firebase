//
//  ProfileViewViewModel.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

// Bu sınıf, kullanıcı profil bilgilerini yönetir.
class ProfileViewViewModel: ObservableObject {
    init() {}
    
    // Kullanıcı bilgilerini saklar. Eğer kullanıcı bilgisi yoksa `nil` değer alır.
    @Published var user: User? = nil
    
    // Firestore'dan mevcut kullanıcının bilgilerini çeker.
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Firestore veritabanı referansı.
        let db = Firestore.firestore()
        
        // 'users' koleksiyonundaki belirli bir kullanıcıya ait belgeyi getirir.
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            // Ana iş parçacığı üzerinde kullanıcı bilgilerini günceller.
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    
    
    // Kullanıcı oturumunu sonlandırma işlevi.
    func logOut(){
        do {
            try  Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
