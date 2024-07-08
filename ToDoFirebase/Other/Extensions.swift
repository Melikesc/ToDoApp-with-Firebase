//
//  Extensions.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import Foundation

extension Encodable {
    
    // Bu fonksiyon, `Encodable` tipinin nesnelerini sözlük (dictionary) formatına çevirir.
    func asDictionary() -> [String: Any] {
        // JSON veri tipine çevriliyor
        guard let data = try? JSONEncoder().encode(self) else {
            // Eğer veri JSON'a çevrilemezse, boş bir sözlük döndürülür.
            return [:]
        }
        
        do {
            // JSON verisi sözlük tipine çevriliyor.
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            // Eğer çevirme işlemi başarılıysa, oluşturulan sözlüğü döndür.
            return json ?? [:]
        } catch {
            // Bir hata oluşursa boş bir sözlük döndür.
            return [:]
        }
    }
}
