# 🚀 Quick Start - GitHub Actions CI/CD Setup

Your forked repository is ready! Follow these quick steps:

## ⚡ 5-Minute Setup

### Step 1: Add Secrets (2 min)
Go to: https://github.com/rohit-tiwari-leo/Demoappaz204/settings/secrets/actions

**Secret 1: AZURE_CREDENTIALS**
- Name: `AZURE_CREDENTIALS`
- Value: The JSON credentials provided (clientId, clientSecret, subscriptionId, tenantId)

**Secret 2: AZURE_SUBSCRIPTION_ID**
- Name: `AZURE_SUBSCRIPTION_ID`
- Value: `20d12d83-267a-4879-842e-117791537e50`

### Step 2: Trigger Workflow (1 min)
1. Go to: https://github.com/rohit-tiwari-leo/Demoappaz204/actions
2. Click "Build and Deploy to Azure"
3. Click "Run workflow" → Select master → Run

### Step 3: Monitor (2 min)
Watch the workflow execute:
- Build job (2-3 min)
- Deploy job (3-5 min)
- Verify deployment

## ✅ What You Get

✓ Automated build and test on every push
✓ Infrastructure provisioning via Bicep
✓ Automatic deployment to Azure Web App
✓ Application Insights monitoring
✓ Health checks and notifications

## 📍 Key Files

- `.github/workflows/deploy.yml` - CI/CD Pipeline
- `infra/main.bicep` - Infrastructure as Code
- `GITHUB_ACTIONS_SECRETS_SETUP.md` - Detailed setup guide

## 🎯 Your Application

After deployment:
- **URL**: https://rtdemowebappdemo-prod.azurewebsites.net
- **Resource Group**: demonamedemo
- **Region**: East US

---

For detailed instructions, see `GITHUB_ACTIONS_SECRETS_SETUP.md`
