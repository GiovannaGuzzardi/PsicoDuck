//
//  ContentView.swift
//  MainProject
//
//  Created by Student09 on 21/08/23.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ContentView: View {
    @StateObject var view = Model()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                    ForEach(view.data , id: \.self){
                        value in
                        VStack {
                            Text("Seja bem vinda, \(value.name_user!)").font(.title2).foregroundColor(.white)
                        }
                    
                    }.padding()
                    
        
                
                .frame(maxWidth: .infinity)
                VStack(spacing: 40){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 1)
                            .frame(height: .infinity, alignment: .center)
                            .background(.white)
                        HStack{
                            Spacer()
                            Image(systemName: "note.text")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(30)
                        }
                        NavigationLink(destination : CardDiario() ){
                            VStack{
                                Text("Diario").font(.title2)
                                    .foregroundColor(Color.primary)
                            }
                            .frame(
                                maxWidth: 260,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                            .background(Color("branco2"))
                            .hoverEffect(.lift)
                            Spacer()
                        }
                    }.cornerRadius(15)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 1)
                            .frame(height: .infinity, alignment: .center)
                            .background(.white)
                        HStack{
                            Spacer()
                            Image(systemName: "stairs")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(30)
                        }
                        NavigationLink(destination : exemplo() ){
                            VStack{
                                Text("Estatisticas").font(.title2)
                                    .foregroundColor(Color.primary)
                            }
                            .frame(
                                maxWidth: 260,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                            .background(Color("branco2"))
                            .hoverEffect(.lift)
                            Spacer()
                        }
                    }.cornerRadius(15)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 1)
                            .frame(height: .infinity, alignment: .center)
                            .background(.white)
                        HStack{
                            Spacer()
                            Image(systemName: "figure.step.training")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .padding(30)
                        }
                        NavigationLink(destination : exemplo() ){
                            VStack{
                                Text("desafios").font(.title2).foregroundColor(Color.primary)
                            }
                            .frame(
                                maxWidth: 260,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                            .background(Color("branco2"))
                            .hoverEffect(.lift)
                            Spacer()
                        }
                    }.cornerRadius(15)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 1)
                            .frame(height: .infinity, alignment: .center)
                            .background(.red)
                        NavigationLink(destination : emergencia() ){
                            VStack{
                                Text("Emergência").font(.title2)
                            }
                            .frame(
                                maxWidth: 260,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                            .background(.red)
                            .hoverEffect(.lift)
                            Spacer()
                        }
                    }.cornerRadius(100)
                }
                .padding()
            }
            .tint(.white)
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(Color("azul1"))
        }
        .onAppear{
                        view.fetch()
            
                    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
