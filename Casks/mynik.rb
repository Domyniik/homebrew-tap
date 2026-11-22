cask "mynik" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.0"
  sha256 arm:   "4d11492485ece07ae9372a190c435b5f8337bbd5db2b5e29d0c2128d0867dcfc",
         intel: "715d33e6c85c71f2a4632d08d4a8a31bb1412bc681b22407c2c079713b0a7dce"

  url "https://github.com/Domyniik/mynik/releases/download/v#{version}/Mynik_#{version}_#{arch}.dmg"
  name "Mynik"
  desc "Dashboard pessoal: finanças, contas a pagar, loja, projetos e notas"
  homepage "https://github.com/Domyniik/mynik"

  depends_on macos: ">= :big_sur"

  app "Mynik.app"

  # A app não é notarizada pela Apple: retira a quarentena para abrir sem bloqueio.
  postflight_steps do
    if_path_exists "{{appdir}}/Mynik.app" do
      run "/usr/bin/xattr",
          args: ["-dr", "com.apple.quarantine", "{{appdir}}/Mynik.app"]
    end
  end

  uninstall quit: "com.domynik.mynik.desktop"

  zap trash: [
    "~/Library/Application Support/com.domynik.mynik.desktop",
    "~/Library/Caches/com.domynik.mynik.desktop",
    "~/Library/WebKit/com.domynik.mynik.desktop",
  ]
end
