# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class ClaudeCodeRouterConfig < Formula
  desc "Multi-provider configuration for Claude Code Router with intent-based routing"
  homepage "https://github.com/halilertekin/CC-RouterMultiProvider"
  url "https://github.com/halilertekin/CC-RouterMultiProvider/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a1e262b8617aecc705dcb558db18d6aed951b3b8bb49806dba4e65c7d0152ce2"
  license "MIT"

  depends_on "pnpm" => :recommended
  depends_on "node"

  def install
    # Copy configuration files
    config_dir = Dir.home/".claude-code-router"
    config_dir.mkpath

    # Install config files if they don't exist
    %w[config.json intent-router.js].each do |file|
      target = config_dir/file
      target.write(buildpath/"config"/file.read) unless target.exist?
    end

    # Create .env file from example if it doesn't exist
    env_file = Dir.home/".env"
    unless env_file.exist?
      env_file.write(buildpath/".env.example".read)
    end
  end

  def post_install
    ohai "Claude Code Router Config installed!"
    ohai "Next steps:"
    puts <<~EOS
      1. Install claude-code-router with pnpm or npm:
         pnpm add -g @musistudio/claude-code-router
         # OR
         npm install -g @musistudio/claude-code-router

      2. Edit your API keys in ~/.env:
         nano ~/.env

      3. Add environment variables to your shell (~/.zshrc or ~/.bashrc):
         export $(cat ~/.env | xargs)
         export ANTHROPIC_BASE_URL="http://127.0.0.1:3456"
         export NO_PROXY="127.0.0.1"

      4. Reload your shell:
         source ~/.zshrc

      5. Start the router:
         ccr code

      For API keys, visit:
        OpenAI:     https://platform.openai.com/api-keys
        Anthropic:  https://console.anthropic.com/settings/keys
        Gemini:     https://aistudio.google.com/apikey
        Qwen:       https://dashscope.console.aliyun.com/apiKey
        GLM:        https://open.bigmodel.cn/usercenter/apikeys
        OpenRouter: https://openrouter.ai/keys
        Copilot:    https://github.com/settings/tokens
    EOS
  end

  test do
    # Test that config files exist
    config_dir = Dir.home/".claude-code-router"
    assert_predicate config_dir/"config.json", :exist?
    assert_predicate config_dir/"intent-router.js", :exist?
  end
end