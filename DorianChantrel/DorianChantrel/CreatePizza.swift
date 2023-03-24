//
//  CreatePizza.swift
//  DorianChantrel
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct CreatePizza: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var pizzaList: [Pizza]
    
    @State private var nombreParts = 1
    @State private var tomate = false
    @State private var fromage = false
    @State private var cornichon = false
    @State private var commentaire = ""
    
    var body: some View {
        VStack{
            HStack {
                Text("Nombre de parts : \(nombreParts)")
                Stepper("", value: $nombreParts, in: 1...12)
            }
            Toggle("Base sauce tomates ? 🍅", isOn: $tomate)
            Toggle("Supplément fromage ? 🧀", isOn: $fromage)
            Toggle("Supplément cornichons ? 🥒", isOn: $cornichon)
            TextField("Commentaire...", text: $commentaire)
                .padding(6)
                .foregroundColor(.black)
                .border(.black)
            Button{
                let newPizza = createPizza()
                addNewPizza(pizza: newPizza)
                // Faire disparaitre la modale
                dismiss()
            }label: {
                Text("Commander")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(.black)
            }
        }
        .padding(15)
    }
    
    private func createPizza() -> Pizza {
        
        return Pizza(
            nombreParts: nombreParts,
            tomate: tomate,
            fromage: fromage,
            cornichon: cornichon,
            commentaire: commentaire
        )
    }
    
    private func addNewPizza(pizza: Pizza) {
        pizzaList.append(pizza)
    }
    
}

struct CreatePizza_Previews: PreviewProvider {
    static var previews: some View {
        CreatePizza(pizzaList: .constant([]))
    }
}
