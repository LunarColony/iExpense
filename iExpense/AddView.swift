//
//  AddView.swift
//  iExpense
//
//  Created by Yunis Farah on 20/07/2020.
//  Copyright © 2020 LunarColony. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var expenses: Expenses

    @State private var name = ""
    @State private var type = "Business"
    @State private var amount = ""

    static let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
                .navigationBarTitle("Add new expense")
                .navigationBarItems(leading:
                        Button("Save") {
                            if let actualAmount = Int(self.amount) {
                                let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                                self.expenses.items.append(item)
                            }
                            self.presentationMode.wrappedValue.dismiss()
                    },
                    trailing:
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Done")
                                .bold()
                    }
                )
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
