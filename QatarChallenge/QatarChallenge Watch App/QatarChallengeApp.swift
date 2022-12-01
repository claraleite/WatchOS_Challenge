//
//  QatarChallengeApp.swift
//  QatarChallenge Watch App
//
//  Created by mccl on 22/11/22.
//

import SwiftUI

@main
struct QatarChallenge_Watch_AppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
//        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
