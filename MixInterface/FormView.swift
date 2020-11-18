//
//  FormView.swift
//  MixInterface
//
//  Created by Alessio Roberto on 18/11/2020.
//

import SwiftUI

struct FormView: View {
    @ObservedObject var keyboardHandler: KeyboardFollower
    @ObservedObject var viewModel: ViewModel

    private var mainTitle: String

    init(viewModel: ViewModel, keyboardHandler: KeyboardFollower) {
        self.keyboardHandler = keyboardHandler
        self.viewModel = viewModel
        self.mainTitle = viewModel.maintitle
    }

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text(mainTitle)
                    .font(.title)
                Spacer()
                    .frame(height: 16.0)
                TextField("Enter your email address",
                          text: $viewModel.user.email)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.blue))
                Spacer()
                Text("Name")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                    .frame(height: 16.0)
                TextField("Enter your name",
                          text: $viewModel.user.name)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.blue))
                Spacer()
            }
            .padding(.bottom, keyboardHandler.keyboardHeight)
            .edgesIgnoringSafeArea(keyboardHandler.isVisible ? .bottom : [])
            .padding([.top, .leading, .trailing])
        }
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(viewModel: ViewModel(),
                 keyboardHandler: KeyboardFollower())
    }
}
