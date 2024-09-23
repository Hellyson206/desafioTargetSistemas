//
//  ContentView.swift
//  InversorString
//
//  Created by Hellyson Barbosa on 23/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputString: String = ""
    @State private var reversedString: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Inversor de String")
                .font(.largeTitle)
                .bold()

            TextField("Digite uma string", text: $inputString)
                .padding()
                .border(Color.gray, width: 1)

            Button(action: {
                reversedString = inverterString(inputString)
            }) {
                Text("Inverter")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Text("String invertida: \(reversedString)")
                .padding()
                .multilineTextAlignment(.center)
        }
        .padding()
    }

    func inverterString(_ string: String) -> String {
        var resultado = ""
        let count = string.count
        
        // Loop para acessar os caracteres da string do último ao primeiro
        for index in 0..<count {
            let i = string.index(string.startIndex, offsetBy: count - 1 - index)
            resultado.append(string[i]) // Adiciona o caractere na ordem inversa
        }
        
        return resultado
    }
}

