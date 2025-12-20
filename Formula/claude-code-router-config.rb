# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class ClaudeCodeRouterConfig < Formula
  desc "Multi-provider configuration for Claude Code Router with intent-based routing"
  homepage "https://github.com/halilertekin/CC-RouterMultiProvider"
  url "https://github.com/halilertekin/CC-RouterMultiProvider/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a1e262b8617aecc705dcb558db18d6aed951b3b8bb49806dba4e65c7d0152ce2"
  license "MIT"

  depends_on "node"

  def install
    # Create README with installation instructions
    (prefix/"README.md").write <<~EOS
      Claude Code Router Config Installation

      This package provides configuration for claude-code-router with 7 AI providers.

      Manual Installation Steps:

      1. Install claude-code-router:
         pnpm add -g @musistudio/claude-code-router
         # OR
         npm install -g @musistudio/claude-code-router

      2. Create config directory:
         mkdir -p ~/.claude-code-router

      3. Copy configuration files from:
         https://github.com/halilertekin/CC-RouterMultiProvider

      4. Set up your API keys in ~/.env

      5. Start the router:
         ccr code

      For detailed instructions, visit:
      https://github.com/halilertekin/CC-RouterMultiProvider
    EOS
  end

  def post_install
    ohai "Claude Code Router Config installed!"
    ohai "Please follow the installation instructions in:"
    ohai "#{prefix}/README.md"
    ohai ""
    ohai "Quick setup:"
    puts "  1. pnpm add -g @musistudio/claude-code-router"
    puts "  2. Copy config files to ~/.claude-code-router/"
    puts "  3. Edit ~/.env with your API keys"
    puts "  4. ccr code"
  end

  test do
    assert_predicate prefix/"README.md", :exist?
  end
end