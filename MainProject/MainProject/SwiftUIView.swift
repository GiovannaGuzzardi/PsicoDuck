//
//  SwiftUIView.swift
//  ProjetoFInal
//
//  Created by Student08 on 21/08/23.
//

import SwiftUI
import AVKit
struct SwiftUIView: View {
    @State var play = "play.circle.fill"
    @State var p : playlist?
    @State var musicNow = song(name: "nome da musica", path: "taylor", pic: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fge.globo.com%2Feu-atleta%2Ftreinos%2Fnoticia%2Fnove-dicas-de-meditacao-para-iniciantes.ghtml&psig=AOvVaw3qvpFNaYtLiGMeOi5hFBpG&ust=1692727111890000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMj9n4Oq7oADFQAAAAAdAAAAABAE",id: "jfkldsajk;lfjdksalj");
    @State  var sound = Bundle.main.path(forResource: "taylor", ofType: "mp3")
    @State var songs = [
        song(name: "nome da musica", path: "tomp3.cc - Katy Perry Dark Horse ft Juicy J", pic: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fge.globo.com%2Feu-atleta%2Ftreinos%2Fnoticia%2Fnove-dicas-de-meditacao-para-iniciantes.ghtml&psig=AOvVaw3qvpFNaYtLiGMeOi5hFBpG&ust=1692727111890000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMj9n4Oq7oADFQAAAAAdAAAAABAE",id: "jfkldsajk;lfjdksalj")
    ]
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        VStack(){
            VStack{
                Spacer()
                ScrollView(.vertical, showsIndicators: false, content:  {
                    HStack{
                        VStack{
                            AsyncImage(url: URL(string: p?.picmain ?? "")){ image in
                                image
                                    .resizable()
                            }placeholder: {
                                Color.gray
                            }
                            .frame(width: 150, height: 150)
                            Text(p?.name ?? "")
                                .font(.system(size: 30))
                        }
                    }
                    
                    ForEach(p?.songs! ?? songs, id: \.self){ song in
                        VStack{
                            Button{
                               musicNow = song
                                sound = Bundle.main.path(forResource: musicNow.path, ofType: "mp3")
                                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                            } label: {
                                
                                    ZStack{
                                        
                                        Rectangle()
                                            .frame(width: 400, height: 100)
                                            .foregroundColor(Color("azulCinza"))
                                            .cornerRadius(20)
                                        
                                        ZStack{
                                            
                                            HStack{
                                                VStack{
                                                    Spacer()
                                                    HStack{
                                                        AsyncImage(url: URL(string: song.pic )){ image in
                                                            image
                                                                .resizable()
                                                        }placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 100, height: 100)
                                                        Spacer()
                                                    }.ignoresSafeArea()
                                                    Spacer()
                                                }
                                                Spacer()
                                            }
                                            Text(song.name )
                                                .colorInvert()
                                                .font(.system(size: 25))
                                        }.padding(.horizontal, 20.0)
                                        
                                    
                                }
                               
                            }
                        }.frame(width: 350, height: .infinity)
                    }
                    
                })
            }
            
            //.frame(maxWidth:.infinity, maxHeight: .infinity)
            Spacer()
            
                ZStack{
                    Rectangle()
                        .frame(width: 380, height: 70)
                        .foregroundColor(Color("azulCinza"))
                        
                    HStack{
                        VStack{
                            
                            AsyncImage(url: URL(string: musicNow.pic )){ image in
                                image
                                    .resizable()
                            }placeholder: {
                                Color.gray
                            }
                            .frame(width: 70, height: 70)
                        }.padding(.top, 20)
                        Spacer()
                    }.padding([.leading, .bottom, .trailing], 20.0)
                    VStack{
                        Text(musicNow.name )
                            .font(.system(size: 25))
                            .bold()
                    }
                    
                    HStack{
                        Spacer()
                        Button{
                            if(play == "play.fill"){
                                play = "pause.fill"
                                self.audioPlayer.play()
                            }else{
                                play = "play.fill"
                                self.audioPlayer.pause()
                            }
                        }
                    label: {
                        
                        Spacer()
                        Image(systemName: play)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }.padding()
                        
                    
                }
                }.offset(y:20)
        }
        .onAppear {
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
//        .ignoresSafeArea()
        .foregroundColor(.blue)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView( p: playlist(name: "exercicio de respiracao", picmain: "https://zenklub.com.br/blog/wp-content/uploads/2021/04/iStock-1139912908-1.jpg", songs: [
            song( name: "taylor", path: "taylor", pic: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fge.globo.com%2Feu-atleta%2Ftreinos%2Fnoticia%2Fnove-dicas-de-meditacao-para-iniciantes.ghtml&psig=AOvVaw3qvpFNaYtLiGMeOi5hFBpG&ust=1692727111890000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMj9n4Oq7oADFQAAAAAdAAAAABAE",id: "jfkldsajk;lfjdksalj"),
            song(name: "dormir", path: "dormir", pic: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fge.globo.com%2Feu-atleta%2Ftreinos%2Fnoticia%2Fnove-dicas-de-meditacao-para-iniciantes.ghtml&psig=AOvVaw3qvpFNaYtLiGMeOi5hFBpG&ust=1692727111890000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMj9n4Oq7oADFQAAAAAdAAAAABAE",id: "jfkldsajk;lfjdksalj"),
            song( name: "katy", path: "katy", pic: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fge.globo.com%2Feu-atleta%2Ftreinos%2Fnoticia%2Fnove-dicas-de-meditacao-para-iniciantes.ghtml&psig=AOvVaw3qvpFNaYtLiGMeOi5hFBpG&ust=1692727111890000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMj9n4Oq7oADFQAAAAAdAAAAABAE",id: "jfkldsajk;lfjdksalj")
      
            
            
        ]));
    }
}
