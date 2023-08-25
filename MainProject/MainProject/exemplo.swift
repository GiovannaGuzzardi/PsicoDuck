import SwiftUI

struct exemplo: View {
    var body: some View {
        VStack{
            Text("Tela em manutenção")
        }
    }
}


// eu coloco o choise como se foesse um exemplo de argumento que ele pode receber
struct exemplo_Previews: PreviewProvider {
    static var previews: some View {
        exemplo()
    }
}
