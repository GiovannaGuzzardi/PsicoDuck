//
//  ContatosView.swift
//  MainProject
//
//  Created by Student08 on 24/08/23.
//

import SwiftUI

struct ContatosView: View {
    @StateObject var viewModel = Model()
    @State private var showingSheet = false
    @State var Auxiliar = Usuario(diario: [], emergency_contact: [])
    var body: some View {
        VStack {
            VStack{
                Text("Contatos")
                    .font(.largeTitle)
                ForEach(viewModel.data, id: \.self){ usuariofinal in
                    ForEach(usuariofinal.emergency_contact , id: \.self){ contato in
                       
                        let urlTest = URL(string: "https://wa.me//"+contato.number!+"?text=Preciso%20de%20ajuda!")!
                        HStack{
                            Button(action: {
                                UIApplication.shared.open(urlTest,options: [:], completionHandler:nil)
                            }) {
                                HStack{
                                    Text(contato.name!)
                                        .foregroundColor(.black)
                                        .padding()
                                }
                            }
                          Image(systemName:"trash.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .onTapGesture{
                                    var usuario = usuariofinal
                                    if let index = usuario.emergency_contact.firstIndex(of: contato) {
                                        usuario.emergency_contact.remove(at: index)
                                    }
                                    viewModel.update(usuario: usuario)
                                    viewModel.fetch()
                                }
                        }.background(.cyan)
                            .cornerRadius(10)
                    }
                    Spacer()
                    Image(systemName:"person.crop.circle.fill.badge.plus")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                        .onTapGesture{
                            showingSheet.toggle()
                        }
                    
                   //
                    
                }.sheet(isPresented: $showingSheet){
                    SheetView(usuario: $Auxiliar)
                 }
                }.onAppear{
                    viewModel.fetch()
                    
                    Timer.scheduledTimer(withTimeInterval: 5, repeats: true){_ in
                        viewModel.fetch()
                        Auxiliar = viewModel.data.first!
                    }
                    
                }
            }
        }
        
    }

struct SheetView: View {
    @Binding var usuario:Usuario
    @StateObject var viewModel = Model()
    @State private var name: String = ""
    @State private var number: String = ""
    @State private var main = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            VStack{
                Text("Nome:")
                TextField(
                    "Nome do contato",
                    text: $name
                )
            }.padding()
            VStack{
                Text("Numero:")
                TextField(
                    "Numero do contato",
                    text: $number
                )
            }.padding()
            VStack{
                Toggle("Contato Principal", isOn: $main)
            }.padding()
                Spacer()
            HStack{
                Button("Cancelar") {
                    dismiss()
                }
                Spacer()
                Button("Adicionar") {
                    let contato = Contatos(name:name,number:number,main:main)
                    usuario.emergency_contact.append(contato)
                    viewModel.update(usuario: usuario)
                    dismiss()
                }
            }.padding()
        }    }
}


struct Contatos_Previews: PreviewProvider {
    static var previews: some View {
        ContatosView()
    }
}

