//
//  WebSocketMessage.swift
//  RVR_Brain
//
//  Created by RG on 09/01/2024.
//

import Foundation

struct WebSocketMessage: Encodable, Decodable, Equatable {
    var name: String
    var value: String
    var idInput: String?
}

extension WebSocketMessage {
    // Convertir l'objet en JSON et ensuite en String
    func toJsonString() -> String? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            print("Erreur lors de la conversion en JSON : \(error.localizedDescription)")
            return nil
        }
    }
    
    // Convertir JSON en objet
    static func fromJson(jsonString: String) -> WebSocketMessage? {
        do {
            let jsonData = jsonString.data(using: .utf8)!
            let decodedObject = try JSONDecoder().decode(WebSocketMessage.self, from: jsonData)
            return decodedObject
        } catch {
            print("Erreur lors de la conversion de JSON en objet : \(error.localizedDescription)")
            return nil
        }
    }
}
