//
//  PizzaCellView.swift
//  DorianChantrel
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct PizzaCellView: View {
    
    @ObservedObject var pizza: Pizza
    
    var body: some View {
        VStack(alignment: .leading){
            Text(String(pizza.nombreParts) + " parts")
                .multilineTextAlignment(.leading)
            HStack {
                if pizza.tomate == true{
                    Text("🍅")
                        .multilineTextAlignment(.leading)
                }
                if pizza.fromage == true{
                    Text("🧀")
                        .multilineTextAlignment(.leading)
                }
                if pizza.cornichon == true{
                    Text("🥒")
                        .multilineTextAlignment(.leading)
                }
            }
            Text(pizza.commentaire ?? "")
                .multilineTextAlignment(.leading)
        }
    }
}

struct PizzaCellView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaCellView(pizza: Pizza.preview.first!)
    }
}
