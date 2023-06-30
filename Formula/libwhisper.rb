class Libwhisper < Formula
  desc "OpenAI's whisper models ported to C++"
  homepage "https://github.com/ggerganov/whisper.cpp"
  url "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "b2e34e65777033584fa6769a366cdb0228bc5c7da81e58a5e8dc0ce94d0fb54e"
  license "MIT"

  depends_on "openblas"

  def install
    ENV["WHISPER_OPENBLAS"] = "1"
    system "make", "-j", "libwhisper.a"
    system "make", "-j", "libwhisper.so"
    lib.install "libwhisper.a"
    lib.install "libwhisper.so"
    include.install "whisper.h"
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <stdio.h>
      #include <whisper.h>

      int main(int argc, char *argv[]) {
        fprintf(stdout, "%s", whisper_print_system_info());
      }
    EOS

    system ENV.cc, "test.c", "-I#{include}", "-L#{lib}", "-lwhisper", "-o", "test"
    output = shell_output("./test")
    assert_equal "AVX = 0 | AVX2 = 0 | AVX512 = 0 | FMA = 0 | NEON = 1 | ARM_FMA = 1 | F16C = 0 | FP16_VA = 1 | WASM_SIMD = 0 | BLAS = 1 | SSE3 = 0 | VSX = 0 | COREML = 0 | ", output
  end
end
