//
//  SearchView.swift
//  MainProject
//
//  Created by Student08 on 23/08/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack{
            HStack{
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                Spacer()
            }
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
