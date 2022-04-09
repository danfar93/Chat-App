//
//  MessagesManager.swift
//  ChatApp
//
//  Created by Daniel Farrell on 06/02/2022.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class MessagesManager: ObservableObject {
  @Published private(set) var lastMessageId = ""
  @Published private(set) var messages: [Message] = []
  let db = Firestore.firestore()

  init() {
    getMessages()
  }

  func getMessages() {
    db.collection("messages").addSnapshotListener { snapshot, error in
      guard let documents = snapshot?.documents else {
        print("error fetching messages: \(String(describing: error))")
        return
      }

      self.messages = documents.compactMap { document -> Message? in
        do {
          return try document.data(as: Message.self)
        } catch {
          print("error decoding data into message: \(error)")
          return nil
        }
      }
      self.messages.sort { $0.timestamp < $1.timestamp }
      if let id = self.messages.last?.id {
        self.lastMessageId = id
      }
    }
  }



  func sendMessage(text: String) {
    do {
      let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
      try db.collection("messages").document().setData(from: newMessage)
    } catch {
      print("Error adding a message to Firestore \(error)")
    }
  }





}
