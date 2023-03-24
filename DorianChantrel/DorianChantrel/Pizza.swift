//
//  Pizza.swift
//  DorianChantrel
//
//  Created by Cours on 24/03/2023.
//

import Foundation

class Pizza: Identifiable, ObservableObject {
    let id = UUID()
    let nombreParts: Int
    let tomate: Bool
    let fromage: Bool
    let cornichon: Bool
    let commentaire: String?
    
    init(nombreParts: Int, tomate: Bool, fromage: Bool, cornichon: Bool, commentaire: String?) {
        self.nombreParts = nombreParts
        self.tomate = tomate
        self.fromage = fromage
        self.cornichon = cornichon
        self.commentaire = commentaire
    }
}

extension Pizza {
    static let preview = [
        Pizza(nombreParts: 8, tomate: true, fromage: false,cornichon: true, commentaire: "Ceci est un commentaire"),
        Pizza(nombreParts: 6, tomate: false, fromage: false,cornichon: true, commentaire: "Miam miam la pizza"),
        Pizza(nombreParts: 12, tomate: true, fromage: true,cornichon: true, commentaire: "Miam miam la pizza"),
    ]
}
