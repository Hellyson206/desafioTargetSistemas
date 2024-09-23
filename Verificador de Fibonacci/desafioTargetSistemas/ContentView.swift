import SwiftUI

struct DesafioTargetSistemas: View {
    @State private var inputNumber: String = ""
    @State private var resultMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Verificador de Fibonacci")
                .font(.largeTitle)
                .bold()
                .padding()

            TextField("Digite um número", text: $inputNumber)
                .padding()
                .border(Color.gray, width: 1)
                .keyboardType(.numberPad)

            Button(action: {
                if let number = Int(inputNumber) {
                    resultMessage = pertenceFibonacci(number) ?
                        "O número \(number) pertence à sequência de Fibonacci." :
                        "O número \(number) não pertence à sequência de Fibonacci."
                } else {
                    resultMessage = "Por favor, insira um número válido."
                }
            }) {
                Text("Verificar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Text(resultMessage)
                .padding()
                .multilineTextAlignment(.center)
        }
        .padding()
    }

    func pertenceFibonacci(_ n: Int) -> Bool {
        var a = 0
        var b = 1
        
        while a <= n {
            if a == n {
                return true
            }
            let temp = a
            a = b
            b = temp + b
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DesafioTargetSistemas()
    }
}

