//
//  ContentView.swift
//  Calculo de faturamento
//
//  Created by Hellyson Barbosa on 23/09/24.
//

import SwiftUI

struct Faturamento: Codable { // Objeto criado como model do json
    let dia: Int
    let valor: Double
}

struct ContentView: View {
    @State private var menorValor: Double = 0.0
    @State private var maiorValor: Double = 0.0
    @State private var diasAcimaMedia: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Faturamento Diário")
                .bold()
                .font(.largeTitle)

            Text("Menor valor: \(String(format: "%.2f", menorValor))")
            Text("Maior valor: \(String(format: "%.2f", maiorValor))")
            Text("Dias acima da média: \(diasAcimaMedia)")
        }
        .padding()
        .onAppear(perform: calcularFaturamento)
    }

    func calcularFaturamento() {
        guard let url = Bundle.main.url(forResource: "faturamento", withExtension: "json") else {
            print("Arquivo JSON não encontrado")
            return
        }

        do {// e aqui vem o do catch para decodificar o json,
            // dando certo ele exibe os valores nos campos
            let data = try Data(contentsOf: url)
            let faturamentos = try JSONDecoder().decode([Faturamento].self, from: data)

            //Filtrei os dias para que ele ignore os que não tiveram faturamento
            let valores = faturamentos.map { $0.valor }.filter { $0 > 0 }
            
            // Calculo do menor e do maior,
            menorValor = valores.min() ?? 0.0
            maiorValor = valores.max() ?? 0.0
            
            // Calcula a média
            let media = valores.reduce(0, +) / Double(valores.count)
            
            // Uma vez encontrada eu conto os dias acima da média
            diasAcimaMedia = valores.filter { $0 > media }.count

        } catch {
            print("Erro ao ler o arquivo JSON: \(error)")
        }
    }
}
