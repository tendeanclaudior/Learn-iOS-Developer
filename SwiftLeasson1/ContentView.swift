//
//  ContentView.swift
//  SwiftLeasson1
//
//  Created by Claudio Tendean on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Image("bg").resizable().edgesIgnoringSafeArea(.all)
            VStack(spacing:20){
                Logo()
                FormBox()
            }
            .padding(.all, 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Logo : View {
    var body : some View {
        
        VStack{
            Image("LogoSwift")
                .resizable()
                .frame(width:100,height:100)
                .background(Color("ADDDD0"))
                .foregroundColor(Color.white)
                .padding()
                .background(Color("ADDDD0"))
                .cornerRadius(20)
            
            Text("Hello SwiftUI").foregroundColor(Color.white)
        }
    }
}

struct FormBox : View {
    @State var username: String = ""
    @State var password: String = ""
    
    
    var body : some View {
        VStack(alignment:.leading){
            Text("Username").font(.callout).bold()
            
            TextField("Type Username....", text:$username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Password").font(.callout).bold()
            
            TextField("Type Password....", text:$password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {print("Hello World")}){
                HStack{
                    Text("SignIn")
                    Spacer()
                }
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .foregroundColor(Color.white)
        }
        .padding(.all, 20)
        .background(Color("ADDDD0"))
        .cornerRadius(10)
    }
}
