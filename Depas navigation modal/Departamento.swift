//
//  Departamento.swift
//  Depas navigation modal
//
//  Created by WIN603 on 20/10/26.
//

import Foundation

struct Departamento: Identifiable {
    let id = UUID()
    let ubicacion: String
    let imagen: String
    let precio: String
    var esFavorito: Bool = false
    let caracteristicas: [String]
    let diagramaImagen: String
    let fotosAdicionales: [String]
}
