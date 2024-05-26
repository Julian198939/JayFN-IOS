//
//  ProductCardView.swift
//  Jay
//
//  Created by Pocky on 2023/8/14.
//

import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cartManager : CartManager
    var product: Product
    var body: some View {
        ZStack {
            Color("jSecondary")
            
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .leading) {
                    Image(product.image)
                        .resizable()
                        .frame(width: 130,height: 130)
                        .cornerRadius(12)
                        
                    
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical,1)
                    
                    Text(product.supplier)
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(.vertical,0.5)
                    Text("$\(product.price)")
                        .foregroundColor(.black)
                        .bold()
                }
                
                    Button{
                        cartManager.addToCart(product: product)
                    } label:{
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(Color("jPrimary"))
                            .frame(width: 30,height: 30)
                            .padding(.trailing)
                    }
                }
        
        }
        .frame(width: 170,height: 240)
        .cornerRadius(15)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: productList[0])
            .environmentObject(CartManager())
    }
}
