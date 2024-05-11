class Dotload < Formula
  desc "Tool for installing dotfiles and other required packages"
  homepage "https://github.com/okineadev/dotload"
  url "https://github.com/okineadev/dotload/releases/download/v1.2.2/dotload_1.2.2.tar.xz"
  sha256 "956cdaf31ea3fba2145a2fa229dfd8678b3efd443c9216b541184d10a7e81cac"
  license "MIT"

  def install
    bin.install "bin/dotload"
  end
end
