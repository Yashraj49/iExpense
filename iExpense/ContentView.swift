//
//  ContentView.swift
//  iExpense
//
//  Created by Yashraj jadhav on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @StateObject var expenses = Expenses()
    @State private var animateopacity = false
    
    
    
    var body: some View {
        NavigationView{ 
            List{
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor(self.color(forAmount: Int(item.amount)))
                    }
                }
                .onDelete(perform: removeItems)
                
                
            } // navigate from Home view to other .
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {self.showingAddExpense = true }) {
               
            })
            
            
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: Expenses())
                
            }
            
           
            .toolbar {
                Button {
                    showingAddExpense = true
                   
                } label: {
                    Image(systemName: "plus")
                
                }
            }
        }
    }
    func removeItems(at offsets : IndexSet)
    {
        expenses.items.remove(atOffsets: offsets)
}
    func color(forAmount amount: Int) -> Color {
            switch amount {
            case Int.min..<10:
                return .green
            case 10..<100:
                return .orange
            default:
                return .red
            }
        }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
