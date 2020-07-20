//
//  ContentView.swift
//  iExpense
//
//  Created by Yunis Farah on 20/07/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    // Remember here that `@ObservedObject` asks SwiftUI to watch the object for any changes
    // announcements.
    @ObservedObject var expenses = Expenses()



    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(Color.green)
                    }
                }
                    .onDelete(perform: removeItems)

            }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: self.expenses)
                }

                .navigationBarTitle("iExpense")
                .navigationBarItems(
                    leading:
                        EditButton(),
                    trailing:
                        Button(action: {
                            self.showingAddExpense.toggle()
                        }) {
                            Image(systemName: "plus")
                                .font(Font.system(.title))
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
