//
//  PizzaDetailView.swift
//  DorianChantrel
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct PizzaDetailView: View {
    @ObservedObject var pizza: Pizza
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PizzaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaDetailView(pizza: Pizza.preview.first!)
    }
}
