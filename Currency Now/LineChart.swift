//
//  LineChart.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/10/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct LineChart: UIViewRepresentable {
    
    @Binding var data: [Double]
    
    class Coordinator: NSObject, ChartDelegate {
        func didTouchChart(_ chart: Chart, indexes: [Int?], x: Double, left: CGFloat) {
            print("touch")
        }
        
        func didFinishTouchingChart(_ chart: Chart) {
            
        }
        
        func didEndTouchingChart(_ chart: Chart) {
            
        }
        var parent: LineChart
        init(_ parent: LineChart) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    

    func makeUIView(context: Context) -> Chart {
        let chart = Chart(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        let s = [0.7555130743496963, 0.7530502351577942, 0.7527314941272877, 0.7531143052703627, 0.743342, 0.743342, 0.7433421, 0.743342]
        let series = ChartSeries(s)
        chart.minY = s.min() ?? 0
        chart.maxY = s.max() ?? 1
        chart.yLabels = [s.min() ?? 0, s.max() ?? 1]
        chart.add(series)
        chart.delegate = context.coordinator

        print("data", data)
        
        return chart
    }
    
    func updateUIView(_ uiView: Chart, context: Context) {
        
    }
}
