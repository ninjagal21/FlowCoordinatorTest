//
//  MainViewModel.swift
//  FlowCoordinatorTest
//
//  Created by Admin on 20.07.2021.
//

import Foundation

protocol MainViewModelProtocol {
    var user: User? { get set }
}

class MainViewModel: MainViewModelProtocol {
    var user: User?
}
