//
//  HomeView.swift
//  Restart
//
//  Created by Kevin Aguilera on 20/11/21.
//

import SwiftUI

struct HomeView: View {
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  @State private var isAnimated: Bool = false
  
    var body: some View {
      VStack(spacing: 20) {
        
        // HEADER
        Spacer()
        
        ZStack {
          CircleGruopView(ShapeColor: .gray, ShapeOpacity: 0.1)
          
          Image("character-2")
            .resizable()
            .scaledToFit()
            .padding()
            .offset(y: isAnimated ? 35 : -35)
            .animation(
              Animation
                .easeInOut(duration: 4)
                .repeatForever(),
              value: isAnimated
            )
          
        }
        
        // CENTER
        Text("The time that leads to mastery is dependent on the intensity of our focus.")
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.center)
          .padding()
        
        // FOOTER
        Spacer()
        
        Button(action: {
          //some action
          withAnimation {
            playSound(sound: "success", type: "m4a")
            isOnboardingViewActive = true
          }
        }) {
          Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
            .imageScale(.large)
          
          Text("Restart")
            .font(.system(.title, design: .rounded))
            .fontWeight(.bold)
        } // BUTTON
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        
      } // VStack
      .onAppear(perform: {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
          isAnimated = true
        })
      })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
