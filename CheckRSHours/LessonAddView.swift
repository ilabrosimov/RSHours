//
//  LessonAddView.swift
//  CheckRSHours
//
//  Created by ilabrosimov on 15.01.2022.
//

import SwiftUI

struct LessonAddView: View {
    @EnvironmentObject var lessons: Lessons
    @State private var currentHours = 2
    @State private var currentPersons = 1
    @State private var isPro = false
    @State private var isSpec = false
    @State private var date = Date()
    
    var persons = [1,2,3,4,5,6,7,8]
    var hours = [1,2,3,4,5]
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 10){
                HStack{
                    DatePicker("Выбери дату", selection: $date, displayedComponents: .date)
                        
                }
                HStack{
                    Text ("🕐")
                    Picker("", selection: $currentHours) {
                        ForEach(hours, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    
                    Text("👨‍👨‍👧")
                    Picker("", selection: $currentPersons) {
                        ForEach(persons, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }.font(.system(size: 30))
                .accentColor(.black)
                    
                HStack {
                  
                }
                HStack {
                    Text ("Пролонгация")
                    if isPro {
                        Text("✅")
                    }
                   // Image(systemName: "heart.fill").foregroundColor(Color.red)
                }.onTapGesture {
                    isPro.toggle()
                }
                    
                HStack {
                    Text("Спецпрограмма")
                    if isSpec {
                        Text("✅")
                    }
                 //   Text("🎯")
                }.onTapGesture {
                    isSpec.toggle()
                }
                Button {
                    lessons.add(item: Lesson(date: date, hours: currentHours, pro: isPro, group: currentPersons, special: isSpec))
                    
                } label: {
                    Text("Готово").padding()
                }
              
            }
            .navigationTitle("Добавляем часы")
             .padding()
                .font(.system(size: 20))
                
        }
        
}
}
struct LessonAddView_Previews: PreviewProvider {
    static var previews: some View {
        LessonAddView()
    }
}
