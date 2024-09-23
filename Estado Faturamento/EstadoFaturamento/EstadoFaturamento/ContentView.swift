//
//  ContentView.swift
//  EstadoFaturamento
//
//  Created by Hellyson Barbosa on 23/09/24.
//

import SwiftUI

struct EstadoFaturamento {
    let nome: String
    let valor: Double
}

struct ContentView: View {
    let faturamentos: [EstadoFaturamento] = [
        EstadoFaturamento(nome: "SP", valor: 67836.43),
        EstadoFaturamento(nome: "RJ", valor: 36678.66),
        EstadoFaturamento(nome: "MG", valor: 29229.88),
        EstadoFaturamento(nome: "ES", valor: 27165.48),
        EstadoFaturamento(nome: "Outros", valor: 19849.53)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Faturamento Mensal por Estado")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
            
            ForEach(faturamentos, id: \.nome) { estado in
                let percentual = calcularPercentual(valor: estado.valor)
                Text("\(estado.nome): \(String(format: "%.2f", percentual))%")
            }
        }
        .padding()
    }
    
    func calcularPercentual(valor: Double) -> Double {
        let total = faturamentos.reduce(0) { $0 + $1.valor }
        return (valor / total) * 100
    }
}
