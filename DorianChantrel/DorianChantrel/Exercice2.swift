//
//  Exercice2.swift
//  DorianChantrel
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct Exercice2: View {
    
    @State private var isShowingCreatePizza = false
    
    class PizzaData: ObservableObject {
        @Published var pizza: [Pizza]
        
        init(pizza: [Pizza]) {
            self.pizza = pizza
        }
    }
    
    @StateObject var pizzaData: PizzaData = PizzaData(pizza: Pizza.preview)
    
    var body: some View {
        List{
            ForEach(pizzaData.pizza) { pizza in
                PizzaCellView(pizza: pizza)
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                isShowingCreatePizza = true
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(.blue)
                    )
                    .shadow(radius: 10, y: 5)
            }
            .padding()
        }
        .sheet(isPresented: $isShowingCreatePizza) {
            CreatePizza(pizzaList: $pizzaData.pizza)
        }
    }
}

struct Exercice2_Previews: PreviewProvider {
    static var previews: some View {
        Exercice2()
    }
}
