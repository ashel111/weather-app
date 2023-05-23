//
//  ContentView.swift
//  weather app
//
//  Created by Ashel D Souza on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isnight = false
    var body: some View {
        ZStack {
            //            Color(.blue)
            //   .edgesIgnoringSafeArea(.all) , for colouring entire area
            backgroundView(isnight:  $isnight) // $does binding
            
            VStack{
                
                
                citytextView(cityname: "Mangalore,Karnataka")

                Spacer()
                
            } //for all the ui elements
            mainweatherView(imagename: isnight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 26)
            
            .padding(.bottom,300)
           


            
          
            
            HStack(spacing: 30){
                
                weatherview(dayoftheweek: "TUE",
                            imageName: "cloud.drizzle.fill",
                            temperature: 25)
                
                weatherview(dayoftheweek: "WED",
                            imageName: "sun.max.fill",
                            temperature: 29)

                weatherview(dayoftheweek: "THU",
                            imageName: "cloud.sun.rain.fill",
                            temperature: 27)
                
                weatherview(dayoftheweek: "FRI",
                            imageName: "cloud.drizzle.fill",
                            temperature: 28)
                
                weatherview(dayoftheweek: "SAT",
                            imageName: "cloud.bolt.rain.fill",
                            temperature: 26)
                


                
                
            }
            .padding(.top,280)

            Spacer()
            
            Button{
                isnight.toggle()
                print("tapped") //what the button does
                
            }label: {
                weatherbutton(title: "change day time", textColor: .blue, backgroundColor: .white)
                
            }
            .padding(.top,600)
                //we can only have 10 views
        }
    }
    
    
}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct weatherview: View {
    
    var dayoftheweek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack{
            Text(dayoftheweek)
                .font(.system(size:16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)  //displays image with it's original colors
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)") // \ The value of temperature will be converted to a string and displayed as part of the text content.
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    @Binding var isnight:Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isnight ? .black : .blue, isnight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct citytextView: View{
    var cityname: String
    var body: some View{
        Text("Mangalore,Karnataka")
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)  //color for text
            .padding()

        
    }
}
struct mainweatherView: View{
    var imagename: String
    var temperature: Int
    var body: some View{
        VStack{
            Image(systemName: imagename)
                .renderingMode(.original) // to give multi color
                .resizable()
                .frame(width: 250, height: 180)
                .aspectRatio(contentMode: .fit)
            Text("\(temperature)")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
                
            

        }

    }
}

