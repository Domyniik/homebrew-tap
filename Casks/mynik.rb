cask "mynik" do
  version "1.4.0"
  sha256 "bfb92350b2822da5993d3f02bba50da3134a74d8958026aee1583f5de792367a"

  url "https://github.com/Domyniik/mynik/releases/download/v#{version}/Mynik-#{version}.zip"
  name "Mynik"
  desc "Dashboard pessoal: finanças, contas a pagar, loja, projetos e notas"
  homepage "https://github.com/Domyniik/mynik"

  depends_on macos: :tahoe

  app "Mynik.app"

  # A app não é notarizada pela Apple: retira a quarentena para abrir sem bloqueio.
  postflight_steps do
    if_path_exists "{{appdir}}/Mynik.app" do
      run "/usr/bin/xattr",
          args: ["-dr", "com.apple.quarantine", "{{appdir}}/Mynik.app"]
    end
  end

  uninstall quit: "com.domynik.mynik"

  zap trash: [
    "~/Library/Containers/com.domynik.mynik",
    "~/Library/Containers/com.domynik.mynik.widgets",
    "~/Library/Group Containers/CJ7Y2P3TKF.com.domynik.mynik",
  ]
end
