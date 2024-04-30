//
//  ProgressView.swift
//  UsersList(SwiftUI)
//
//  Created by Veysal Hasanbayli on 29.04.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(1.5, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .cyan))
    }
}
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}


