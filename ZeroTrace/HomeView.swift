//
//  SwiftUIView.swift
//  ZeroTrace
//
//  Created by Ishika Meel on 10/14/24.
//

import SwiftUI

struct HomeView: View {
    @State private var totalEmissions: Double = 0.0 // Example data
    @State private var totalMiles: Double = 0.0 // Example data

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to EcoDrive AI")
                    .font(.largeTitle)
                    .padding()

                Text("Total Miles Driven: \(totalMiles, specifier: "%.2f") miles")
                    .font(.title2)
                    .padding()

                Text("Estimated Total Emissions: \(totalEmissions, specifier: "%.2f") kg CO2")
                    .font(.title2)
                    .padding()

                NavigationLink(destination: PredictionView()) {
                    Text("Check Emissions Prediction")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Spacer()
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}


#Preview {
    HomeView()
}
