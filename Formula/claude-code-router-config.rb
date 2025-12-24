# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class ClaudeCodeRouterConfig < Formula
  desc "Multi-provider configuration for Claude Code Router with intent-based routing"
  homepage "https://github.com/halilertekin/CC-RouterMultiProvider"
  url "https://github.com/halilertekin/CC-RouterMultiProvider/archive/refs/tags/v1.3.3.tar.gz"
  sha256 "92bbba64d0f9b7c738df39b2604ee42cea61b29bf18d431585db3e816c7313a3"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]

    # Copy configuration files to user's home directory
    config_dir = File.join(Dir.home, ".claude-code-router")
    FileUtils.mkdir_p(config_dir)

    %w[config.json intent-router.js].each do |file|
      source = buildpath/"config"/file
      target = File.join(config_dir, file)
      if File.exist?(source) && !File.exist?(target)
        FileUtils.cp(source, target)
      end
    end

    # Create .env example if it doesn't exist
    env_file = File.join(Dir.home, ".env")
    unless File.exist?(env_file)
      env_source = buildpath/".env.example"
      if File.exist?(env_source)
        FileUtils.cp(env_source, env_file)
      else
        # Create a basic .env file if .env.example doesn't exist
        File.write(env_file, <<~EOS
          # Claude Code Router - API Keys
          # Required for Claude models
          export ANTHROPIC_API_KEY="your_anthropic_api_key_here"

          # Optional - Add other providers
          export OPENAI_API_KEY="your_openai_api_key_here"
          export GEMINI_API_KEY="your_gemini_api_key_here"
          export QWEN_API_KEY="your_qwen_api_key_here"
          export GLM_API_KEY="your_glm_api_key_here"
          export OPENROUTER_API_KEY="your_openrouter_api_key_here"
          export GITHUB_TOKEN="your_github_token_here"
        EOS
        )
      end
    end
  end

  def post_install
    ohai "Claude Code Router Config installed successfully!"
    ohai "Next steps:"
    puts <<~EOS
      1. Edit your API keys in ~/.env:
         nano ~/.env

      2. Add to your shell profile (~/.zshrc or ~/.bashrc):
         export $(cat ~/.env | xargs)
         export ANTHROPIC_BASE_URL="http://127.0.0.1:3456"
         export NO_PROXY="127.0.0.1"

      3. Reload your shell:
         source ~/.zshrc

      4. Start the router:
         ccr code

      For API keys, visit:
        Anthropic:  https://console.anthropic.com/settings/keys
        OpenAI:     https://platform.openai.com/api-keys
        Gemini:     https://aistudio.google.com/apikey
        Qwen:       https://dashscope.console.aliyun.com/apiKey
        GLM:        https://open.bigmodel.cn/usercenter/apikeys
        OpenRouter: https://openrouter.ai/keys
        Copilot:    https://github.com/settings/tokens
    EOS
  end

  test do
    # Test that config files exist
    config_dir = File.join(Dir.home, ".claude-code-router")
    assert_predicate File.join(config_dir, "config.json"), :exist?
    assert_predicate File.join(config_dir, "intent-router.js"), :exist?
  end
end