//
//  NodeDiario.swift
//  MainProject
//
//  Created by Student08 on 24/08/23.
//

//
//  Diario.swift
//  telaDeAjuda
//
//  Created by Student02 on 22/08/23.
//

import SwiftUI
struct NewDiario: View {
    var choise : Diario
    
    @State var texto = ""
    @State var data  = ""
    
    var date: Date
    
    @State var n = 0

    var dateFormato = DateFormatter()
    
    @StateObject var view = Model()
    
    @State var Auxiliar = Usuario(diario : [] , emergency_contact: [])

    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .center){
                    TextField("Titulo",text: $data ).foregroundColor(.black)
                    Rectangle()
                        .frame(height:0.5)
                        .background(.gray)
                    HStack{
                        Text(date, format: .dateTime.day().month().year())
                        Spacer()
                        Text(date, format: .dateTime.hour().minute())
                    }
                    .foregroundColor(.black)
                    TextEditor(
                        text: $texto).foregroundColor(.black)
                    Spacer()
                        
                }
                VStack{
                    
                    HStack{
                    
                        Spacer()
                            
                            Button(){
                                if let index = Auxiliar.diario.firstIndex(of: choise){
                                    Auxiliar.diario[index].name_note =  data
                                    Auxiliar.diario[index].text =  texto
                                    view.update(usuario: Auxiliar)
                                    
                                } else {
                                    Auxiliar.diario.append( Diario(
                                        date_note: "" ,
                                        visible: false ,
                                        text: texto,
                                        name_note: data
                                    )
                                                            
                                    )
                                    
                                    view.update(usuario: Auxiliar)
                                }
                                
                            }
                            
                        label: {
                            Text("Salvar")
                        }
                        .background(.blue)
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        .tint(.black)
                            
                        }
                        
                    }
                    
                }
                .padding(10)
                
            }
            .onAppear(){
                dateFormato.dateFormat = "dd/MM/yyyy"
                texto = choise.text!
                data = choise.name_note!
                
                view.fetch()
                
                Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                    Auxiliar = view.data.first!
                }
            }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: .infinity)
        }
        
       
    }


struct NewDiario_Previews: PreviewProvider {
    static var previews: some View {
        NewDiario(choise: Diario(
            date_note: "",
            visible: false ,
            text: "",
            name_note: ""
        ),date: Date.now)
    }
}

