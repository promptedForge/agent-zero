# Agent Zero - Railway Deployment

Agent Zero is a personal, organic agentic AI framework that runs in Docker and can be easily deployed to Railway.

## Quick Deploy to Railway

1. Click the "Deploy on Railway" button
2. Configure your environment variables (optional but recommended):
   - `AUTH_LOGIN`: Username for authentication
   - `AUTH_PASSWORD`: Password for authentication
3. Wait for the build to complete (~10-15 minutes)
4. Access your Agent Zero instance via the provided Railway URL
5. Configure your LLM API keys in the Settings page

## What Gets Deployed

- Full Agent Zero framework with all features
- Web UI accessible via HTTPS
- Containerized environment for security
- All necessary dependencies pre-installed

## Post-Deployment Setup

1. **Access the Web UI**: Click on the Railway-provided URL
2. **Login**: Use the credentials you set (if any)
3. **Configure Settings**:
   - Go to Settings (gear icon)
   - Add your LLM provider API keys (OpenAI, Anthropic, OpenRouter, etc.)
   - Select your preferred models
   - Configure other preferences as needed
4. **Start Using**: Begin chatting with your agent!

## Important Notes

⚠️ **Data Persistence**: Railway provides ephemeral storage. Use the Backup/Restore feature regularly to save your data, or configure Railway Volumes for persistence.

⚠️ **Resources**: Agent Zero requires at least 2GB RAM. Ensure your Railway plan supports this.

⚠️ **Costs**: Monitor your Railway usage. The app runs continuously and will consume resources.

## Need Help?

- [Full Railway Deployment Guide](./docs/railway-deployment.md)
- [Agent Zero Documentation](./docs/README.md)
- [Agent Zero Discord](https://discord.gg/B8KZKNsPpj)
- [Railway Documentation](https://docs.railway.app)

## Features

✅ Web-based chat interface
✅ Multi-agent cooperation
✅ Code execution capabilities
✅ Memory and knowledge management
✅ File management
✅ Real-time streaming responses
✅ Speech-to-Text and Text-to-Speech support

## Security

- Always set authentication credentials
- Use environment variables for API keys
- Railway provides HTTPS by default
- Container isolation for security

---

For detailed information, see the [complete deployment guide](./docs/railway-deployment.md).
