class Bpsh < Formula
  desc "DS3 Script shell for interfacing with the Spectra Logic BlackPearl"
  homepage "https://github.com/SpectraLogic/ds3_script"
  url "https://github.com/SpectraLogic/ds3_script/releases/download/v3.5.1/bpsh-3.5.1.zip"
  sha256 "5d872bba09dcdabed1f2947b91ee949abe4474a39efb21442ddf7917124e5cdb"

  bottle :unneeded

  depends_on :java => "1.8+"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"bpsh").write_env_script libexec/"bin/bpsh", Language::Java.overridable_java_home_env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bpsh -v")
  end
end
