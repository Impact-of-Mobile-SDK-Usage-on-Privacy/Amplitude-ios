//
//  B_InquireConsent.swift
//  AppLovinTestbed
//
//  This display is intended for setting and withdrawing consent. However, Amplitude does not provide an option for this, which is why the methods setConsentManually and refuseConsentManually are empty.
//

import SwiftUI

struct B_InquireConsent: View {
    
    @State private var showingPopover = false
    @StateObject var progress = ConsentBox()
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea() // Ignore just for the color
                .overlay(
                    VStack(spacing: 20) {
                        Button(action: progress.displayAlert, label: {
                            VStack {
                                Image(systemName: "cursorarrow.click.2")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 80))
                                Text("Set consent manually")
                                    .font(.system(size: 20))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            }
                        }).alert(isPresented: $progress.isDisplayingAlert) { () -> Alert in
                            Alert(title: Text("Give consent"), message: Text("Amplitude has no option to set consent. So nothin happend..."), dismissButton: .cancel())
                        }
                        Spacer();
                        Button(action: progress.displayAlert2, label: {
                            VStack {
                                Image(systemName: "cursorarrow.click.2")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 80))
                                Text("Refuse consent manually")
                                    .font(.system(size: 20))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            }
                        }).alert(isPresented: $progress.isDisplayingAlert2) { () -> Alert in
                            Alert(title: Text("Refuse consent"), message: Text("Amplitude has no option to refuse or set consent. Nothin happened ..."), dismissButton: .cancel())
                        }
                        Spacer()
                            .frame(height: 100)
                        Button(action: {
                            print("Go to initialize view")
                        }, label: {
                            NavigationLink(destination: C_Initialize()) {
                                HStack {
                                    Image(systemName: "arrowshape.turn.up.right.fill")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 144))
                                    Text("Initialize")
                                        .font(.system(size: 40))
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                }
                            }
                        })
                    })
        }.onAppear {
            if (MyVariables.onLoad) {
                print("Inside Inquire consent")
                progress.displayAlert()
            }
        }
    }
}

private func setConsentManually() {
    
}

private func refuseConsentManually() {
    
}

struct B_InquireConsent_Previews: PreviewProvider {
    static var previews: some View {
        B_InquireConsent()
    }
}

class ConsentBox: ObservableObject {
    @Published var isDisplayingAlert = false
    @Published var isDisplayingAlert2 = false;
    
    func displayAlert() {
        setConsentManually();
        print("Set consent manually");
        // update Published property.
        isDisplayingAlert = true
      }
    
    func displayAlert2() {
        refuseConsentManually();
        print("Refuse consent manually");
        isDisplayingAlert2 = true;
    }
}
