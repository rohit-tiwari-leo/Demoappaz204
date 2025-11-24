# Complete GitHub Actions Setup - Manual Steps

Your code has been successfully pushed to your forked repository!

🔗 **Forked Repository**: https://github.com/rohit-tiwari-leo/Demoappaz204

## ✅ What's Been Done

1. ✅ Code pushed to your fork
2. ✅ GitHub Actions workflow file created (`.github/workflows/deploy.yml`)
3. ✅ Bicep infrastructure template created (`infra/main.bicep`)
4. ⏳ GitHub Secrets need to be added (see below)

## 🔐 Add GitHub Secrets (Manual Steps Required)

### Go to Your Repository Settings

1. Open: https://github.com/rohit-tiwari-leo/Demoappaz204/settings/secrets/actions

### Create Secret #1: AZURE_CREDENTIALS

1. Click **"New repository secret"**
2. **Name**: `AZURE_CREDENTIALS`
3. **Value**: Paste the JSON provided in your setup email/chat (format below):

```json
{
  "clientId": "YOUR_CLIENT_ID",
  "clientSecret": "YOUR_CLIENT_SECRET",
  "subscriptionId": "YOUR_SUBSCRIPTION_ID",
  "tenantId": "YOUR_TENANT_ID"
}
```

**Note**: The actual credentials were provided in the setup instructions. Do not share this with anyone.

4. Click **"Add secret"**

### Create Secret #2: AZURE_SUBSCRIPTION_ID

1. Click **"New repository secret"**
2. **Name**: `AZURE_SUBSCRIPTION_ID`
3. **Value**: Use the subscription ID provided (20d12d83-267a-4879-842e-117791537e50)

4. Click **"Add secret"**

## 🚀 Trigger the Workflow

After adding the secrets, the workflow will run automatically when you push to the `master` branch.

To trigger manually:
1. Go to: https://github.com/rohit-tiwari-leo/Demoappaz204/actions
2. Select the **"Build and Deploy to Azure"** workflow
3. Click **"Run workflow"** button
4. Select branch: `master`
5. Click **"Run workflow"**

## 📊 Monitor the Workflow

1. Go to the **Actions** tab
2. Click on the latest workflow run
3. Watch the build, deploy, and notify jobs execute

Expected timeline:
- **Build**: ~2-3 minutes
- **Deploy**: ~3-5 minutes
- **Total**: ~5-8 minutes

## 🎯 What Happens During Deployment

The workflow will:
1. ✅ Check out your code
2. ✅ Setup .NET 8.0 environment
3. ✅ Build your application
4. ✅ Run tests
5. ✅ Publish the application
6. ✅ Deploy Azure infrastructure using Bicep:
   - App Service Plan (B1 Linux)
   - Web App (.NET Core 8.0)
   - Application Insights
7. ✅ Deploy your application to the web app
8. ✅ Verify the deployment

## ✨ After Deployment

Your application will be available at:
**https://rtdemowebappdemo-prod.azurewebsites.net**

Application Insights monitoring dashboard will be available in Azure Portal.

## 📝 Workflow Files Structure

```
.github/
  workflows/
    deploy.yml          # CI/CD Pipeline
infra/
  main.bicep           # Infrastructure as Code
GITHUB_ACTIONS_SETUP.md  # Setup Guide
```

## 🔧 Configuration Details

**GitHub Actions Workflow** (`.github/workflows/deploy.yml`):
- Builds with .NET 8.0
- Runs tests automatically
- Deploys infrastructure with Bicep
- Deploys application to Azure Web App
- Includes health checks

**Bicep Template** (`infra/main.bicep`):
- Creates App Service Plan (B1 tier, Linux)
- Provisions Web App with .NET Core 8.0
- Sets up Application Insights monitoring
- Configures logging and diagnostics
- Enforces HTTPS
- Sets minimum TLS 1.2

## 🆘 Troubleshooting

**Workflow not triggering?**
- Ensure secrets are added correctly
- Check that you pushed to the `master` branch

**Build failing?**
- Check the build logs in GitHub Actions
- Verify .NET 8.0 compatibility

**Deployment failing?**
- Verify Azure credentials are correct
- Check resource group exists: `demonamedemo`
- Review Azure subscription quota

**For more help:**
- Check the Actions tab for detailed logs
- Review Bicep deployment output
