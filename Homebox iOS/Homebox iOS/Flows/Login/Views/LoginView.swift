//
//  LoginView.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var _session: Session
    @StateObject var viewModel: LoginViewModel
    @State var showPassword: Bool = false
    
    var isSignInButtonDisabled: Bool {
        [viewModel.username, viewModel.password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            TextField("Email",
                      text: $viewModel.username ,
                      prompt: Text("Email").foregroundColor(.blue)
            )
            .textInputAutocapitalization(.never)
            .keyboardType(.emailAddress)
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            }
            .padding(.horizontal)

            HStack {
                Group {
                    if showPassword {
                        TextField("Password",
                                  text: $viewModel.password,
                                    prompt: Text("Password").foregroundColor(.red))
                        .textInputAutocapitalization(.never)
                    } else {
                        TextField("Password",
                                    text: $viewModel.password,
                                    prompt: Text("Password").foregroundColor(.red))
                        .textInputAutocapitalization(.never)
                    }
                }
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.red, lineWidth: 2)
                }

                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.red)
                }

            }.padding(.horizontal)

            Spacer()

            Button {
                print("do login action")
                Task {
                    await self.viewModel.doLogin()
                }
            } label: {
                Text("Sign In")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
            .background(
                isSignInButtonDisabled ? // how to add a gradient to a button in SwiftUI if the button is disabled
                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .disabled(isSignInButtonDisabled) // how to disable while some condition is applied
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    
    static var session: Session {
        let session = Session()
        return session
    }
    
    static var previews: some View {
        Group {
            let sampleViewModel = LoginViewModel(Self.session)
            LoginView(viewModel: sampleViewModel)
                .environmentObject(Self.session)
        }
    }
}
