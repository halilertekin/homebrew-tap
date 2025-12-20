# halilertekin/homebrew-tap

## Overview

This is a personal Homebrew tap for maintaining formulas that aren't (yet) accepted into Homebrew core.

## Available Formulae

### claude-code-router-config

Multi-provider configuration for Claude Code Router with intent-based routing.

**What it does:**
- Installs @musistudio/claude-code-router globally
- Copies configuration files to `~/.claude-code-router/`
- Creates `.env` template with all 7 AI providers
- Provides clear post-installation instructions

**Supported AI Providers:**
- OpenAI (GPT-4o, GPT-4 Turbo, O1)
- Anthropic (Claude Sonnet 4, Claude 3.5 Sonnet)
- Gemini (Gemini 2.5 Flash, Gemini 2.5 Pro)
- Qwen (Qwen Plus, Qwen Max)
- GLM (GLM-4.6, GLM-4.5)
- OpenRouter (Multiple models)
- GitHub Copilot (Code assistance)

## Installation

### 1. Tap the Repository

```bash
brew tap halilertekin/tap
```

### 2. Install the Formula

```bash
brew install claude-code-router-config
```

## Usage

After installation, the router will automatically:

1. **Install @musistudio/claude-code-router** globally
2. **Copy configuration files** to `~/.claude-code-router/`
3. **Create .env file** with API key templates
4. **Show next steps** for setup

Complete the setup by:

1. **Edit API keys** in `~/.env`:
   ```bash
   nano ~/.env
   ```

2. **Add to shell profile** (`~/.zshrc` or `~/.bashrc`):
   ```bash
   export $(cat ~/.env | xargs)
   export ANTHROPIC_BASE_URL="http://127.0.0.1:3456"
   export NO_PROXY="127.0.0.1"
   ```

3. **Reload shell**:
   ```bash
   source ~/.zshrc
   ```

4. **Start the router**:
   ```bash
   ccr code
   ```

## Features

### Intent-Based Routing

The router automatically selects the best provider based on your request:

| Request Type | Provider | Model | Why |
|-------------|----------|-------|-----|
| Code writing, debugging | OpenAI | gpt-4o | Best coding model |
| Deep analysis, architecture | Anthropic | claude-sonnet-4 | Superior reasoning |
| Quick responses | Gemini | gemini-2.5-flash | Fastest responses |
| Simple tasks | Qwen | qwen-plus | Cost effective |
| Translation, multilingual | GLM | glm-4.6 | Excellent language support |
| Complex algorithms | OpenAI | o1 | Advanced reasoning |
| Coding assistance | GitHub Copilot | copilot | Code-specific training |

### 7 AI Providers

All providers are pre-configured with optimal routing:

1. **OpenAI** - GPT-4o, GPT-4 Turbo, O1 models
2. **Anthropic** - Claude Sonnet 4, Claude 3.5 Sonnet
3. **Google** - Gemini 2.5 Flash/Pro models
4. **Alibaba** - Qwen Plus/Max models
5. **Zhipu AI** - GLM-4.6/4.5 models
6. **OpenRouter** - Multi-provider access
7. **GitHub** - Copilot integration

## API Keys

Get API keys for providers you want to use:

| Provider | Link |
|----------|------|
| OpenAI | https://platform.openai.com/api-keys |
| Anthropic | https://console.anthropic.com/settings/keys |
| Gemini | https://aistudio.google.com/apikey |
| Qwen | https://dashscope.console.aliyun.com/apiKey |
| GLM | https://open.bigmodel.cn/usercenter/apikeys |
| OpenRouter | https://openrouter.ai/keys |
| Copilot | https://github.com/settings/tokens |

## Troubleshooting

### Common Issues

1. **Permission Denied**
   ```bash
   # Check npm permissions
   npm config get prefix
   # If /usr/local, use: npm config set prefix ~/.npm-global
   ```

2. **Router Not Found**
   ```bash
   # Verify installation
   which ccr
   # Reinstall if needed
   brew reinstall claude-code-router-config
   ```

3. **API Key Errors**
   - Verify keys are correct in `~/.env`
   - Check provider status pages
   - Ensure keys have necessary permissions

### Debug Mode

Enable verbose logging:
```bash
HOMEBREW_VERBOSE=1 brew install claude-code-router-config
```

### Uninstall

```bash
brew uninstall claude-code-router-config
brew untap halilertekin/tap
```

## Related Projects

- **Main Repository**: https://github.com/halilertekin/CC-RouterMultiProvider
- **Original Router**: https://github.com/musistudio/claude-code-router
- **NPM Package**: https://www.npmjs.com/package/claude-code-router-config

## Contributing

This is a personal tap for formula maintenance. For issues or suggestions:

1. **Check existing issues** on the main repository
2. **Create an issue** describing the problem
3. **Provide details** about your environment

## License

MIT License - see LICENSE file in main repository for details.

## Attribution

This tap provides installation for `claude-code-router-config`, which offers configuration for [@musistudio/claude-code-router](https://github.com/musistudio/claude-code-router).

Original project: https://github.com/musistudio/claude-code-router
Maintainer: Halil Ertekin