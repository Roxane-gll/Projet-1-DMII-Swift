//
//  RoverMessage.swift
//  RVR_Brain
//
//  Created by digital on 12/01/2024.
//

import Foundation


struct RoverMessage : Encodable, Decodable {
    var action:String
}

extension RoverMessage {
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
    static func fromJson(jsonString: String) -> RoverMessage? {
        do {
            let jsonData = jsonString.data(using: .utf8)!
            let decodedObject = try JSONDecoder().decode(RoverMessage.self, from: jsonData)
            return decodedObject
        } catch {
            print("Erreur lors de la conversion de JSON en objet : \(error.localizedDescription)")
            return nil
        }
    }
}


struct RoverReturn : Decodable, Equatable {
    var position:Double
    
    // Convertir JSON en objet
    static func fromJson(jsonString: String) -> RoverReturn? {
        do {
            let jsonData = jsonString.data(using: .utf8)!
            let decodedObject = try JSONDecoder().decode(RoverReturn.self, from: jsonData)
            return decodedObject
        } catch {
            print("Erreur lors de la conversion de JSON en objet : \(error.localizedDescription)")
            return nil
        }
    }
}
    
