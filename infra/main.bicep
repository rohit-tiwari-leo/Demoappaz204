param location string = resourceGroup().location
param appName string = 'rtdemowebappdemo'
param environment string = 'prod'
param skuName string = 'B1'
param skuCapacity int = 1

// Generate unique suffix
var uniqueSuffix = uniqueString(resourceGroup().id)
var appServicePlanName = '${appName}-plan-${environment}'
var webAppName = '${appName}-${environment}'
var appInsightsName = '${appName}-insights-${environment}'

// App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appServicePlanName
  location: location
  kind: 'linux'
  sku: {
    name: skuName
    capacity: skuCapacity
  }
  properties: {
    reserved: true
  }
}

// Application Insights
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    RetentionInDays: 30
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

// Web App
resource webApp 'Microsoft.Web/sites@2024-04-01' = {
  name: webAppName
  location: location
  kind: 'app,linux'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|8.0'
      alwaysOn: skuName != 'F1'
      minTlsVersion: '1.2'
      http20Enabled: true
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsights.properties.ConnectionString
        }
        {
          name: 'ApplicationInsightsAgent_EXTENSION_VERSION'
          value: '~3'
        }
        {
          name: 'ASPNETCORE_ENVIRONMENT'
          value: 'Production'
        }
      ]
    }
  }
}

// Web App Logging Configuration
resource webAppLogging 'Microsoft.Web/sites/config@2024-04-01' = {
  parent: webApp
  name: 'logs'
  properties: {
    applicationLogs: {
      fileSystemLevel: 'Information'
    }
    httpLogs: {
      fileSystemRetentionInDays: 7
      fileSystemRetentionInMb: 100
    }
    failedRequestsTracing: {
      enabled: true
    }
    detailedErrorMessages: {
      enabled: true
    }
  }
}

output appServicePlanId string = appServicePlan.id
output webAppId string = webApp.id
output webAppName string = webApp.name
output webAppUrl string = 'https://${webApp.properties.defaultHostName}'
output appInsightsId string = appInsights.id
output appInsightsInstrumentationKey string = appInsights.properties.InstrumentationKey
