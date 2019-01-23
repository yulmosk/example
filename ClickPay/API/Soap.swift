//
//  Soap.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 23/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//
import Foundation

public protocol SoapOperation {
    associatedtype Result: RootResponseModel
    func normalizeRequestArgs() -> Bool
    
    func operationTitle() -> String
}

public extension SoapOperation {
    func normalizeRequestArgs() -> Bool {
        return true
    }
    func operationTitle() -> String {
        return "\(type(of: self))"
    }
}


//Шаг 1. Обработка нитки запроса
public func executeSoap<T: SoapOperation>(
    _ operation: T,
    dispatchMain: Bool = false,
    finish: @escaping(Response<T.Result>?, Error?) -> Void)
{
    executeSoap(operation) { (response, error) in
        if dispatchMain {
            DispatchQueue.main.async { finish(response, error) }
        } else {
            finish(response, error)
        }
    }
}

//Шаг 2. Создание request запроса
public func executeSoap<T: SoapOperation>(
    _ operation: T,
    complete: @escaping(Response<T.Result>?, Error?) -> Void)
{
    executeSoap(Request(Constants.endPoint, operation: operation), on: complete)
}

//Шаг 3. Сам запрос
public func executeSoap<T: RootResponseModel>(
    _ request: Request,
    on complete: @escaping (Response<T>?, Error?) -> Void)
{
    SoapManager.shared.execute(request, on: complete)
}

