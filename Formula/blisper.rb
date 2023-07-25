class Blisper < Formula
  desc "Easily and quickly convert audio to text"
  homepage "https://github.com/llimllib/blisper"
  url "https://github.com/llimllib/blisper/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "d735bb1c0e8b81f5fe10f0adf1d10f21f4930b92742e2895c57876b8d1e096ea"
  license "MIT"

  depends_on "go" => :build
  depends_on "llimllib/whisper/libwhisper"

  def install
    system "go", "build", *std_go_args
  end

  test do
    system bin/"blisper", "help"
  end
end
