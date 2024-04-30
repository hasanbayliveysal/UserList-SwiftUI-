//
//  UserListView.swift
//  UsersList(SwiftUI)
//
//  Created by Veysal Hasanbayli on 29.04.24.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var vm = UserListViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                List(vm.users ?? [], id: \.id) { user in
                    HStack {
                        AsyncImage(url: URL(string: user.imageUrl ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        } placeholder: {
                            Circle()
                                .foregroundColor(.teal)
                        }
                        .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text(user.username?.capitalized ?? "")
                            Text(user.type ?? "")
                        }
                    }.navigationTitle("Users")
                }
                if vm.isLoading {
                    LoadingView()
                }
            }
            .task {
                await vm.getUsers()
          }
            .alert(isPresented: $vm.shouldShowAlert) {
                return Alert(title: Text("Error"), message: Text("\(vm.error)"))
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
