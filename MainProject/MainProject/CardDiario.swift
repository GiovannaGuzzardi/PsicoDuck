//
//  CardDiario.swift
//  MainProject
//
//  Created by Student08 on 24/08/23.
//

//
//  CardDiario.swift
//  telaDeAjuda
//
//  Created by Student02 on 22/08/23.
//

import SwiftUI

struct CardDiario: View {
    @StateObject var view = Model()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Text("Diário")
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                HStack(){
                    Spacer()
                    NavigationLink(destination: NewDiario(choise: Diario(
                         date_note: "",
                        visible: false,
                         text: "",
                         name_note: ""
                    ), date: Date.now)){
                        Image(systemName: "folder.fill.badge.plus")

                    }.padding([.top, .trailing], 20)
                    }
            }
            HStack(){
                Spacer()
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack {
                        ForEach(view.data , id: \.self){
                            obj in
                            ForEach(obj.diario, id: \.self){
                                note in
                                NavigationLink(destination: NoteDiario(choise: note, date: Date.now)){
                                    ZStack{
                                        Rectangle()
                                        .foregroundColor(Color.black.opacity(0.2))
                                        .frame(height: 50.00)
                                    HStack{
                                        Text(note.name_note!)
                                            .foregroundColor(.white)
                                        Spacer()
                                    }.padding()
                                }
                                }
                            }
                        }
                    }
                        
                })
                
            }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(.blue)
            
        }
        .onAppear{
                        view.fetch()
            
                    }
    }
}

struct CardDiario_Previews: PreviewProvider {
    static var previews: some View {
        CardDiario()
    }
}
