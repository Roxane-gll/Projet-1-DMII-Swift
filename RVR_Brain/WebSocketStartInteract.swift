//
//  WebSocketStartInteract.swift
//  RVR_Brain
//
//  Created by RG on 10/01/2024.
//

import Foundation

struct WebSocketStartInteract: Encodable {
    var name="interact"
    var value=[String:String]()
}

extension WebSocketStartInteract {
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
}
