//
//  A_InitialState.swift
//  AppLovinTestbed
//
//  This file realizes the initial state for the study. An instance of the Amplitude SDK is created without making any further settings.
//

import SwiftUI
import Amplitude

struct A_InitialState: View {
    @State var selectedTag: String?
    
    @State private var showingPopover = false
    @StateObject var progress = AlertingBox()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                VStack(spacing: 10) {
                    Button(action: progress.displayAlert, label: {
                        VStack {
                            Image(systemName: "cursorarrow.click.2")
                                .foregroundColor(Color.black)
                                .font(.system(size: 80))
                            Text("Create Obj")
                                .font(.system(size: 34))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                    })
                    Spacer()
                        .frame(height: 50).foregroundColor(Color.blue)
                    Button(action: {
                        print("Floating Button Click")
                    }, label: {
                        NavigationLink(destination: B_InquireConsent()) {
                            HStack {
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 80))
                                Text("Go to consent screen")
                                    .font(.system(size: 34))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            }
                        }
                    })
                    Spacer()
                        .frame(height: 50)
                    Button(action: {
                        print("Floating Button Click")
                    }, label: {
                        NavigationLink(destination: C_Initialize()) {
                            VStack {
                                Image(systemName: "arrowshape.zigzag.right.fill")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 80))
                                Text("Initialize SDK without Consent")
                                    .font(.system(size: 30))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            }
                        }
                    })
                }
            }.onAppear {
                if (MyVariables.onLoad) {
                    progress.displayAlert();
                }
            }.alert(isPresented: $progress.isDisplayingAlert) { () -> Alert in
                Alert(title: Text("Created Object"), message: Text("Created object via Amplitude.instance()"), dismissButton: .cancel())
            }
        }
    }
}

struct A_InitialState_Previews: PreviewProvider {
    static var previews: some View {
        A_InitialState()
    }
}

class AlertingBox: ObservableObject {
    @Published var isDisplayingAlert = false
    
    func displayAlert() {
        let sb = Amplitude.instance();
        print("Create object");
        isDisplayingAlert = true
      }
}
