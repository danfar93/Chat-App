//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Daniel Farrell on 05/02/2022.
//

import SwiftUI

struct MessageBubble: View {

  var message: Message
  var imageUrl = URL(string: "https://media-exp1.licdn.com/dms/image/C4D03AQHaT1gF9VSAiA/profile-displayphoto-shrink_200_200/0/1576053354120?e=1649289600&v=beta&t=zS7qUYm_dmKlSWL58Q1pWywIHHWq19bPzFTD9Yw_RBE")

  @State private var showTime = false

    var body: some View {
      VStack(alignment: message.received ? .leading : .trailing) {
        HStack {
          Text(message.text)
            .padding()
            .background(message.received ?  Color("Pink") : Color("Blue"))
            .cornerRadius(30)
            .foregroundColor(message.received ? .black : .white)
        }
        .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
        .onTapGesture {
          showTime.toggle()
        }

        if showTime {
          Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
            .font(.caption2)
            .foregroundColor(.gray)
            .padding(message.received ? .leading : .trailing, 25)
        }
      }
      .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
      .padding(message.received ? .leading : .trailing)
      .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
      MessageBubble(message: Message(id: "12345", text: "Oi Ella, tudo bem? Eu tenho uma chave por a casa!", received: true, timestamp: Date()))
    }
}
