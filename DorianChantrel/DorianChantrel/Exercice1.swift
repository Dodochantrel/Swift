//
//  Exercice1.swift
//  DorianChantrel
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct Exercice1: View {
    @State var buttonEnabled = true
    
    func changeState(){
        buttonEnabled.toggle()
    }
    
    var body: some View {
        Button{
            changeState()
        }label: {
            Text("My Button")
        }
        .padding(10)
        .background(buttonEnabled ? Color.black : Color.white)
        .foregroundColor(buttonEnabled ? Color.white : Color.black)
        .border(.black)
    }
}

struct Exercice1_Previews: PreviewProvider {
    static var previews: some View {
        Exercice1()
    }
}
