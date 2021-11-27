//
//  ContentView.swift
//  Restart
//
//  Created by Kevin Aguilera on 20/11/21.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
    var body: some View {
      ZStack {
        if isOnboardingViewActive {
          OnboardingView()
        } else {
          HomeView()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewDevice("iPhone 13 mini")
    }
}
