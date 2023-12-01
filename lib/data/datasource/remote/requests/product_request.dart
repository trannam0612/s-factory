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

  static const String factoryProductionOrderReport = r'''
    mutation factoryProductionOrderReport($arguments: POReportArgs!){
  factoryProductionOrderReport(arguments: $arguments) {
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
        providerCode
        refDocument
        sampleCount
        note
        ngCount
        status
        detailStandards {
          id
          name
          description
          standard
          tool
          samples {
            id
            order
            serial
            value
            result
          }
        }
        overviewStandards {
          id
          name
          description
          standard
          ngCount
          note
          result
          tool
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
  static const String factoryAllProductionOrders = r'''
    query factoryAllProductionOrders($filter: ListPOFilter!){
  factoryAllProductionOrders(filter: $filter) {
    total
    count
    productionOrders{
      code
      id
      poCode
      status
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
}
  ''';

  static const String factoryPOReports = r'''
    query factoryPOReports($filter: POReportFilter!){
  factoryPOReports(filter: $filter) {
    total
    count
    poReports{
      id
      status
      stampType
      code
    }
  }
}
  ''';
  static const String factoryPOReportDetail = r'''
    query factoryPOReportDetail($id: String!){
  factoryPOReportDetail(id: $id) {
    id
    code
    poCode
    createdAt
    productionAt
    productionCount
    startNo
    endNo
    status
    stampType
    providerCode
    refDocument
    ngCount
    note
    uniqueCodes
    sampleSerials
    productType{
      name
    }
    owner{
      fullname
    }
    detailStandards {
      id
      name
      standard
      description
      tool
      type
      version
      reviewType
      standard
      result
      samples {
        id
        standardId
        note
        value
        result
        note
      }
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
      standard
      note
      ngCount
      result
    }
  }
}
  ''';
}
