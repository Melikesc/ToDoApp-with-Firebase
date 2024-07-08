//
//  NewItemViewViewModel.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

// Yeni yapılacaklar listesi öğesi için ViewModel
class NewItemViewViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAlert = false 

    
    init() {}
    
    // Yeni öğeyi kaydeder
    func save(){
        // Kaydetme işlemine devam edip edemeyeceğini kontrol et
        guard canSave else {
            return
        }
        
        // Aktif kullanıcının ID'sini al
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Yeni bir öğe oluştur
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
       
        // Yeni öğeyi veritabanına kaydet
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    // Kaydetme koşullarını kontrol eder
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
        
    }
    
}
