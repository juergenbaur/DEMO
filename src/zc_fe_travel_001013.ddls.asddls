@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_FE_Travel_001013
  as projection on ZI_FE_Travel_001013
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @EndUserText.label: 'Travel'
      @ObjectModel.text.element:  [ 'Description' ]
      TravelID,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]
      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: ['AgencyName']
      AgencyID,
      _Agency.Name       as AgencyName,
      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
      CustomerID,
      _Customer.LastName as LastName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,
      Description,
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: ['StatusText']
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZI_FE_STAT_001013', element: 'TravelStatusId'  } }]
      OverallStatus,
      _TravelStatus.TravelStatusText as StatusText,
      OverallStatusCriticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      @EndUserText.label: 'Last Changed At'
      LastChangedAt,
      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_FE_Booking_001013,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus

}
