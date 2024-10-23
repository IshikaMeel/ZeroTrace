//
//  HomeView.swift
//  ZeroTrace
//
//  Created by Ishika Meel on 10/14/24.
//

import SwiftUI

struct HomeView: View {
    @State private var totalEmissions: Double = 152.5 // Hardcoded value for preview, replace with backend data
    @State private var totalMiles: Double = 350.0 // Hardcoded value for preview, replace with backend data
    @State private var ecoTip: String = "Combine errands to save fuel and reduce emissions!" // Placeholder eco-tip

    var body: some View {
        TabView {
            NavigationView {
                VStack(spacing: 20) {
                    // App Welcome Title
                    Text("Welcome to EcoDrive AI")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.top, 40)

                    // Display Cards for Total Miles and Emissions
                    VStack(spacing: 20) {
                        InfoCard(icon: "car.fill", title: "Total Miles Driven", value: "\(String(format: "%.2f", totalMiles)) miles")
                        InfoCard(icon: "leaf.fill", title: "Total Emissions", value: "\(String(format: "%.2f", totalEmissions)) kg CO2")
                    }


                    // Daily Eco Tip Section
                    Text("Eco Tip: \(ecoTip)")
                        .font(.headline)
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    // Quick Access Buttons
                    HStack(spacing: 15) {
                        QuickAccessButton(icon: "plus.circle.fill", label: "Log Drive")
                        QuickAccessButton(icon: "map.fill", label: "Find Chargers")
                        QuickAccessButton(icon: "chart.bar.fill", label: "View Stats")
                    }
                    .padding()

                    // Check Emissions Prediction Button
                    NavigationLink(destination: PredictionView()) {
                        Text("Check Emissions Prediction")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()

                    Spacer()
                }
                .padding(.bottom, 40)
                .navigationBarTitle("Home", displayMode: .inline)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.green.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                )
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationView {
                SettingsView()
                    .navigationBarTitle("Settings", displayMode: .inline)
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }

            NavigationView {
                PredictionView()
            }
            .tabItem {
                Label("Prediction", systemImage: "chart.bar")
            }
        }
    }
}

// Supporting Views

struct InfoCard: View {
    var icon: String
    var title: String
    var value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.gray)
                Text(value)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 5)
        .padding(.horizontal)
    }
}

struct QuickAccessButton: View {
    var icon: String
    var label: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
            Text(label)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    HomeView()
}
