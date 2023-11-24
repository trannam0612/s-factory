class ProductRequest {
  static const String stampCheckUniqueCode = r'''
    query stampCheckUniqueCode($serial: String!) {
    stampCheckUniqueCode(serial: $serial) {
      id
      uniqueCode
      no
      productionAt
      batchName
      productionOrder {
        id
        code
        poCode
      uniqueCodes
      }
      productType {
        id
        code
        name
      }
    }
  } 
  ''';
  static const String factoryProductionOrderDetail = r'''
    query factoryProductionOrderDetail($id: String!){
    factoryProductionOrderDetail(id: $id) {
      id
      code
      poCode
      productionAt
      productionCount
      startNo
      endNo
      status
      stampType
      uniqueCodes
      productType {
        id
        code
        name
        unitCode
        unitName
        standardImageUrls
        detailStandards {
          id
          name
          standard
          description
          tool
          type
          version
          reviewType
        }
        overviewStandards {
          id
          name
          standard
          description
          tool
          type
          version
          reviewType
        }
      }
    }
}
  ''';
}
