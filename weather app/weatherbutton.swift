//
//  weatherbutton.swift
//  weather app
//
//  Created by Ashel D Souza on 23/05/23.
//
import SwiftUI


struct weatherbutton: View{
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width:280 ,height: 60)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,weight: .bold, design: .default))
            .cornerRadius(10)


        

        
    }
}

