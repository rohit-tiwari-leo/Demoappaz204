# GitHub Actions Setup Guide

## Prerequisites

You need to set up GitHub Secrets for Azure authentication. Follow these steps:

### Step 1: Add AZURE_CREDENTIALS Secret

1. Go to your GitHub repository: https://github.com/rohit-tiwari-leo/Demoappaz204
2. Navigate to Settings → Secrets and variables → Actions
3. Click "New repository secret"
4. Name: `AZURE_CREDENTIALS`
5. Value: Use the Azure credentials provided by your administrator (JSON format with clientId, clientSecret, subscriptionId, tenantId)
6. Click "Add secret"

**Note:** Keep your Azure credentials secure and never commit them to the repository.

### Step 2: Add AZURE_SUBSCRIPTION_ID Secret

1. Click "New repository secret"
2. Name: `AZURE_SUBSCRIPTION_ID`
3. Value: `20d12d83-267a-4879-842e-117791537e50`
4. Click "Add secret"

## Workflow Overview

The GitHub Actions workflow (`deploy.yml`) includes three jobs:

### 1. Build Job
- Checkout code
- Setup .NET 8.0
- Restore dependencies
- Build in Release mode
- Run tests
- Publish the application
- Upload artifact for deployment

### 2. Deploy Job (runs on master branch pushes only)
- Download build artifact
- Authenticate with Azure
- Deploy infrastructure using Bicep template
- Deploy web app from published artifact
- Verify deployment

### 3. Notify Job
- Check build and deployment status
- Display deployment summary

## Bicep Template

The `infra/main.bicep` template defines:
- **App Service Plan**: Linux B1 tier with 1 capacity
- **Web App**: .NET Core 8.0 runtime with HTTPS enabled
- **Application Insights**: For monitoring and diagnostics
- **Logging Configuration**: File system logging with 7-day retention

## Workflow Triggers

The workflow runs on:
1. Push to `master` branch
2. Pull requests to `master` branch
3. Manual trigger via `workflow_dispatch`

## Deployment Outputs

After successful deployment, you can access:
- Web App URL: https://rtdemowebappdemo-prod.azurewebsites.net
- Application Insights Dashboard in Azure Portal
- Deployment logs in GitHub Actions

## Troubleshooting

If the workflow fails:

1. **Authentication errors**: Verify AZURE_CREDENTIALS and AZURE_SUBSCRIPTION_ID secrets are correctly set
2. **Build errors**: Check .NET version compatibility
3. **Deployment errors**: Review Bicep template parameters and Azure resource quotas
4. **Test failures**: Review test output in the GitHub Actions logs

## Next Steps

1. Add the secrets to GitHub (follow Step 1 and Step 2 above)
2. Push changes to master branch to trigger the workflow
3. Monitor the workflow in the Actions tab
4. Once deployed, the app will be available at the Web App URL
