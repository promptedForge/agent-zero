# Railway Deployment Guide

This guide will help you deploy Agent Zero to Railway.app, a modern cloud platform that makes deploying applications simple.

## Prerequisites

1. A [Railway.app](https://railway.app) account (you can sign up with GitHub)
2. Your LLM API keys (OpenAI, Anthropic, OpenRouter, etc.)

## Deployment Steps

### Method 1: Deploy from GitHub (Recommended)

1. **Fork or Clone this Repository**
   - Fork this repository to your GitHub account, or
   - Clone it and push to your own GitHub repository

2. **Create a New Project on Railway**
   - Go to [Railway.app](https://railway.app)
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your Agent Zero repository
   - Railway will automatically detect the Dockerfile and build your application

3. **Configure Environment Variables**
   
   After deployment, you need to configure your LLM API keys and other settings:
   
   - Go to your project in Railway
   - Click on your service
   - Go to the "Variables" tab
   - Add the following environment variables as needed:

   **Required Variables:**
   ```
   # No variables are strictly required - you can configure everything through the Web UI
   ```

   **Optional Variables:**
   ```
   WEB_UI_HOST=0.0.0.0
   WEB_UI_PORT=$PORT
   FLASK_SECRET_KEY=<your-secret-key>
   AUTH_LOGIN=<your-username>
   AUTH_PASSWORD=<your-password>
   ```

   **Note:** Railway automatically sets the `PORT` environment variable. The application will use this port automatically.

4. **Access Your Application**
   - Once deployed, Railway will provide you with a public URL
   - Click on the URL or go to the "Settings" tab to find your deployment URL
   - Access Agent Zero at `https://your-app.railway.app`

5. **Configure Agent Zero**
   - On first access, you'll see the login screen (if AUTH_LOGIN and AUTH_PASSWORD are set)
   - Go to Settings in the Web UI
   - Configure your LLM providers and API keys
   - Choose your preferred models
   - Start chatting with your agent!

### Method 2: Deploy using Railway CLI

1. **Install Railway CLI**
   ```bash
   npm i -g @railway/cli
   ```

2. **Login to Railway**
   ```bash
   railway login
   ```

3. **Initialize and Deploy**
   ```bash
   cd agent-zero
   railway init
   railway up
   ```

4. **Set Environment Variables** (optional)
   ```bash
   railway variables set AUTH_LOGIN=admin
   railway variables set AUTH_PASSWORD=your-secure-password
   ```

5. **Open Your App**
   ```bash
   railway open
   ```

## Important Notes

### Data Persistence

⚠️ **Important:** Railway provides ephemeral storage by default. This means:
- Your data will be lost when the container restarts
- Use the built-in Backup/Restore feature regularly to save your data
- Consider using Railway Volumes for persistence (see Railway documentation)

### Resource Considerations

- **Memory:** Agent Zero requires at least 2GB of RAM. Adjust your Railway plan accordingly.
- **Build Time:** The initial build may take 10-15 minutes as it includes all dependencies and tools.
- **Docker Base Image:** The deployment uses the pre-built `agent0ai/agent-zero-base:latest` image from Docker Hub.

### Features Available on Railway

✅ All core features work on Railway:
- Web UI with real-time streaming
- Agent conversations and multi-agent cooperation
- Code execution (within container)
- Memory and knowledge management
- File browser
- Text-to-Speech and Speech-to-Text (if configured)

❌ Some features may need additional configuration:
- SSH access (not available by default)
- Certain system-level operations may be restricted

### Security Recommendations

1. **Set Authentication:** Always set `AUTH_LOGIN` and `AUTH_PASSWORD` environment variables
2. **Use Secrets:** Use Railway's built-in secrets management for API keys
3. **HTTPS:** Railway provides HTTPS by default - always use it
4. **Regular Updates:** Keep your deployment updated by triggering rebuilds when new versions are released

### Updating Your Deployment

To update to the latest version:

1. **Via GitHub:**
   - Pull the latest changes to your repository
   - Railway will automatically rebuild and deploy

2. **Via CLI:**
   ```bash
   git pull origin main
   railway up
   ```

## Troubleshooting

### Build Fails
- Check Railway build logs for specific errors
- Ensure your GitHub repository has all necessary files
- Verify that the Dockerfile is present and correct

### Application Won't Start
- Check the deployment logs in Railway dashboard
- Verify that all required base images are accessible
- Ensure environment variables are correctly set

### Can't Access the Application
- Verify the deployment is running in Railway dashboard
- Check that Railway has generated a public URL
- Ensure your firewall allows HTTPS traffic

### Memory Issues
- Upgrade your Railway plan to provide more RAM
- Monitor resource usage in Railway dashboard

## Cost Estimation

Railway offers:
- **Starter Plan:** $5/month with $5 in credits
- **Developer Plan:** $20/month with $20 in credits
- Usage-based pricing for additional resources

Agent Zero typically uses:
- ~2GB RAM minimum
- Minimal CPU when idle
- Network bandwidth for LLM API calls

## Support

For Railway-specific issues:
- [Railway Documentation](https://docs.railway.app)
- [Railway Discord](https://discord.gg/railway)

For Agent Zero issues:
- [Agent Zero GitHub Issues](https://github.com/agent0ai/agent-zero/issues)
- [Agent Zero Discord](https://discord.gg/B8KZKNsPpj)

## Additional Resources

- [Railway Documentation](https://docs.railway.app/)
- [Agent Zero Documentation](./README.md)
- [Installation Guide](./installation.md)
