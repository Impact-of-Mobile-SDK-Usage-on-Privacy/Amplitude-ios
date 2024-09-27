//
//  D_CoreFunctionality.swift
//  AppLovinTestbed
//
//  This display uses the core functionality of Amplitude. In this case, the sending of events. 
//

import SwiftUI
import Amplitude

struct D_CoreFunctionality: View {
    @State var showingAdd = false
    @StateObject var progress = CoreBox()
    
    var body: some View {
        if (MyVariables.onLoad) {
            
        }
        ZStack {
            Color.pink
                .ignoresSafeArea() // Ignore just for the color
                .overlay(
                    VStack(spacing: 20) {
                        Button(action: progress.displayAlert, label: {
                            Image(systemName: "cursorarrow.click.2")
                                .foregroundColor(Color.black)
                                .font(.system(size: 80))
                            Text("Sending custom event")
                                .font(.system(size: 40))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        })
                    })
        }.onAppear {
            if (MyVariables.onLoad) {
                progress.displayAlert();
            }
        }.alert(isPresented: $progress.isDisplayingAlert) { () -> Alert in
            Alert(title: Text("Core Func"), message: Text("Sending  custom event"), dismissButton: .cancel())
        }
    }
}

private func test() {
    print("Sending event to amplitude");
    Amplitude.instance().logEvent("My AdditionalData with Values", withEventProperties: ["Get Funky": "100ms"] )
}


struct D_CoreFunctionality_Previews: PreviewProvider {
    static var previews: some View {
        D_CoreFunctionality()
    }
}

class CoreBox: ObservableObject {
    @Published var isDisplayingAlert = false
                        
    func displayAlert() {
        print("Sending custom event");
        test();
        // update Published property.
        isDisplayingAlert = true
    }
}
