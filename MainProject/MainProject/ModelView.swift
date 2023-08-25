//
//  ModelView.swift
//  MainProject
//
//  Created by Student08 on 22/08/23.
//

import Foundation

struct Contatos:Codable,Hashable{
    var name:String?
    var number: String?
    var main: Bool?
}

struct Diario:Codable,Hashable{
    var date_note: String?
    var visible: Bool?
    var text: String?
    var name_note: String?
}

struct playlist:Codable,Hashable{
    var name: String
    var picmain:String
    var songs: [song]?
}

struct song:Codable,Hashable{
    var name: String
    var path: String
    var pic: String
    var id  : String
}


struct Usuario:Codable,Hashable{
    var _id : String?
    var _rev : String?
      var name_user : String?
      var date_create : String?
      var acompanhamento: Bool?
      var diario: [Diario]
      var emergency_contact: [Contatos]
      var playlist: [playlist]?
   }

