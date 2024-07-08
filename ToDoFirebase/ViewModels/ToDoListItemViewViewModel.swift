//
//  ToDoListItemViewViewModel.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

// Her bir yapılacaklar listesi öğesi için ViewModel.
/// Primary tab
class ToDoListItemViewViewModel: ObservableObject {
    
   
    
    init() {}
    
    // Yapılacak işin tamamlanma durumunu değiştir
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        // İşaretlenme durumunu tersine çevir
        itemCopy.setDone(!item.isDone)
        
        // Kullanıcının kimliğini kontrol et
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Firestore veritabanı bağlantısı
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }

    
}
