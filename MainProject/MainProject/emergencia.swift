//
//  emergencia.swift
//  MainProject
//
//  Created by Student09 on 21/08/23.
//

import Foundation
import SwiftUI


//                        NavigationLink(destination: SwiftUIView(play: view.UserNow(num: 0).playlist?.first)){
//
                
              
                               
struct emergencia: View {
    @StateObject var view = Model()
    var body: some View {
        NavigationStack{
//            titulo
            Text("Emergencia")
                .font(.callout)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            //botao de emergencia
            HStack(){
                Spacer()
                VStack{
                    Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 1)
                                .frame(height: .infinity, alignment: .center)
                                .background(.white)
                            HStack{
                                Spacer()
                                Image("Image1")
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                    .padding(20)
                                
                            }
                            NavigationLink(destination : ContatosView() ){
                                VStack{
                                    Text("Contato de Emergência").font(.title2).foregroundColor(Color.primary)
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
                    Spacer()
//                    playlists


                            ForEach(view.data, id: \.self){ tex in
                                ForEach(tex.playlist!, id: \.self){ tex2 in
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.white, lineWidth: 1)
                                            .frame(height: .infinity, alignment: .center)
                                            .background(.white)
                                        HStack{
                                            Spacer()
                                            AsyncImage(url: URL(string: tex2.picmain)){ image in
                                                image
                                                    .resizable()
                                            }placeholder: {
                                                Color.gray
                                            }
                                                .frame(width: 50,height: 60)
                                                .padding(20)
                                            
                                        }
                                        NavigationLink(destination : SwiftUIView(p: tex2) ){
                                            VStack{
                                                Text(tex2.name).font(.title2).foregroundColor(Color.primary)
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
                                }
                            }
                        
                        
                        Spacer()
                }
                
            }
                    .onAppear{
                        view.fetch()
                    }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(Color("azulCinza"))
            
        }

    }
}

struct emergencia_Previews: PreviewProvider {
    static var previews: some View {
        emergencia()
    }
}

