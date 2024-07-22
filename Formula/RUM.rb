VERSION="0.1.15"
PRODUCT="RUM"

class RUM < Formula
  desc "A tool for archiving files and directories and extracting several archive formats."
  homepage "https://github.com/KuratateH/RUM"
  version VERSION
  license "MIT"

  option "without-completions", "Disable completions"
  depends_on "bash-completion@2" => :optional

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/KuratateH/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_amd64.tar.gz"
    sha256 "080d6fa0151284208c4e3032e0ce8a7eadeb9c3a7f22965a99220b41bdb6c84f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/KuratateH/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_darwin_arm64.tar.gz"
    sha256 "9dd44399437577ff2909d99afd15e4eab4416d1e2b6dbabfd33865bb0118e035"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/KuratateH/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_amd64.tar.gz"
    sha256 "3c00ed66c5bebf097ab8290c5b459322b4430049eecee1fda5cf9490892a575d"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/KuratateH/#{PRODUCT}/releases/download/v#{VERSION}/#{PRODUCT}-#{VERSION}_linux_arm64.tar.gz"
    sha256 "33355f32b26872b8efa2ddc93b0c5d489b5854cd81a62c66e6f47a16f18bc287"
  end

  def install
    bin.install "RUM"

    bash_completion.install "completions/bash/sibling.bash" if build.with? "completions"
    fish_completion.install "completions/fish/sibling.bash" if build.with? "completions"
    zsh_completion.install  "completions/zsh/sibling.bash"  if build.with? "completions"
  end

  test do
    system "#{bin}/RUM --version"
  done
end
