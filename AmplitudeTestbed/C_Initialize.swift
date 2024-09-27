//
//  C_Initialize.swift
//  AppLovinTestbed
//
//  This display enables the Amplitude SDK to be initialized. There are 2 different versions for EU and non-EU.
//

import SwiftUI
import Amplitude

struct C_Initialize: View {
    
    //@EnvironmentObject var sdk: SDK
    @StateObject var progress = InitBox()
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea() // Ignore just for the color
                .overlay(
                    VStack(spacing: 20) {
                        Button(action: progress.displayAlert, label: {
                            VStack {
                                Image(systemName: "cursorarrow.click.2")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 144))
                                Text("Request initialize")
                                    .font(.system(size: 40))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            }
                        })
                        Spacer()
                            .frame(height: 100)
                        Button(action: {
                            print("Floating Button Click")
                        }, label: {
                            NavigationLink(destination: D_CoreFunctionality()) {
                                VStack {
                                    Image(systemName: "arrowshape.turn.up.right.fill")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 144))
                                    Text("Go to Core Func (Analytics)")
                                        .font(.system(size: 20))
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                }
                            }
                        })
                    })
        }.onAppear {
            if (MyVariables.onLoad) {
                progress.displayAlert();
            }
        }.alert(isPresented: $progress.isDisplayingAlert) { () -> Alert in
            Alert(title: Text("Initialize"), message: Text("Init SDK"), dismissButton: .cancel())
        }
    }
}

private func initSDKViaButton() {
    print("So long and thanks for all the fish!")
    
    // initialize the non EU SDK version
    //initSDK();
    
    // intialize the EU SDK version
    initSDKEU();
}

private func initSDK() {
    print("Initialize SDK");
    
    Amplitude.instance().defaultTracking = AMPDefaultTrackingOptions.initWithAllEnabled()
    Amplitude.instance().initializeApiKey(MyVariables.API_KEY);
    Amplitude.instance().setUserId(MyVariables.userId);
    
    if (MyVariables.setUserProperties) {
        setUserProperties();
    }
}

private func initSDKEU() {
    print("Initialize EU SDK");

    Amplitude.instance().defaultTracking = AMPDefaultTrackingOptions.initWithAllEnabled()
    Amplitude.instance().initializeApiKey(MyVariables.API_KEY);
    Amplitude.instance().setServerZone(AMPServerZone.EU);
    Amplitude.instance().setUserId(MyVariables.userId);
    
    if (MyVariables.setUserProperties) {
        setUserProperties();
    }
}

// Method to set user properties
private func setUserProperties() {
    let identify = AMPIdentify()
        .set("gender", value: NSString("female"))
        .set("age",value: NSNumber(value: 20))
        .add("karma", value: NSNumber(value: 0.123))
        .add("friends",value: NSNumber(value: 1))
    Amplitude.instance().identify(identify!)
}

struct C_Initialize_Previews: PreviewProvider {
    static var previews: some View {
        C_Initialize()
    }
}

class InitBox: ObservableObject {
    @Published var isDisplayingAlert = false
    
    func displayAlert() {
        print("init SDK via button");
        initSDKViaButton();
        // update Published property.
        isDisplayingAlert = true
      }
}
