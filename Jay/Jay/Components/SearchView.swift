//
//  SearchView.swift
//  Jay
//
//  Created by Pocky on 2023/8/14.
//

import SwiftUI

struct SearchView: View {
    @State private var search:String = ""
    var body: some View {
        HStack {
            HStack {
                Image(systemName:"magnifyingglass")
                    .padding(.leading)
                
                TextField("Search For Your favorite",text: $search)
                    .padding()
            }
            .background(Color("jSecondary"))
            .cornerRadius(22)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color("jPrimary"))
                .cornerRadius(12)
        }
            .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
