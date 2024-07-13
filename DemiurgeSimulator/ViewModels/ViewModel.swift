//
//  ViewModel.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 13.07.2024.
//

import Foundation
import UIKit

protocol ViewModelDelegate: AnyObject {
    func viewModel(wantsToUpdateCellsList cells: [CellState])
    func viewModel(wantsToScrollCellsListToTheLastRow row: Int)
}

class ViewModel {
    private var cells: [CellState] {
        didSet {
            delegate.viewModel(wantsToUpdateCellsList: cells)
        }
    }
    
    var formattedCells: [UITableViewCell] {
        return cells.map {
            switch $0 {
            case .alive:
                return AliveCell()
            case .dead:
                return DeadCell()
            case .life:
                return LifeCell()
            }
        }
    }
    
    weak var delegate: ViewModelDelegate!
    
    init() {
        self.cells = [CellState]()
    }
    
    private func realizeDemiurgeMechanics(inCaseOfNewCell randomCell: CellState) {
        guard cells.count >= 3 else {
            cells.append(randomCell)
            return
        }
        
        let indexLast = cells.count - 1
        
        if cells[indexLast] == cells[indexLast - 1] && cells[indexLast - 1] == cells[indexLast - 2] {
            if cells[indexLast] == .alive {
               createLife()
                return
            } else {
                killCloseLife()
                return
            }
        }
        
        cells.append(randomCell)
    }
    
    func createRandomCell() {
        let randomCell = [CellState.alive, CellState.dead].randomElement()!
        realizeDemiurgeMechanics(inCaseOfNewCell: randomCell)
        delegate.viewModel(wantsToScrollCellsListToTheLastRow: cells.count - 1)
    }
    
    private func createLife() {
        for _ in 1...3 {
            cells.removeLast()
        }
        
        cells.append(.life)
    }
    
    private func killCloseLife() {
        for _ in 1...3 {
            cells.removeLast()
        }
        
        for cell in cells.reversed() {
            if cell == .dead {
                return
            }
            
            cells.removeLast()
        }
    }
}
