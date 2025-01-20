//
//  LoginScreen.swift
//  Boardrooms
//
//  Created by mona alruthaya on 20/07/1446 AH.
//
import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            // Background
            VStack(spacing: 0) {
                Image("Background") // Replace with your image name
                    .resizable()
                    .scaledToFill()
                    .frame(width:390,height: 398) // Set the height for the image
        //            .clipped()

                Color(hex: "#F3F3F3") // Background color
            }
            .ignoresSafeArea()

            // Login content
            VStack {
                Spacer().frame(height: 80) // Space from the top of the screen
                
                Text("Welcome back! Glad to see you, Again!")
            
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "#D45E39"))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)

                // Input Fields
                VStack(spacing: 16) {
                    TextField("Enter your job number", text: .constant(""))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)

                    HStack {
                        SecureField("Enter your password", text: .constant(""))
                            .padding()
                        
                        Button(action: {
                            // Handle show/hide password logic
                        }) {
                            Image(systemName: "eye.slash")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal, 24)

                // Login Button
                Button(action: {
                    // Handle login action
                }) {
                    Text("Login")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#232455"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)

                Spacer()
            }
        }
    }
}

// MARK: - Color Extension for Hex Support
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.hasPrefix("#") ? hex.index(after: hex.startIndex) : hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue >> 16) & 0xff) / 255.0
        let green = Double((rgbValue >> 8) & 0xff) / 255.0
        let blue = Double(rgbValue & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

