//
//  CardView.swift
//  HikeAdvanceApp
//
//  Created by Ricky Primayuda Putra on 09/10/24.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        print("--- BUTTON WAS PRESSED ---")
        print("STATUS: old Image Number = \(imageNumber)")
        
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        print("Result from new image numeber = \(imageNumber)")
    }
    
    var body: some View {
        
        ZStack {
            CustomBackground()
        VStack {
            // MARK: - Header
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Hiking")
                        .fontWeight(.black)
                        .font(.system(size: 52))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGrayLight, .customGrayMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    Spacer()
                    
                    Button {
                        print("Ricky Primayuda Putra")
                        isShowingSheet.toggle()
                    } label: {
                        CustomButtonView()
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        SettingsView()
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium, .large])
                    }
                }
                Text("Fun and enjoyable outdoor activity for friends and families")
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(.customGrayMedium)
            }
            .padding(.horizontal, 30)
            
            // MARK: -- Main Content
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                // MARK: - Footer
                Button {
                    randomImage()
                } label : {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color:
                                .black.opacity(0.25),
                            radius: 0.25, x: 1, y: 2
                            
                        )
                }
                .buttonStyle(GradientButton())
            }
            
        }
        .frame(width: 320, height: 570)
    }
    
}

#Preview {
    CardView()
}
