//
//  WelcView.swift
//  iExpense
//
//  Created by Yashraj jadhav on 15/07/23.
//

import SwiftUI

struct WelcView: View {
    
    @State private var isNextViewActive = false
    var body: some View {
        NavigationView{
            VStack{
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 360, height: 389)
                        .background(
                            Image("WelcIMg")
                                .resizable()
                                .aspectRatio(contentMode : .fill)
                                .frame(width: 360, height: 389)
                                .clipped()
                            
                            
                        )
                        .cornerRadius(40)
                }
                .padding(.vertical)
                
                Text("Simple solution for your budget.")
                    .font(
                        Font.custom("Inter", size: 30)
                            .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 283, height: 69, alignment: .topLeading)
                    .padding(.all , 50)
                Spacer()
                
                ZStack{
                    
                    Text("Counter and distribute the income correctly...")
                    .font(Font.custom("Inter", size: 16))
                        .foregroundColor(.black)
                }
                
               Spacer()
                
                Button(action: {
                    isNextViewActive = true
                }) {
                    Text("Continue")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 35)
                                .fill(Color.pink)
                        )
                    
                    
                    NavigationLink(destination: ContentView(), isActive: $isNextViewActive) {
                        EmptyView()
                    }
                }
            }
            .navigationTitle("iExpense")
        }
        
    }
    
}


struct WelcView_Previews: PreviewProvider {
    static var previews: some View {
        WelcView()
    }
}
