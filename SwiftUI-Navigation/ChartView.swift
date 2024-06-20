//
//  ChartView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 25/08/23.
//

import SwiftUI
import Charts
import CoreData

/*
 
 - We have presented chart view in all 5 types.
 - To select and show different chart types we have used Binding.
   also, It covers showing sheet/fullscreen.
 - Used animation for showing changes in chart view.
 - We have used custom view modifier.
 
 */

struct ChartView: View {
    
    @State private var isShowingSheet = false
    @State private var chartType: ChartType = .bar
    
    var viewMonths: [ViewMonth] = [.init(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 10000),
                                   .init(date: Date.from(year: 2023, month: 2, day: 1), viewCount: 9000),
                                   .init(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 14000),
                                   .init(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 15000),
                                   .init(date: Date.from(year: 2023, month: 5, day: 1), viewCount: 13000),
                                   .init(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 18000),
                                   .init(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 11000),
                                   .init(date: Date.from(year: 2023, month: 8, day: 1), viewCount: 15000),
                                   .init(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 15000),
                                   .init(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 16000),
                                   .init(date: Date.from(year: 2023, month: 11, day: 1), viewCount: 21000),
                                   .init(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 18000)]
    
//    @FetchRequest(sortDescriptors: [
//        SortDescriptor(\.date),
//        SortDescriptor(\.viewCount)
//    ]) var monthViews: FetchedResults<YoutubeData>

    var body: some View {
        VStack {
            //Text("Youtube views").modifier(PrimaryLabel())
            Spacer()
            Chart {
                RuleMark(y: .value("Goal", 18000)).lineStyle(.init(dash: [3])).annotation(alignment: .leading){
                    Text("Goal").font(.caption).foregroundColor(.secondary)
                }
                ForEach(viewMonths) { viewMonth in
                    switch chartType {
                        case .line:
                        LineMark(x: .value("Months", viewMonth.date, unit: .month), y: .value("Views", viewMonth.viewCount)).lineStyle(.init(dash: [2])).foregroundStyle(Color.blue.gradient)
                        case .bar:
                            BarMark(x: .value("Months", viewMonth.date, unit: .month), y: .value("Views", viewMonth.viewCount)).foregroundStyle(Color.blue.gradient)
                        case .point:
                            PointMark(x: .value("Months", viewMonth.date, unit: .month), y: .value("Views", viewMonth.viewCount)).foregroundStyle(Color.blue.gradient)
                        case .area:
                            AreaMark(x: .value("Months", viewMonth.date, unit: .month), y: .value("Views", viewMonth.viewCount)).foregroundStyle(Color.blue.gradient)
                        case . rectangle:
                            RectangleMark(x: .value("Months", viewMonth.date, unit: .month), y: .value("Views", viewMonth.viewCount)).foregroundStyle(Color.blue.gradient)
                    }
                        
                }
            }
            .frame(height: 180)
            .chartXAxis {
                AxisMarks(values: viewMonths.map { $0.date }) { date in
                    AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
                }
            }
            Spacer()
//            List(monthViews){ monthView in
//                Text("\(monthView.viewCount ?? 0)")
//            }
            
            Button {
                withAnimation(.spring()) {
//                    if chartType.rawValue > 3 {
//                        chartType = ChartType.allCases[0]
//                    } else {
//                        chartType = ChartType.allCases[chartType.rawValue + 1]
//                    }
                    isShowingSheet = true
                }
                print("change style")
            } label: {
                Text("Change chart style")
                    .frame(width: 280, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .cornerRadius(25)
            }
            
        }.navigationTitle("Youtube Views").navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $isShowingSheet, content: {
                SheetView(chartType: $chartType)
            })
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
        ChartView().preferredColorScheme(.dark)
    }
}

struct ViewMonth: Identifiable {
    let id  = UUID()
    let date: Date
    let viewCount: Int
}

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(.clear)
            .foregroundStyle(.blue)
            .font(.system(size: 20,weight: .semibold, design: .default))
            .cornerRadius(10)
    }
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}


