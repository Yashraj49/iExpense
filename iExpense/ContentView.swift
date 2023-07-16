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
    @State private var animateOpacity = false
   
    
    var body: some View {
        NavigationView{
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            .font(.headline)
                            .foregroundColor(self.color(forAmount: Int(item.amount)))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .listStyle(InsetGroupedListStyle())
            
            .navigationBarTitleDisplayMode(.automatic)
            
            .background(Color(.systemGroupedBackground))
            .animation(.default)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: { self.showingAddExpense = true }) {
                        Image(systemName: "plus")
                            
                          
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {self.showingAddExpense = true}) {
                        EditButton()
                    }
                }
                
                
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
        
    }
  
    func removeItems(at offsets: IndexSet) {
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
