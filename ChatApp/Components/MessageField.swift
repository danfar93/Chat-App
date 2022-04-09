//
//  MessageField.swift
//  ChatApp
//
//  Created by Daniel Farrell on 06/02/2022.
//

import SwiftUI

struct MessageField: View {
  
  @EnvironmentObject var messagesManager: MessagesManager
  @State private var message = ""
    var body: some View {
      HStack {
        CustomTextField(placeholder: Text("Say 👋🏻"), text: $message)
        Button {
          messagesManager.sendMessage(text: message)
          message = ""
        } label: {
          Image(systemName: "paperplane.fill")
            .foregroundColor(.white)
            .padding(10)
            .background(Color("Blue"))
            .cornerRadius(50)
        }
      }
      .padding(.horizontal)
      .padding(.vertical, 10)
      .background(Color("Gray"))
      .cornerRadius(50)
      .padding()
      .disableAutocorrection(true)
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
        .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
  var placeholder: Text
  @Binding var text: String
  var editingChanged: (Bool) -> () = {_ in}
  var commit: () -> () = {}

  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        placeholder
          .opacity(0.5)
      }
      TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
    }
  }
}
