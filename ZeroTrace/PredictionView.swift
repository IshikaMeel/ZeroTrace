//
//  PredictionView.swift
//  ZeroTrace
//
//  Created by Ishika Meel on 10/14/24.
//

import SwiftUI

struct PredictionView: View {
    @State private var userStatistics: [String: String] = [
        "Total Driving Hours": "120 hrs",
        "Average Weekly Hours": "10 hrs",
        "Vehicle Type": "Sedan"
    ]
    
    @State private var predictions: [String] = [
        "You are on track to reduce carbon emissions by 15% this month.",
        "Based on your driving patterns, you can save 20% on fuel costs by driving during non-peak hours.",
        "If you maintain your current driving habits, you can offset your annual carbon footprint by 10%."
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                Text("Your Driving Statistics & Predictions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                    .padding(.horizontal)
                
                // User Statistics Section
                VStack(spacing: 15) {
                    Text("User Statistics")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    // Statistics Cards
                    ForEach(userStatistics.sorted(by: >), id: \.key) { key, value in
                        HStack {
                            Text(key)
                                .font(.body)
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(value)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .padding(.horizontal)
                    }
                }
                
                // Prediction Section
                VStack(spacing: 15) {
                    Text("GPT Predictions")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    // Predictions Cards
                    ForEach(predictions, id: \.self) { prediction in
                        Text(prediction)
                            .font(.body)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            .padding(.horizontal)
                    }
                }
                
                // Charts Section - Example Placeholder
                VStack(spacing: 15) {
                    Text("Driving Trends & Insights")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    // Placeholder for Chart
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.blue.opacity(0.3))
                        .frame(height: 200)
                        .overlay(
                            Text("Trend Chart Placeholder")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green.opacity(0.3))
                        .frame(height: 200)
                        .overlay(
                            Text("Emission Savings Chart Placeholder")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding(.bottom, 40)
            .navigationBarTitle("Predictions", displayMode: .inline)
            .background(Color(.systemBackground).ignoresSafeArea())
        }
    }
}

#Preview {
    PredictionView()
}

