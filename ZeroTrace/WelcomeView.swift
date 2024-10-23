//
//  WelcomeView.swift
//  ZeroTrace
//
//  Created by Noga Gercsak on 10/15/24.
//

import SwiftUI

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack{
            VStack {
                // Title - "ZERO TRACE"
                VStack(alignment: .center, spacing: 4) {
                    Text("ZERO")
                        .font(.system(size: 68, weight: .bold))
                        .foregroundColor(.black)
                        .opacity(0.6)
                        .padding(.trailing, 130)
                    Text("TRACE")
                        .font(.system(size: 68, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.leading, 90)
                }
                .padding(.top, 100)
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:650, height: 200)
                
                
                
                Text("Track your carbon footprint and make sustainable travel choices.\n\n Powered by AI.\n\n Striving for a sustainable future.") //we can change this to make it say somethingthing better
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                
                Spacer()
                
                // Navigation to HomeView
                NavigationLink(destination: HomeView()) {
                    Text("Get Started")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                        .padding(.horizontal, 40)
                }
                    Spacer()
            }
            .background(Color(red: 0.9, green: 0.95, blue: 1)) // Light blue background
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


#Preview {
    WelcomeView()
}
