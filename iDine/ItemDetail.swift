//
//  ItemDetail.swift
//  iDine
//
//  Created by Michael O'Connor on 10/27/19.
//  Copyright © 2019 Michael O'Connor. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
            .padding()
            
            Button("Order This") {
                self.order.add(item: self.item)
            }.font(.headline)
               // .font(.bold)
            .padding(10)
//            .background(Color.purple)
//                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            //.padding()
            .foregroundColor(.white)
            //.padding()
            //.border(Color.purple, width: 5)
            .padding(10)
//                .overlay(RoundedRectangle(cornerRadius: 40)
//                    .stroke(Color.purple, lineWidth: 5))
            .overlay(RoundedRectangle(cornerRadius: 40)
                             .stroke(Color("DarkGreen"), lineWidth: 5))
            
            
            Spacer()
            
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
