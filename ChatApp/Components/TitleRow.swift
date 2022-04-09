//
//  TitleRow.swift
//  ChatApp
//
//  Created by Daniel Farrell on 05/02/2022.
//

import SwiftUI

struct TitleRow: View {

  var imageUrl = URL(string: "https://firebasestorage.googleapis.com/v0/b/chatapp-c2885.appspot.com/o/profile-square.png?alt=media&token=c35c887b-9ac9-43b1-853f-842859ea7062")

    var name = "Daniel Farrell"

    var body: some View {
      HStack(spacing: 20) {
        ZStack {
          AsyncImage(url: imageUrl) { image in
            image.resizable()
              .aspectRatio(contentMode: . fill)
              .frame(width: 50, height: 50)
              .cornerRadius(50)
              .padding(.leading, 10)
              .padding(.top, 10)
              .padding(.bottom, 10)
          } placeholder: {
            ProgressView()
        }
          Circle()
              .fill(Color.green)
              .frame(width: 10, height: 10)
              .padding(.top, 40)
              .padding(.leading, 40)
        }

        VStack(alignment: .leading) {
          Text(name)
            .font(.title).bold()
            .foregroundColor(.white)
          Text("Online")
            .font(.caption)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

        Image(systemName: "phone.fill")
          .foregroundColor(.gray)
          .padding(10)
          .background(.white)
          .cornerRadius(50)
          .padding(.trailing, 10)
      }
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
        .background(Color("Blue"))
    }
}
