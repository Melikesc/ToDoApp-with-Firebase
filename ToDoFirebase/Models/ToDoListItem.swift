//
//  ToDoListItem.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//
import Foundation

// Identifiable, her nesnenin benzersiz bir şekilde tanımlanmasını sağlar.
struct ToDoListItem: Codable, Identifiable { 
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool

    // `isDone` özelliğini güncelleyen bir fonksiyon. Görevin tamamlanıp tamamlanmadığı bilgisini ayarlar.
    // mutating anahtar kelimesi, bir struct veya enum içindeki metotların, o yapıların özelliklerini değiştirebilmesine izin vermek için kullanılır.
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
