//
//  AmplitudeTestbedApp.swift
//  AmplitudeTestbed
//
//  This class stores global variables that are required for the configuration.
//

import SwiftUI

@main
struct AmplitudeTestbedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct MyVariables {
    static var onLoad = false
    static var idfa = "XXX"
    static var sendAdditionalData = false;
    static var setUserProperties = false;
    static var EU = true;
    // NOT EU Key
    //static var API_KEY = "XXX";
    // EU Key
    static var API_KEY = "XXX";
    static var userId = "MyAmplitudeID";
}
