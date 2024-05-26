//
//  CartView.swift
//  Jay
//
//  Created by Pocky on 2023/8/15.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0{
                ForEach(cartManager.products, id: \.id){product in
                    CartProductView(product: product)
                }
                HStack{
                    Text("Your Total is ")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                    
                    
                }
                .padding()
                
                PaymentButton(action: {})
                    .padding()
            }else {
                
                Text("Your Cart is Empty")
    
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
