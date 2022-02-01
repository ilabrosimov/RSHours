//
//  ContentView.swift
//  CheckRSHours
//
//  Created by ilabrosimov on 25.12.2021.
//

import SwiftUI

struct ContentView: View {
    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
//        formatter.dateStyle = .short
        formatter.dateFormat = "dd MMM"
        formatter.locale = Locale(identifier: "ru_RU")
           return formatter
       }()
    @EnvironmentObject var lessons: Lessons
    @State private  var isShowingLessonAddView = false 
    

    var body: some View {
        NavigationView {
            List {
                        Section ( footer: Text("Итого \(lessons.total)₽")) {
                            ForEach (lessons.items.sorted(by: > )) { item in
                                HStack (spacing: 10) {
                                    Text(item.date, formatter: dateFormatter)
                                    Text("🕐\(item.hours)")
                                    Text("👨‍👩‍👧‍👦\(item.group) ")
                                    item.pro ? Text("❤️"): Text("")
                                    item.special ? Text("🎯") : Text("")
                                    Spacer()
                                    Text("💰\((Float(item.price) / 1000), specifier: "%.1f" )k")
                                }
                            }.onDelete(perform: lessons.remove)
                        }
                      
                        
                    } .sheet (isPresented: $isShowingLessonAddView) {
                        LessonAddView()
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Добавить часы") {
                                isShowingLessonAddView = true
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Стастистика") {
                                
                            }
                        }
                    }
                    .navigationTitle("Мои занятия")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Lessons())
    }
}
